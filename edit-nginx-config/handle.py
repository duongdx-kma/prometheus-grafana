import glob
import re

def edit_nginx_config(file_path):
  # Define the new lines to be appended
    new_lines_table_order_admin = 'include /etc/nginx/white_lists/table_order_admin.conf;\n'
    new_lines_taskmiru = 'include /etc/nginx/white_lists/taskmiru.conf;\n'
    #new_lines_nabata = 'include /etc/nginx/white_lists/nabata.conf;\n'
    new_lines_default = 'include /etc/nginx/white_lists/default.conf;\n'

    table_order_admin_domain = 'sub1.domain.com'
    table_order_user_domain = 'sub2.domain.com'
    taskmiru_domain = 'sub.domain.com'

    # Regex to match the server_name and location blocks
    regex_server_name = r'^\s*server_name\s+(?!.*\bapi\b)([^;]*);$'
    regex_location = r'^\s*location\s+/.*{'

    with open(file_path, 'r') as file:
        config_lines = file.readlines()

    server_name = None
    in_location_block = False

    for index, line in enumerate(config_lines):
        # Match server_name
        if server_name is None:
            match = re.match(regex_server_name, line)
            if match:
                server_name = match.group(1).strip()
                # config_lines.insert(index + 1, '    ' + new_lines_letsencrypt)

        # Check if we are in a location block
        if re.match(regex_location, line):
            in_location_block = True

        # Check if we reached the end of a location block
        if in_location_block and '}' in line:
            in_location_block = False

            # Append the appropriate include line based on the server_name
            if server_name in [table_order_admin_domain, table_order_user_domain]:
                config_lines.insert(index, '        ' + new_lines_table_order_admin)
            elif server_name == taskmiru_domain:
                config_lines.insert(index, '        ' + new_lines_taskmiru)
            else:
                config_lines.insert(index, '        ' + new_lines_default)

    # Write the modified content back to the file
    with open(file_path, 'w') as file:
        file.writelines(config_lines)

def main():
  files = glob.glob("/etc/nginx/conf.d/*.conf")
  for file in files:
    edit_nginx_config(file)

if __name__ == '__main__':
    main()
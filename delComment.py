# -*- coding:utf-8 -*-
# ！/usr/bin/python3
import shutil
import sys


def make_backup(src_url):
    bak_url = src_url + ".bak"
    shutil.copyfile(src_url, bak_url)


def del_comment(src_url):
    with open(src_url, 'r', encoding='utf-8') as f1:
        lines = f1.readlines()
    with open(src_url, 'w', encoding='utf-8') as f2:
        for line in lines:
            if line.startswith("#") or not line.strip():
                continue
            f2.write(line)


if __name__ == '__main__':
    length = len(sys.argv)

    print("对%d个文件进行处理" % (length-1))
    for num in range(1, length):
        f_path = sys.argv[num]
        f_name = str(f_path).split('/')[-1]
        print("对文件:%s进行备份.." % f_name)
        make_backup(f_path)
        print("对文件:%s进行处理.." % f_name)
        del_comment(f_path)


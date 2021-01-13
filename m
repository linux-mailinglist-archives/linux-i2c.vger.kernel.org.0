Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0CF2F50A9
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 18:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbhAMRJQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jan 2021 12:09:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54431 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726544AbhAMRJQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jan 2021 12:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610557668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=vtlPeCjkXQaaeUcUdKzAXMSQBUO9hHcpNbvBO/drdRE=;
        b=FMqd7GsPwLxqTFIu7/YktrNJ05O78PixNVdYiyVxX+sWKHdYsivpTjBjs41HmIhUlflahl
        WBqQDP+Pt2njepGfz+FZjMt4drLw5LXiH1caF0MyB8gvGipwOEisjLrFQWDvM0qWQXzhML
        gL2pLaXeIOFnU4ny9n3ahriU2xUv5Q0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-8c1Tsm_1Npqs5tWxhoeiLw-1; Wed, 13 Jan 2021 12:07:46 -0500
X-MC-Unique: 8c1Tsm_1Npqs5tWxhoeiLw-1
Received: by mail-ej1-f70.google.com with SMTP id f26so1136440ejy.9
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jan 2021 09:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=vtlPeCjkXQaaeUcUdKzAXMSQBUO9hHcpNbvBO/drdRE=;
        b=mhZ5UeUwsZYbv/FFjMTwQQZ5Dy2ufgjQeAPfLJeseETw50EkSb0JujzGxtUvwv2Jvq
         oICcWIP13CYZvm9Zp++Kw3dxTvg4Qoi1Ss5oXkilyHUOVq/GtOmNYzF3xxg6rtTh7tLi
         awTkKPLSuS3mvaZyOQerPEbHYQrG1hhfCcf1erVqpUmpW7h8DMj1GQLg76YQchUU7+u9
         Ss8EWcxidt1esoB+NpvOwewUbb1v01n16Evrlp3wrG9SP2RtefLpxcj1nR+wxUypDFeA
         +DdfFIGDJKsDgcVlRypdDKeA4SmeWXNYwE2mKAqf4tS8CVq/YgYPq4rp2u4JWnjFX3Km
         08kg==
X-Gm-Message-State: AOAM533U9PWYfqRmgoMfgZVh6sFvfmYAyNFZYOTzt65d3Hhel0Nyrq0g
        KGOiO6a9K1HZOZcjjX8h0cB/n/4H0NZZGlo07YnXlNCO8x+0K8GJP6T8ysnDbWw5W3gVvjU0l9w
        cM1moAWJcMP8Kpo7Eiv+b0Syip+p1bhpBaag2Q82fbueOFJ/vZ/7r1VJjufLjrQ6Gnaumxhlf
X-Received: by 2002:a05:6402:31b5:: with SMTP id dj21mr2650669edb.90.1610557665414;
        Wed, 13 Jan 2021 09:07:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5swoavjufnFbnjYDTiucGOHnmC3UyrKR9FjYw8ZmjHTe+HXXtsYeRUmX8IOxgnm/puvQeoA==
X-Received: by 2002:a05:6402:31b5:: with SMTP id dj21mr2650649edb.90.1610557665056;
        Wed, 13 Jan 2021 09:07:45 -0800 (PST)
Received: from ?IPv6:2a00:ca8:a1f:9150:d143:b0bd:3067:a652? ([2a00:ca8:a1f:9150:d143:b0bd:3067:a652])
        by smtp.gmail.com with ESMTPSA id bn21sm942445ejb.47.2021.01.13.09.07.44
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 09:07:44 -0800 (PST)
To:     linux-i2c@vger.kernel.org
From:   Artem Egorenkov <aegorenk@redhat.com>
Subject: Re: [PATCH i2c-tools] tools: Load the i2c-dev kernel
Message-ID: <653595ee-69ae-7a6f-a2bf-c65bb41beb97@redhat.com>
Date:   Wed, 13 Jan 2021 18:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There was a thread over a year ago about the subject:
https://marc.info/?l=linux-i2c&m=157313524002998&w=2

I took the patch provided by Ondrej Lysonek and tried to fix problems 
pointed by Jean Delvare here:
https://marc.info/?l=linux-i2c&m=157355568725656&w=2

Here are some notes:
1. https://marc.info/?l=linux-i2c&m=157355568725656&w=2
Ondrej Lysonek wrote:
 > Using libkmod should be faster as it avoids executing the shell and then
 > modprobe. I could use system("modprobe i2c-dev") in the #else branch
 > when libkmod is not available, though.

Using of libkmod doesn't make sense. Here are few lines from the libkmod 
source code for the kmod_module_probe_insert_module() function 
(https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/libkmod/libkmod-module.c):

/**
  * kmod_module_probe_insert_module:
  * @mod: kmod module
...
  * @run_install: function to run when @mod is backed by an install command.
  * @data: data to give back to @run_install callback
...
  * If @run_install is NULL, this function will fork and exec by calling
  * system(3). Don't pass a NULL argument in @run_install if your binary is
  * setuid/setgid (see warning in system(3)). If you need control over the
  * execution of an install command, give a callback function instead.
...
  */
KMOD_EXPORT int kmod_module_probe_insert_module(struct kmod_module *mod,
             unsigned int flags, const char *extra_options,
             int (*run_install)(struct kmod_module *m,
                         const char *cmd, void *data),
             const void *data,
             void (*print_action)(struct kmod_module *m,
                         bool install,
                         const char *options))

As we can see the justification to use libkmod is not correct, since 
when the function is called the @run_install is NULL, so the system(3) 
will be used:
res = kmod_module_probe_insert_module(mod, flags, NULL, NULL, NULL, NULL);

2. https://marc.info/?l=linux-i2c&m=157357238900931&w=2
Jean Delvare <jdelvare@suse.de> writes:
 > Are we guaranteed that the driver probing has completed at this point?
 > I mean, the kernel sends events for udev to process and the actual /dev
 > nodes are created by udev asynchronously as I understand it. Don't we
 > need an equivalent of "udevadm settle" here?

To be honest I'm quite inexperienced in that. If that check have to be 
done, I'll need more time to prepare code for it.
Just to point it out I was trying the changes on my laptop and it worked 
well all the time, even if I know that proves nothing.

3.https://marc.info/?l=linux-i2c&m=157357238900931&w=2
Jean Delvare <jdelvare@suse.de> writes:
 > A rather unusual convention. Any reason why you opted for that rather
 > that the usual 0 on success / -errno on error?
For me it looks fine. If you think about 0 as false and 1 is true, it 
simply indicates if function ran successfully.

Signed-off-by: Artem Egorenkov <aegorenk@redhat.com>
---
  tools/i2cbusses.c | 99 +++++++++++++++++++++++++++++++++++++++++------
  1 file changed, 87 insertions(+), 12 deletions(-)

diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
index b4f00ae..932560c 100644
--- a/tools/i2cbusses.c
+++ b/tools/i2cbusses.c
@@ -43,6 +43,8 @@
  #include <linux/i2c.h>
  #include <linux/i2c-dev.h>

+#define I2C_DEV_MOD_NAME "i2c_dev"
+
  enum adt { adt_dummy, adt_isa, adt_i2c, adt_smbus, adt_unknown };

  struct adap_type {
@@ -63,6 +65,26 @@ static struct adap_type adap_types[5] = {
           .algo         = "N/A", },
  };

+/**
+ * Try to load the i2c_dev kernel module.
+ * Returns 1 on success, 0 otherwise.
+ */
+static int load_i2c_dev_module(int quiet) {
+       int probe_result = system("modprobe " I2C_DEV_MOD_NAME);
+       if (probe_result == 0) {
+               return 1;
+       }
+       if (probe_result > 0) {
+               if(!quiet)
+                       fprintf(stderr, "modprobe command exited with 
code %d",
+                                       WEXITSTATUS(probe_result));
+               return 0;
+       }
+       if (!quiet)
+               fprintf(stderr, "failed to execute modprobe command");
+       return 0;
+}
+
  static enum adt i2c_get_funcs(int i2cbus)
  {
         unsigned long funcs;
@@ -209,8 +231,12 @@ struct i2c_adap *gather_i2c_busses(void)
            i2c-dev and what we really care about are the i2c-dev numbers.
            Unfortunately the names are harder to get in i2c-dev */
         strcat(sysfs, "/class/i2c-dev");
-       if(!(dir = opendir(sysfs)))
-               goto done;
+       if(!(dir = opendir(sysfs))) {
+               if (!load_i2c_dev_module(0))
+                       goto done;
+               if (!(dir = opendir(sysfs)))
+                       goto done;
+       }
         /* go through the busses */
         while ((de = readdir(dir)) != NULL) {
                 if (!strcmp(de->d_name, "."))
@@ -404,26 +430,75 @@ int parse_i2c_address(const char *address_arg, int 
all_addrs)
         return address;
  }

+/**
+ * Get i2c device filename for provided pattern and i2cbus
+ *
+ * Returns -EOVERFLOW if resulting name is too big for provided 
@filename buffer,
+ * returns 0 otherwice.
+ */
+static int __get_i2c_dev_filename__(char *filename, size_t size, int 
i2cbus, const char *pattern) {
+       int len = snprintf(filename, size, pattern, i2cbus);
+       if (len >= (int)size) {
+               fprintf(stderr, "%s: path truncated\n", filename);
+               return -EOVERFLOW;
+       }
+
+       return 0;
+}
+
+/**
+ * Try to open a device file by i2cbus name
+ * at first as /dev/i2c/@i2cbus
+ * second as /dev/i2c-@i2cbus if first failed.
+ *
+ * The result doesn't tell if file was successfully opened,
+ * it just says if we were successful to try it.
+ * File descritor should be checked to be valid outside of this function.
+ *
+ * Returns -EOVERFLOW if provided @filename buffer is too small,
+ * returns 0 otherwise.
+ */
+static int __try_open_i2c_dev__(char *filename, size_t size, int 
i2cbus, int *file) {
+       if (-EOVERFLOW == __get_i2c_dev_filename__(filename, size, 
i2cbus, "/dev/i2c/%d")) {
+               return -EOVERFLOW;
+       }
+       *file = open(filename, O_RDWR);
+
+       if (*file < 0 && (errno == ENOENT || errno == ENOTDIR)) {
+               if (-EOVERFLOW == __get_i2c_dev_filename__(filename, 
size, i2cbus, "/dev/i2c-%d")) {
+                       return -EOVERFLOW;
+               }
+               *file = open(filename, O_RDWR);
+       }
+
+       return 0;
+}
+
  int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet)
  {
-       int file, len;
+       int file;

-       len = snprintf(filename, size, "/dev/i2c/%d", i2cbus);
-       if (len >= (int)size) {
-               fprintf(stderr, "%s: path truncated\n", filename);
+       /**
+        * At first let's just try to open the device file.
+        */
+       if (-EOVERFLOW == __try_open_i2c_dev__(filename, size, i2cbus, 
&file)) {
                 return -EOVERFLOW;
         }
-       file = open(filename, O_RDWR);

-       if (file < 0 && (errno == ENOENT || errno == ENOTDIR)) {
-               len = snprintf(filename, size, "/dev/i2c-%d", i2cbus);
-               if (len >= (int)size) {
-                       fprintf(stderr, "%s: path truncated\n", filename);
+       /**
+        * If previous attempt left us with invalid file descriptor,
+        * let's try to load i2c_dev module first and try to open the 
device file again
+        */
+       if (file < 0 && (errno == ENOENT || errno == ENOTDIR) && 
load_i2c_dev_module(quiet)) {
+               if (-EOVERFLOW == __try_open_i2c_dev__(filename, size, 
i2cbus, &file)) {
                         return -EOVERFLOW;
                 }
-               file = open(filename, O_RDWR);
         }

+       /**
+        * At this point we tried everything we can.
+        * If file is still not opened we should report error and return.
+        */
         if (file < 0 && !quiet) {
                 if (errno == ENOENT) {
                         fprintf(stderr, "Error: Could not open file "
-- 
2.29.2


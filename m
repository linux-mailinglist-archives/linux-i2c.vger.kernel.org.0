Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6E7146563
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 11:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgAWKLk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 05:11:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:43010 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbgAWKLk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 05:11:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4CD2FB205;
        Thu, 23 Jan 2020 10:11:38 +0000 (UTC)
Date:   Thu, 23 Jan 2020 11:11:37 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Lei YU <mine260309@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH 2/2] docs: i2c: dev-interface: document the actual
 implementation
Message-ID: <20200123111137.5899fa5a@endymion>
In-Reply-To: <20200123105246.67732e33@endymion>
References: <20200123105246.67732e33@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The old i2c-dev API based on inline functions is long gone, we have
libi2c now which implements the same as real functions and comes with
complete API documentation. Update the dev-interface documentation
file accordingly to only mention what can be done without the
library, and redirect the reader to the libi2c manual page for the
rest.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reported-by: Lei YU <mine260309@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/i2c/dev-interface.rst |   67 ++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 37 deletions(-)

--- linux-5.4.orig/Documentation/i2c/dev-interface.rst	2020-01-16 10:32:18.436175325 +0100
+++ linux-5.4/Documentation/i2c/dev-interface.rst	2020-01-16 10:32:25.205247017 +0100
@@ -22,10 +22,11 @@ C example
 =========
 
 So let's say you want to access an I2C adapter from a C program.
-First, you need to include these two headers::
+First, you need to include these three header files::
 
+  #include <linux/i2c.h>
   #include <linux/i2c-dev.h>
-  #include <i2c/smbus.h>
+  #include <sys/ioctl.h>
 
 Now, you have to decide which adapter you want to access. You should
 inspect /sys/class/i2c-dev/ or run "i2cdetect -l" to decide this.
@@ -62,19 +63,23 @@ I2C to communicate with your device. SMB
   __u8 reg = 0x10; /* Device register to access */
   __s32 res;
   char buf[10];
+  struct i2c_smbus_ioctl_data args;
+  union i2c_smbus_data data;
 
   /* Using SMBus commands */
-  res = i2c_smbus_read_word_data(file, reg);
+  args.read_write = I2C_SMBUS_READ;
+  args.command = reg;
+  args.size = I2C_SMBUS_WORD_DATA;
+  args.data = &data;
+
+  res = ioctl(file, I2C_SMBUS, &args);
   if (res < 0) {
     /* ERROR HANDLING: I2C transaction failed */
   } else {
-    /* res contains the read word */
+    /* data contains the read word */
   }
 
-  /*
-   * Using I2C Write, equivalent of
-   * i2c_smbus_write_word_data(file, reg, 0x6543)
-   */
+  /* Using I2C Write */
   buf[0] = reg;
   buf[1] = 0x43;
   buf[2] = 0x65;
@@ -82,7 +87,7 @@ I2C to communicate with your device. SMB
     /* ERROR HANDLING: I2C transaction failed */
   }
 
-  /* Using I2C Read, equivalent of i2c_smbus_read_byte(file) */
+  /* Using I2C Read */
   if (read(file, buf, 1) != 1) {
     /* ERROR HANDLING: I2C transaction failed */
   } else {
@@ -93,10 +98,8 @@ Note that only a subset of the I2C and S
 the means of read() and write() calls. In particular, so-called combined
 transactions (mixing read and write messages in the same transaction)
 aren't supported. For this reason, this interface is almost never used by
-user-space programs.
-
-IMPORTANT: because of the use of inline functions, you *have* to use
-'-O' or some variation when you compile your program!
+user-space programs. See the I2C_RDWR ioctl below for combined transaction
+support.
 
 
 Full interface description
@@ -107,7 +110,11 @@ Full interface description
 ``ioctl(file, I2C_SLAVE, long addr)``
   Change slave address. The address is passed in the 7 lower bits of the
   argument (except for 10 bit addresses, passed in the 10 lower bits in this
-  case).
+  case). Fails if the address is already busy.
+
+``ioctl(file, I2C_SLAVE_FORCE, long addr)``
+  Same as I2C_SLAVE but succeeds even if the address was already busy.
+  Dangerous, don't use.
 
 ``ioctl(file, I2C_TENBIT, long select)``
   Selects ten bit addresses if select not equals 0, selects normal 7 bit
@@ -148,30 +155,16 @@ You can do plain I2C transactions by usi
 You do not need to pass the address byte; instead, set it through
 ioctl I2C_SLAVE before you try to access the device.
 
-You can do SMBus level transactions (see documentation file smbus-protocol
-for details) through the following functions::
 
-  __s32 i2c_smbus_write_quick(int file, __u8 value);
-  __s32 i2c_smbus_read_byte(int file);
-  __s32 i2c_smbus_write_byte(int file, __u8 value);
-  __s32 i2c_smbus_read_byte_data(int file, __u8 command);
-  __s32 i2c_smbus_write_byte_data(int file, __u8 command, __u8 value);
-  __s32 i2c_smbus_read_word_data(int file, __u8 command);
-  __s32 i2c_smbus_write_word_data(int file, __u8 command, __u16 value);
-  __s32 i2c_smbus_process_call(int file, __u8 command, __u16 value);
-  __s32 i2c_smbus_read_block_data(int file, __u8 command, __u8 *values);
-  __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
-                                   __u8 *values);
-
-All these transactions return -1 on failure; you can read errno to see
-what happened. The 'write' transactions return 0 on success; the
-'read' transactions return the read value, except for read_block, which
-returns the number of values read. The block buffers need not be longer
-than 32 bytes.
-
-The above functions are made available by linking against the libi2c library,
-which is provided by the i2c-tools project.  See:
-https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/.
+C Library
+=========
+
+For SMBus level transactions you will want to use libi2c which offers a
+much nicer API similar to the in-kernel API. See the libi2c(3) manual page
+for details. The library is part of i2c-tools:
+https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/
+
+Python bindings are also available for libi2c, in the same project.
 
 
 Implementation details


-- 
Jean Delvare
SUSE L3 Support

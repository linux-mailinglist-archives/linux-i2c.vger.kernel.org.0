Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0B125BECF
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 12:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgICKJa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 06:09:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:46142 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgICKJa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 06:09:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 979E7B685
        for <linux-i2c@vger.kernel.org>; Thu,  3 Sep 2020 10:09:29 +0000 (UTC)
Date:   Thu, 3 Sep 2020 12:09:27 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH v2] libi2c: Add a manual page to document the API
Message-ID: <20200903120927.482b6eae@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is good practice for a library to come with a complete API description.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 Makefile      |    1 
 lib/Module.mk |    6 +-
 lib/libi2c.3  |  137 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+), 2 deletions(-)

Changes since v1:
 * Integrated the new manual page with the Makefiles so that it gets installed
   and uninstalled properly.
 * Updated date and copyright years.

--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ i2c-tools/lib/libi2c.3	2020-09-03 12:06:57.547427314 +0200
@@ -0,0 +1,137 @@
+.\" Copyright (C) 2019-2020  Jean Delvare <jdelvare@suse.de>
+.\" libi2c is distributed under the LGPL
+.TH libi2c 3  "September 2020" "i2c-tools" "Linux Programmer's Manual"
+
+.SH NAME
+libi2c \- publicly accessible functions provided by the i2c library
+
+.SH SYNOPSIS
+.nf
+.B #include <linux/i2c.h>
+.B #include <i2c/smbus.h>
+
+/* Universal SMBus transaction */
+.BI "__s32 i2c_smbus_access(int " file ", char " read_write ", __u8 " command ","
+.BI "                       int " size ", union i2c_smbus_data *" data ");"
+
+/* Simple SMBus transactions */
+.BI "__s32 i2c_smbus_write_quick(int " file ", __u8 " value ");"
+.BI "__s32 i2c_smbus_read_byte(int " file ");"
+.BI "__s32 i2c_smbus_write_byte(int " file ", __u8 " value ");"
+.BI "__s32 i2c_smbus_read_byte_data(int " file ", __u8 " command ");"
+.BI "__s32 i2c_smbus_write_byte_data(int " file ", __u8 " command ", __u8 " value ");"
+.BI "__s32 i2c_smbus_read_word_data(int " file ", __u8 " command ");"
+.BI "__s32 i2c_smbus_write_word_data(int " file ", __u8 " command ", __u16 " value ");"
+.BI "__s32 i2c_smbus_process_call(int " file ", __u8 " command ", __u16 " value ");"
+
+/* Block SMBus (and non-SMBus) transactions */
+.BI "__s32 i2c_smbus_read_block_data(int " file ", __u8 " command ", __u8 *" values ");"
+.BI "__s32 i2c_smbus_write_block_data(int " file ", __u8 " command ", __u8 " length ","
+.BI "                                 const __u8 *" values ");"
+.BI "__s32 i2c_smbus_block_process_call(int " file ", __u8 " command ", __u8 " length ","
+.BI "                                   __u8 *" values ");"
+.BI "__s32 i2c_smbus_read_i2c_block_data(int " file ", __u8 " command ", __u8 " length ","
+.BI "                                    __u8 *" values ");"
+.BI "__s32 i2c_smbus_write_i2c_block_data(int " file ", __u8 " command ", __u8 " length ","
+.BI "                                     const __u8 *" values ");"
+
+.SH DESCRIPTION
+This library offers to user-space an SMBus-level API similar to the in-kernel
+one.
+Each function is a wrapper around the appropriate ioctl call for i2c-dev to
+process.
+The i2c-dev kernel driver will convert the ioctl to its in-kernel
+equivalent function call, and pass the result back to the user-space caller.
+
+.B i2c_smbus_access()
+is the universal function to run any SMBus transaction.
+You have to fill out and link the data structures yourself.
+It returns 0 on success, or a negative \fBerrno\fR value on error.
+In practice you should never need to call this function directly, instead use
+one of the specific functions below, which will prepare the data and then
+call it for you.
+
+.B i2c_smbus_write_quick()
+runs an SMBus "Quick command" transaction.
+
+.B i2c_smbus_write_byte()
+runs an SMBus "Send byte" transaction.
+
+.B i2c_smbus_write_byte_data()
+runs an SMBus "Write byte" transaction.
+
+.B i2c_smbus_write_word_data()
+runs an SMBus "Write word" transaction.
+
+These write transaction functions return 0 on success.
+On error, a negative \fBerrno\fR value is returned.
+
+.B i2c_smbus_read_byte()
+runs an SMBus "Receive byte" transaction.
+
+.B i2c_smbus_read_byte_data()
+runs an SMBus "Read byte" transaction.
+
+.B i2c_smbus_read_word_data()
+runs an SMBus "Read word" transaction.
+
+.B i2c_smbus_process_call()
+runs an SMBus "Process call" transaction.
+
+These read transaction functions return the read byte or word value on success.
+On error, a negative \fBerrno\fR value is returned.
+
+.B i2c_smbus_write_block_data()
+runs an SMBus "Block write" transaction.
+
+.B i2c_smbus_read_block_data()
+runs an SMBus "Block read" transaction.
+
+.B i2c_smbus_block_process_call()
+runs an SMBus "Block write-block read process call" transaction.
+
+These block transaction functions return 0 on success.
+On error, a negative \fBerrno\fR value is returned.
+The block length is limited to 32 bytes.
+
+.B i2c_smbus_write_i2c_block_data()
+runs an "I2C block write" transaction. This is typically used to write to
+an EEPROM up to 4 kb in size.
+
+.B i2c_smbus_read_i2c_block_data()
+runs an "I2C block read" transaction. This is typically used to read from
+an EEPROM up to 4 kb in size.
+
+While technically not part of the SMBus specification, these I2C block
+transactions are supported by many SMBus host controllers.
+These block transaction functions return 0 on success.
+On error, a negative \fBerrno\fR value is returned.
+Like their SMBus counterparts, the block length is limited to 32 bytes.
+
+.SH DATA STRUCTURES
+
+Structure \fBi2c_smbus_ioctl_data\fR is used to send data to and retrieve
+data from the kernel through the i2c-dev driver.
+It will be filled out for you by \fBi2c_smbus_access()\fR so you do not need
+to care about the details.
+
+Union \fBi2c_smbus_data\fR is used to store all possible SMBus data.
+
+union \fBi2c_smbus_data\fR {
+.br
+	\fB__u8\fR byte;
+.br
+	\fB__u16\fR word;
+.br
+	\fB__u8\fR block[I2C_SMBUS_BLOCK_MAX + 2];
+.br
+};
+
+\fBblock[0]\fR is used for length and the last byte is reserved.
+If you use the higher-level functions, this structure will be filled out for
+you so you do not have to care about the details.
+Only if you call \fBi2c_smbus_access()\fR directly, you need to fill it out
+yourself.
+
+.SH AUTHOR
+Simon G. Vogl, Frodo Looijaard, Jean Delvare and others
--- i2c-tools.orig/Makefile	2020-08-03 16:27:42.617814857 +0200
+++ i2c-tools/Makefile	2020-09-03 11:47:27.636476491 +0200
@@ -12,6 +12,7 @@ PREFIX	?= /usr/local
 bindir	= $(PREFIX)/bin
 sbindir	= $(PREFIX)/sbin
 mandir	= $(PREFIX)/share/man
+man3dir	= $(mandir)/man3
 man8dir	= $(mandir)/man8
 incdir	= $(PREFIX)/include
 libdir	= $(PREFIX)/lib
--- i2c-tools.orig/lib/Module.mk	2020-08-27 10:28:33.059366343 +0200
+++ i2c-tools/lib/Module.mk	2020-09-03 12:06:40.696210031 +0200
@@ -1,6 +1,6 @@
 # I2C library for Linux
 #
-# Copyright (C) 2012  Jean Delvare <jdelvare@suse.de>
+# Copyright (C) 2012-2020  Jean Delvare <jdelvare@suse.de>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU Lesser General Public License as published
@@ -87,7 +87,7 @@ strip-lib: $(addprefix $(LIB_DIR)/,$(LIB
 	$(RM) $(addprefix $(LIB_DIR)/,*.o *.ao $(LIB_TARGETS) $(LIB_LINKS))
 
 install-lib: $(addprefix $(LIB_DIR)/,$(LIB_TARGETS))
-	$(INSTALL_DIR) $(DESTDIR)$(libdir)
+	$(INSTALL_DIR) $(DESTDIR)$(libdir) $(DESTDIR)$(man3dir)
 ifeq ($(BUILD_DYNAMIC_LIB),1)
 	$(INSTALL_PROGRAM) $(LIB_DIR)/$(LIB_SHLIBNAME) $(DESTDIR)$(libdir)
 	$(LN) $(LIB_SHLIBNAME) $(DESTDIR)$(libdir)/$(LIB_SHSONAME)
@@ -96,10 +96,12 @@ endif
 ifeq ($(BUILD_STATIC_LIB),1)
 	$(INSTALL_DATA) $(LIB_DIR)/$(LIB_STLIBNAME) $(DESTDIR)$(libdir)
 endif
+	$(INSTALL_DATA) $(LIB_DIR)/libi2c.3 $(DESTDIR)$(man3dir)
 
 uninstall-lib:
 	for library in $(LIB_TARGETS) $(LIB_LINKS) ; do \
 	$(RM) $(DESTDIR)$(libdir)/$$library ; done
+	$(RM) $(DESTDIR)$(man3dir)/libi2c.3
 
 all: all-lib
 


-- 
Jean Delvare
SUSE L3 Support

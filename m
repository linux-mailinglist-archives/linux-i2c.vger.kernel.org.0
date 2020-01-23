Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82152146553
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 11:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAWKD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 05:03:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:34306 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbgAWKD5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 05:03:57 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3F5B3AF3D;
        Thu, 23 Jan 2020 10:03:56 +0000 (UTC)
Date:   Thu, 23 Jan 2020 11:03:55 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Lei YU <mine260309@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH 1/2] libi2c: Add a manual page to document the API
Message-ID: <20200123110355.4cb793ce@endymion>
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

It is good practice for a library to come with a complete API description.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 lib/libi2c.3 |  137 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ i2c-tools/lib/libi2c.3	2020-01-23 10:45:45.648471093 +0100
@@ -0,0 +1,137 @@
+.\" Copyright (C) 2019  Jean Delvare <jdelvare@suse.de>
+.\" libi2c is distributed under the LGPL
+.TH libi2c 3  "December 2019" "i2c-tools" "Linux Programmer's Manual"
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

-- 
Jean Delvare
SUSE L3 Support

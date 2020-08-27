Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98032545E6
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 15:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgH0N3F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 09:29:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:60460 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728056AbgH0N2u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 09:28:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id ADB01ADC2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Aug 2020 13:29:15 +0000 (UTC)
Date:   Thu, 27 Aug 2020 15:28:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 2/2] decode-vaio: Add support for the at24 driver
Message-ID: <20200827152842.44105002@endymion>
In-Reply-To: <20200827152523.6cc67392@endymion>
References: <20200827152523.6cc67392@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have just added support for the VAIO EEPROM to the at24 kernel
driver, so let this script handle it.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-vaio |   40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

--- i2c-tools.orig/eeprom/decode-vaio	2020-08-27 10:55:47.615109809 +0200
+++ i2c-tools/eeprom/decode-vaio	2020-08-27 15:23:21.874934933 +0200
@@ -1,6 +1,6 @@
 #!/usr/bin/perl -w
 #
-# Copyright (C) 2002-2008  Jean Delvare <jdelvare@suse.de>
+# Copyright (C) 2002-2020  Jean Delvare <jdelvare@suse.de>
 #
 #    This program is free software; you can redistribute it and/or modify
 #    it under the terms of the GNU General Public License as published by
@@ -19,7 +19,7 @@
 #
 # EEPROM data decoding for Sony Vaio laptops.
 #
-# The eeprom driver must be loaded. For kernels older than 2.6.0, the
+# The at24 or eeprom driver must be loaded. For kernels older than 2.6.0, the
 # eeprom driver can be found in the lm-sensors package.
 #
 # Please note that this is a guess-only work.  Sony support refused to help
@@ -53,11 +53,39 @@
 
 use strict;
 use Fcntl qw(:DEFAULT :seek);
+use File::Basename;
 use vars qw($sysfs $found);
 
-use constant VERSION	=> "1.6";
+use constant VERSION	=> "1.7";
 use constant ONLYROOT	=> "Readable only by root";
 
+# From a sysfs device path and an attribute name, return the attribute
+# value, or undef (stolen from sensors-detect)
+sub sysfs_device_attribute
+{
+	my ($device, $attr) = @_;
+	my $value;
+
+	open(local *FILE, "$device/$attr") or return "";
+	$value = <FILE>;
+	close(FILE);
+	return unless defined $value;
+
+	chomp($value);
+	return $value;
+}
+
+# From a sysfs device path, return the driver name, or undef (stolen from
+# sensors-detect)
+sub sysfs_device_driver
+{
+	my $device = shift;
+
+	my $link = readlink("$device/driver");
+	return unless defined $link;
+	return basename($link);
+}
+
 sub print_item
 {
 	my ($label,$value) = @_;
@@ -209,10 +237,14 @@ END
 	print("\n");
 }
 
-for (my $i = 0, $found=0; $i <= 4 && !$found; $i++)
+for (my $i = 0, $found=0; $i <= 31 && !$found; $i++)
 {
 	if (-r "/sys/bus/i2c/devices/$i-0057/eeprom")
 	{
+		my $driver = sysfs_device_driver("/sys/bus/i2c/devices/$i-0057");
+		my $name = sysfs_device_attribute("/sys/bus/i2c/devices/$i-0057", "name");
+		next if ($driver eq "at24" && $name ne "24c02-vaio");
+
 		$sysfs = 1;
 		$found += vaio_decode($i, '57');
 	}

-- 
Jean Delvare
SUSE L3 Support

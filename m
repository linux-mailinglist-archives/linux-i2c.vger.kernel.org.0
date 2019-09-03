Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE80CA650B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfICJVo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:21:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:52322 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728128AbfICJVn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:21:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DE95CAC10
        for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2019 09:21:42 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:21:51 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 2/7] decode-dimms: Print kernel driver used
Message-ID: <20190903112151.3e63882b@endymion>
In-Reply-To: <20190903111706.43f9bc2b@endymion>
References: <20190903111706.43f9bc2b@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When not reading from dump files, print which kernel driver is being
used.  This will help spot setup mistakes where the legacy eeprom
driver stole EEPROMs from the ee1004 driver for DDR4 memory.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 eeprom/decode-dimms |   24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

Index: i2c-tools/eeprom/decode-dimms
===================================================================
--- i2c-tools.orig/eeprom/decode-dimms
+++ i2c-tools/eeprom/decode-dimms
@@ -2537,17 +2537,22 @@ sub sysfs_device_attribute
 
 sub get_dimm_list
 {
-	my (@dirs, $dir, $opened, $file, @files);
+	my (@drivers, $driver, $dir, $opened, $file, @files);
 
 	if ($use_sysfs) {
-		@dirs = ('/sys/bus/i2c/drivers/eeprom',
-			 '/sys/bus/i2c/drivers/at24',
-			 '/sys/bus/i2c/drivers/ee1004');	# DDR4
+		@drivers = ('eeprom',
+			    'at24',
+			    'ee1004');	# DDR4
 	} else {
-		@dirs = ('/proc/sys/dev/sensors');
+		@drivers = ('eeprom');
+		$dir = '/proc/sys/dev/sensors';
 	}
 
-	foreach $dir (@dirs) {
+	foreach $driver (@drivers) {
+		if ($use_sysfs) {
+			$dir = "/sys/bus/i2c/drivers/$driver";
+		}
+
 		next unless opendir(local *DIR, $dir);
 		$opened++;
 		while (defined($file = readdir(DIR))) {
@@ -2567,7 +2572,8 @@ sub get_dimm_list
 				next unless $file =~ /^eeprom-/;
 			}
 			push @files, { eeprom => "$file",
-				       file => "$dir/$file" };
+				       file => "$dir/$file",
+				       driver => "$driver" };
 		}
 		close(DIR);
 	}
@@ -2584,6 +2590,7 @@ sub get_dimm_list
 # Each hash has the following keys:
 #  * eeprom: Name of the eeprom data file
 #  * file: Full path to the eeprom data file
+#  * driver: Driver used to retrieve the data (undef for dump files)
 #  * bytes: The EEPROM data (array)
 #  * is_rambus: Whether this is a RAMBUS DIMM or not (boolean)
 #  * chk_label: The label to display for the checksum or CRC
@@ -2650,6 +2657,7 @@ for $current (0 .. $#dimm) {
 				printl("Guessing DIMM is in", "bank $dimm_num");
 			}
 		}
+		printl("Kernel driver used", $dimm[$current]->{driver});
 	}
 
 # Decode first 3 bytes (0-2)
@@ -2724,6 +2732,8 @@ for $current (0 .. $#dimm) {
 		# 320-383
 		if (@bytes >= 384) {
 			decode_ddr4_mfg_data(\@bytes);
+		} elsif (!$use_hexdump && $dimm[$current]->{driver} ne "ee1004") {
+			print STDERR "HINT: You should be using the ee1004 driver instead of the $dimm[$current]->{driver} driver\n";
 		}
 	} else {
 		# Decode next 35 bytes (64-98, common to most

-- 
Jean Delvare
SUSE L3 Support

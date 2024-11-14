Return-Path: <linux-i2c+bounces-7974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5F69C8349
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 07:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B8428115F
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 06:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16661EABB8;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bm9VQHJD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F67F1E884C
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731566452; cv=none; b=PwYAMfhZYnVoHqih8uRymhCjrxcNPTqbt/SLYZyoTHdyZoH390IqzMCpgazAzzjLsVs4QyYnhNRcE+EsXOYwtmDhzqkF4Y8FMatHf4WwePkk1dIkEz8bx2WJ7xng8Oe29hNAqTp5gwovzdpFcMwdnYdQrySQiFGTEt+Oxb+zzko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731566452; c=relaxed/simple;
	bh=VPVakmc0BMcwJGL7VkDUyXn+PSvTfybR6AtLUqPFoqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhmAJNCOHKvi+YDpNoV5duFTNeMkIjE1/oHA9mZlc6S6odUtID/LwDSKazWvEkffEpLgwbp4fKLQ4V2GvOiZ2VFFox1HixuP3DpBa71sT72p5eABnrR+pMAe8r7GhUxQlDoYI6IgcurY/nNa8aUs/gxFvBP06z7AjevvZ1ww0+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm9VQHJD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39ACDC4CED0;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731566452;
	bh=VPVakmc0BMcwJGL7VkDUyXn+PSvTfybR6AtLUqPFoqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bm9VQHJDUyFJt9OdcDB1DsjaAHMabHp7LxIqpP8IRyw6GhmqUMuipOKGW/oty6Jrh
	 /uDBslSEGU78rALOzjqObePbPmLbPxReAjqf1+YgMeyMPYPLSqH4M4ZPpOSthpPrLR
	 /4HZXGaFxS3uaTtnLJSekFLEzt6ydLCPegQhJFdzIGPYPKJCsNSZY4ngv8Muk3Ov4L
	 Tv8LZqU2JUp4czTZYcCH9jyHIsVslWIgDuIYP0zZlNRapyCE39GwdLjS8VkgnMggEQ
	 as/h3VOGqDhr19W4hrvGMVVf2njierpgqCLf1BrcirOV0tyl+KfjZ07Q1yswh9Zk2P
	 MlT57jCGiZPew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE92D65C4C;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
From: Stephen Horvath via B4 Relay <devnull+s.horvath.outlook.com.au@kernel.org>
Date: Thu, 14 Nov 2024 16:37:36 +1000
Subject: [PATCH 2/6] decode-dimms: Decode DDR5 Manufacturer Data
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-decode-ddr5-v1-2-0ed2db8ef30f@outlook.com.au>
References: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
In-Reply-To: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Stephen Horvath <s.horvath@outlook.com.au>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612;
 i=s.horvath@outlook.com.au; s=2024-05-10; h=from:subject:message-id;
 bh=X+AyiLEN3z1mvM8HVdsBTc0C94+YdcCxZGbiG8Yc8z8=;
 b=owEBbQKS/ZANAwAKAYC8XiInGJ2jAcsmYgBnNZtwxV640gxcrt/p8+Gcp2OmC2qjcM3OSgx/a
 dLt+UkkkUSJAjMEAAEKAB0WIQTIAeBGYgifSxYwNMiAvF4iJxidowUCZzWbcAAKCRCAvF4iJxid
 o/fpD/wO3w1wRNeW81epW68dGr4rY/7t5l0EVMyMT1KoW6L0ZJ8w5L2313RNr+ot5cBI6KOPtEc
 ihnmWlEKOcs5z8ad41OaMtbrqj9WJ3kQ+Ph/Z/DcrJLbckKk0ePOJPSsfsMmV7+v/mlgtF+X/7W
 pW5xQvGvCf9tCZRdEjOKSmHOLy96E9ZvZumTeFmF7U9bxEjn/IuUdrM0m6dg3DIo4Wd1hxXoksQ
 P5FUAZDiRB+e3/nP7K/jcEQEyAZQfq5ayJZkNlC2mc1gwuc6wvg9A0qLHhHLfZwCThC/00yyTjP
 pceZ5+GxWeQaHbQl5zpsj3gXD/eH54SUR5HWG+vLPYLdWQ75434rk02JO2YZfQFRkAkBNWkAR2M
 0Ft2zvLwm0ZafmmIusMRbMm+NFxfktJAF8t+4drq6gX0FGkgYyoEi+xk4KtIuPHxkLLIICIEV3I
 7EbzcDUiogOhlyt/dkdqhMGzc5giWKeGA9RQPH1KZIkHtOpaqFlkvM+WCGZWoI0KVpmPjhaF5hh
 WlmyP5k/+H+eqewG9EipXQg1tZiupIV7cI3L8hUmgSaW5k28t4xMJlNocia/0rkmHOXClBQ7vRe
 inurInrKawtTZ7ylglIMbt3KgQo/H04Z7vSvSJQJJKDy3Gc979Lc6Wkgp1kASPfZ1kuARVS61Y7
 uTjarXWWBH0Af1A==
X-Developer-Key: i=s.horvath@outlook.com.au; a=openpgp;
 fpr=C801E04662089F4B163034C880BC5E2227189DA3
X-Endpoint-Received: by B4 Relay for s.horvath@outlook.com.au/2024-05-10
 with auth_id=277
X-Original-From: Stephen Horvath <s.horvath@outlook.com.au>
Reply-To: s.horvath@outlook.com.au

From: Stephen Horvath <s.horvath@outlook.com.au>

Decode the DRAM's manufacturer data for DDR5.
There are more manufacturers in the common and type specific sections,
but I decided to limit myself to only reading the
'Manufacturing Information' section of the eeprom.

Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>
---
 eeprom/decode-dimms | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index 88ebe67d86d52486c8ce439d885fb3f9c89526b6..b395eafca9ba17725e391e18a70d303c0baaa291 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -2278,6 +2278,48 @@ sub decode_ddr4_mfg_data($)
 		    sprintf("0x%02X", $bytes->[349]));
 }
 
+# Parameter: EEPROM bytes 0-639 (using 512-554)
+sub decode_ddr5_mfg_data($)
+{
+	my $bytes = shift;
+
+	prints("Manufacturer Data");
+
+	printl("Module Manufacturer",
+	       manufacturer_ddr3($bytes->[512], $bytes->[513]));
+
+	printl_cond(spd_written(@{$bytes}[552..553]),
+		    "DRAM Manufacturer",
+		    manufacturer_ddr3($bytes->[552], $bytes->[553]));
+
+	printl_mfg_location_code($bytes->[514]);
+
+	printl_cond(spd_written(@{$bytes}[515..516]),
+		    "Manufacturing Date",
+		    manufacture_date($bytes->[515], $bytes->[516]));
+
+	printl_mfg_assembly_serial(@{$bytes}[517..520]);
+
+	printl("Part Number", part_number(@{$bytes}[521..550]));
+
+	printl_cond(spd_written(@{$bytes}[551]),
+		    "Revision Code",
+		    sprintf("0x%02X", $bytes->[551]));
+
+	if ($bytes->[554] != 0xff) {
+		# DRAM Stepping may be a number or an uppercase ASCII letter
+		# 0x00-0xfe is valid, 0xff is invalid
+		my $stepping = $bytes->[554];
+		if ($stepping < 0x41 || $stepping > 0x5a) {
+			printl("DRAM Stepping",
+			       sprintf("0x%02X", $stepping));
+		} else {
+			printl("DRAM Stepping",
+			       sprintf("%c", $stepping));
+		}
+	}
+}
+
 # Parameter: EEPROM bytes 0-127 (using 64-98)
 sub decode_manufacturing_information($)
 {
@@ -2828,6 +2870,15 @@ for $current (0 .. $#dimm) {
 		} elsif (!$use_hexdump && $dimm[$current]->{driver} ne "ee1004") {
 			print STDERR "HINT: You should be using the ee1004 driver instead of the $dimm[$current]->{driver} driver\n";
 		}
+	} elsif ($type eq "DDR5 SDRAM" ||
+		 $type eq "LPDDR5 SDRAM" ||
+		 $type eq "DDR5 NVDIMM-P" ||
+		 $type eq "LPDDR5X SDRAM") {
+		if (@bytes >= 640) {
+			# Decode DDR5-specific manufacturing data in bytes
+			# 512-639
+			decode_ddr5_mfg_data(\@bytes);
+		}
 	} else {
 		# Decode next 35 bytes (64-98, common to most
 		# memory types)

-- 
2.45.2




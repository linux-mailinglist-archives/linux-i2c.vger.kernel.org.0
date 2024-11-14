Return-Path: <linux-i2c+bounces-7979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACE9C834E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 07:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 533E4B256DE
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 06:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337AF1E9093;
	Thu, 14 Nov 2024 06:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtocX/Au"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69B51EABCF
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731566453; cv=none; b=B4AibSEH1ktp+DLdiQD4l/a8FZeXbYvR4qIWEeONp+Jb3FzZupN/kRYWJ7NMPbi6uR3kTm5ljV/G1Py7P0BZechDsqFSKRVXVLxBEjWgSWxOu+zvKtJTW7SKMOWCDSv5Ki9k6sGyC+HO1Ly29Rn8m0VUA8hNt++yCy4Ru2VO6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731566453; c=relaxed/simple;
	bh=7UkmwzRzPvVRZR4kyQh8SPzIgwNi7OOcSePlFoDBRek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqZQhSsoRaM2Ss5QQKKTv+47Hg3ng+eCABYZlrRMO2anoSvwr0Qz8BYZpFEaAoyYIYIfmr5qDsuSGPiKFrbRhdvraVr9bkbmFB0hr7jcBONCtNAVefEcC/hnSVdkTlEKrcy8mpKVWH50d3zSELJPaamyuSLOK7Sbbx041/a8Afw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtocX/Au; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7060FC4CED8;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731566452;
	bh=7UkmwzRzPvVRZR4kyQh8SPzIgwNi7OOcSePlFoDBRek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BtocX/AuK8grCLiEi1lXK2HlmYLWk/P7EMRELOyDeA30f7kd2TXeZ5iBWjBcRw3ky
	 +uKiNJ1w7Vf+eZvdqEin6q8pS/tFddhRgsoSuXWd0zMwXikZknhc6AX5sna49RmCj0
	 wSPPORlqhULoVpdpqdnhIRbE3VU+rmdwNdEpi1KOEHajdXD7oQxwQvRM1icEU3tYCz
	 umYtWrqnBdLJrwkxULPGAhGwoUwqTbQSJ0pth58NNEpZKG711n6whwsjuuKvaUpeoj
	 3iBQwPTA2g9ReMeDcPE9Pm7WyTMrFnNVuo6YmT2GT8ntvuGGaAhvtqYU6m/nkcscXK
	 bea6M/JMj/WrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F99D65C4F;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
From: Stephen Horvath via B4 Relay <devnull+s.horvath.outlook.com.au@kernel.org>
Date: Thu, 14 Nov 2024 16:37:40 +1000
Subject: [PATCH 6/6] decode-dimms: Decode DDR5 error log
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-decode-ddr5-v1-6-0ed2db8ef30f@outlook.com.au>
References: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
In-Reply-To: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Stephen Horvath <s.horvath@outlook.com.au>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5999;
 i=s.horvath@outlook.com.au; s=2024-05-10; h=from:subject:message-id;
 bh=A8O/ruVMqwOn599M2htEJdweuap0U7q1Y3nIc9FO6VI=;
 b=owEBbQKS/ZANAwAKAYC8XiInGJ2jAcsmYgBnNZtyNKNq45T8D41/g4BA/TiL5/A4pNuGwAhnp
 ONb1jhD7jSJAjMEAAEKAB0WIQTIAeBGYgifSxYwNMiAvF4iJxidowUCZzWbcgAKCRCAvF4iJxid
 o+cID/9uVzU3YRJQcjwNMelgsPAxItzMLT5a0jknUCpYjQwu82DUxQ7A+BJWhD0HwYBRhJmQVy2
 80v8eVivffheveIujhnXCwUKQearVPaAYiEG8Sf+ph079ZqO4slgPKPKUds7utb2mF3jgP9DS4J
 FXMQw/jJtnrBDNgeK+4nk8Y1OpzdazjgO2mxgL1FH2jzj8yrxr9k1a1M2bTFGJiuwodW9s8iOWI
 P9ZZYVlXKlv6R+iHnnMm+U8sch8e75fZMx4XX7lmoQjQsZtE43o1yZ63OIm85vjzIkC4jXKS2vC
 CMoG3GFFz8SX99Oa0UePjVhWtNNbDJvsj/qerOFcNNVP2erj+At4G4KTh1CgjiDUHgt6cvxVR/t
 2V7QXC1xlCiE6D2IkmBrKxTrcrjiJHzJJDI2K+STyZ87nrZDbL5/sb94VOwuFyvBTiQ4J7bd1+W
 C5SQr8bS7hiRjvfT9MH5G05NuXb5cfHGcn0yy3kFSz/2jOOGFwbi5ew8KrGmwdWgkPpxSgrjX4d
 2fQ0WO6f5ocht55OjUp+51TXGoG4D9NT2vrB0t2rtWtGpnHNKesXmA/uewB2CgE4U7/zRCHHdsY
 5nyltzAJFNWXpG9gJm+9lseUZgSOoLtTDs2FpQ1YKi+BhjI13Jxm6DQHTdt+tHGV42MFcjnW2Xw
 +cXXQRytDc40Q0Q==
X-Developer-Key: i=s.horvath@outlook.com.au; a=openpgp;
 fpr=C801E04662089F4B163034C880BC5E2227189DA3
X-Endpoint-Received: by B4 Relay for s.horvath@outlook.com.au/2024-05-10
 with auth_id=277
X-Original-From: Stephen Horvath <s.horvath@outlook.com.au>
Reply-To: s.horvath@outlook.com.au

From: Stephen Horvath <s.horvath@outlook.com.au>

JESD400 specifies that an error log can be written to anywhere in the end
user programmable eeprom section, following a specific format. This adds
some code to find and read this error log. This is also completely
untested on actual hardware implementations, only tested by reading some
manually constructed files.

Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>
---
 eeprom/decode-dimms | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index a3b613bc869bbd1d8183958c42d05c3b3e3653ca..a6a16696b126b16b7a8e62b15120f99789d9b762 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -2656,6 +2656,108 @@ sub decode_ddr5_mfg_data($)
 	}
 }
 
+# Parameter: EEPROM bytes 0-1023 (using 640-1023)
+sub decode_ddr5_error_data($)
+{
+	my $bytes = shift;
+
+	# Zero or more error logs may appear anywhere in any End User Programmable blocks of the SPD,
+	# including over SPD Block boundaries. They may be found by searching for a four byte anchor string.
+
+	my $errors = [];
+
+	my $size = scalar @{$bytes} < 1023 ? scalar @{$bytes} : 1023;
+
+	for (my $ii = 0; $ii < $size - 640 - 23; $ii++) {
+		if (join('', @{$bytes}[640 + $ii .. 640 + $ii + 3]) eq "95707695") {
+			push @{$errors}, [@{$bytes}[640 + $ii .. 640 + $ii + 23]];
+			$ii += 23;
+		}
+	}
+
+	if (@{$errors} == 0) {
+		# No error logs found
+		return;
+	}
+
+	prints("Error Log");
+
+	printl("Error Log Count", scalar @{$errors});
+
+	for (my $ii = 0; $ii < scalar @{$errors}; $ii++) {
+		my $error = @{$errors}[$ii];
+	
+		# error location
+		printl_cond($error->[4] & (1 << 0), "Error $ii Type", "DRAM Uncorrectable Error");
+		printl_cond($error->[4] & (1 << 1), "Error $ii Type", "DRAM Correctable Error");
+		printl_cond($error->[4] & (1 << 2), "Error $ii Type", "DRAM ECS Error");
+		printl_cond($error->[4] & (1 << 3), "Error $ii Type", "hPPR Was Required");
+		printl_cond($error->[4] & (1 << 4), "Error $ii Type", "hPPR Resource Error");
+
+		printl("Error $ii Location CPU", ($error->[5] >> 3) & 0x07);
+		printl("Error $ii Location CPUMC", (($error->[5] & 3) << 2) | ($error->[6] >> 6));
+		printl("Error $ii Location DIMM", ($error->[6] >> 4) & 0x01);
+
+		# these are active low
+		printl_cond(~$error->[6] & (1 << 3), "Error $ii Location Rank", "0 (sub-channel A)");
+		printl_cond(~$error->[6] & (1 << 2), "Error $ii Location Rank", "1 (sub-channel A)");
+		printl_cond(~$error->[6] & (1 << 1), "Error $ii Location Rank", "0 (sub-channel B)");
+		printl_cond(~$error->[6] & (1 << 0), "Error $ii Location Rank", "1 (sub-channel B)");
+
+		printl("Error $ii Location Parity", ($error->[7] >> 6) & 0x01);
+		if (($error->[7] >> 5) & 1) {
+			# chip identifier?
+			printl("Error $ii Location Chip", ($error->[7] >> 2) & 0x07);
+		} else {
+			# row address?
+			printl("Error $ii Location Bank Group", (($error->[7] & 0x03) << 1) | (($error->[8] & 0x80) >> 7));
+			printl("Error $ii Location Bank Address", ($error->[8] >> 5) & 0x03);
+			printl("Error $ii Location Row Address", (($error->[8] & 0x1f) << 12) | ($error->[9] << 4) | ($error->[10] >> 4));
+			printl("Error $ii Location Column Address", (($error->[10] & 0x0f) << 7) | (($error->[11] & 0xf0) >> 1));
+		}
+
+		# also active low
+		printl_cond(~$error->[11] & (1 << 0), "Error $ii Location Device", "DQS6A");
+		printl_cond(~$error->[11] & (1 << 1), "Error $ii Location Device", "DQS7A");
+		printl_cond(~$error->[11] & (1 << 2), "Error $ii Location Device", "DQS8A");
+		printl_cond(~$error->[11] & (1 << 3), "Error $ii Location Device", "DQS9A");
+
+		printl_cond(~$error->[12] & (1 << 0), "Error $ii Location Device", "DQS8B");
+		printl_cond(~$error->[12] & (1 << 1), "Error $ii Location Device", "DQS9B");
+		printl_cond(~$error->[12] & (1 << 2), "Error $ii Location Device", "DQS0A");
+		printl_cond(~$error->[12] & (1 << 3), "Error $ii Location Device", "DQS1A");
+		printl_cond(~$error->[12] & (1 << 4), "Error $ii Location Device", "DQS2A");
+		printl_cond(~$error->[12] & (1 << 5), "Error $ii Location Device", "DQS3A");
+		printl_cond(~$error->[12] & (1 << 6), "Error $ii Location Device", "DQS4A");
+		printl_cond(~$error->[12] & (1 << 7), "Error $ii Location Device", "DQS5A");
+
+		printl_cond(~$error->[12] & (1 << 0), "Error $ii Location Device", "DQS0B");
+		printl_cond(~$error->[12] & (1 << 1), "Error $ii Location Device", "DQS1B");
+		printl_cond(~$error->[12] & (1 << 2), "Error $ii Location Device", "DQS2B");
+		printl_cond(~$error->[12] & (1 << 3), "Error $ii Location Device", "DQS3B");
+		printl_cond(~$error->[12] & (1 << 4), "Error $ii Location Device", "DQS4B");
+		printl_cond(~$error->[12] & (1 << 5), "Error $ii Location Device", "DQS5B");
+		printl_cond(~$error->[12] & (1 << 6), "Error $ii Location Device", "DQS6B");
+		printl_cond(~$error->[12] & (1 << 7), "Error $ii Location Device", "DQS7B");
+
+		# timestamp
+		my $year = ($error->[14] >> 2) + 2020;
+		my $month = (($error->[14] & 0x03) << 2) | ($error->[15] >> 6);
+		my $day = ($error->[15] & 0x3e) >> 1;
+		my $hour = (($error->[15] & 0x01) << 4) | ($error->[16] >> 4);
+		my $minute = (($error->[16] & 0x0f) << 2) | ($error->[17] >> 6);
+		my $second = $error->[17] & 0x3f;
+		printl("Error $ii Timestamp", sprintf("%04d-%02d-%02d %02d:%02d:%02d",
+						      $year, $month, $day, $hour, $minute, $second));
+
+		# DRAM refresh settings
+		# TODO
+
+		# measured temperature
+		# TODO
+	}
+}
+
 # Parameter: EEPROM bytes 0-127 (using 64-98)
 sub decode_manufacturing_information($)
 {
@@ -3215,6 +3317,9 @@ for $current (0 .. $#dimm) {
 			# Decode DDR5-specific manufacturing data in bytes
 			# 512-639
 			decode_ddr5_mfg_data(\@bytes);
+			# Decode DDR5-specific error log
+			# 640-1023 (max)
+			decode_ddr5_error_data(\@bytes);
 		}
 	} else {
 		# Decode next 35 bytes (64-98, common to most

-- 
2.45.2




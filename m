Return-Path: <linux-i2c+bounces-7978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA429C834D
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 07:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB771B2551C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 06:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250331EB9ED;
	Thu, 14 Nov 2024 06:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkXHAQJw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC41EABA9
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731566452; cv=none; b=mefvVgOlDF2LmRyPmCIBDmfGZRPt71aPVGhQpzlrDd9Ny4TWPBs4bANWlXgI3H7xt7Ff+6h08gcdGIb7K6QXPRV/nz/tq2Nq93QKe7Wyrg5dr6M+8C/LOodk1C9GXVtL+xImrzh6EPqxveA1NZ1cbhq8umF3Fp1onmzDALIzUZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731566452; c=relaxed/simple;
	bh=yNSCeCrIwPAgFS1lFaPJeXf7JPvPmr2Y9GwLO/vMI7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LKs9eFmJeVMXxklVBY6iowdWIi1N+hStAHBMNyt08Vk3zS4iYLvRi5huYBdC1E5mpwce22ueEvE7iS8cf35HhtGcBPqG2B7rbBGJyiIAOcUIaZus9WO5uQxF/EZ5hIQX/ztP4tIDdkQYuBTh4LocmNiKYaia4XpAMvvnvyp+Tuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkXHAQJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52E99C4CED7;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731566452;
	bh=yNSCeCrIwPAgFS1lFaPJeXf7JPvPmr2Y9GwLO/vMI7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qkXHAQJwg31hLIyKIeroEmH13wQpLGUtjJY4C3ERkK0eBmBjKbX6W2A98bcZHLlId
	 xYWln0XM2l/z3YE6lQ2o5TXO/7MAyJ8mCI2kwrbdNx2j+40GmXSP/IYRJz0VHq37/e
	 NpAQR5InH23XjIy4t90qTtvq7iNxxDrbdd4lE9vO+XrVb+UZkkVqvwtyFa+id0oVfQ
	 CcY3aTG02b9wReyy33CDMrsO1e9FDGsr7TcJFWyC1TGPf0F6RVLzsr8iZsxbJTsjWH
	 aRvhhHxek0EQe4RxxJwdvrrer1eqYs2Ik0cCfRk0/+q5bEJUI3w0hPbEacUVVyLeij
	 19MmIc5RhZgCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD37D65C48;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
From: Stephen Horvath via B4 Relay <devnull+s.horvath.outlook.com.au@kernel.org>
Date: Thu, 14 Nov 2024 16:37:38 +1000
Subject: [PATCH 4/6] decode-dimms: Decode DDR5 common module information
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-decode-ddr5-v1-4-0ed2db8ef30f@outlook.com.au>
References: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
In-Reply-To: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Stephen Horvath <s.horvath@outlook.com.au>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=s.horvath@outlook.com.au; s=2024-05-10; h=from:subject:message-id;
 bh=DIxs5C5xxcrutDoF8/mc8o5mMwdN5y6h33snnMesEb0=;
 b=owEBbQKS/ZANAwAKAYC8XiInGJ2jAcsmYgBnNZtx6aw1AGIpoFCHHLkWsaRsM4PqZhna3zAlf
 aLERcLq0YOJAjMEAAEKAB0WIQTIAeBGYgifSxYwNMiAvF4iJxidowUCZzWbcQAKCRCAvF4iJxid
 o5+tD/4mDbisrDuru2XGWZdHUgFUeF19niyy+3V60FR172Db0Ftgqr/i9GZiltBEcN1CLFRgqy+
 6CXc61a/7qp9aF0fJSi/0Fzuxuc4AwWQ+QYImFqMPtfxHxY+Rj2luMrO2wYI4vEjVU6MbhiWqAU
 up+ed0ps2o/HaF0TYwQD71dbpLdL5iwd3m1aELwEw4tDIpXwj09PIlnQoWhTqaHsm1t3ITgPa/p
 9lZlaOymxy1akh5tUVj5eI0EU9zydqXjod74y5AxhxC+0VnoaPjHLmSjUiG8oA4q4ZgNo/9mABV
 sAUhJkrcG55TJZR4Gqx4Ge9oYt7zDCOGp8kCGb2mye/S3aMSZT+d/LupeeCuHz7DEvYW7FEr/S7
 5XwZfcZpPugkx6UNYTnVOZxgqKs9oyF+OpDhdJe1/bfOllUYQpg/5mYWLx2GS/2hINu/59Tq3dg
 bh1un7DV787soR5rv0mc0gShs1ACDkcCY6gD79DibZvdP3MkJ/AzZHkS3eockcoPqKVl8bd0zUp
 ozzJ/odaw/B0pyhc3msNku8p6gmG5AJzloBq2xVa2v1J7mBnUFrg05HIlQhna6U2o1qjGSv4Ik0
 7uShmEbl1tAmnU2bJ8kfdg5MoqM0VhQuPsUbDtHO38buHsNu+rmuZ1IJ1wwHu3zp9F8kabqa1Wh
 k0tX6ffH3FkUMDQ==
X-Developer-Key: i=s.horvath@outlook.com.au; a=openpgp;
 fpr=C801E04662089F4B163034C880BC5E2227189DA3
X-Endpoint-Received: by B4 Relay for s.horvath@outlook.com.au/2024-05-10
 with auth_id=277
X-Original-From: Stephen Horvath <s.horvath@outlook.com.au>
Reply-To: s.horvath@outlook.com.au

From: Stephen Horvath <s.horvath@outlook.com.au>

Decode that extra manufacturer information that was mentioned earlier,
but only the info that is common between all DDR5 memory modules.
Also the physical size is here too.

Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>
---
 eeprom/decode-dimms | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index 4a19e962cd1f837ccdb6660caa8d198f65e3fc4f..f36af056a480d429203abc7e0dfda3751027948b 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -2350,6 +2350,42 @@ sub decode_ddr5_sdram($)
 
 	printl("Thermal Sensor",
 	       $bytes->[14] & 0x08 ? "Supported" : "No");
+
+# common module information
+	prints("Common Information");
+
+	my $spd_info_rev = $bytes->[192];
+	printl("SPD Module Info Revision", ($spd_info_rev >> 4) . "." . ($spd_info_rev & 0xf));
+
+	printl_cond($bytes->[196] & 0x80,
+		    "SPD Manufacturer",
+		    manufacturer_ddr3($bytes->[194], $bytes->[195]));
+	printl_cond($bytes->[200] & 0x80,
+		    "PMIC0 Manufacturer",
+		    manufacturer_ddr3($bytes->[198], $bytes->[199]));
+	printl_cond($bytes->[204] & 0x80,
+		    "PMIC1 Manufacturer",
+		    manufacturer_ddr3($bytes->[202], $bytes->[203]));
+	printl_cond($bytes->[208] & 0x80,
+		    "PMIC2 Manufacturer",
+		    manufacturer_ddr3($bytes->[206], $bytes->[207]));
+	printl_cond($bytes->[212] & 0xC0,
+		    "Thermal Sensors Manufacturer",
+		    manufacturer_ddr3($bytes->[210], $bytes->[211]));
+
+	prints("Physical Characteristics");
+
+	my $height = $bytes->[230] & 0x1f;
+	printl("Module Height",
+		$height == 0x00 ? "15 mm or less" :
+		$height == 0x1f ? "more than 45 mm" :
+		sprintf("%u mm", $height + 15));
+	printl("Module Thickness",
+		sprintf("%d mm front, %d mm back",
+			($bytes->[231] & 0x0f) + 1,
+			(($bytes->[231] >> 4) & 15) + 1));
+	printl("Module Reference Card",
+		ddr3_reference_card($bytes->[232], $bytes->[232]));
 }
 
 # Parameter: EEPROM bytes 0-127 (using 4-5)

-- 
2.45.2




Return-Path: <linux-i2c+bounces-10602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC8DA99FAE
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 05:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F12F4600A1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 03:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5319D1B3F3D;
	Thu, 24 Apr 2025 03:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Tt5LiOcQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D11A8F8A;
	Thu, 24 Apr 2025 03:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745466306; cv=none; b=UOfVWkL+Dezea9Vf0ieDvoaUVApQIi6vv3kglpxbAdLlU1g+/TvqtGXoTUVUvG6D+oBa2+FHMgeRMgYavuZl105qnAqJpFITnIwpRoo4PGW7OwDOJ7cQNLViIPnFBlpqpZmB3xAZrLJAUsJ42LIMrOldrv68nJ7BA7Oo2xCsu38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745466306; c=relaxed/simple;
	bh=NnqERpE7eR8g8r0iLIpxS2uNkqlSpGP9aGgq+2djYg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pENzuJXNFqpz+azhLPUThtnqztKuK2+t4gSHm3SeAb0jxXa+0niclR29I0gRE2ZQ28kGOMv4sBnFUObJsiG1vLSLBKUrVvCU2r169HdyJ53kckh+K7cFq3gMcTumFZfz9pglqZQNUYofN7hkIZObIMwe3ilz8F2cnXBLrNXHD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Tt5LiOcQ; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [10.102.98.142] (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B5C913FFEC;
	Thu, 24 Apr 2025 03:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745465800;
	bh=9TuPK+Tu+4yd7SCrzNeveB7vgYe62My2LDqUfykqOFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=Tt5LiOcQKE1L/PtyBiv/DnoXVkcXZKjrW8gvZ2XrCSHD+yKSqup/MpCDyWq0hL/9q
	 i92PECtVLm8IkhcEtnWFLipqraRLHFR9amxKgOQIOTc18R0M8TlmlhcRhCd+Dp2nuY
	 CJ42FF4S3UfV6uzW/D6W+LoRzu2ZjMICNlJuCo6N92k4rTvNmXsFbJNdoaFvPTWCrO
	 HhFcni9PEzl1ayXzDUdmOho8ZCIUriIF1OAl1SwnNPe6h8vT9Vgm2TjGApVUhef9Tg
	 /pVFs2g1/YJPVfI9mLpG52aYEz9U5iCw4vXAk+njdTWlcnOxvy1XdjgMW0v27myxmZ
	 m+Nnm2X73Ra6A==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Thu, 24 Apr 2025 11:35:44 +0800
Subject: [PATCH 2/2] i2c: i801: don't instantiate spd5118 if SPD Write
 Disable is set
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-2-627398268a1f@canonical.com>
References: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
In-Reply-To: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=NnqERpE7eR8g8r0iLIpxS2uNkqlSpGP9aGgq+2djYg4=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoCbG9Stdu01Wp2ar44hPp3CIGHsuW4dvAyyq/X
 fD466cwV2qJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaAmxvQAKCRBfF7GWSinu
 hgl+D/988uFs6hJ3+3qTA3IDg7pYKd2cw3W2eJUAJben9yBdu6Mxu70241Xih3tY5bgwq9aZGv1
 SxGOskARCwOZaAWe//d9LrOZxebnOOAMndiEwHSm4RiOUnf/Nli6DZGzvq5J67ZTz+Jq8IpjDDv
 9fhLx1jSlTDNnATLcRqyj/amCxrWvHE/CD3tEquuQky6sl5IE26D8A0QheVh2y+kcG5BG+1XS9d
 qAnSZONUVEeCnQf/Q0UTCk/pcUJDIFRq5ENNF4y9AgpmGfwW2XHTWA+wjfeUfH0jdHqmU1UFGrg
 hI7DOofls/mi9IiY4yma4JMumUNta7Cm6WcQyGsatQa0nStkNzLf9eJ28zRyoTvl3tLdsUMfBoF
 LTY0YFgZMTls71t44hiAHBVrNZMfbbAfGiXpw5G6/5cmI8vz70V6KDZ/UtkV+NGA/2DogvTldSo
 fSPFNzx1PS+ecYoCOaKBrGWO8UyQiCufYCwzopy8F927SvHro44//0CjdqCfWJxxDpmWcKGfHjK
 3j2LpZzr0NscROZmpkpdO3TEE44I4e0FrOZt1rFhFFqGE3dZZn3m6GDVzoueyFAGskb+x0PLDPy
 s+/HAGclTAdsMR+gse6njr2SlpaFsiMiUcOc3KYgGw5thO7WvQG8Y9Sp0cVe45rGIfVfnLSbYEI
 vkdowSPIRlDVhGw==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

If SPD Write Disable bit in the SMBus is enabled, writing data to
addresses from 0x50 to 0x57 is forbidden. This may lead to the
following issues for spd5118 device:

  1) Writes to the sensor hwmon sysfs attributes will always result
     in ENXIO.

  2) System-wide resume, errors may occur during regcache sync,
     resulting in the following error messages:

     kernel: spd5118 1-0050: Failed to write b = 0: -6
     kernel: spd5118 1-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
     kernel: spd5118 1-0050: PM: failed to resume async: error -6

  3) nvmem won't be usable, because writing to the page selector becomes
     impossible.

Also, spd5118 from some manufacturers may set the page to a value != 0
after a sensor reset. This will make the sensor not functional unless
its MR11 register can be changed, which is impossible due to writes being
disabled.

To address these issues, don't instantiate it at all if SPD Write Disable
bit is set.

Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
---
 drivers/i2c/i2c-smbus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 97e833895dd7..cb7ef6a7a174 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -378,6 +378,7 @@ void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
 	u16 handle;
 	u8 common_mem_type = 0x0, mem_type;
 	u64 mem_size;
+	bool scan_needed = true;
 	const char *name;
 
 	while ((handle = dmi_memdev_handle(slot_count)) != 0xffff) {
@@ -438,6 +439,7 @@ void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
 	case 0x22:	/* DDR5 */
 	case 0x23:	/* LPDDR5 */
 		name = "spd5118";
+		scan_needed = !write_disabled;
 		break;
 	default:
 		dev_info(&adap->dev,
@@ -461,6 +463,9 @@ void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
 		addr_list[0] = 0x50 + n;
 		addr_list[1] = I2C_CLIENT_END;
 
+		if (!scan_needed)
+			continue;
+
 		if (!IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL))) {
 			dev_info(&adap->dev,
 				 "Successfully instantiated SPD at 0x%hx\n",

-- 
2.43.0



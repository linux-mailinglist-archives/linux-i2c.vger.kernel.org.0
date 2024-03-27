Return-Path: <linux-i2c+bounces-2627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29D88D937
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 09:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A04201F2A650
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 08:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF6D2E85A;
	Wed, 27 Mar 2024 08:34:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B1125C9;
	Wed, 27 Mar 2024 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711528456; cv=none; b=DX7bjHOzxBFtOqpm16rYb0krxtE9R7IbpOu+WTV7CUXLpNeLM/7Y4KWNv+poEZBFUtVTc01xr2tw+58unX69jKtxfYeTybzARsOqcHlGTwM7WkJLwAk19b7t7IMXF9ICiQI1WuLyiko3slonhlo+LfsOUvKuJYtfnNniPER3GKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711528456; c=relaxed/simple;
	bh=UGvZxVMikB6qaCnJ2KKhOrkVnVs1RqwYKNO6LJX6940=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=msP3pHDyjb6JvkCo0ZAzFshCkuIq/sQd+xSRaVialcuokxkX5wkkVveXPFwcAWCPxfiNXDFneAyhew5ZVP0/oQNSguQf+S9XwlykvRK9uQX08khnpwTD/EsKvvx0Cj2bKUTPCUfNyTZqyEMJRW9qMCAcal5BpxZZVylPW6lri0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from localhost.localdomain (ip5f5aedba.dynamic.kabel-deutschland.de [95.90.237.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 86C4561E5FE06;
	Wed, 27 Mar 2024 09:34:02 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: smbus: Add (LP)DDR5 types to `i2c_register_spd()`
Date: Wed, 27 Mar 2024 09:33:55 +0100
Message-ID: <20240327083356.74246-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On several systems Linux logs:

     i2c i2c-0: Memory type 0x22 not supported yet, not instantiating SPD

1.  Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022
2.  Dell Inc. Precision 3660/0PRR48, BIOS 2.9.3 11/22/2023
3.  Dell Inc. OptiPlex SFF Plus 7010/0YGWFV, BIOS 1.7.1 08/11/2023
4.  Run `git grep 'emory type.*supported yet, not instantiating SPD'` in
    the repository of dmesg reports for various computers collected by
    Linux users at https://linux-hardware.org. [1]

Add 0x22 and 0x23 for DDR5 according to section 7.18.2 (Memory Device —
Type), table 78 in *System Management BIOS (SMBIOS) Reference
Specification*, version 3.6.0 [2].

I use the same name as for DDR4 out of ignorance.

[1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.6.0.pdf
[2]: https://github.com/linuxhw/Dmesg
---
 drivers/i2c/i2c-smbus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 97f338b123b1..0d67a95c0599 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -308,7 +308,7 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
  * target systems are the same.
  * Restrictions to automatic SPD instantiation:
  *  - Only works if all filled slots have the same memory type
- *  - Only works for DDR, DDR2, DDR3 and DDR4 for now
+ *  - Only works for DDR, DDR2, DDR3, DDR4 and DDR5 for now
  *  - Only works on systems with 1 to 8 memory slots
  */
 #if IS_ENABLED(CONFIG_DMI)
@@ -380,6 +380,8 @@ void i2c_register_spd(struct i2c_adapter *adap)
 		break;
 	case 0x1A:	/* DDR4 */
 	case 0x1E:	/* LPDDR4 */
+	case 0x22:	/* DDR5 */
+	case 0x23:	/* LPDDR5 */
 		name = "ee1004";
 		break;
 	default:
-- 
2.43.0



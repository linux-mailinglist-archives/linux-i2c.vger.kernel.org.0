Return-Path: <linux-i2c+bounces-3244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D448B420E
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 00:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3626283F4D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 22:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE249374DB;
	Fri, 26 Apr 2024 22:09:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8538F82;
	Fri, 26 Apr 2024 22:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714169341; cv=none; b=LCZemKOUrc2Y9diRUHFMlNO+cWuGFCHj8eSdjJzY01vwSmBhhfwDKTjK62fNhOjJJbs1cm8F7NVDeFBSVYgiTZScAlQELDnv9ZeuNzC+ETQOyW43T+ZlU1HGiADJr0GSv4kFJnT+Y246S6Vkp0ilMXzdcle/MGXoR1yS3tCQi5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714169341; c=relaxed/simple;
	bh=XngLk3rh99WGiLHg8bpg5snL+jhoAiLTaMr5zaZSZ6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ftxxrAM7C9lNx+IjgU7nXAtfNVX6q/uhgKHeFVF4ymde5aZ16+Zm0h0q8xOCCvb1+aAGl4qQOu347AF83nW5SYS/mrDuDTcxA+0uNn1G2FRjkRZC03faczqSxipCo/XZYIIo47n0H2/hSV3eLsyQBHJ+Xrq7bZkz2ZjdAvTytMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from localhost.localdomain (ip5f5af2dd.dynamic.kabel-deutschland.de [95.90.242.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A7F4761E5FE06;
	Sat, 27 Apr 2024 00:08:41 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: smbus: Add (LP)DDR5 types to `i2c_register_spd()`
Date: Sat, 27 Apr 2024 00:07:48 +0200
Message-ID: <20240426220748.28184-2-pmenzel@molgen.mpg.de>
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

The same name *ee1004* as for DDR4 is used.

Successfully tested on Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022:

    [    5.459383] i801_smbus 0000:00:1f.4: SPD Write Disable is set
    [    5.465180] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
    [    5.465803] intel_pstate: HWP enabled by BIOS
    [    5.474046] i2c i2c-0: Successfully instantiated SPD at 0x50
    [    5.475379] intel_pstate: Intel P-state driver initializing
    [    5.487129] i2c i2c-0: Successfully instantiated SPD at 0x51
    [    5.487350] intel_pstate: HWP enabled
    [    5.493288] i2c i2c-0: Successfully instantiated SPD at 0x52
    [    5.496481] hid: raw HID events driver (C) Jiri Kosina
    [    5.502695] i2c i2c-0: Successfully instantiated SPD at 0x53

[1]: https://github.com/linuxhw/Dmesg
[2]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.6.0.pdf

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.de>
---
1.  I have no idea if the name ee1004 is correct.
2.  Should I test other things besides looking at the Linux messages?

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



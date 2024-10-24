Return-Path: <linux-i2c+bounces-7516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978259ADD77
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566B8282DD1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 07:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B8918BB8B;
	Thu, 24 Oct 2024 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="cWpLo8Eq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87BC19CC25;
	Thu, 24 Oct 2024 07:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754318; cv=none; b=g9EWi55d8A/EIzdf353TgbyQZ+DpKEXtZyaiXTh+r8yWW6fR0kaDQiJtdmff8+CZKlq6tbK2maDwIHRTcDFC1vZ9pdSzXjXqPpfjQMxUZ1GaMTbFI239pIPWIgONyBls0+cQKwj53xqyTUiAkTPoDic/1ZCNwNTi2y/C8LKEOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754318; c=relaxed/simple;
	bh=/2vAQ2orbtt6jFt/wJe83iV1UJ5z1C5ZfzMaGqbUAIw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=mru9Tl5LcRP53sp49elCdZnL/d3uM8MkZAwBHGXjUDdK6fh3pRRFooaIrwXxRZNu5jTMVM9ml3MThRd3/GdFFnT+ZFzFQhjE0kyhJKPe3F/TGqj0czLIN/UQPdw+arkybRNiVrrP4nUIyp51pWu8NPFBPp/1vB3T5F9XTSMzDaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=cWpLo8Eq; arc=none smtp.client-ip=207.54.90.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729754317; x=1761290317;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/2vAQ2orbtt6jFt/wJe83iV1UJ5z1C5ZfzMaGqbUAIw=;
  b=cWpLo8Eqnwc71DtPXfmYbPaVPQUfdkaLUstTG5ZNLtCqdzGki2uOAFlo
   oduggSjflchFg0pzxb6/KIq3J+QrT8tg+2hezFl21wlROUhQpis2s/X50
   I+TdjKMvviUo4OBtzswhCQJs4Twpw2t7+a1XGfRxoHksS7PGwvhInKN0A
   n8NLMZIsYpX1LEoinZPW80Y5hBLzF48H6jAK7Nbvf41ZIEeFd7HlXGQhL
   F1qES8xRZzUJMqBVGD2/W/aarzVEcPT2UBR+JKEytc7ju5z8LN4si5nPj
   6AbkcYygYqyjH6UYYGHtuOcNdG+H9kowU9TTxKPXo5BhrwVWqJQsVqqgC
   w==;
X-CSE-ConnectionGUID: ZXqK5EbZRCeiuIrJ52lE7g==
X-CSE-MsgGUID: v13xD5VSTwy+qyWfqUoHRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="177828397"
X-IronPort-AV: E=Sophos;i="6.11,228,1725289200"; 
   d="scan'208";a="177828397"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 16:17:25 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC76AD647E;
	Thu, 24 Oct 2024 16:17:21 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A4EFD4C00;
	Thu, 24 Oct 2024 16:17:21 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om2.fujitsu.com (Postfix) with ESMTP id E44A0400578EC;
	Thu, 24 Oct 2024 16:17:20 +0900 (JST)
From: Yoshihiro Furudera <fj5100bi@fujitsu.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Subject: [PATCH v2] i2c: designware: Add ACPI HID for DWAPB I2C controller on FUJITSU-MONAKA
Date: Thu, 24 Oct 2024 07:15:53 +0000
Message-Id: <20241024071553.3073864-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

Enable DWAPB I2C controller support on FUJITSU-MONAKA.
This will be used in the FUJITSU-MONAKA server scheduled
for shipment in 2027.

The DSDT information obtained when verified using an
in-house simulator is presented below.

     Device (SMB0)
     {
         Name (_HID, "FUJI200B")  // _HID: Hardware ID
         Name (_UID, Zero)  // _UID: Unique ID
         ...
         Name (_CRS, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x2A4B0000,         // Address Base
                 0x00010000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000159,
             }
         })
         ...
     }

The expression SMB0 is used to indicate SMBus HC#0,
a string of up to four characters.

Created the SMB0 object according to the following
specifications:

ACPI Specification
13.2. Accessing the SMBus from ASL Code
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/13_ACPI_System_Mgmt_Bus_Interface_Spec/accessing-the-smbus-from-asl-code.html

IPMI Specification
Example 4: SSIF Interface(P574)
https://www.intel.co.jp/content/www/jp/ja/products/docs/servers/ipmi/ipmi-second-gen-interface-spec-v2-rev1-1.html

Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
---
Changes in v2:
- Updated the commit message as per previous discussion. (Andy)
- Change the string "Fujitsu MONAKA" to "FUJITSU-MONAKA"
- Link to v1: https://lore.kernel.org/all/20241018015826.2925075-1-fj5100bi@fujitsu.com/

 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2d0c7348e491..c04af315a4f9 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -351,6 +351,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
 	{ "AMDI0510", 0 },
 	{ "APMC0D0F", 0 },
+	{ "FUJI200B", 0 },
 	{ "HISI02A1", 0 },
 	{ "HISI02A2", 0 },
 	{ "HISI02A3", 0 },
-- 
2.34.1



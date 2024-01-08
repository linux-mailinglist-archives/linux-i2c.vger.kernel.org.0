Return-Path: <linux-i2c+bounces-1203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44078267F7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 07:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39DF6281CA1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 06:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC958473;
	Mon,  8 Jan 2024 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="blqzxTZJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F127465;
	Mon,  8 Jan 2024 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704694934; x=1736230934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WLlD667SlYu6Vle9zCroNnbONlCAGpGMG2WQHv+acL8=;
  b=blqzxTZJES7zPBEuOeH18Q/V8J+1oqlH6/pPu6MRoOj/pSBVfNXf13qq
   0PSQ6UJCevlYdLjWIGWEZgvEeGstoRmeGONDeiZ1av+0nXzp0320rH90U
   BF2loTrhmjV2HEM4/sL/0haNknXCvxBi87yKQ1PUGOTJiYmAreCDWepSS
   Y7AQOgzXvxViYBqbLT1ex5xKePCSWEePwNFwUBmmv7j9W6kqxBk/LfoXV
   ydQjxs7iPwlzhNkV2l4b7q1U5+VWj5/Rx7ELv9004hqZ2uF/9WZkgMwS3
   leVz7BLrBvlbQ/rOEPFDD0hGJdBLTTiIvinfIwlB81i3feFz+7ruriy3g
   A==;
X-CSE-ConnectionGUID: QE9fNKUrR+GdEUXyDBi0kQ==
X-CSE-MsgGUID: j4idvRUGSOOtzP+6+RhSLA==
X-IronPort-AV: E=Sophos;i="6.04,340,1695657600"; 
   d="scan'208";a="6822653"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2024 14:21:07 +0800
IronPort-SDR: RoSAO+HiZZ5UpilwXQXv3+RLQuV7VrkQcqwV7/wuOssvXsILWVJWIS5uBSl7jaV49UAIlU4Obr
 p8z+9I/hpqKw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jan 2024 21:31:28 -0800
IronPort-SDR: qUmsJyn4eYLxEVWjGtkgqFmqvU/n5Ggz70QzKLpXgWu2+bsRdUasej9EakU81QoFS6/4156cjN
 ASSHMax5WWuA==
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2024 22:21:05 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Klara Modin <klarasmodin@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v6 2/2] platform/x86: p2sb: Use pci_resource_n() in p2sb_read_bar0()
Date: Mon,  8 Jan 2024 15:20:59 +0900
Message-ID: <20240108062059.3583028-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
References: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accesses to resource[] member of struct pci_dev shall be wrapped with
pci_resource_n() for future compatibility. Call the helper function in
p2sb_read_bar0().

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/platform/x86/p2sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 061d22ad6548..bc18d9575c94 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -65,7 +65,7 @@ static bool p2sb_valid_resource(struct resource *res)
 /* Copy resource from the first BAR of the device in question */
 static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 {
-	struct resource *bar0 = &pdev->resource[0];
+	struct resource *bar0 = pci_resource_n(pdev, 0);
 
 	/* Make sure we have no dangling pointers in the output */
 	memset(mem, 0, sizeof(*mem));
-- 
2.43.0



Return-Path: <linux-i2c+bounces-1069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED281FD4E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 07:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38BD11F21A1D
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C097E6128;
	Fri, 29 Dec 2023 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="pkZzruut"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12F259A;
	Fri, 29 Dec 2023 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1703831963; x=1735367963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Flx901Kgose+/GX8hPePgXRAU7GSK47n8SUv6VUgW1Q=;
  b=pkZzruutNSRVwe5tDTwBI3JhfHlWKuaL4pjs5pp7VMzobVeFOpyJ80Wt
   55LNK84CwcWReA7R6IMn6GOwo9hk6HrLTO/oqTXM6DgIeRx1o7YAhaEBW
   7hJeK4YOdr88j11WDkaAyFUn3aodHuiXe6/Irnjbqv3F30E3Y1NiCzzdr
   NEpHzW8cu0uqYD1VwG4jpaRTVkAtOIaWxRAnWCBP6uEdf7hgAAPBzVa7a
   UP4NTGOqNumkpT8wbE5QkbBVS3JVsV2UT22mwNnlyDgbwojPcEE3+zrRY
   QaEXVHZEl2M7aEpWf2RAuK7cOhEgNW8G9O0IEQBOegTDKV949Za+CaOeU
   w==;
X-CSE-ConnectionGUID: Z6EgstluRCifEc/bfIuA8Q==
X-CSE-MsgGUID: DVL5CWkzQeu+0Ime845s0Q==
X-IronPort-AV: E=Sophos;i="6.04,314,1695657600"; 
   d="scan'208";a="6253595"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 29 Dec 2023 14:39:16 +0800
IronPort-SDR: tHOB6AOVPTYw10E7yqxyzhp3IBlEDwezUhtxN5WLTBr5plXyuc4Oe+lKAnDXHfUP4PpGzaMHc+
 O7aG8DWqPNrA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Dec 2023 21:49:49 -0800
IronPort-SDR: 99XcEEeBRcC0tCWFO0X60GreLMm8Xba4XYxkK0G5POBP+OBaE6UjTUZVJu8Scum7Hl6rHtBvb5
 bvqnpnsmdA+Q==
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 28 Dec 2023 22:39:16 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v5 2/2] platform/x86: p2sb: Use pci_resource_n() in p2sb_read_bar0()
Date: Fri, 29 Dec 2023 15:39:12 +0900
Message-ID: <20231229063912.2517922-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229063912.2517922-1-shinichiro.kawasaki@wdc.com>
References: <20231229063912.2517922-1-shinichiro.kawasaki@wdc.com>
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
index fcf1ce8bbdc5..99a0e456f075 100644
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



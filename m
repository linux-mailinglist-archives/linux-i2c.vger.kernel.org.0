Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5D643E151
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Oct 2021 14:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhJ1Mzg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Oct 2021 08:55:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:7110 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhJ1Mzf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Oct 2021 08:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635425588; x=1666961588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4zcRYigW6bIg1bB9/tgDQEg9k9jhZisUTTA0nSv0e2M=;
  b=gYDC6/lRW4WUHbZTSSr73vi89+vFSgLOsVXe/WG53VTeDyFEFI3cO/dk
   9zxgdD8GMcTPKQ+UPv5GjasIjFbixWPMDhv2QEsd12cvfMgNRSzCfVEgX
   cxkwsca8vDtJniMa1A3SlcSPAGtLslXqvhGBZAZQDl78DNGzt997/ObxQ
   EsNiyRzXaq8y/rBuRDI4iu/lZVRrNMx9bk51U2qEPWILJdWe3Lo9dXURD
   XQJibvwlCLOjNchsnHUKmI5CAAL215bjhgs/d+faURcK+6YaurZllNV7N
   n0kgcvkBsfQdPv4KNsutPJ8ynM4Rnur+5vCGUJAOJAR96c11Fsc1+N1X0
   Q==;
IronPort-SDR: Aj9lK6B8MLOTJIrflILwyn7TDyq8TR1e+D3h21RHlPlaSR/LdpWUy3DROBKSmlC9HZ/FIURf+M
 4H/+egqoiFEbvvoB6ksWcmhxnEf64UrJI4JXYq3veFpxM5psHTTx/sOywST7wL4X71TdfSUkH/
 WGROh/qzfpEwlv+s6gMhjJv+RRcmRksSjIkec0GweEHFJE9tf+6CcaxrQJ0xv+4dkWkLFB+cNo
 uctzZqfzpSdRFbuiNdAx4nCp5ckA6qG+CoiSGzwhI8sjdb/9I+ZJjwAs9Ggia+8eRBLApED5UP
 SDJnoFBo2h3A57T6crNp0hrw
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; 
   d="scan'208";a="141996016"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Oct 2021 05:53:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 28 Oct 2021 05:53:06 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 28 Oct 2021 05:53:05 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>
Subject: [PATCH v2 2/2] i2c-mux-gpmux: Support settle-time-us property
Date:   Thu, 28 Oct 2021 14:53:41 +0200
Message-ID: <20211028125341.2457171-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028125341.2457171-1-horatiu.vultur@microchip.com>
References: <20211028125341.2457171-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for settle-time-us property. If this is defined in device
tree then add this delay to mux APIs.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/i2c/muxes/i2c-mux-gpmux.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index d3acd8d66c32..569de1d8fdc1 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -16,6 +16,7 @@
 
 struct mux {
 	struct mux_control *control;
+	u32 delay_us;
 
 	bool do_not_deselect;
 };
@@ -25,7 +26,7 @@ static int i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
 	struct mux *mux = i2c_mux_priv(muxc);
 	int ret;
 
-	ret = mux_control_select(mux->control, chan);
+	ret = mux_control_select_delay(mux->control, chan, mux->delay_us);
 	mux->do_not_deselect = ret < 0;
 
 	return ret;
@@ -89,6 +90,9 @@ static int i2c_mux_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(mux->control),
 				     "failed to get control-mux\n");
 
+	mux->delay_us = 0;
+	of_property_read_u32(np, "settle-time-us", &mux->delay_us);
+
 	parent = mux_parent_adapter(dev);
 	if (IS_ERR(parent))
 		return dev_err_probe(dev, PTR_ERR(parent),
-- 
2.33.0


Return-Path: <linux-i2c+bounces-9877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C8A67169
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 11:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0D81420FB3
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 10:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8783F20767B;
	Tue, 18 Mar 2025 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ufrm5jsa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F5920459F;
	Tue, 18 Mar 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294202; cv=none; b=eGJXkX0O8vzEPG6HBdWgERr3KH4afZNe9zunXUveP9dug3TV7tg3JZ9c59MfzJRVB/nHSW7x9OAJHVsMFiIEnluTmkUSw9Q7s6nBIPVItr8uTWpQfuDSGrJqXpeRX5FWYZq4jxT3reg5iJ4qyFX4rE0hWp5CJUeGwqBn+kLKEPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294202; c=relaxed/simple;
	bh=Sai5g5/aPSCV0FNdoUWAXDOQb5aLvdETtjtDL4WuPys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F072zd1KUhEp91rj3eZNuwj3Uy5fI1vFTXKYF8NuMliyUNGvUM67zqefy7Me84Bzozjl1NWadOblxDzqY3oyUqqLtEOPTHrYEuKZMM8LUe/ezAQBNHDzgjvv+g6vQmse/Qosbf5ipX4EAFVvrEE4EY9GneLcWb3Tq5ZQeDoy074=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ufrm5jsa; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IAaRCj3128589
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 05:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742294187;
	bh=1lT0nGmOjXid+4lh3vU+4FUK8ztnz2+Zk32BL7lapu0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ufrm5jsaus9ObIh1rzJikit9rlKnY0qo6rIYN91Y0hHKGeCIA0ExK2ZLtlQgTGzu5
	 Ke6Wuj3klwcAlB5R6F9bYyxKSTnFRQiMn9Wh6ZHZuM9azgdi+69X7zoEyh9G8I758i
	 6isEafIJc8hUDpd84vcT0BbypvyV9DTCa0NtMZ74=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IAaQDX125983
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Mar 2025 05:36:26 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 05:36:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 05:36:26 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.98])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IAaPsl042214;
	Tue, 18 Mar 2025 05:36:26 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <vigneshr@ti.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <jmkrzyszt@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [PATCH 2/2] i2c: omap: Add support for setting mux
Date: Tue, 18 Mar 2025 16:06:22 +0530
Message-ID: <20250318103622.29979-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318103622.29979-1-j-choudhary@ti.com>
References: <20250318103622.29979-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Some SoCs require muxes in the routing for SDA and SCL lines.
Therefore, add support for setting the mux by reading the mux-states
property from the dt-node.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/i2c/busses/Kconfig    |  1 +
 drivers/i2c/busses/i2c-omap.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fc438f445771..0648e58b083e 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -940,6 +940,7 @@ config I2C_OMAP
 	tristate "OMAP I2C adapter"
 	depends on ARCH_OMAP || ARCH_K3 || COMPILE_TEST
 	default MACH_OMAP_OSK
+	select MULTIPLEXER
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C interface on the Texas Instruments OMAP1/2 family of processors.
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f18c3e74b076..16afb9ca19bb 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/mux/consumer.h>
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/platform_data/i2c-omap.h>
@@ -211,6 +212,7 @@ struct omap_i2c_dev {
 	u16			syscstate;
 	u16			westate;
 	u16			errata;
+	struct mux_state	*mux_state;
 };
 
 static const u8 reg_map_ip_v1[] = {
@@ -1452,6 +1454,23 @@ omap_i2c_probe(struct platform_device *pdev)
 				       (1000 * omap->speed / 8);
 	}
 
+	if (of_property_read_bool(node, "mux-states")) {
+		struct mux_state *mux_state;
+
+		mux_state = devm_mux_state_get(&pdev->dev, NULL);
+		if (IS_ERR(mux_state)) {
+			r = PTR_ERR(mux_state);
+			dev_dbg(&pdev->dev, "failed to get I2C mux: %d\n", r);
+			goto err_disable_pm;
+		}
+		omap->mux_state = mux_state;
+		r = mux_state_select(omap->mux_state);
+		if (r) {
+			dev_err(&pdev->dev, "failed to select I2C mux: %d\n", r);
+			goto err_disable_pm;
+		}
+	}
+
 	/* reset ASAP, clearing any IRQs */
 	omap_i2c_init(omap);
 
@@ -1511,6 +1530,9 @@ static void omap_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&omap->adapter);
 
+	if (omap->mux_state)
+		mux_state_deselect(omap->mux_state);
+
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
 		dev_err(omap->dev, "Failed to resume hardware, skip disable\n");
-- 
2.34.1



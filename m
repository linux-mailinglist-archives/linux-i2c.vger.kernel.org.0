Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF9B3448F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 12:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbfFDKpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 06:45:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36495 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfFDKpH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 06:45:07 -0400
Received: by mail-wm1-f68.google.com with SMTP id v22so14191387wml.1
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AqCRJF+tWO8GjQ+BYqBPp1niU5qb/tDJg7K+sAphcaY=;
        b=AIAK6dlTEzyFPS33lzwlWRQfcGkqUp1UJt5Ex89yOC256gjvgv/kOuCmKHq5VXadSI
         CDZOK4WJ6VpNUUDXEoUghSYY87U8X3yDk5PcVNslnWnpc5nCu7BDmxhuJx12qSi4KyqW
         2quQmqBKHqeY+YUVh06Hpliw5lTIe7n8uAIHmGbQETJXW9ZQHB/966gxGmLfIL7SsOZN
         Xxv3Tw9xcnoM+DJhkEUmBUfaIKT8TZEuQg6wfVf3jG8iQssZqvcdqykVBs8upIdQ14fm
         Ogl9ATE9r2xdRRNXMUGVDzKAwLGUxHUS4ckp1XHTjyB2aX6YLaHrFCpUIAwHrkufs7Hw
         ixJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AqCRJF+tWO8GjQ+BYqBPp1niU5qb/tDJg7K+sAphcaY=;
        b=a5em1tonuhx0MOh+jLHv9DPhTPB4WHAv4zG2g1JpvX4MX0Q/kxiC0HjVo2Xy7G4z73
         sIBh/VfWrLsn61acaxHEYzVmFj8pcvHIRbiVCiKk3NXNGIRVlV+jfhBPtEyPHWWklDN/
         R3JjWm9ggC91fAD/2eA4u0s/J1I6EbjdLNL9dZSA+Oj2DbpmAD67lVSmeQ18eOhoQfgf
         mf8LrlAdGDjRaPW5YtLTgLeBVpUlUngUNgosaOSMG7YpCknNsq8dRNwfz4AELYrZStLY
         OwjK9EmI8IFuKrmqQtZLDs4MFxKBRmgdts+vEoAtB6fZLjDXymvSnkmmnJy9jtEIGIJR
         WHZA==
X-Gm-Message-State: APjAAAU5up4vBdXN7TuNI2MF2yEC7iBnDl6Kzv4EZXVWqnJgRJXJn3lF
        eBWhxsifyw7zjXbHCKj7S7gzkR+5Kf8=
X-Google-Smtp-Source: APXvYqz1PZ+v0ppfo/iRxBj73434Z1eLx4iCObzDiSNjIzT6eaLQQ2BAp/+eON/wI6sO2G9chsvZ3w==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr5723688wmm.96.1559645104975;
        Tue, 04 Jun 2019 03:45:04 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 6/8] usb: dwc3: qcom: Add support for booting with ACPI
Date:   Tue,  4 Jun 2019 11:44:53 +0100
Message-Id: <20190604104455.8877-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In Linux, the DWC3 core exists as its own independent platform device.
Thus when describing relationships in Device Tree, the current default
boot configuration table option, the DWC3 core often resides as a child
of the platform specific node.  Both of which are given their own
address space descriptions and the drivers can be mostly agnostic to
each other.

However, other Operating Systems have taken a more monolithic approach,
which is evident in the configuration ACPI tables for the Qualcomm
Snapdragon SDM850, where all DWC3 (core and platform) components are
described under a single IO memory region.

To ensure successful booting using the supplied ACPI tables, we need to
devise a way to chop up the address regions provided and subsequently
register the DWC3 core with the resultant information, which is
precisely what this patch aims to achieve.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/Kconfig     |   2 +-
 drivers/usb/dwc3/dwc3-qcom.c | 194 ++++++++++++++++++++++++++++++-----
 2 files changed, 170 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 2b1494460d0c..6dab3fd1e233 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -116,7 +116,7 @@ config USB_DWC3_ST
 config USB_DWC3_QCOM
 	tristate "Qualcomm Platform"
 	depends on EXTCON && (ARCH_QCOM || COMPILE_TEST)
-	depends on OF
+	depends on (OF || ACPI)
 	default USB_DWC3
 	help
 	  Some Qualcomm SoCs use DesignWare Core IP for USB2/3
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 184df4daa590..349bf549ee44 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -4,6 +4,7 @@
  * Inspired by dwc3-of-simple.c
  */
 
+#include <linux/acpi.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/clk.h>
@@ -38,6 +39,20 @@
 #define PWR_EVNT_LPM_IN_L2_MASK			BIT(4)
 #define PWR_EVNT_LPM_OUT_L2_MASK		BIT(5)
 
+#define SDM845_QSCRATCH_BASE_OFFSET		0xf8800
+#define SDM845_QSCRATCH_SIZE			0x400
+#define SDM845_DWC3_CORE_SIZE			0xcd00
+
+struct dwc3_acpi_pdata {
+	u32			qscratch_base_offset;
+	u32			qscratch_base_size;
+	u32			dwc3_core_base_size;
+	int			hs_phy_irq_index;
+	int			dp_hs_phy_irq_index;
+	int			dm_hs_phy_irq_index;
+	int			ss_phy_irq_index;
+};
+
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
@@ -56,6 +71,8 @@ struct dwc3_qcom {
 	struct notifier_block	vbus_nb;
 	struct notifier_block	host_nb;
 
+	struct dwc3_acpi_pdata	*acpi_pdata;
+
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
@@ -300,12 +317,32 @@ static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
 			  PIPE_UTMI_CLK_DIS);
 }
 
+static int dwc3_qcom_get_irq(struct platform_device *pdev,
+			     const char *name, int num)
+{
+	if (pdev->dev.of_node) {
+		return platform_get_irq_byname(pdev, name);
+	} else if (ACPI_HANDLE(&pdev->dev)) {
+		return platform_get_irq(pdev, num);
+	} else
+		dev_err(&pdev->dev, "Neither ACPI nor DT enabled\n");
+
+	return -EINVAL;
+}
+
 static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	int irq, ret;
 
-	irq = platform_get_irq_byname(pdev, "hs_phy_irq");
+	if (ACPI_HANDLE(&pdev->dev) && !qcom->acpi_pdata) {
+		dev_err(&pdev->dev, "No ACPI platform data supplied\n");
+		return -EINVAL;
+	}
+
+	irq = dwc3_qcom_get_irq(pdev, "hs_phy_irq",
+				qcom->acpi_pdata ?
+				qcom->acpi_pdata->hs_phy_irq_index : -1);
 	if (irq > 0) {
 		/* Keep wakeup interrupts disabled until suspend */
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
@@ -320,7 +357,9 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		qcom->hs_phy_irq = irq;
 	}
 
-	irq = platform_get_irq_byname(pdev, "dp_hs_phy_irq");
+	irq = dwc3_qcom_get_irq(pdev, "dp_hs_phy_irq",
+				qcom->acpi_pdata ?
+				qcom->acpi_pdata->dp_hs_phy_irq_index : -1);
 	if (irq > 0) {
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
@@ -334,7 +373,9 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		qcom->dp_hs_phy_irq = irq;
 	}
 
-	irq = platform_get_irq_byname(pdev, "dm_hs_phy_irq");
+	irq = dwc3_qcom_get_irq(pdev, "dm_hs_phy_irq",
+				qcom->acpi_pdata ?
+				qcom->acpi_pdata->dm_hs_phy_irq_index : -1);
 	if (irq > 0) {
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
@@ -348,7 +389,9 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		qcom->dm_hs_phy_irq = irq;
 	}
 
-	irq = platform_get_irq_byname(pdev, "ss_phy_irq");
+	irq = dwc3_qcom_get_irq(pdev, "ss_phy_irq",
+				qcom->acpi_pdata ?
+				qcom->acpi_pdata->ss_phy_irq_index : -1);
 	if (irq > 0) {
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
@@ -373,7 +416,7 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 
 	qcom->num_clocks = count;
 
-	if (!count)
+	if (!count || ACPI_HANDLE(dev))
 		return 0;
 
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
@@ -409,12 +452,28 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
+static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
+	.qscratch_base_offset = SDM845_QSCRATCH_BASE_OFFSET,
+	.qscratch_base_size = SDM845_QSCRATCH_SIZE,
+	.dwc3_core_base_size = SDM845_DWC3_CORE_SIZE,
+	.hs_phy_irq_index = 1,
+	.dp_hs_phy_irq_index = 4,
+	.dm_hs_phy_irq_index = 3,
+	.ss_phy_irq_index = 2
+};
+
+static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
+	{ "QCOM2430", (unsigned long)&sdm845_acpi_pdata },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
-	struct resource		*res;
+	struct resource		*res, *parent_res = NULL, *child_res = NULL;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 
@@ -425,6 +484,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, qcom);
 	qcom->dev = &pdev->dev;
 
+	if (ACPI_HANDLE(dev)) {
+		const struct acpi_device_id *match;
+
+		match = acpi_match_device(dwc3_qcom_acpi_match, dev);
+		if (!match || !match->driver_data) {
+			dev_err(&pdev->dev, "no supporting ACPI device data\n");
+			return -EINVAL;
+		}
+		qcom->acpi_pdata = (struct dwc3_acpi_pdata *)match->driver_data;
+	}
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		ret = PTR_ERR(qcom->resets);
@@ -454,7 +524,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qcom->qscratch_base = devm_ioremap_resource(dev, res);
+
+	if (ACPI_HANDLE(dev)) {
+		parent_res = kmemdup(res, sizeof(struct resource), GFP_KERNEL);
+		if (!parent_res)
+			return -ENOMEM;
+
+		parent_res->start = res->start +
+			qcom->acpi_pdata->qscratch_base_offset;
+		parent_res->end = parent_res->start +
+			qcom->acpi_pdata->qscratch_base_size;
+	} else {
+		parent_res = res;
+	}
+
+	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
 	if (IS_ERR(qcom->qscratch_base)) {
 		dev_err(dev, "failed to map qscratch, err=%d\n", ret);
 		ret = PTR_ERR(qcom->qscratch_base);
@@ -462,13 +546,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	ret = dwc3_qcom_setup_irq(pdev);
-	if (ret)
-		goto clk_disable;
-
-	dwc3_np = of_get_child_by_name(np, "dwc3");
-	if (!dwc3_np) {
-		dev_err(dev, "failed to find dwc3 core child\n");
-		ret = -ENODEV;
+	if (ret) {
+		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
 	}
 
@@ -481,17 +560,74 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret) {
-		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-		goto clk_disable;
-	}
+	if (ACPI_HANDLE(dev)) {
+		int irq;
 
-	qcom->dwc3 = of_find_device_by_node(dwc3_np);
-	if (!qcom->dwc3) {
-		dev_err(&pdev->dev, "failed to get dwc3 platform device\n");
-		ret = -ENODEV;
-		goto depopulate;
+		qcom->dwc3 = platform_device_alloc("dwc3", PLATFORM_DEVID_AUTO);
+		if (!qcom->dwc3) {
+			ret = -ENOMEM;
+			goto clk_disable;
+		}
+
+		qcom->dwc3->dev.parent = dev;
+		qcom->dwc3->dev.type = dev->type;
+		qcom->dwc3->dev.dma_mask = dev->dma_mask;
+		qcom->dwc3->dev.dma_parms = dev->dma_parms;
+		qcom->dwc3->dev.coherent_dma_mask = dev->coherent_dma_mask;
+
+		child_res = kcalloc(2, sizeof(*child_res), GFP_KERNEL);
+		if (!child_res) {
+			ret = -ENOMEM;
+			goto platform_unalloc;
+		}
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res) {
+			dev_err(&pdev->dev, "failed to get memory resource\n");
+			ret = -ENODEV;
+			goto platform_unalloc;
+		}
+
+		child_res[0].flags = res->flags;
+		child_res[0].start = res->start;
+		child_res[0].end = child_res[0].start +
+			qcom->acpi_pdata->dwc3_core_base_size;
+
+		irq = platform_get_irq(pdev, 0);
+		child_res[1].flags = IORESOURCE_IRQ;
+		child_res[1].start = child_res[1].end = irq;
+
+		ret = platform_device_add_resources(qcom->dwc3, child_res, 2);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to add resources\n");
+			goto platform_unalloc;
+		}
+
+		ret = platform_device_add(qcom->dwc3);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to add device\n");
+			goto platform_unalloc;
+		}
+	} else {
+		dwc3_np = of_get_child_by_name(np, "dwc3");
+		if (!dwc3_np) {
+			dev_err(dev, "failed to find dwc3 core child\n");
+			ret = -ENODEV;
+			goto clk_disable;
+		}
+
+		ret = of_platform_populate(np, NULL, NULL, dev);
+		if (ret) {
+			dev_err(dev, "failed to register dwc3 core - %d\n", ret);
+			goto clk_disable;
+		}
+
+		qcom->dwc3 = of_find_device_by_node(dwc3_np);
+		if (!qcom->dwc3) {
+			dev_err(&pdev->dev, "failed to get dwc3 platform device\n");
+			ret = -ENODEV;
+			goto depopulate;
+		}
 	}
 
 	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
@@ -514,7 +650,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	return 0;
 
 depopulate:
-	of_platform_depopulate(&pdev->dev);
+platform_unalloc:
+	if (child_res)
+		kfree(child_res);
+
+	if (np)
+		of_platform_depopulate(&pdev->dev);
+	else
+		platform_device_put(pdev);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -608,6 +751,7 @@ static struct platform_driver dwc3_qcom_driver = {
 		.name	= "dwc3-qcom",
 		.pm	= &dwc3_qcom_dev_pm_ops,
 		.of_match_table	= dwc3_qcom_of_match,
+		.acpi_match_table = ACPI_PTR(dwc3_qcom_acpi_match),
 	},
 };
 
-- 
2.17.1


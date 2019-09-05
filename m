Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9D8AA874
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 18:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730440AbfIEQTV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 12:19:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34141 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388222AbfIEQSO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 12:18:14 -0400
Received: by mail-pl1-f193.google.com with SMTP id d3so1556164plr.1
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gVFpbnmwR/H0XIcZNgb2GdBzjOFgaobM9Yxc91rkUEw=;
        b=Dr/9HzD6iWPfceKw7JxoqfNkPUkVwEJIvJ6qPHqxv0lvskG3nUTwAbc8W7CdTnpWNZ
         E7/74MJVoS89JAhyqoEzJccajtDV8UlDwLBe8qTFagb2kZG4kmB7cyrIpxAKBzTCNmzu
         paRFo5MSQ8Hzwh37g3MidoLPOqizim/nuyd3ERaPZo1p8+qfX3DuSC9+dQks+Ezp/Lj/
         d9GaXIqusviMB8769avG6rrHw+IRW05Bhx3JuyBbS04PBMIjMsAbUalHeiMMPmdUGQNc
         APry6qeospuB2zMpOCseNSbRDbfzQdeqsw9Wj1F3zJq1Wuh8fO/rKTkiE1tnL3tT+yyv
         YTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gVFpbnmwR/H0XIcZNgb2GdBzjOFgaobM9Yxc91rkUEw=;
        b=efggwu1opfQETMZQBpS/bD1rzMjr+BrkvUjkoNC5ktQT1u1/eH0HU9kIjR0KJ0Plda
         EDE35k0Es5zxaSH5XXHP18IQa8kaR07pFvkSi3EBHV9aGRPl5o8CSXUKHhun++33a8DA
         Oe5N17qUWeb5IeLNODRMP9yHRLN6zi0czlDRwcUemNpj2WPnKo6Yop2tGoXLaW1OKIgI
         /TTEprpRU0Ei/hZ4J1mesySUeMOjFmsts539UF1F2VDwPyAuoqtBWNzCUfFp6HHS4Ync
         rM/EPtESUAMPhIXk+ogh8bRf6apo3yhexIYDGCDxRzmm7bk2veO/evmHoBOxBQNmo39s
         rwuQ==
X-Gm-Message-State: APjAAAXt6+DToIA1xAIcWfgg0mh5oS5+Kjm2kw7mOi68VNWZxJu2HPG+
        /CadvS5rP1P4ZgmDUPcbagOMgA==
X-Google-Smtp-Source: APXvYqyNIXlJiqwV3V85SK8fy/yhRQoUKe37oa8NmDiqIxSm+9Zd+bnI8Wd3T5ihYqVjjx3jMryqRA==
X-Received: by 2002:a17:902:9f97:: with SMTP id g23mr4381121plq.248.1567700293310;
        Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [BACKPORT 4.14.y 10/18] PCI: dra7xx: Add shutdown handler to cleanly turn off clocks
Date:   Thu,  5 Sep 2019 10:17:51 -0600
Message-Id: <20190905161759.28036-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Keerthy <j-keerthy@ti.com>

commit 9c049bea083fea21373b8baf51fe49acbe24e105 upstream

Add shutdown handler to cleanly turn off clocks.  This will help in cases of
kexec where in a new kernel can boot abruptly.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/pci/dwc/pci-dra7xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c
index 7f5dfa169d0f..2e0d0b29cdcb 100644
--- a/drivers/pci/dwc/pci-dra7xx.c
+++ b/drivers/pci/dwc/pci-dra7xx.c
@@ -817,6 +817,22 @@ static int dra7xx_pcie_resume_noirq(struct device *dev)
 }
 #endif
 
+void dra7xx_pcie_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dra7xx_pcie *dra7xx = dev_get_drvdata(dev);
+	int ret;
+
+	dra7xx_pcie_stop_link(dra7xx->pci);
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0)
+		dev_dbg(dev, "pm_runtime_put_sync failed\n");
+
+	pm_runtime_disable(dev);
+	dra7xx_pcie_disable_phy(dra7xx);
+}
+
 static const struct dev_pm_ops dra7xx_pcie_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
@@ -830,5 +846,6 @@ static struct platform_driver dra7xx_pcie_driver = {
 		.suppress_bind_attrs = true,
 		.pm	= &dra7xx_pcie_pm_ops,
 	},
+	.shutdown = dra7xx_pcie_shutdown,
 };
 builtin_platform_driver_probe(dra7xx_pcie_driver, dra7xx_pcie_probe);
-- 
2.17.1


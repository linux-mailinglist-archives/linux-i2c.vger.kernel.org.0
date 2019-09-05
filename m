Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34866AA8BE
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 18:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbfIEQUN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 12:20:13 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40718 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733184AbfIEQSE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 12:18:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id w10so1680291pgj.7
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 09:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MSiwBcSQD+D+YdS5Q0qHybng0VxB5Rm8vXeXQFjLMZc=;
        b=O3tNCt/W9wLVtkbdnd5ZHoteegcojqCr7hKVqHkZxaUlxVn/YzfA6HZZ40nBdnkoAO
         ZhrB0iw1Uc7D91gKUNEFUts4aaIwRfLc9HFFMibqH7dcc8fRUXz52KMfGwZDlccDJJiE
         RKX9AyFqS2JsIHjGGXMBX/BZ1YMB9oSdcvYb1l/YwNtkOv1/bY7a0taZGatIUTZLB8B5
         qoHjnHc9HvsJyTbTAEzBV36syWkgm7Xqp77PJV2mZ8WayBu5mJr3U5qaAjISS8G7GYPD
         EdmiI92amAdqbvyv4IrbpfYnerC9XFLioXTmFRbJMwAJ7YCYhVi9YGHLHFzUt0cn8dd8
         c2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MSiwBcSQD+D+YdS5Q0qHybng0VxB5Rm8vXeXQFjLMZc=;
        b=Gfkx5CrjLTLmK7AAQcv2Abxm+MnMw8VrgwwfcBo1jHkYnVcSTbA/Se3KvVXHdZY/+X
         TTQoqGjivAKEpwfLbs6T4VJ3Atrnvzgm3T5Z7jGWrIVKswYDZOrpMIKOt2NLVAv3Vwxc
         bVYyPXu01lYbLpXJxjyRRI5cAvkNLZ32Vfc9U23JeaXaMRjSzRnvsdINEuStQfKpT61W
         KLvUwLxQ6GGxiyLkocFCUgYaQHW0xosDz7uR0bXJtNXlWIXDmkosrh/nIgbrmGD3L5G4
         xhwpPyNa4NsTUBtOw2x7+QGEygPyr3/hUWEQw5PkH8Elfd047EIeoH0B8VKtHxRUpQpt
         JHqg==
X-Gm-Message-State: APjAAAWY6lHnoDC3KyAZXsme7LxGw9F0ZLW8dwDPCTkIoGeaU6b86wkE
        UC+DT1nb+gpnzsgQEhpDMmuwSQ==
X-Google-Smtp-Source: APXvYqwx6+407C9x94FJoPzSVHCP0t2Zdj+mPwGij0zS69UFxmlYHwYXWRRcMX8TRc0mw6jEYgImGw==
X-Received: by 2002:a65:684c:: with SMTP id q12mr3654124pgt.405.1567700283561;
        Thu, 05 Sep 2019 09:18:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 09:18:03 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [BACKPORT 4.14.y 02/18] PCI: dra7xx: Fix legacy INTD IRQ handling
Date:   Thu,  5 Sep 2019 10:17:43 -0600
Message-Id: <20190905161759.28036-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Vignesh R <vigneshr@ti.com>

commit 524d59f6e30aab5b618da55e604c802ccd83e708 upstream

Legacy INTD IRQ handling is broken on dra7xx due to fact that driver
uses hwirq in range of 1-4 for INTA, INTD whereas IRQ domain is of size
4 which is numbered 0-3. Therefore when INTD IRQ line is used with
pci-dra7xx driver following warning is seen:

       WARNING: CPU: 0 PID: 1 at kernel/irq/irqdomain.c:342 irq_domain_associate+0x12c/0x1c4
       error: hwirq 0x4 is too large for dummy

Fix this by using pci_irqd_intx_xlate() helper to translate the INTx 1-4
range into the 0-3 as done in other PCIe drivers.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Reported-by: Chris Welch <Chris.Welch@viavisolutions.com>
Signed-off-by: Vignesh R <vigneshr@ti.com>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/pci/dwc/pci-dra7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c
index 63052c5e5f82..7f5dfa169d0f 100644
--- a/drivers/pci/dwc/pci-dra7xx.c
+++ b/drivers/pci/dwc/pci-dra7xx.c
@@ -227,6 +227,7 @@ static int dra7xx_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
 
 static const struct irq_domain_ops intx_domain_ops = {
 	.map = dra7xx_pcie_intx_map,
+	.xlate = pci_irqd_intx_xlate,
 };
 
 static int dra7xx_pcie_init_irq_domain(struct pcie_port *pp)
@@ -270,7 +271,7 @@ static irqreturn_t dra7xx_pcie_msi_irq_handler(int irq, void *arg)
 	case INTC:
 	case INTD:
 		generic_handle_irq(irq_find_mapping(dra7xx->irq_domain,
-						    ffs(reg)));
+						    ffs(reg) - 1));
 		break;
 	}
 
-- 
2.17.1


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E833239E0CE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhFGPmd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:42:33 -0400
Received: from mail-pj1-f41.google.com ([209.85.216.41]:53780 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhFGPm3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 11:42:29 -0400
Received: by mail-pj1-f41.google.com with SMTP id ei4so10093418pjb.3;
        Mon, 07 Jun 2021 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NCCUVu48/YxKe+76n8oOpi5HhiU1MccRKkRryIWRGrY=;
        b=OS4EcGoksInG36ZFqUT7ibl0i7seCqXy34Y1Yaqw4UU6mQnLyBhyO4oxgvwaV757eO
         3OOVg7Etfn6Ovn5a/wyGap4jFt3oQA3YF2kBfNhNi6BzLu77XttKckkx2ww85i1apfhQ
         ekuhbXt/9/gRFTG9/z7PmOPeVdjAZMSK9sfxC5/zv2NK7nIIQGGeorVw0T+W8sM1Vazf
         PSiDe0Oc9zru+52WAzgE+xrwkqxcwvcCcvGYkyCeO7uLpD0B3/BWirwS1VN2DF/puR0T
         7s4mIxBw+X+t9IRUAA9Lbdef5ch4WVMffx7hQSSIycfuyA3cG85MH9ZIPY9aGRqGsvUh
         Z5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NCCUVu48/YxKe+76n8oOpi5HhiU1MccRKkRryIWRGrY=;
        b=gtzmYWu6qeFSxqEELrP3O2AD8vaGH+F5A5etAnejBILMvD4he2mTHpnCPRy/I+ETMI
         SkNWFWPU2N9u5X97dYKW0UKFpqqXYeHNCtzzxkJF7NC8AKLJcvKr5AB8LbGKcMdP9Pci
         ijI1OtRPii7Xrrioce/heCZBRQUfI/hUNm0lqG0aMHdnTm1ZzHqA51Tdx/SfsJXEciMm
         5V4ylHMBJnzx8rnzp7X45xPBhVvTe9qHq7GXaZXmxA64GjvRaaReskvjNO36OqnCuPQ4
         cVAvsBBvIff19UHdVi3n9gVhiFil5sY4rJDiF2IQf0hvJHA9oBMb3UkoG1P4GLvx9NRs
         qzYA==
X-Gm-Message-State: AOAM530Qdqlcl3LmnW/sWCoQIK9pGcJl2H4XIzRbyoVkV4vI+vhZ4glA
        PqEFN7LVl/FGCrMfdpzAQlBLkAa+wKbrN3j/
X-Google-Smtp-Source: ABdhPJwMNKP15oGyesPtOeAnFeRGAZFrCrotHvaDZsVsbwycnY7O+X2WS5POBmPAdxJocubb2Bu3KQ==
X-Received: by 2002:a17:90a:db4e:: with SMTP id u14mr20775908pjx.43.1623080377825;
        Mon, 07 Jun 2021 08:39:37 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id j3sm8696259pfe.98.2021.06.07.08.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 08:39:37 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v7 4/4] i2c: thunderx: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
Date:   Mon,  7 Jun 2021 23:39:16 +0800
Message-Id: <20210607153916.1021016-5-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210607153916.1021016-1-zhengdejin5@gmail.com>
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pcim_alloc_irq_vectors() function, an explicit device-managed version
of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
before, then pci_alloc_irq_vectors() is actually a device-managed
function. It is used here as a device-managed function, So replace it
with pcim_alloc_irq_vectors().

Acked-by: Robert Richter <rric@kernel.org>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v6 -> v7:
	- rebase to PCI next branch
v5 -> v6:
	- rebase to 5.13-rc4
v4 -> v5:
	- Modify the subject name.
v3 -> v4:
	- No change.
v2 -> v3:
	- No change.
v1 -> v2:
	- Modify some commit messages.

 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 12c90aa0900e..63354e9fb726 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -192,7 +192,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	i2c->hlc_int_enable = thunder_i2c_hlc_int_enable;
 	i2c->hlc_int_disable = thunder_i2c_hlc_int_disable;
 
-	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
+	ret = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
 	if (ret < 0)
 		goto error;
 
-- 
2.30.1


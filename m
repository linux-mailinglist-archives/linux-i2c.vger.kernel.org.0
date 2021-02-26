Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DF03264F9
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 16:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhBZPv5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 10:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhBZPvz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Feb 2021 10:51:55 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B952C061574;
        Fri, 26 Feb 2021 07:51:13 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id ba1so5526861plb.1;
        Fri, 26 Feb 2021 07:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fEL2Wtcp7vRXCt6Wpq4/98VdAV/arU6OyXJ4oSsd3Hc=;
        b=LU65kqxdAtcmytZqXi4Eofp0P4HrKLNKG5whaGh9+xib0XaZV8nfqw8koh3an1TNjK
         dB8E8reDH7BIJVLQR3dYir+yBTiXR3wJA0MdoiT4uWvmWQiYCAeJVR/8O0mUjLCPkNYy
         fDB2s3Tbs4bHA3iv4A2hcN8+I+4Mc4OaG2bFfxiLQDooRBDaeYmLFzj3ntgVo/XYQmyk
         MmFG/Q0Caqgv30y6MX9mYcaJuzJJaz9aAYmSg1nTIF/AQCOU1fGzc26yUYhDULLJHk8L
         jd/frsVkeEdUCmzDQJUHNy7TsxXYp1kjt2+FmPnsuv6zWI8bT2Rb8fGSf17hZ5EnkuL+
         dCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fEL2Wtcp7vRXCt6Wpq4/98VdAV/arU6OyXJ4oSsd3Hc=;
        b=PYeuIEhXbvfUYAHO3trIyemVlxnV5olb55nqGdZO4UrJ4TIP2sLBO3fh0iu96Loep0
         UCVJKiRT/cIGuLryOm0RBIW79nYCfgu1NxGDopWSGT/JXJQ1ngxIvrnVB1/7U3Fx4Eze
         biBHeXKf0k8PYA0AuBdsMTHMVwNmxRkKKYbSYUMy/Um2Fw0KLOPlcySCuyo0ZimMLXza
         rNkgzFTYVZutPJeilarv2cYHU79DwLVHdBjVuQa3UwW41NtwfN6IWDftW/Gxr4Sv+5pR
         4v2Vi1C5eDX+Uv8ZtgQiDU+9aSDoqU6+AtUCxucG65OmgCyDGoOqTLN/HFtriH3UvQUG
         LTKg==
X-Gm-Message-State: AOAM530pmn7yWNNc0vbYn3onv4O4CMDh3KcLIq8rzBSGdK1bp8te3iHA
        RXLG53+pdyDjm96ihmMXnSA=
X-Google-Smtp-Source: ABdhPJzUwETcuVjPTkuHc2piKLP77s1XLRtMjupnxum752PTWEpJAkLXBIMXadfMspFIUD1YjtQwvQ==
X-Received: by 2002:a17:90b:390b:: with SMTP id ob11mr4237550pjb.50.1614354672768;
        Fri, 26 Feb 2021 07:51:12 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id b18sm9763881pfb.197.2021.02.26.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:51:12 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v5 4/4] i2c: thunderx: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
Date:   Fri, 26 Feb 2021 23:50:56 +0800
Message-Id: <20210226155056.1068534-5-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210226155056.1068534-1-zhengdejin5@gmail.com>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
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

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
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
2.25.0


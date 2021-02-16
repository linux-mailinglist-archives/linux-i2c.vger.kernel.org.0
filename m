Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B20231CD82
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 17:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhBPQDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 11:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhBPQDv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 11:03:51 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D898FC061786;
        Tue, 16 Feb 2021 08:03:10 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id kr16so1285984pjb.2;
        Tue, 16 Feb 2021 08:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hHuRwf2TdnMlb69qCWHCGaaZJgBzN1vXiSlYH3WgE1I=;
        b=RTX2JZ0LfFB+vJQkvu8Ry+s8sAaHG2DRIKvxP+DcYQy+ATKBoJxQ2cqoQ6Vhsv0ZPH
         Ku/FsOrpdSdhdgbI1/uJp3iBhhLPWHcN1Hl6lHlvexvjWSCw6cFlZf+sAwNSOVX0lZ+/
         1JITHXBf1uZlxLnKX7VweTPjDasm8kNeNlXJwAzpv97izrMxzZjDk9VnpvPBx0SpMCuL
         mVxCfJy3o3068IlsqR9ts/ify76qxephAt/CX2fmjfafPvL8dWhqO8Lgd92NQojpHeLf
         iRrzms+LFeqeAiVG6SH2iLLls2vgNY8gLfFHYCd81xz0waQk/0nnCFrYEORogFXVMBGA
         9BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHuRwf2TdnMlb69qCWHCGaaZJgBzN1vXiSlYH3WgE1I=;
        b=j2Cf7Gaf18pYibGP3/cvMZN0qOs56fE9sm0OVQ9feuS5AXwVeoRq+LxMdhHSjRKhNm
         d3+aBdgRUiocVbJ+lLTpUh9+qPeIn660bJU88v/ZJPi8NGDlGoAK9YpH/N/rIcpxisPu
         yFc31eUttPbxj2v6KXJb3De811MVMDx8zwwauZUh8HneGPqF4E0Go2+8kBLy415hjtw0
         6Da9kUqMsHXJJD5Zx/ZkA+aj7UTgDunPAjld58KvUmQ+0hKAKr+kA16S8GrHKXu37BpA
         GjwQyST7y5AJdYVPXuXif1i5596m2FkUMDFKDREY64PsEJ35cPvL3E+UeavVmBKmQcRL
         aZ8g==
X-Gm-Message-State: AOAM530WByOBEkPM9gVIHdcOXzEIYK7wpTjFdXz+ka1yIuromnxNQ0zA
        ccHtjJy55mTr6eKZ7CiImeI=
X-Google-Smtp-Source: ABdhPJwYdmqIcde3VGwF41I/uukrGzb1eKNviqwJLoZTUw0NI0c24qLxgqGPQmGPDZ36D50BCBY6nQ==
X-Received: by 2002:a17:90a:7e0a:: with SMTP id i10mr4754761pjl.152.1613491390486;
        Tue, 16 Feb 2021 08:03:10 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id t21sm23457321pfc.92.2021.02.16.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 08:03:10 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v3 4/4] i2c: thunderx: Use the correct name of device-managed function
Date:   Wed, 17 Feb 2021 00:02:49 +0800
Message-Id: <20210216160249.749799-5-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210216160249.749799-1-zhengdejin5@gmail.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new function pcim_alloc_irq_vectors() to allocate IRQ vectors,
the pcim_alloc_irq_vectors() function, an explicit device-managed version
of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
before, then pci_alloc_irq_vectors() is actually a device-managed
function. It is used here as a device-managed function, So replace it
with pcim_alloc_irq_vectors().

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
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


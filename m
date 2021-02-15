Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F229531C163
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 19:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhBOSR7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 13:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhBOSQq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 13:16:46 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E90EC06178A;
        Mon, 15 Feb 2021 10:16:06 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id y25so1358017pfp.5;
        Mon, 15 Feb 2021 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3CVx8x/uzNXn30+T+KgGNTCM/AO8INlKriF8saOOxcg=;
        b=HCBWxifauE/9Zl4Zp+5V+6mOAK8I1ldnH++yA+EReSYPCVgtOEt7MXSn0aP5IZ6lez
         D14G0jPE2LPHmaoRdrhLmbCelXlAczf81A0Zbh42O6r6qkYmAgAsUcMRYQcxbhqZiPFL
         RkzSoNCAHGWpba2SHHWsyKpaQhBHJVTQiBr0XxFCJJs/mPC85LiqE0AX8fZxBFPalcgK
         3HEw0IhMFY/tKK03E7eQ3t18SpPh3T5ZH9l3b29a7eyRfhLBu+0EIV3eKQGDBcTFsdD9
         vbpzDGeJTS/SMJ03UVP8l+pUE9F6Y6WS9+PR4Z/m6I6hFH4iUCiNDBeguF9gfZ7EhuIC
         W6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3CVx8x/uzNXn30+T+KgGNTCM/AO8INlKriF8saOOxcg=;
        b=qXjSINtdhsB/jxy1eBD2w/aUKwUfBuVVOyuefE5rD2D8H3SJBapyTRaKuIJ0lq9wML
         Yu09cA39tEVNjm1frp8hgYYMPf5HE2ep6o2AzLNqPJG9rvL/qUXqSPWMXupnV+H14vZP
         B9IZ8EJJ9BQXZyNDDgRl0rfK17CNle+ehNBItUifk6FDjISEwdcZnKjUykzIvmBPtLlZ
         Z0MLh+bXCPsrvH8Koom4Nd1fpZLQR4N1EhhG5hJV3P9U+6q1xYeVYH2xF8ggSetYQRJG
         qWvbSXnlRqxlsk9mn4ZBBIrO5rsPcgUrXf2k67BY1Cpx8Z7LFm7Nrv9klO0NV0AO8epV
         MWTw==
X-Gm-Message-State: AOAM531gPQ11qfAId6jWNnHluUDa2AgID5ebE6kKVpDZ9eeVEL6MJzmD
        gN4uyB+LmjXA/qnD7U8aeMA=
X-Google-Smtp-Source: ABdhPJyNMTWJRSo/PojxXb8pkipT50qqBBezSslnxnxbGJvdpWQblCasRD3SE+VwAgU0990i2ApHwA==
X-Received: by 2002:a05:6a00:2ac:b029:1e9:3cb7:324a with SMTP id q12-20020a056a0002acb02901e93cb7324amr15470130pfs.36.1613412966047;
        Mon, 15 Feb 2021 10:16:06 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id g65sm19039593pfb.20.2021.02.15.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 10:16:05 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 4/4] i2c: thunderx: Use the correct name of device-managed function
Date:   Tue, 16 Feb 2021 02:15:50 +0800
Message-Id: <20210215181550.714101-5-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210215181550.714101-1-zhengdejin5@gmail.com>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the correct name of device-managed function to alloc irq vectors,
the pcim_alloc_irq_vectors() function, a explicit device-managed version
of pci_alloc_irq_vectors().

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
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


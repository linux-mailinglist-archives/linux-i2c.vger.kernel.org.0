Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FBD31CBBD
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhBPOTy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhBPOTm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 09:19:42 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77322C061788;
        Tue, 16 Feb 2021 06:18:46 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id z15so6221295pfc.3;
        Tue, 16 Feb 2021 06:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/buNpyRFgspwU+MkC/Juop3a8WJIqyKWAqKUWxoeJJc=;
        b=bX6jvJ3UlhD7THO1NdxMHfvVVKKqD2xJWU78jPT3XqLEKcN9VAX88Hw9VOy4mtxRZx
         jXxNItzb4CCeOlSM44taKtbCJPQ8LO2CY9Y6Ifyk/Oo28tW6n74FLFiaQFcTBkbvvFK1
         ncYhQXjcnb6Yl+XWz8MGMJnRMyLLu3YawLZA2kHhDrJGt1BCjToBn6sh0veMR8tnIcz0
         OumaY0jhqiKY8qR2CQJz/FYzjN+7wtNX08ZOL9FvYzFr7tSSLL8DPG2eNhKhSdCRPbRY
         lmL5PVNWP51e927eOk4RFkTVo4v06kBL0bXyJLueVN6TgnNuzAkzkgo+aNIAk604AosT
         6//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/buNpyRFgspwU+MkC/Juop3a8WJIqyKWAqKUWxoeJJc=;
        b=iUyLnVaER0muzwLQWSc9nBdUEuKOpsMHNDKPdsTeXy0rFyx0+kIweMuMSaCUGQL/RM
         eC8gr43fBw8656ef0K+u3m9GA/bL3EBvKtHkMrHr3MFK2zmREkvFBobPjGyHimdRRjz5
         ElBCIrhz1JxKtlQfSaRj7J5qOeIUzP+ChHGsFhCAH9PPFMMBr8RDidpWdEbCEB+cBvdH
         yTHlgSY+9SVXEAizFbrvwM4qXT2wqPf/GQ+tLvCFHu+Qx4nFKEfIiKM6t1Pd9bdV+rin
         gyqxGAvRLQCIrFwQKqOY+5TlhJ8IoG8XLUswgZyyN9dvCBO8HUS53VSmjTky5Q/n8ic0
         /Qog==
X-Gm-Message-State: AOAM531B7tT8vLw1+BxJjyk+6orI0DH0WX7OvgX3KgFzeRLm9Q6xDXEv
        xkidMOK+DJ34N8rAzJJkPwE=
X-Google-Smtp-Source: ABdhPJwcy1a0lBl8fNv+FAEpQDdRc5ILxMOYUdvTw8x/8rpkkxifobP8+A7Zgpl+flvdAQSzRb8ong==
X-Received: by 2002:a63:234f:: with SMTP id u15mr19541929pgm.360.1613485126111;
        Tue, 16 Feb 2021 06:18:46 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id c26sm11189077pfj.183.2021.02.16.06.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:18:45 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 4/4] i2c: thunderx: Use the correct name of device-managed function
Date:   Tue, 16 Feb 2021 22:18:10 +0800
Message-Id: <20210216141810.747678-5-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210216141810.747678-1-zhengdejin5@gmail.com>
References: <20210216141810.747678-1-zhengdejin5@gmail.com>
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


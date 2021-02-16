Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F8F31CBB7
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhBPOTT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhBPOTP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 09:19:15 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417F4C0613D6;
        Tue, 16 Feb 2021 06:18:35 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id f8so3965710plg.5;
        Tue, 16 Feb 2021 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IHEaF+WKHnNn5hB+4HbszzyQ9PkeVdXzN3dgFBMQEXo=;
        b=ef11sgnV/UXxKFcVgxGvL7LE+NNwCeOupgSes75/fQnxnyRpNSNVoVTZcTRKzO7VNS
         21+ceS3lkMHQjQUEvI8Tpongs/ZGl+IyCKXgUJkm8XvX+TF3nRsoYWzcFT61AUFTqfXv
         wwJOHh9wCUBmLCE1OudnQ+N4uVJfkFcv9q+KRxBkn9j9odn6Dv7Gep12w6VMqg4Hkpu9
         qqC92aH12QTGiiW7/Q+1VoWW8CB0w+8k9UiHaFFobTk+H5molyMJTXNLB/ZzBwLNx4lT
         xHF3iSS7FyVt+Chq4GWgsXsc0p0yFJts5HECHbYlZZbZhPVEHapEnnYl79K8HUvX0Lf2
         YclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IHEaF+WKHnNn5hB+4HbszzyQ9PkeVdXzN3dgFBMQEXo=;
        b=uBWez7qhPWWQDd3QuVrm2e944SM7xoVqv7dGiBfGQWdClWKD+mSMRk5MsUKQfcfgvK
         r0wAEP60oMfs2yo2Kv8+sgiQzBCRlV6NYkakorfGwoJq0gTlVhgnOUWzMil6GVw6J1me
         gNj9b0cKoLuWhuwUCW94dQymxjpiMT7/LePLBVR35pqTQ/1qfnw0C4tKngnYLwXfOUgH
         jiDWeftYTEvFtygoJGkRgu3hI+k3BYfyONrJvaAALXb/PpoREpIPidUqYJV0Y8x6wTbu
         5hZ+pxO/ajKBNKXn2r6MpdhyyLfJmax0IzU21unxxpIf1z9M9TV0U/Bv8jdbd0GiGdb1
         IbrA==
X-Gm-Message-State: AOAM53346V09c3prgPJrrbibSt6vZYyro2t6vog1AlxNoOxHyKKExWG/
        Ip2JdVq5llA9c4eiixItqVk=
X-Google-Smtp-Source: ABdhPJxxmC4O0TZ9mAkEa2i7E+Zrav+9n9oUbTjSNFyTJ6otdgU55STJt4ylH9qnQ28oPxSKXGky1Q==
X-Received: by 2002:a17:90a:2c9:: with SMTP id d9mr4479856pjd.67.1613485114854;
        Tue, 16 Feb 2021 06:18:34 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id y8sm23911377pfe.36.2021.02.16.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:18:34 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 3/4] i2c: designware: Use the correct name of device-managed function
Date:   Tue, 16 Feb 2021 22:18:09 +0800
Message-Id: <20210216141810.747678-4-zhengdejin5@gmail.com>
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

 drivers/i2c/busses/i2c-designware-pcidrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 55c83a7a24f3..444533be49ee 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -219,7 +219,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if (!dev)
 		return -ENOMEM;
 
-	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	r = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (r < 0)
 		return r;
 
-- 
2.25.0


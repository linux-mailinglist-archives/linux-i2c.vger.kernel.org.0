Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E9231C15E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 19:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbhBOSQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 13:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhBOSQn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 13:16:43 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E16C061788;
        Mon, 15 Feb 2021 10:16:03 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id e9so4159914plh.3;
        Mon, 15 Feb 2021 10:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FKIHzO/8B5H0T3re/yrCOXEbpu1BJ6SeawfxnwopbDE=;
        b=Q/5tsoHe7laL24wXukVg050qxzUghUWnvE5Ib1LvShit+TQ9xHtVKJhldBwQenZa4f
         Lbs8Zcs4GsPyaUGOcemHvX0pxg5tauH6oi7qjiSB1KJgZH7Rl/oyU/QNK/fg/MgxrFcB
         qRNo3G54aIaagfwJlyfuVys9/omRmp5o2vFEqIFeDemQ7M52FLTAG0XMyopwfrJcf7Li
         KSGEE4pUazBP1BuUAqDkGFlB7arYfWaGatmr+m9wVnS3z9Atanlu1jH9PkZP80PqCdSX
         VoNPQcoDfy7Oq/u9BAmyqftcXBtJvz9DFgLrTHBwcw+eJBBn15pLme7+pu+U8EfYsrjU
         v53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FKIHzO/8B5H0T3re/yrCOXEbpu1BJ6SeawfxnwopbDE=;
        b=IbQzJESqvlPEL9/7uQmJ2709c0D3DF7luA+npppORDAYBDR4OoNnabBQ60VR34oaJ2
         Y02PKxct4eLDl573kcb8ij+YXc3L7dxE6SdnJOvgQVjno1P3w9H6VRDmwUHAUf8R4IK4
         5SnqHGzr21ABDQgzUVJtN03JDnvggszAV62wcAMtWsR/bC+1p4P2nTsRy5AMQPdtEvzi
         Py7pS8UCiLhLhmxMUqwzmdxcM3coQfqghzRIKCZKfbNSsbF4AxgAaJBNsKhKR1Y+7WGJ
         4zT74Diu6tj77QLyzxBGrK07LC2sE2mFR6qo00SyQIbqxsLnoPkaq+2tsbZ0saF/9hht
         dW7g==
X-Gm-Message-State: AOAM532Z9IMqD51LRa6+FPN7txLDIgXd+Ywfk6QwbGTmh/SuEt2vB2BL
        49XNxDMjmqs4U69if+vXHe4=
X-Google-Smtp-Source: ABdhPJy6BJ0QsWiXQq8mexMLqf2qWqJ3BOYbKkPjyzuL6uyCx2qW+uzSerzg7jIIqtH7ifu5gms4iQ==
X-Received: by 2002:a17:90a:fb87:: with SMTP id cp7mr137371pjb.162.1613412963172;
        Mon, 15 Feb 2021 10:16:03 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id s19sm19981330pfc.79.2021.02.15.10.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 10:16:02 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 3/4] i2c: designware: Use the correct name of device-managed function
Date:   Tue, 16 Feb 2021 02:15:49 +0800
Message-Id: <20210215181550.714101-4-zhengdejin5@gmail.com>
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


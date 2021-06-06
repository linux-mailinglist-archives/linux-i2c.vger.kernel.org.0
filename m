Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F18C39CDC8
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 09:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhFFHHN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 03:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhFFHHN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 03:07:13 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB35C061766;
        Sun,  6 Jun 2021 00:05:24 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id q15so11346634pgg.12;
        Sun, 06 Jun 2021 00:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5+ypx9Rj8P3lUr4MhiNDQWc6dLd11JIlQkIpaR01+QE=;
        b=KLf6SbUADB+x9z3VxprjCJD8KLPIuGQ58gp9lkDcQap5DqMRANgjoRm8EjvzyzM+PT
         dGQF3IZSSKZSnRTWmubz8hic85nLkmr4/8ti9o2Fth/DktZX2P134jWCPQcwEJ6fTxL8
         cwK6nhQ7LHmI1q5dbnBdwmO9SWMdA9obZxySLH3ZPzf6Pk3+jNuRHX335w3zraY09yNJ
         zsHuq3/n5wzi9NOKonP6cuEe7sJ+HRmxJa8+id8p0od/r0Ca/XeaSSKfy8neLhKz/l/i
         vaR8BV5c4M2/iqW7AZMfYuMdhSmHBujOG7y2PfiQKPBelVhwBkTRmJzkr7pXN7q26Mnm
         7UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5+ypx9Rj8P3lUr4MhiNDQWc6dLd11JIlQkIpaR01+QE=;
        b=kflqNfRvBy6KdhRoQ/4GkkGD3ngX/PtjlfU05Mflln2utUFriGpUk00dmG7znX1Xm9
         J9GxaRKgOjg9+yduNSbBu7Zz7vbpGKej2y2r93uzbT0s5AmFyG+X3pPSMVpqjsTQwsyk
         1kbHSjb5EN5WngE5vYZ70R7gvDkJyZqFCVCs14fm4ywXUp7tQikq8bIDFQ235sAc8gju
         EVvx9gtX/vdzxqyTrgu7LG8eUEechahUSoaPxMTk2yAwxKBOQHsZH/WOc+rIwPu+WqLO
         4xUH0HJ78r/LlB/a+OPGMAxy/2tOxAYcXtG8y+Ma/pc5eIEHXxbvROyXMbiBsGAtZypy
         vUjA==
X-Gm-Message-State: AOAM532mLHF55OsiRhyVIXvkwiI1TdA3XEykWS14coLYnVgVgPS5PuZC
        eIgxHk9YMyFZDEFqyHlm4JY=
X-Google-Smtp-Source: ABdhPJy+qdrOE/LjLgy/vqnJhEjg3s4IbWRnIvryIz+JBNVLpJZeeafjufZihW+dhDx96gZYpiEvXw==
X-Received: by 2002:a63:1a49:: with SMTP id a9mr12628609pgm.63.1622963124130;
        Sun, 06 Jun 2021 00:05:24 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id o17sm8629945pjp.33.2021.06.06.00.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 00:05:23 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v6 2/4] Documentation: devres: Add pcim_alloc_irq_vectors()
Date:   Sun,  6 Jun 2021 15:05:09 +0800
Message-Id: <20210606070511.778487-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210606070511.778487-1-zhengdejin5@gmail.com>
References: <20210606070511.778487-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add pcim_alloc_irq_vectors(), a device-managed version of
pci_alloc_irq_vectors(). introducing this function can simplify
the error handling path in many drivers.

Reviewed-by: Robert Richter <rric@kernel.org>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v5 -> v6:
	- rebase to 5.13-rc4
v4 -> v5:
	- No change
v3 -> v4:
	- No change
v2 -> v3:
	- No change
v1 -> v2:
	- Modify some commit messages.

 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index e0814d214048..fad7d26ccf35 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -382,6 +382,7 @@ PCI
   devm_pci_alloc_host_bridge()  : managed PCI host bridge allocation
   devm_pci_remap_cfgspace()	: ioremap PCI configuration space
   devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
+  pcim_alloc_irq_vectors()      : managed IRQ vectors allocation
   pcim_enable_device()		: after success, all PCI ops become managed
   pcim_pin_device()		: keep PCI device enabled after release
 
-- 
2.30.1


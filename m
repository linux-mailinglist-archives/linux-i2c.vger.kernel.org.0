Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE2E3264F2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 16:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBZPvw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 10:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhBZPvu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Feb 2021 10:51:50 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99693C061786;
        Fri, 26 Feb 2021 07:51:08 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id n10so6429575pgl.10;
        Fri, 26 Feb 2021 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EYv/mJxKPjVOLew2rn62IgtnY4RP7SORjigSii1Fy/A=;
        b=NxFxvhxK5304614G2GOSt84YpgjPPRtwbTMh4OsIpkOHSYT6unL5QE4aEbMeR0uHVS
         r0iflqX7w1AM2r3GjoVhQSKJYWzEVcGAuPUJbbfe03qRgXb6fnl03ZbiV2jnK6kQhfNX
         bW1B6yfYhAgyfdRirwgAgnWJ8A043YuIR6jkpdT1J7nCJJ5aWzG7OE3OKg8cbaxCnzfe
         vHoGaC4s+QJolWbY3EHZ6YASEnD4D4McaHlYjdYVqKl84/+xwek0a1gnvGtymSsVle59
         RWOe9KvgLCi8lYYbS1zT2PzUUE7m9Sj8j55os30LY2rlyPHNRTeI/Nvkm1oEAYSkbzPl
         4Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EYv/mJxKPjVOLew2rn62IgtnY4RP7SORjigSii1Fy/A=;
        b=fa9Y6sPPLC4G3+1fcifbS9+EJLyUb6rqebogXPFFQsXxKHjM+TLkyMEUjVKFjQlChx
         s1LAHCqy/ZiWAdgHGXDFecXv2sKp0FHZAYN1v5p2DNB220vmpBvj9BoIto9yZpMJoRBv
         c4G61ISaE0AZTNkBGAVU+DTrEhxTEhxn/JZl+eOIBLkVVETEMJ5wU8KY3u8fDBRBSlUW
         v4tbls7k1ZzAoMN7pI6cVvCAdZUAWKT5lv+QwUOpFqIUKjv6UbD1QW/KsPASCUmihDUp
         17csC05p9L69Bmb+RbE0NMxlCDJU/SNoZWoHmWCwOxCv4uvFE6hqsa1IiSABCwegPLxu
         aupA==
X-Gm-Message-State: AOAM530ReWQ/FKob6GPXDqVWAmQ2fIvXBDw/Kh48s94/Jp1R2iFUicgR
        z9iQ7E85y3j1qI+h7x6LPyQ=
X-Google-Smtp-Source: ABdhPJxVdd7oEeDQm+TFuPdFoBmREOJAEtezT6ChUqR0J2wXiiNezjMQN0Y6ZA/TnbITZgpRtUWk1Q==
X-Received: by 2002:a63:4761:: with SMTP id w33mr3484306pgk.118.1614354668272;
        Fri, 26 Feb 2021 07:51:08 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id v7sm10397503pfv.93.2021.02.26.07.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:51:08 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v5 2/4] Documentation: devres: Add pcim_alloc_irq_vectors()
Date:   Fri, 26 Feb 2021 23:50:54 +0800
Message-Id: <20210226155056.1068534-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210226155056.1068534-1-zhengdejin5@gmail.com>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add pcim_alloc_irq_vectors(), a device-managed version of
pci_alloc_irq_vectors(). introducing this function can simplify
the error handling path in many drivers.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
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
index cd8b6e657b94..a52f65b6352f 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -380,6 +380,7 @@ PCI
   devm_pci_alloc_host_bridge()  : managed PCI host bridge allocation
   devm_pci_remap_cfgspace()	: ioremap PCI configuration space
   devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
+  pcim_alloc_irq_vectors()      : managed IRQ vectors allocation
   pcim_enable_device()		: after success, all PCI ops become managed
   pcim_pin_device()		: keep PCI device enabled after release
 
-- 
2.25.0


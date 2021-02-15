Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D0331C15A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 19:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhBOSQt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 13:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhBOSQl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 13:16:41 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5A1C061786;
        Mon, 15 Feb 2021 10:16:01 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id r2so4140668plr.10;
        Mon, 15 Feb 2021 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xnoNnH/L5zEhIq0sRCrgcPMdMrANs5dA+JonFJyOPWc=;
        b=bN439IQRSSDlB/CC8oaNMTMXXCkdXfoAN719XvCeWMnuOrA82iceLWIZfAMvaCT3aO
         eg/p8OCtjphR3iCfeIsDW+VbksC9uGFD/KP/vzuGRImZs2PtudKRB7eyktugirfJ5ThB
         +juzPBRSuGP2izRy39ZAjk87xdHtBGKesNmkdnyn3lRrhHIFbJ9QkWtGqBIZbf0nh5Uc
         4Hjmkx6C969+XHaQsMBKTgfZNFZCrRhxoxrc/GSp/VpHm6Wv6GCcU5D00JKYfVHOJgro
         mzny/h2p5U1waMns5zJd5e/iW8i2bByhFsnq2o+3XjyNbyNhCcavB3dADzQfu/uJ9lQl
         b+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xnoNnH/L5zEhIq0sRCrgcPMdMrANs5dA+JonFJyOPWc=;
        b=oOfF9W1B9wuXPUlz58P7Un7hNzdzQwmO86JNHnMuhMAC3KHL2Sb5bVnN3rNol3OiPA
         hacYyZfaiJ69DUcKQNSGrqbRHyXE/jLQcVcLx77r/8i9FUm29iEVyORbgTZkU5Jozaa5
         Ogu0nHjb5ublV8NxsbWdowEqvE/hMvyimaZ7PB1wVEkwL26KGaSY+VVXk9W6JGPvDVmZ
         yd3hepOJQE7jAjbGzfB6mEwERFZJfKD44lwjyGUrwDZgAYYvXHNrN0Zs/EsAG5mNhgd0
         3kbuN+X4tSgojHYiPxOefhvBGjM2yJUXMjfxS6Q3NX9QzA9IImCPIry2sRkyUHw2eO0C
         1ngQ==
X-Gm-Message-State: AOAM531FragFqHvxnbnl1rTPCuNgTvzea2XDX0hDIICAWcJlpQ1RZeaI
        6pPD1gydSZKS5jxkewrTw+w=
X-Google-Smtp-Source: ABdhPJzGiveTCd8I2UolTZNrcatXgCf2F4QAR1DDljOVbXxY0xonT2eylGgvjkUiR7rtJ7/xpi0/Dw==
X-Received: by 2002:a17:90a:fb87:: with SMTP id cp7mr107499pjb.121.1613412960670;
        Mon, 15 Feb 2021 10:16:00 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id m81sm19262472pfd.188.2021.02.15.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 10:16:00 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 2/4] Documentation: devres: add pcim_alloc_irq_vectors()
Date:   Tue, 16 Feb 2021 02:15:48 +0800
Message-Id: <20210215181550.714101-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210215181550.714101-1-zhengdejin5@gmail.com>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

add pcim_alloc_irq_vectors(), a explicit device-managed version of
pci_alloc_irq_vectors().

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index cd8b6e657b94..cd53106fbf5e 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -380,6 +380,7 @@ PCI
   devm_pci_alloc_host_bridge()  : managed PCI host bridge allocation
   devm_pci_remap_cfgspace()	: ioremap PCI configuration space
   devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
+  pcim_alloc_irq_vectors()      : managed irq vectors allocation
   pcim_enable_device()		: after success, all PCI ops become managed
   pcim_pin_device()		: keep PCI device enabled after release
 
-- 
2.25.0


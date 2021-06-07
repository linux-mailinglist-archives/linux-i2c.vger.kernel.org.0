Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D619639E0B7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFGPlg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhFGPlf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 11:41:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB06C061766;
        Mon,  7 Jun 2021 08:39:29 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id k22-20020a17090aef16b0290163512accedso150579pjz.0;
        Mon, 07 Jun 2021 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UIGdwCdkkWqLBRFSq2kkHALz5xEueOvwNTx/1skELWk=;
        b=Gh1Lqwrk85otYcFMpOHUUFANaF7P9the3majQO82pmQM3swDLWsO2uYcx5v/p8gJBj
         G8dSS/sYFc3clqgzVIOM2gsjcUTdzpYgOOuvNq2EJPUK0pB8YsTInAkGdA1dGBEhYhhq
         3DXHDNmEj53DlIxernqM6PLQaljlYB1DBrjOoi+LT70hdm5Du0A0bG24YY6OzlEH7QcE
         e5hD2OtfLUzMweGtCxQrAJgsbQzZkWcH5SCs/fDTTB0l6oXdvHZaExjDVTK6PjGtunBv
         kF0xx6DeGTcZ5MlQmoW79oy7Twf0TPME1UjIi2sr0BJtOFl2VzEVVdxTkuy4gVgezsih
         PTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UIGdwCdkkWqLBRFSq2kkHALz5xEueOvwNTx/1skELWk=;
        b=tokEupuq0D1C7+RItdcDLbq4ue2t3X6g+yBXvhkbU6KsuT8dLpD2thsaLd9rwP5TEZ
         39d7grQt2N7IIfbG178baQGc1PXRbKmrK6JkcnmdXIbgcOQk2cIVVRnybdnc6pBfKouD
         9iR5UmtskTwSBo5KCG1Zq7pDD6QnWpDpqaS9tRdAnRfyUOjlxtTaGe3Gj+gLlrWeX2Zy
         ru5jTt7Vrt3ERAA2D1/HHCQOrNVUD5THalol+U/w4Qtx73WXmiUcF/6OjPE+lHhmCBRS
         qLGhITFyA6UJRPtBiOiNiWt/TEBdeBG6vtfsbM7i5SJ//MH94QAJYWXNJd4b0V222b+C
         RH4g==
X-Gm-Message-State: AOAM531yVS9RFaljyagXDKK6yDpASfdbmFiMPvrA5Y3uFPi6x1Ao9C+z
        0JxsazU2+SiDzep1MV1R7CqiZAEl2xT6aLr1
X-Google-Smtp-Source: ABdhPJyoitZZCcuUdMntNQbBh3XXRqe7w4Fg+NetaZ4Scj9yIyG3xtFmlBtRV4b7J3HwvAi8FkAVoQ==
X-Received: by 2002:a17:90b:901:: with SMTP id bo1mr17611331pjb.0.1623080369472;
        Mon, 07 Jun 2021 08:39:29 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id x13sm14211295pja.3.2021.06.07.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 08:39:29 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v7 2/4] Documentation: devres: Add pcim_alloc_irq_vectors()
Date:   Mon,  7 Jun 2021 23:39:14 +0800
Message-Id: <20210607153916.1021016-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210607153916.1021016-1-zhengdejin5@gmail.com>
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
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
v6 -> v7:
	- rebase to PCI next branch
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


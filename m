Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AE731CBB5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhBPOTR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhBPOTL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 09:19:11 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050D3C061756;
        Tue, 16 Feb 2021 06:18:31 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id l18so6013318pji.3;
        Tue, 16 Feb 2021 06:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjaOOeSZGEGtGWhCG3YiZONTXpJPR1CoglJJC/wPq8k=;
        b=RrVghl0SP20X6/Q1pUmqyM8D6ib+ZfrRttGqQGYTpbllLk6bw6oQXDvzmWffmlziK9
         4MH+1J20JOsq8kDFI4jdMifozCjm+/hPXdHfTJsDLJhNbuMhZ8Z9AxY7qXGjwvrCq3l4
         5/2EaFlT+rW0LtGZLIhqYJrOV97iOt++VurOTOnRjt3qAtNpfSTUA7SKCPon0oFrhhAw
         vleus6/LhqbSbuaGRzx0Xmwtf3zjHQbYw6ZDlaJjOE6MHWhFFHcDW+RG7Me+lFVtF5tU
         U1kOAWuGzpzVQWsn8EG6clHmOkcdzoHOWQdQQAhVvOV4a1FkcIUbczp1G43S8hTAg6xD
         Z6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjaOOeSZGEGtGWhCG3YiZONTXpJPR1CoglJJC/wPq8k=;
        b=YXB+QiYmIkOWDSKsU89RJM7VizKXnak8Xj0VHpUahKVLd93lsknlBfAl2nvldFiLo6
         SXNkk+RCoTdwObZyd+Fms6xsg7eDWi7/C1Hg8QGeqdkSPah/W16AOms9N7FAVoGGrZ+g
         cHEIgqizNJ9mbYPJb/mIKumv1vZdQWyr9/kk4xGH2MVo8MKcPlXi7pxvvU8wD9l810fy
         L2tGD7ahdU3q34FFcJ1xDeL+sVzKCP2PJPn88W1uUhZm0OUHDeGzM1PDv9DGMHUA+X6r
         EUtocuGTP2mECmWK1mLFiPJw/fj77qjcK3vg9hyPg4rGBY3jAB7ZfraUzr/rBAdrfd3m
         Q0Ow==
X-Gm-Message-State: AOAM531fVk1SwBwiUftDpuOraFfd0QMB472vPv9lyrloMupaTNB0UBkl
        UZlkVojUw/qToRCPNAdEnoA=
X-Google-Smtp-Source: ABdhPJwoq2qsFaiEymd9VtKA/KfinToQB4lR57IRZSQUfgM56wiNPmD3ejkwCoqptqwS60NyFZKvAw==
X-Received: by 2002:a17:902:d113:b029:e2:86e9:c1ee with SMTP id w19-20020a170902d113b02900e286e9c1eemr19907015plw.42.1613485110617;
        Tue, 16 Feb 2021 06:18:30 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id m12sm3065459pjk.47.2021.02.16.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:18:30 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 2/4] Documentation: devres: Add pcim_alloc_irq_vectors()
Date:   Tue, 16 Feb 2021 22:18:08 +0800
Message-Id: <20210216141810.747678-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210216141810.747678-1-zhengdejin5@gmail.com>
References: <20210216141810.747678-1-zhengdejin5@gmail.com>
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


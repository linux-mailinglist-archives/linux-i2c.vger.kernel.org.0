Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44EF31CD7A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 17:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhBPQDs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 11:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbhBPQDq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 11:03:46 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A900C061756;
        Tue, 16 Feb 2021 08:03:06 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id b145so6412713pfb.4;
        Tue, 16 Feb 2021 08:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vLYno5aciuzWdkhSYU1ddjoRMBsS1paz+F+v6wPI8Hc=;
        b=krRQBl1JLay6HNr6hIjHnM54AIGq/vAIjBaq9YbAtVKVxNGzu8E4zfhwqgtZDS+1pt
         x3gpiUR8q+gLTlW/P1UGuyaYsQFkpSwxHPR3xFrbWc+qGFeWONa5i1ZrNKBfP3+rfHXZ
         3oPIyekKvvf5S2HhMQisIKWESRJLvlPXN07gXex7D8PWBPXoGwUQG8Iik+moR1MckGAf
         mzDHrEdXm1pzlyiTdsFhckV4Kyy10A9YkocU1+wg44nOJ0Nl+Tz3upI6/QXRf8YZ6nLA
         vxkb4r7p0x5klG4h5xIw1HKSteVzFK7LwqqtBsVqOj51Vw6WNE4E5wWsMct3n1s6tBrt
         xxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vLYno5aciuzWdkhSYU1ddjoRMBsS1paz+F+v6wPI8Hc=;
        b=RT5IA/zLGPuGKlgKBjrNp+goueY+DY3SyAuLiHbOFNIoULiJ4XgQqVoQ/YUWf+59P+
         A6lr96P+oIWL/SIVKiB+z3NvnBbDiKC4fs2wSbs8wfsM4hIZ1uIDQCXaCBfAm3no/Dch
         L+89ZfOAO1AluNVHLSZDtOw62p4KuymJzRRrC02EgdKUuD0iDgmBWMPpEwUgOpjIlhPQ
         0DeRGT2HevPFyF/PqssNXobXEEIyDgplw5HKlxCIJ5Gk4fSi4sDR1wtCS5lW+7BZgGA5
         Ni85p6PXt2IMcg55L+Oy6m7T2qla76WRjQTyOmckuvI++HqKXwRAgT/89OoNcHgzP3dK
         1wVw==
X-Gm-Message-State: AOAM531Nc9Ex1EBGG7f03as9Rzexzn8gwK8qjXwSqEqyElSo6cjx5plp
        zUyV44i0GE88soC05kBsEHE=
X-Google-Smtp-Source: ABdhPJxYGWys9szZhDZBKBrk8Fc7ZjUgWYbHqr34rbhGZ2C6OGUU6ANP2huG0CSkTO41JQRuOUxboA==
X-Received: by 2002:a62:e804:0:b029:1dd:cf18:bdee with SMTP id c4-20020a62e8040000b02901ddcf18bdeemr20780783pfi.63.1613491385721;
        Tue, 16 Feb 2021 08:03:05 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id g8sm3579464pjj.41.2021.02.16.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 08:03:05 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v3 2/4] Documentation: devres: Add pcim_alloc_irq_vectors()
Date:   Wed, 17 Feb 2021 00:02:47 +0800
Message-Id: <20210216160249.749799-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210216160249.749799-1-zhengdejin5@gmail.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
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


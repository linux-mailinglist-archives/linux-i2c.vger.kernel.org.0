Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474F531C155
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 19:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhBOSQm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 13:16:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhBOSQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 13:16:35 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E803C0613D6;
        Mon, 15 Feb 2021 10:15:55 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id m6so4655536pfk.1;
        Mon, 15 Feb 2021 10:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaLpm+5J78M4+zCEbUWIB2sizz+gR6AHfJVO60Uso3o=;
        b=Zlr6P8drhqgtwUWpogXsXLZg0ftRWKdW1LomVGnz4HxL6q0pYI2XK+3tdm4o3xeyLL
         60jP014ys+YScSZeVBg0/eMXGwVgJ8WxqHBZCf46p0Br5c42zASiZMKbTbjqrl+kEMwh
         ccL3X2dt6DkzMoBz+yDfsVMJdAKXvMjKgxzakJk3VoSk2DXdcpcYTcbjj85GW5reOKGa
         4erKd5XlKdxAN3GMuVbOjx5Bzzcjyf1IVmDGH/lgFtmBWaHTLue/wXvviT6UbL9as+Hs
         UvuOW/cj8ECTALRqp8tRxYv4Z9q2DyGOXbBbPIrS8gI69k9UVcvE+SMmGFzBv4deYcIt
         ZnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaLpm+5J78M4+zCEbUWIB2sizz+gR6AHfJVO60Uso3o=;
        b=ByanLKDMTE2+xmoQHlwNnDipuua++eH6JtfsSfmLxMHjjjAQ0WIRC+lkVsXEUd+37K
         QlRBiMiWqUWscF5FbKfaC1NKxeBGn5D4xV2oxohls03FFQmLmrStcXvl3j04dd5njpyA
         f8ICc8KGlJ1/p4c2/jbzBo3xf+XAcQLw2eSGgs6wHY91Yl0GHaeI6TiN+wrzJ0ICF69y
         ZJZRSSYsFWmhuXqVfy20Rn+C4ofd87zbKVdQqVGQVaOP4gZNprSWU8RR9RgKKopK8dSa
         ObCPQoZAZ72x4Z1S21QpHdUvuIEgz8azc8TruD6pQxarzrox7vZOVX06+REJ77cilz39
         MHQA==
X-Gm-Message-State: AOAM532sHU3N8pEH3vauKweQ/paiSKspU/os4Me0AjuvZC7KZk1XBwcF
        xsyWn3xzcOiLO7KwyDXhH++GoKa3QN1sxg==
X-Google-Smtp-Source: ABdhPJydTyCPuF8hvURnTih4047bCFhevML+/3+RyAyoPmdY/ts4kqdaIN45LIff29Dqd06TO6yCkA==
X-Received: by 2002:aa7:8598:0:b029:1dd:9cb4:37ee with SMTP id w24-20020aa785980000b02901dd9cb437eemr16515951pfn.54.1613412954909;
        Mon, 15 Feb 2021 10:15:54 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id y24sm18978244pfr.152.2021.02.15.10.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 10:15:54 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 0/4] Introduce pcim_alloc_irq_vectors()
Date:   Tue, 16 Feb 2021 02:15:46 +0800
Message-Id: <20210215181550.714101-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce pcim_alloc_irq_vectors(), a explicit device-managed version of
pci_alloc_irq_vectors(). and use the correct name of device-managed
function to alloc irq vectors in i2c drivers.

Dejin Zheng (4):
  PCI: Introduce pcim_alloc_irq_vectors()
  Documentation: devres: add pcim_alloc_irq_vectors()
  i2c: designware: Use the correct name of device-managed function
  i2c: thunderx: Use the correct name of device-managed function

 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c    |  2 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c      |  2 +-
 drivers/pci/pci.c                             | 19 +++++++++++++++++++
 include/linux/pci.h                           |  3 +++
 5 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.25.0


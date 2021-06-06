Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1A539CDC2
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 09:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhFFHHJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 03:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhFFHHJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 03:07:09 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B135C061766;
        Sun,  6 Jun 2021 00:05:19 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso3418443pjb.0;
        Sun, 06 Jun 2021 00:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RhJyx4jGK5xqxDQ3bMag95GRO0aLjTpNVgg4TVn7HA=;
        b=XsYQFGgYXU4YGoKIvEb3KOunmXFHbJDbA8ejCbH2vxM2RPqdujm8lnAlDfWrioF4JS
         X/bapZrpa0DDlSZFWUy1wlnalNctdSEsu//BXiKvT9i2nArNnzTsKz6JFew1xgj0wcn7
         n4jwX4PQfkITb03BkTR9GarBkAZihB/bQu0lB0uxybZmKFZ9kchuvtH0774rUIDVyevo
         jIBtexPnHVWmm4Vc/8pU5kHaLnzekpcS/F/sIsVC+87RF6wmbeJDHMjf9qXWuNpoV/bt
         wDculc4ZeqY9vqAfABxUCIUpkEdnt3E3pzbTZ7X6il3yJnRFSla9nI5zuMopnHd1Wniu
         WqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RhJyx4jGK5xqxDQ3bMag95GRO0aLjTpNVgg4TVn7HA=;
        b=ZJKHKjRU3yBkOw27QdXGP9sKXhHVIT+5lZwowsF7S2Obd8fFwVBfGssYOm+/WtegXp
         lfmEkzqXcSLv33FUIX5wk+aeMyAgb1O+xLB0d+oLjRiESATVRUki5PL59+KFaHZE06f+
         xs4g4pfp0EEDElijNBEcZ0jX1dy5UgDSICFZWIzDk5VvxWXHzu7AJVbuJPjXr+7nZ5U0
         DsVKiBFykxvmdW6WlZdBBM6x/HrIs6IEfow+O9GKdXwr8ypXZ9ZQ0s6y9sq3KLoN7FgW
         uftmvx0wvbya22k833Y5bFti+BJgdFRqBY69nV6VXIVHskjROCGh+H7morv45dCNIiV4
         rgiA==
X-Gm-Message-State: AOAM531IsVlzh81SE8uABgDkYsQwVvG7GzGKSgCkUNRerYxUhsJQ4JQG
        Sd3dNrYZNnZag2Qn7T9CxEk=
X-Google-Smtp-Source: ABdhPJy9tRtqj9qt+xSMLaW5ukpSiCnPMti6iENAREk80u0Kg25w0zbddLzhecE+6UymXbuJWA2mnw==
X-Received: by 2002:a17:90b:8c4:: with SMTP id ds4mr13980194pjb.65.1622963116328;
        Sun, 06 Jun 2021 00:05:16 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id c25sm5242733pfo.130.2021.06.06.00.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 00:05:15 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v6 0/4] Introduce pcim_alloc_irq_vectors()
Date:   Sun,  6 Jun 2021 15:05:07 +0800
Message-Id: <20210606070511.778487-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce pcim_alloc_irq_vectors(), a device-managed version of
pci_alloc_irq_vectors(), In some i2c drivers, If pcim_enable_device()
has been called before, then pci_alloc_irq_vectors() is actually a
device-managed function. It is used as a device-managed function, So
replace it with pcim_alloc_irq_vectors().

Changelog
---------
v5 -> v6:
	- rebase to 5.13-rc4
v4 -> v5:
	- Remove the check of enable device in pcim_alloc_irq_vectors()
	  and make it as a static line function.
	- Modify the subject name in patch 3 and patch 4.
v3 -> v4:
	- add some commit comments for patch 3
v2 -> v3:
	- Add some commit comments for replace some codes in
	  pcim_release() by pci_free_irq_vectors().
	- Simplify the error handling path in i2c designware
	  driver.
v1 -> v2:
	- Use pci_free_irq_vectors() to replace some code in
	  pcim_release().
	- Modify some commit messages.

Dejin Zheng (4):
  PCI: Introduce pcim_alloc_irq_vectors()
  Documentation: devres: Add pcim_alloc_irq_vectors()
  i2c: designware: Use pcim_alloc_irq_vectors() to allocate IRQ vectors
  i2c: thunderx: Use pcim_alloc_irq_vectors() to allocate IRQ vectors

 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c    | 15 ++++--------
 drivers/i2c/busses/i2c-thunderx-pcidrv.c      |  2 +-
 drivers/pci/pci.c                             |  5 +---
 include/linux/pci.h                           | 24 +++++++++++++++++++
 5 files changed, 31 insertions(+), 16 deletions(-)

-- 
2.30.1


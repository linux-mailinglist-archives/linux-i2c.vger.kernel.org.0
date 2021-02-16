Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8824431CD73
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 17:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhBPQDn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 11:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhBPQDk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 11:03:40 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE260C061574;
        Tue, 16 Feb 2021 08:03:00 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 75so3122433pgf.13;
        Tue, 16 Feb 2021 08:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n3sRb5LshDbI1PZnequXT/7ADeWk0eQoDLFgSBLnNpM=;
        b=a6Wu7wcH699EZGPjthqNP2AJP9x/nusuk+VFJlETtdD7/1/mNIMm8ZIsjjted+6HIs
         400V3pro5fUhIHawhNowYMKQSmsepHDXoXPsx0LJI/E17mgQc1imN4c223aifbEM3vtL
         Jnu0JJTJsgxU7xz9o+iqHAUF1aCTHVh5QUlzALooNJE0UqJWu1s6pAFfiDbRAVncVj7z
         P0xvJSC18e67rlJyeaSlI/btRc9MYjTZJIe3kQS9s+XP/ZU0XhHeH7XsusrLIHEYpsH8
         AizQXY80ytHP0dCRyBwiSbXwyuk0Ttl5vMnT85LXBfUbibOuCf5Qciiu0ICf424mALKO
         SwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n3sRb5LshDbI1PZnequXT/7ADeWk0eQoDLFgSBLnNpM=;
        b=Xf4SvwyWnRn+yMOP7di2bvOImlHv/m8tJjW8ftYdPwhoxqelruEXOChYwmuvdnBIzf
         ylYwVUjMhfhLZkqrEP/nckfpBTJdNV1SSSV3KZl4A7JzPE5qj5/KROaEHxFYi1r1weJz
         HjFz1wXo8eg61EpsVFKaqNqezOCJPC51aq3+hQLckou3Yd802VEBt+Ul8kks7VdcnkzG
         5Tt7SVXcxzIIT0bKlk+E0x5XOsfHfoOiNDqN/8YyPTtRjGLqzviiXsuerMor2P0eWKZa
         FEmbVgJRTF7sqrJ/OJLBSNTE/rQbnjFmkJlqQtYQCqfTzoDZ42zHtKZ4Gc/G3MMHuocC
         rMiQ==
X-Gm-Message-State: AOAM533kavk+4uMDOjf25kPaWN3FCX65/hohdduANtndQ7iqrqGWMZjH
        E0pD9QcyhjFw7mBfqkMivWU=
X-Google-Smtp-Source: ABdhPJxcR9Rc2efbWbHAErffBiWYtrE3oGE+hiFlnzV3Wy+y7hZXHvVSVdYZnm2wRbquf0z/4wgwmA==
X-Received: by 2002:a63:884a:: with SMTP id l71mr19643864pgd.75.1613491380462;
        Tue, 16 Feb 2021 08:03:00 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id ms24sm3215313pjb.18.2021.02.16.08.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 08:03:00 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v3 0/4] Introduce pcim_alloc_irq_vectors()
Date:   Wed, 17 Feb 2021 00:02:45 +0800
Message-Id: <20210216160249.749799-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
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
  i2c: designware: Use the correct name of device-managed function
  i2c: thunderx: Use the correct name of device-managed function

 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c    | 15 +++------
 drivers/i2c/busses/i2c-thunderx-pcidrv.c      |  2 +-
 drivers/pci/pci.c                             | 33 ++++++++++++++++---
 include/linux/pci.h                           |  3 ++
 5 files changed, 38 insertions(+), 16 deletions(-)

-- 
2.25.0


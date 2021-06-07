Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1CD39E0AF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFGPlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFGPlL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 11:41:11 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37CAC061766;
        Mon,  7 Jun 2021 08:39:20 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id n12so14060928pgs.13;
        Mon, 07 Jun 2021 08:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EP1Z0R9h6Sk7sEUIq6S/xiKMedmYureXcAho+7LMC/M=;
        b=WLw1Tq9ZDGcWI3iT7HDdRvX8MplsK9woqfj5VMOePBGLw7iduyhz26GDmRLScAWlOp
         WCgJWQFd+2YZFpdJ2NmdJMCjcCvAP90Jnb5kXj+vK1zi1XMcTObOdR/Cxwy2mbTLcXM0
         L4gAJPoB1zmj8kLUxJq8A3RwRZ5uf+fCB9M5HzndZBWRrIB+RF0xXSL/VuWo9+chTw3F
         Du8BXcgAJRfjabWmYynHIiitxws/Ub1irAH+iC/iLIWUtCpNZrXLDuQDpo3sNdycZ9xa
         W7HJS7vxZYIETq/VZxdOrHjW9Vo5uBoCEZwxZvocVoa52dHjn2v71T/T9jCvdJLOrbmx
         6jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EP1Z0R9h6Sk7sEUIq6S/xiKMedmYureXcAho+7LMC/M=;
        b=ZoBNPzA22R0CtLBmJ+HxB2pfQJU4+w4qyjA0Cs0Yq3taRzLpLeGwpg5PQbGzdBpupb
         KdGpOBk9ZHNWUBOtlHfVTsySNW9TNibWdmGNsmpes6GHF+tLbfU+ZJxGJHBZy+e6S0JP
         OdKJIFTwJMPtyH5+yC14C79pAuhcpMbb/8mnA7Nd1FfNui8+msSNc/lj0XSujdgDjdvZ
         sBFWedn+Y/4dF+/C/bk7EPq2rsSdMBskF5Z13EWO+4jSMrWCBjVLYUffLxnb2c84v/oG
         PLmMTa54lgplJjj646Pf7pwf9R3Mst48VPn7Moz/elU+228pGA+5lyoAQ8Zl7jImm+lb
         L/MQ==
X-Gm-Message-State: AOAM531gosAqIKtKVcp2PXlXZqYC2yzNA95CSGqexaoMSsyVJ9E1yqER
        DpfVqeQl2F1fm8+XnfS1h5s=
X-Google-Smtp-Source: ABdhPJzlPvF6wYriSLd06z56jNI1M7ohQpHxM71ODUFLoNeaworDF5JIrv+ov5+6YtixyJPPRuJEdA==
X-Received: by 2002:a05:6a00:a02:b029:2ec:a0a6:9c54 with SMTP id p2-20020a056a000a02b02902eca0a69c54mr13085147pfh.47.1623080360171;
        Mon, 07 Jun 2021 08:39:20 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id s3sm9859870pgs.62.2021.06.07.08.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 08:39:19 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        Sanket.Goswami@amd.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v7 0/4] Introduce pcim_alloc_irq_vectors()
Date:   Mon,  7 Jun 2021 23:39:12 +0800
Message-Id: <20210607153916.1021016-1-zhengdejin5@gmail.com>
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
v6 -> v7:
	- rebase to PCI next branch
	- add a stub for pci_is_managed() when disable PCI for
	  fix build error in sparc architecture.
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
 drivers/i2c/busses/i2c-designware-pcidrv.c    | 15 +++--------
 drivers/i2c/busses/i2c-thunderx-pcidrv.c      |  2 +-
 drivers/pci/pci.c                             |  5 +---
 include/linux/pci.h                           | 25 +++++++++++++++++++
 5 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.30.1


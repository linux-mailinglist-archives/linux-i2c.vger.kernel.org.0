Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0E3264E8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 16:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZPvr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 10:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhBZPvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Feb 2021 10:51:47 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCB9C06174A;
        Fri, 26 Feb 2021 07:51:03 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id g20so5519646plo.2;
        Fri, 26 Feb 2021 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ktT+GdjKKyhRnZ7kpXgzw67KpCbIpEYpAT6oM+VedEY=;
        b=fHgyPyB96G0xA0bQbvkeXRwcSfe6c8XVo/mlI4Kemqq4FNnAUU+IUcRsVmHbSrS5ny
         AwedSc9S8V2RRlSrRghYX4gCWKmYBGyIvT/9QcdAM0nfkhaca+ImPuctX7G1i1Euiiql
         23mtqXVkIUeqv8pt3MqDctEw7q7LaCFO18dAqYEfY2EmHcH8zt6P3hkUT09hHA9/JVSw
         kWINUz9iGcLJ5vpQzA0PTOr1vbbvkCm+K/DZmefv64A0WaIyrCFQGhFzzX0er82wPDaP
         uMCA0CivbUFJf/Ftz7iwZI0ZHwCxq4j/10K46//QE6JYfX3Mjibhq0o7dsV4cEPr7nRV
         L4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ktT+GdjKKyhRnZ7kpXgzw67KpCbIpEYpAT6oM+VedEY=;
        b=S2p+Pqs6inFasWb2QWYe1BE3E338gsyBJMdjveVQ5ndge0rZ/2YVMUdBWs/1TFeeAN
         A1BcmlCnlqPEcMkCNC2a4F/uVdjnbYouOtxH5n/WB4+NtpNUJ0DtFG6uuazRcRi7C/eh
         84iB8yLpgK7UoYDZaWoKbyJkmDAMvJ0P01pvPdzIvz3rjPwlzLpGLDPt0PQixCvcAA4W
         g92Lpx+MKwRp7HTn+QJO3m8jPt5RR3vSDLSruKLyt2F/OqRyI9lnwPrCCwwxK2ZAL94X
         atRiPPi2N5H9mgSHxSpH2WSo5IVsq0uxImWlIkKmoSBv+8vC2L7baH/N7Da2dg99Z+wG
         HXhw==
X-Gm-Message-State: AOAM531AfCzjaZCSEMraOGyiDVDwr+NSWNo2Z8qtw/puNCxd69k5a300
        gLAU65C0HkwSlu+bzB6qU4M2GmlQq/f5PQ==
X-Google-Smtp-Source: ABdhPJxrcTnOpWUnrcIrBUe+18eX21/3H+bCBon0eEyG86paYlNkLEy6NrGgoh8sWUBj8xosAz8Xog==
X-Received: by 2002:a17:90a:4611:: with SMTP id w17mr4257481pjg.122.1614354663524;
        Fri, 26 Feb 2021 07:51:03 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id n11sm9157293pgm.30.2021.02.26.07.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:51:03 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v5 0/4] Introduce pcim_alloc_irq_vectors()
Date:   Fri, 26 Feb 2021 23:50:52 +0800
Message-Id: <20210226155056.1068534-1-zhengdejin5@gmail.com>
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
2.25.0


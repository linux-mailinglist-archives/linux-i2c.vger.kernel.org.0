Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB2631ECF6
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 18:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhBRRK6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 12:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhBRPFq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 10:05:46 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F98C06178A;
        Thu, 18 Feb 2021 07:05:05 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id k13so1444440pfh.13;
        Thu, 18 Feb 2021 07:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6JzUvbHZRHZd4ZQ75NBM4QAoNuZQMHHQcSNWn9QvA4=;
        b=kqdz24IEELGBD6Xwjwkfk8x2Kth0atGo/+z5qaF4+NPcwPkDl8x9AzNCOwdtoUWSP6
         fC/xvJH7grhIB4PcPhO6dhualq4Hts37AS9lAsNQ93hzcdt/LTLHjf1nhcQ3EdYR0O2r
         wzTGpFp7fpH+oWHn5XgX/lQfwVEm4MbBA8Ym8p3KONLnhN6ZoiVj8OVX1jzl1LfXjJek
         eW7QPkW+TAZUivhY09BerzQaE7j6JaaOf/LwCX9VVFBXl6EQ1iCEnvuLyMxzAlrTEWXS
         772MaL3ECEaCxIRZ8jv5tRrbhkn9OByODs9+mWWbrhp4bZtUWNWO/hFOmu4nNrTNP838
         DM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6JzUvbHZRHZd4ZQ75NBM4QAoNuZQMHHQcSNWn9QvA4=;
        b=MT4tlFqpPOJgtwDvQYx36NDD07x7lYlVuNFEEjZqREP/7tAETXhRdhtC8ftyukjQS7
         3L32h4ovIyFxsCjBnI+syWV8rGC8u9I99jcyAfU+W+J7gLexOB/ve6tE7ZOYbFZC0Naa
         E8OEn6r4hvUraURKV8NsE5cw7vcae7EeC75S0eAJpQ+DS1j+FERymcTLLvf3vOg0Pg0n
         nhbCVkc9dcyfQ/ayc1k+kqkxaVO3CsAxus7yKRAdmfSUzEjqqF/pWGr1HXJ4sUDAqVBY
         ddPdHLM3QpsxOf6wS8ccsLu2aT41YOCgN9FfeL4KrCzIy4xza9eATgUTs4Q3poVYVKIS
         jWWw==
X-Gm-Message-State: AOAM5318bttiolT2qXTzAUbtKPKyaZ8A+8gHRwHw1d9fF6TLMNCu1We7
        MbrASKPl3Bf3DyKdP/aRwDI=
X-Google-Smtp-Source: ABdhPJyHfO8HbKQRE4fnLpa6R8PgqgfAwdUyVq4kbKdk3c/plDFgCfDlJ4z/UaYzkflgyZ1Fw2MpSA==
X-Received: by 2002:a63:1648:: with SMTP id 8mr4426357pgw.392.1613660705220;
        Thu, 18 Feb 2021 07:05:05 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id r23sm6396270pgl.42.2021.02.18.07.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:05:04 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v4 0/4] Introduce pcim_alloc_irq_vectors()
Date:   Thu, 18 Feb 2021 23:04:54 +0800
Message-Id: <20210218150458.798347-1-zhengdejin5@gmail.com>
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


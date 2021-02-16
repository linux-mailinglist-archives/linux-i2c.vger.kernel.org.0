Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D8731CBAE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 15:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhBPOTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 09:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhBPOTB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 09:19:01 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B9EC061574;
        Tue, 16 Feb 2021 06:18:21 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o38so6285306pgm.9;
        Tue, 16 Feb 2021 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PLAWiU4u+/JN6Cect1nU2YTOuyF3kymSRVIxQKTfE7M=;
        b=ARopcqVdkaKOiZfM1Ig0o9IQpQhfRmv3CfZ5OWs82gp5HJtZNiT9g14DA6eMU7dwyb
         R+h05Cymdgv2MEE5uhuFsrGPhPxRVr/CvRhCnsHK1xrfC4hyHhazo3jp2q9yE8I98J1T
         AQc+AAraBQoiyq2iMxrOGsVxkbOiP5kCYfQ/sAI9I4I6b+X46zgbGByz27lqb4vLdBL+
         B47lFuXUQDq9EA9tbHXNH49CJzdAeLqMNe0q+RDTROSwxoc7NPy0RRp+emvRkYcbRp8Y
         7n0i6r7Gh4MGwKOxHGp0cJ+WN7rqT7jV90DIUUST1Sig3idozousEmDiNq15Z81H3dM1
         m/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PLAWiU4u+/JN6Cect1nU2YTOuyF3kymSRVIxQKTfE7M=;
        b=VxAtNuPQ14x8kwr1+cELl2gaCZ8IPLKdiwqTAtGmqGb/FYuQLshs5MaQ2R9sx0veqa
         Evmtw20u8JMRAzWlkeWTTlxSi/nuoASmsDGls+5vxdQJoFXIF6g6aD1YGfvqiZu5nCgp
         TP1VxgeCGDJWs5q4QMK26LT9FOfGeZSO7v+TSIvVNrEB3cpXBTOcuNblxGjiciUrFhhE
         3ZBIyIdzDW9ouknHFrIZNwCNu2uMOWbkuSP7DOGL6D6FwR0tO0ZtrJKjFjmSicNS5+1s
         mN4jVm2k/Dv2iHQ9EY1zPFc3TPeT/Oe8wtxerq7ZCjFNJTdQo/yZLTkX50BiaczQ5600
         apnA==
X-Gm-Message-State: AOAM531r/iB78HzBZKcsRwJTzq3q+TU8NNfNH+wZlCIapVCA43YyF7Kr
        HEZ9+Ed89ufx5fazhyGTTgg=
X-Google-Smtp-Source: ABdhPJyJYksZEPu8FRF4aATJc1TyLBshMBCNdt1NHgVD5mJvrsga1WKLlugALHoGTiF/j0fQJwNkfA==
X-Received: by 2002:a65:4983:: with SMTP id r3mr20001308pgs.288.1613485100793;
        Tue, 16 Feb 2021 06:18:20 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id d124sm16101242pgc.82.2021.02.16.06.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 06:18:20 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, kw@linux.com
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 0/4] Introduce pcim_alloc_irq_vectors()
Date:   Tue, 16 Feb 2021 22:18:06 +0800
Message-Id: <20210216141810.747678-1-zhengdejin5@gmail.com>
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
v1 -> v2:
	- Use pci_free_irq_vectors() to replace some code in
	  pcim_release().
	- Modify some commit messages.

Andy and Krzysztof, thanks for your help!

Dejin Zheng (4):
  PCI: Introduce pcim_alloc_irq_vectors()
  Documentation: devres: Add pcim_alloc_irq_vectors()
  i2c: designware: Use the correct name of device-managed function
  i2c: thunderx: Use the correct name of device-managed function

 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c    |  2 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c      |  2 +-
 drivers/pci/pci.c                             | 33 ++++++++++++++++---
 include/linux/pci.h                           |  3 ++
 5 files changed, 35 insertions(+), 6 deletions(-)

-- 
2.25.0


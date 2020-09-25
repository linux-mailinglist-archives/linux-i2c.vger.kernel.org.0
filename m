Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA7E2789B3
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Sep 2020 15:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbgIYNgl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Sep 2020 09:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgIYNgl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Sep 2020 09:36:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD429C0613CE
        for <linux-i2c@vger.kernel.org>; Fri, 25 Sep 2020 06:36:40 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k10so521483wru.6
        for <linux-i2c@vger.kernel.org>; Fri, 25 Sep 2020 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NpVyy7Iuy1WwWIqgiqN+fCkSXBrOrSE87a6j1YcrG3A=;
        b=IznL4IsRsVYBMdoR8Avh1/WNni8tU4f9zBghlPZ/u9Ap5sI3XkEdTbHKwa/GWjBZY0
         wpgbxSWcEdREvPMCk/vNpCjR3VTXAu3Q+yUH6RMKE8M+A8S1YS6Je/boCcZu/AzUOLcf
         jNLoxkNDKdMOP7uNB+MJRZGLyF/QfP7XHbNZfPaG8DVAccj4gu3Mt8nSSy1FwXrYzJY5
         lbDm6dQNKBYMtzOCAg7qqABsiFwb4Pxj9SRTcBh7r7g2OK0ZTt2JwQmFmx8y7lBKKDUJ
         NCr3Zh0DgaZeIpt25+vCfq1kHcKLO1eCqWLHNsXNamOsfJR8OtBDqcF5m489Epk/dCnW
         MPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NpVyy7Iuy1WwWIqgiqN+fCkSXBrOrSE87a6j1YcrG3A=;
        b=OQHfqFDQPBJiqm7+5OlkGgCPE6LZLzzKK+LBgRVUTOyvfMo78J3TImns2Aexhtla69
         hPlKGAOugsQlAfrZewuJ+qdOF6sQRPBeMCN8u0vKh0FwHszh4FgX+TMxlSyht9QCBOr1
         V6XT8N3+ciu1nK+Hc3xFIH1pEtrUUIzJVYlJWsXyjfOmgY/yrTvZ1s2NYN1KMNbtPMtK
         7Qf3aod3tK1OqGx7VovWE/wIsWNEa9YGZLXk7M5h3mbQG/519vRL90Q1U4wqsbZAPqIn
         TxLoRz6UpmDEuwnzADyv8suBjtSYQqw8l9Mzo3rRc4kZvCecy5KGzqcg0XMAAi1GxVlO
         6ZZw==
X-Gm-Message-State: AOAM532nVmWnmvCTTkOyQHAcYKOd5YFCaClhE+VLguzgAn2/ARPMCAWA
        vUYi4N702XpXxFUhN1Yl5XgWsCIN1tV9fA==
X-Google-Smtp-Source: ABdhPJxpOAnoyWDO/S27GxWVQd01Ud81CoxkTfcUMI7wpQtZwMDwax/HyVH6cWW7wOtYred5Czt98w==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr4858312wrx.251.1601040999425;
        Fri, 25 Sep 2020 06:36:39 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id c4sm3078324wrp.85.2020.09.25.06.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 06:36:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: updates for v5.10
Date:   Fri, 25 Sep 2020 15:36:36 +0200
Message-Id: <20200925133636.10950-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Wolfram,

This release's PR is surprisingly big for at24. We have some new features and
some minor tweaks - details are in the signed tag.

Please pull.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v5.10

for you to fetch changes up to 61f764c307f6b2079b7af0d4fb7951402b824967:

  eeprom: at24: Support custom device names for AT24 EEPROMs (2020-09-25 15:33:04 +0200)

----------------------------------------------------------------
at24 updates for v5.10

- add support for masking sensitive data in VAIO EEPROMs
- set the nvmem TYPE to NVMEM_TYPE_EEPROM
- add support for the new 'label' property
- set the nvmem ID to NVMEM_DEVID_AUTO by default (for backward
  compatibility) or to NVMEM_DEVID_NONE if label is defined

----------------------------------------------------------------
Jean Delvare (2):
      eeprom: at24: Add support for the Sony VAIO EEPROMs
      eeprom: at24: Tidy at24_read()

Jon Hunter (3):
      eeprom: at24: Initialise AT24 NVMEM ID field
      dt-bindings: eeprom: at24: Add label property for AT24
      eeprom: at24: Support custom device names for AT24 EEPROMs

Vadym Kochan (1):
      eeprom: at24: set type id as EEPROM

 Documentation/devicetree/bindings/eeprom/at24.yaml |  3 +
 drivers/misc/eeprom/at24.c                         | 71 +++++++++++++++++++---
 2 files changed, 67 insertions(+), 7 deletions(-)

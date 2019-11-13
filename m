Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2531EFB46D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 16:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfKMP6I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 10:58:08 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43675 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbfKMP6I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 10:58:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id n1so2951051wra.10
        for <linux-i2c@vger.kernel.org>; Wed, 13 Nov 2019 07:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nz+99DY1vtb4B2oWIA46L7hZabZIvbw2T8kl9hWG2gk=;
        b=DXgFiu4lILYTs9n5lHUhF8xNPnSnFBr9ht2PUt4ZPdCg9ckokovjhNN4dY+olPuVbw
         wSoINPCBjwoJ6/LDW+Jo99gPjVTUWpkP3w9Tf4Lr1GVHw9zv11CnpE3CNn0eX2zywyI+
         ylywQMAKrxHe9O76kngAvJh41RrlLbWp15LefkIMjeGVjCD8SLXw+jJL1wZvs7xr9NFN
         5ZSr4kxEhx/giG6qC6X3QZaghloh/Ns4RMocliamI2Th4zLg3toMXVlDjy2KVvqtk68H
         r12SRUw5iQ7uMECmjvBhxNwb91UTW0MGvmyfUlVh6kDgRilGqeIaDrXZ5+hYpF5bjCiz
         CpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nz+99DY1vtb4B2oWIA46L7hZabZIvbw2T8kl9hWG2gk=;
        b=cllhrsv4CCUP15AcVznDEXpmHnHiTFMd0MPlWIZiaRkOV/vivPsWJJvy/9JWVzWDGm
         vcWvpnAjb9TGPd+OxdBajzjI06daQsh0DfQ3mTmEoYQKtdakEkKzw7blNs/PLnE+KXz4
         IaTzXtAk8G3TLYEtIhxU6d7+CiwvldbVMRJAR+7zIH8M7YKFncHHYIGIC9DzpCf1ypt9
         Mv2tfqjXVjgBqRh+JlL22+Cqg++VpbdeUkXk860OLSvd60Awrh9AwIpc4DUH2dKOj0RV
         ambwmLVBrz5uw7cOPuCkRb3lhDE/kJRV2yK8yI/LstDBInBeaVlU1xlX7y2s4nWF8xtx
         QLBw==
X-Gm-Message-State: APjAAAXAXxX1zjSZxKBZgzbJ3LzSvQrmjLw9p0gPd6g3rKpUsUzpiXKC
        eDQdw8LaZLchcJVS8zYWRYVVKQ==
X-Google-Smtp-Source: APXvYqySs1oVmBb9JkCeXqIpSip6q4ZfY/oe3ZrC0J1nXqbQJ1zK59poqBScj9DtoaBQp4g4ov0M3A==
X-Received: by 2002:adf:ab4c:: with SMTP id r12mr3381185wrc.3.1573660686804;
        Wed, 13 Nov 2019 07:58:06 -0800 (PST)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id p15sm2495440wmb.10.2019.11.13.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 07:58:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: updates for v5.5
Date:   Wed, 13 Nov 2019 16:58:03 +0100
Message-Id: <20191113155803.20630-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

this release there's only a small but useful change from Jean fixing a
confusing log message for read-only EEPROMs. Please pull.

Bartosz

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-v5.5-updates-for-wolfram

for you to fetch changes up to 285be87c79e173f08af5e1a6417a106fb14934b7:

  eeprom: at24: Improve confusing log message (2019-10-04 10:46:39 +0200)

----------------------------------------------------------------
at24: updates for v5.5

- print a proper log message for read-only EEPROMs

----------------------------------------------------------------
Jean Delvare (1):
      eeprom: at24: Improve confusing log message

 drivers/misc/eeprom/at24.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

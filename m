Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72979A6814
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 14:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfICMHB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 08:07:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38884 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfICMHA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 08:07:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id o184so17928470wme.3
        for <linux-i2c@vger.kernel.org>; Tue, 03 Sep 2019 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wfpo86Vzk9epnKhYl0/Qm6zfIZVFsSQeJaIl6NoaxQ=;
        b=Q1SUNgB4rtD+NiqjylvOPSMAGwborm3WPc8vx91oBKOh1Kngmou/18i8BfWJmFQlcq
         4nP8MSkBLXHjjnCOOiQkv09ulWIa6ZOGbxIBBriPWQOpIzetD5U2/hVsKMo/SSJnqcCK
         9lWzZh31YQeZOTDi2gmcA4Slu7Ck1A99VBcFwwAxp6aAN0VncIbi0v2+E7/b97ZVWdbP
         IYhTxJir6gv5B92fKXpibsEJSxdGMELM3cj21Uj2af5HP+zfKuU5Tgcw1CHx1V61bSbZ
         GmV5K+T9yLWuyazw07yIzaPStAM3LAPTLVYWscGiCnRbUxyeffHo0b9Fp7iTtCUG2btJ
         rtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wfpo86Vzk9epnKhYl0/Qm6zfIZVFsSQeJaIl6NoaxQ=;
        b=CvpK7kAFkt8BuGbo2Sm4dZ7k0JYyjmw377vfKUZ0qK2B5u6u3E0np2gosvET/mjtf7
         Qq26BbjI79mgJSc8t2/VP5sqH8+RzeAmeUKJd/2JWUoGfQjiiU3kDxMOB2pF57Pz9+BK
         DVEQH6t8t3o9dm+vfbDZLQSSfg0pyWjU+5ggUsh+1dgcQ4c5k/eep1csIrD4W4GHkADW
         42vEA27ugbZh5n1HR87t0Qznv4qYk1LrLjpNiLtn6ir5NXk5pm1g0EBPUkDxD62uhLV5
         +F1Ex3J9R0SeJNnehZtXOA8wzztbLqZGf8xb+2hdTn6sxgk2TW7k7hYbuHLUEyHa2RHq
         Q3wQ==
X-Gm-Message-State: APjAAAWfdRGvq6/PuFweZ5smqT2OspZL9BpIMHK36cElZQl3WHjd0eb7
        1LVxK0Gn+xV2cc/KAUL5rKy4NA==
X-Google-Smtp-Source: APXvYqzeW0oFk6CTwTVXI2MzgswCQV5kbBtDIUxAKbOidxduEqMdZLs3Ylus8NY5xHpgqDc+bO64Nw==
X-Received: by 2002:a1c:a6ca:: with SMTP id p193mr29262307wme.103.1567512418722;
        Tue, 03 Sep 2019 05:06:58 -0700 (PDT)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id f186sm26703843wmg.21.2019.09.03.05.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 05:06:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: updates for v5.4
Date:   Tue,  3 Sep 2019 14:06:52 +0200
Message-Id: <20190903120652.26708-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Wolfram,

just a single trivial commit this time. Please pull.

Bart

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-v5.4-updates-for-wolfram

for you to fetch changes up to 10742fee98eb3b3e8453ef27a33dee314b15f7bd:

  eeprom: at24: remove unneeded include (2019-07-22 14:36:56 +0200)

----------------------------------------------------------------
at24: updates for v5.4

- don't include an unneeded header

----------------------------------------------------------------
Bartosz Golaszewski (1):
      eeprom: at24: remove unneeded include

 drivers/misc/eeprom/at24.c | 1 -
 1 file changed, 1 deletion(-)

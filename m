Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A243BBA38
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 11:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhGEJfz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 05:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbhGEJfz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 05:35:55 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98830C061574
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jul 2021 02:33:18 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id r9-20020a7bc0890000b02901f347b31d55so10730739wmh.2
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jul 2021 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z2wPNwgs51whrliCqyrWnDoUkvZnPubtiXfJqpdRIiE=;
        b=nfn6lCBLNB4CwSB9niCORhuBtfiTRc4zFa23P0Axre6QGg5d+OcOWwBWAbTKkNSZcw
         RAgrzP2nzkoP2/s7zU/qMHg/a+Z//3QdtSSGw8A7I97NrlxIrdwiiToinxgA9CF7Me8u
         arQSFvQMA2ppPerdVRuF8lHhSwRfVaCx2YHk8kyDyJwUSodh4+XP40fR857+PPPM7RSS
         9BcvCwIxoP3Iuv6tc54bw3muASR5DP4PwGtwCQKPfV9JlUdqVsK89+IOcE7zq3xaARXc
         EcZKf8gK99GHAhi1+RVuizPfQ9D/xvktkdRJJXhyXW+FNP7Dd6wuiWbTndawmc5+nlSn
         l+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z2wPNwgs51whrliCqyrWnDoUkvZnPubtiXfJqpdRIiE=;
        b=KBLOxk9AtUsRWbMEKRMcJJbt37KoX0QwSmRSfHhFZaXEiNQp3IpR8iOI+1AM7ljFge
         +lTB3uDJ4sSReW1ZWW9w1qT2HHUZDhM3YPKsbGrwR/i6MQZ9OSnYjQJAR/wXhJciGsYM
         AwEfwzp3GK1muGEuFiDagQTNDOI6/oF3rR3eumQGp9arXA5XNBSx4eCaXytV/EAm46BW
         xarQOxOLjLnmQUyo5S68sdbdHcWxEQWYusBuWQ3o2URZrkBjY8JM92XWyI1fT/njHxnD
         wKrzxbAnigQhKH6ujX9uH1beOCgzlEWBD6uxkmuCYdobdP6sgubjEvU2hwlM1Em6MrR/
         lARw==
X-Gm-Message-State: AOAM533JX7qnkJYDeIHFaugAR2IddKICeaaZmoNJwOxdnniKNyY9KKKp
        g8GwQgBePCDIZ/5UX346lpL1CA==
X-Google-Smtp-Source: ABdhPJwpFXADX++t8skjxd1qMd15B2ZuFxUltMxWRIb7wORNBToVdMaF8iDCYOMFs47JI6kMbmR1AA==
X-Received: by 2002:a05:600c:1d11:: with SMTP id l17mr13966740wms.6.1625477596700;
        Mon, 05 Jul 2021 02:33:16 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j10sm1115650wrt.35.2021.07.05.02.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 02:33:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] at24: fixes for v5.14
Date:   Mon,  5 Jul 2021 11:33:14 +0200
Message-Id: <20210705093314.20322-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram,

Please pull the following fix for an issue that was raised recently on the
list. If multiple eeproms would have the same labels in the system, the driver
would refuse to bind any other than the first one.

Best Regards,
Bartosz Golaszewski

The following changes since commit 62fb9874f5da54fdb243003b386128037319b219:

  Linux 5.13 (2021-06-27 15:21:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-fixes-for-v5.14

for you to fetch changes up to c36748ac545421d94a5091c754414c0f3664bf10:

  misc: eeprom: at24: Always append device id even if label property is set. (2021-07-01 18:49:37 +0200)

----------------------------------------------------------------
at24 fixes for v5.14

- fix a problem with repeating labels not getting a device id

----------------------------------------------------------------
Jérôme Glisse (1):
      misc: eeprom: at24: Always append device id even if label property is set.

 drivers/misc/eeprom/at24.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

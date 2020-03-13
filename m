Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53820184A4D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 16:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgCMPMw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 11:12:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43963 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgCMPMw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 11:12:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id b2so6315123wrj.10
        for <linux-i2c@vger.kernel.org>; Fri, 13 Mar 2020 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OybCSL1/Zq4FwBtk2zCVDmcmO3lEWY7XrQCDyI5j3o8=;
        b=XOZnafQxztFeVvMttr/vlZLzFVI5saRTo/YCYR6WnJfWF9Os8Jcsq+Gb62E+tHMzCf
         xsa1WrIipKF6ZieAXNqUI0fggEerpFA0TIdVunLQGGs6kOh/46dWw0geeP5nxlqisBaI
         ckes7Ral5cknz4T0cv7IiMyyLtSbJCnVpRRoJQDQPg/1ouOAwY8BTshyKA6rkzKXC8nv
         KZjhEDG+bda3qaiITTxywPaJijRRF2TZPsBuSDLoAnjvfM0W/ULk8yfwoP1o6zFzYQZC
         7vUAq9Xw29H+ape2VZCukCUihXGdPgjo9mF8dZpepqLTmVi9ZB4PbTpBg49MVgwpW8cb
         jRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OybCSL1/Zq4FwBtk2zCVDmcmO3lEWY7XrQCDyI5j3o8=;
        b=uQoHGUGnFmYndKAoEl5EBF2rmbBhsBaV9tMAWQd3rTUFjRggF3rVxSTA6qETIwobQv
         GlNVKYR78ebd+4QTuo54/itz2mbgisMpPpCetH4ze+YgM3Iy6pfPknXD19FOwS7XhziJ
         GMDBsCnjNztCJRVAvHB97LUh3s97Dl3rKMkWr+FxLomG6ZFHOLfyOenS38cbVvQGJV2L
         5us9tpcvEDa+5lRnxG675iFVn1TxdQ3PuLu0TP4eF5EyCXn3UO+59K+sK9k0iqKjnD/I
         +NK/sTqRM+XzmeiSaP+8sGfZDhbkfC7BMGsvafk1cZVm1EHcxtNHyg2rNTatZeT43ae0
         D58A==
X-Gm-Message-State: ANhLgQ3ZkRp4wM7ENBZlHgvpkww1VTkPAKztARTMLWPoUBPs4lfRQDyI
        pHmhhlLw1wbOa0LdSaaIjmoX4g==
X-Google-Smtp-Source: ADFU+vu3XtYT7T5Yj+z4ineVAEOrfBLr2Q58Q+N1rfN8Yk3Lw7uEOVQNepyFm+SBiaRCsa6heYPY6A==
X-Received: by 2002:adf:83c4:: with SMTP id 62mr1362897wre.105.1584112368678;
        Fri, 13 Mar 2020 08:12:48 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id 7sm5614927wmf.20.2020.03.13.08.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 08:12:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] at24: fix for v5.6-rc6
Date:   Fri, 13 Mar 2020 16:12:46 +0100
Message-Id: <20200313151246.12356-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Wolfram,

please pull the following fix for a bug introduced during the last merge
window.

Thanks,
Bartosz

The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:

  Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24-fixes-for-v5.6-rc6

for you to fetch changes up to 58d6fee50e67bb1c69977f1a534ccb17bf58b0f1:

  misc: eeprom: at24: fix regulator underflow (2020-03-12 09:02:34 +0100)

----------------------------------------------------------------
at24 fixes for v5.6-rc6

- fix regulator underflow bug introduced during the v5.6 merge window

----------------------------------------------------------------
Michael Auchter (1):
      misc: eeprom: at24: fix regulator underflow

 drivers/misc/eeprom/at24.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

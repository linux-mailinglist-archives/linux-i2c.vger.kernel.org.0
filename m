Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7A72FD214
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jan 2021 14:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbhATNyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jan 2021 08:54:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:56696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389858AbhATN3Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Jan 2021 08:29:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BF5B23357;
        Wed, 20 Jan 2021 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611149323;
        bh=47jFbRMPZFr17CCyold7EQC+gnZRPQ8MCuHaMK38ki4=;
        h=From:To:Cc:Subject:Date:From;
        b=HQw4K4OUROzp6N594zw/eTBZpUuODiKaKOOU+etjPRz6Lnqj+YxGbjjhsG+kJcykc
         +AjILfPu0tK9omF738GjSv0r1v1+bCkV6FTwB2TmAQvOImJA3O+6VkgVvoz4J51ywY
         9RXdNAxB2hqvbkX+5N3rwo7YyMdICX8BMWv5w47qjktWZJiCoQJWDkLiE2YLHwFflL
         nReof1OlQQ4COVgRxbSFt9nKHhwkVonyHfHlGL/U4TC2Ml2fVCxGGPQPK6wnplXKAb
         WRxM15fvmRqMsPM0IN82z/ZC12xHBAAe5OfDufstYHAk7C1XcmxM5CgbkyihbPszVG
         NrU3vPZm73zmA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/3] i2c: drop unused bus drivers
Date:   Wed, 20 Jan 2021 14:28:31 +0100
Message-Id: <20210120132834.2375048-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A few Arm platforms are getting removed in v5.12, this removes
the corresponding i2c bus drivers.

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/


Arnd Bergmann (3):
  i2c: remove sirf bus driver
  i2c: remove u300 bus driver
  i2c: remove zte zx bus driver

 .../devicetree/bindings/i2c/i2c-sirf.txt      |   19 -
 .../devicetree/bindings/i2c/i2c-stu300.txt    |   15 -
 .../devicetree/bindings/i2c/i2c-zx2967.txt    |   22 -
 drivers/i2c/busses/Kconfig                    |   32 -
 drivers/i2c/busses/Makefile                   |    3 -
 drivers/i2c/busses/i2c-sirf.c                 |  475 --------
 drivers/i2c/busses/i2c-stu300.c               | 1008 -----------------
 drivers/i2c/busses/i2c-zx2967.c               |  602 ----------
 8 files changed, 2176 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sirf.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-stu300.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-zx2967.txt
 delete mode 100644 drivers/i2c/busses/i2c-sirf.c
 delete mode 100644 drivers/i2c/busses/i2c-stu300.c
 delete mode 100644 drivers/i2c/busses/i2c-zx2967.c

-- 
2.29.2


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C28BC64E23
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2019 23:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfGJVwA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jul 2019 17:52:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfGJVwA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jul 2019 17:52:00 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F68B31C;
        Wed, 10 Jul 2019 23:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562795517;
        bh=yCre66/S0NmxK7EvPStcEWCQs8iwh4sKNiukq1nK/oM=;
        h=From:To:Cc:Subject:Date:From;
        b=iqI91jb/q2WWr0AutcKlt+HAMErhN4o26QT88YVclWMS8mVOzk9DbAWRVPaBkgG3W
         VH46fxEci+MnvtP6Z4esoNS0eMkhe00tWaQcJ5om2sq2ebhxpfhfd2RoTq3RoW73Tt
         KAKiTgq9b2Y+mBpZE3I6zRovz4go0i6LXzXAmTm4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/6] media: i2c: Convert to probe_new()
Date:   Wed, 10 Jul 2019 22:51:43 +0100
Message-Id: <20190710215149.9208-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C driver framework aims to deprecate the current .probe() function which
requires both an i2c_client structure, and an i2c_device_id structure in favour
of a simpler probe_new() which takes only the i2c_client parameter.

Once all drivers are converted to the probe_new() a global rename can put this
back to probe().

This small series aims to rekindle this effort by converting a selection of the
media based drivers which do not utilise the i2c_device_id parameter and thus are
straightforward renames.

In a future series, these drivers could have their i2c_device_id tables
removed; however doing so may affect their module auto-loading due to a change
in their module alias representations.

I have submitted an RFC patch [0] to discuss if this could be handled at the
file2alias.c component of the modpost stage.

[0] https://lore.kernel.org/lkml/20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com/

Kieran Bingham (6):
  media: radio: si4713: Convert to new i2c device probe()
  media: radio: si470x: Convert to new i2c device probe()
  media: i2c: smiapp: Convert to new i2c device probe()
  media: i2c: s5c73m3: Convert to new i2c device probe()
  media: i2c: et8ek8: Convert to new i2c device probe()
  media: i2c: Convert to new i2c device probe()

 drivers/media/i2c/adv7343.c                   | 5 ++---
 drivers/media/i2c/et8ek8/et8ek8_driver.c      | 5 ++---
 drivers/media/i2c/imx274.c                    | 5 ++---
 drivers/media/i2c/max2175.c                   | 5 ++---
 drivers/media/i2c/mt9m001.c                   | 5 ++---
 drivers/media/i2c/mt9m111.c                   | 5 ++---
 drivers/media/i2c/ov2640.c                    | 5 ++---
 drivers/media/i2c/ov2659.c                    | 5 ++---
 drivers/media/i2c/ov5640.c                    | 5 ++---
 drivers/media/i2c/ov5645.c                    | 5 ++---
 drivers/media/i2c/ov5647.c                    | 5 ++---
 drivers/media/i2c/ov772x.c                    | 5 ++---
 drivers/media/i2c/ov7740.c                    | 5 ++---
 drivers/media/i2c/ov9650.c                    | 5 ++---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      | 5 ++---
 drivers/media/i2c/s5k5baf.c                   | 5 ++---
 drivers/media/i2c/s5k6a3.c                    | 5 ++---
 drivers/media/i2c/smiapp/smiapp-core.c        | 5 ++---
 drivers/media/i2c/tc358743.c                  | 5 ++---
 drivers/media/i2c/ths8200.c                   | 5 ++---
 drivers/media/i2c/tvp5150.c                   | 5 ++---
 drivers/media/i2c/tvp7002.c                   | 4 ++--
 drivers/media/radio/si470x/radio-si470x-i2c.c | 5 ++---
 drivers/media/radio/si4713/si4713.c           | 5 ++---
 24 files changed, 48 insertions(+), 71 deletions(-)

-- 
2.20.1


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADA139CEA
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 13:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfFHK4p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 06:56:45 -0400
Received: from sauhun.de ([88.99.104.3]:51774 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfFHK4p (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 06:56:45 -0400
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
        by pokefinder.org (Postfix) with ESMTPSA id D0A142C3637;
        Sat,  8 Jun 2019 12:56:40 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 00/34] treewide: simplify getting the adapter of an I2C client
Date:   Sat,  8 Jun 2019 12:55:39 +0200
Message-Id: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While preparing a refactoring series, I noticed that some drivers use a
complicated way of determining the adapter of a client. The easy way is
to use the intended pointer: client->adapter

These drivers do:
	to_i2c_adapter(client->dev.parent);

The I2C core populates the parent pointer as:
	client->dev.parent = &client->adapter->dev;

Now take into consideration that
	to_i2c_adapter(&adapter->dev);

is a complicated way of saying 'adapter', then we can even formally
prove that the complicated expression can be simplified by using
client->adapter.

The conversion was done using a coccinelle script with some manual
indentation fixes applied on top.

To avoid a brown paper bag mistake, I double checked this on a Renesas
Salvator-XS board (R-Car M3N) and verified both expression result in the
same pointer. Other than that, the series is only build tested.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/no_to_adapter

Please apply the patches to the individual subsystem trees. There are no
dependencies.

Thanks and kind regards,

   Wolfram


Wolfram Sang (34):
  clk: clk-cdce706: simplify getting the adapter of a client
  gpu: drm: bridge: sii9234: simplify getting the adapter of a client
  iio: light: bh1780: simplify getting the adapter of a client
  leds: leds-pca955x: simplify getting the adapter of a client
  leds: leds-tca6507: simplify getting the adapter of a client
  media: i2c: ak881x: simplify getting the adapter of a client
  media: i2c: mt9m001: simplify getting the adapter of a client
  media: i2c: mt9m111: simplify getting the adapter of a client
  media: i2c: mt9p031: simplify getting the adapter of a client
  media: i2c: ov2640: simplify getting the adapter of a client
  media: i2c: tw9910: simplify getting the adapter of a client
  misc: fsa9480: simplify getting the adapter of a client
  misc: isl29003: simplify getting the adapter of a client
  misc: tsl2550: simplify getting the adapter of a client
  mtd: maps: pismo: simplify getting the adapter of a client
  power: supply: bq24190_charger: simplify getting the adapter of a client
  power: supply: bq24257_charger: simplify getting the adapter of a client
  power: supply: bq25890_charger: simplify getting the adapter of a client
  power: supply: max14656_charger_detector: simplify getting the adapter
    of a client
  power: supply: max17040_battery: simplify getting the adapter of a client
  power: supply: max17042_battery: simplify getting the adapter of a client
  power: supply: rt5033_battery: simplify getting the adapter of a client
  power: supply: rt9455_charger: simplify getting the adapter of a client
  power: supply: sbs-manager: simplify getting the adapter of a client
  regulator: max8952: simplify getting the adapter of a client
  rtc: fm3130: simplify getting the adapter of a client
  rtc: m41t80: simplify getting the adapter of a client
  rtc: rv8803: simplify getting the adapter of a client
  rtc: rx8010: simplify getting the adapter of a client
  rtc: rx8025: simplify getting the adapter of a client
  staging: media: soc_camera: imx074: simplify getting the adapter of a client
  staging: media: soc_camera: mt9t031: simplify getting the adapter of a client
  staging: media: soc_camera: soc_mt9v022: simplify getting the adapter
    of a client
  usb: typec: tcpm: fusb302: simplify getting the adapter of a client

 drivers/clk/clk-cdce706.c                        | 2 +-
 drivers/gpu/drm/bridge/sii9234.c                 | 4 ++--
 drivers/iio/light/bh1780.c                       | 2 +-
 drivers/leds/leds-pca955x.c                      | 2 +-
 drivers/leds/leds-tca6507.c                      | 2 +-
 drivers/media/i2c/ak881x.c                       | 2 +-
 drivers/media/i2c/mt9m001.c                      | 2 +-
 drivers/media/i2c/mt9m111.c                      | 2 +-
 drivers/media/i2c/mt9p031.c                      | 2 +-
 drivers/media/i2c/ov2640.c                       | 2 +-
 drivers/media/i2c/tw9910.c                       | 3 +--
 drivers/misc/fsa9480.c                           | 2 +-
 drivers/misc/isl29003.c                          | 2 +-
 drivers/misc/tsl2550.c                           | 2 +-
 drivers/mtd/maps/pismo.c                         | 2 +-
 drivers/power/supply/bq24190_charger.c           | 2 +-
 drivers/power/supply/bq24257_charger.c           | 2 +-
 drivers/power/supply/bq25890_charger.c           | 2 +-
 drivers/power/supply/max14656_charger_detector.c | 2 +-
 drivers/power/supply/max17040_battery.c          | 2 +-
 drivers/power/supply/max17042_battery.c          | 2 +-
 drivers/power/supply/rt5033_battery.c            | 2 +-
 drivers/power/supply/rt9455_charger.c            | 2 +-
 drivers/power/supply/sbs-manager.c               | 2 +-
 drivers/regulator/max8952.c                      | 2 +-
 drivers/rtc/rtc-fm3130.c                         | 8 +++-----
 drivers/rtc/rtc-m41t80.c                         | 2 +-
 drivers/rtc/rtc-rv8803.c                         | 2 +-
 drivers/rtc/rtc-rx8010.c                         | 2 +-
 drivers/rtc/rtc-rx8025.c                         | 2 +-
 drivers/staging/media/soc_camera/imx074.c        | 2 +-
 drivers/staging/media/soc_camera/mt9t031.c       | 2 +-
 drivers/staging/media/soc_camera/soc_mt9v022.c   | 2 +-
 drivers/usb/typec/tcpm/fusb302.c                 | 3 +--
 34 files changed, 37 insertions(+), 41 deletions(-)

-- 
2.19.1


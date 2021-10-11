Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29972428DEC
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 15:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236946AbhJKNaa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 09:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236956AbhJKNa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 09:30:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3975FC061745
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 06:28:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLZ-0006fi-Rm; Mon, 11 Oct 2021 15:28:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLV-0003nd-8g; Mon, 11 Oct 2021 15:28:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mZvLV-0000Re-6O; Mon, 11 Oct 2021 15:28:01 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Jason Gunthorpe linux-integrity @ vger . kernel . org" 
        <jgg@ziepe.ca>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/13] Make some spi device drivers return zero in .remove()
Date:   Mon, 11 Oct 2021 15:27:41 +0200
Message-Id: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

this series is part of my new quest to make spi remove callbacks return
void. Today they return an int, but the only result of returning a
non-zero value is a warning message. So it's a bad idea to return an
error code in the expectation that not freeing some resources is ok
then. The same holds true for i2c and platform devices which benefit en
passant for a few drivers.

The patches in this series address some of the spi drivers that might
return non-zero and adapt them accordingly to return zero instead. For
most drivers it's just about not hiding the fact that they already
return zero.

Given that there are quite some more patches of this type to create
before I can change the spi remove callback, I suggest the respecive
subsystem maintainers pick up these patches. There are no
interdependencies in this series.

Uwe Kleine-König (13):
  drm/panel: s6e63m0: Make s6e63m0_remove() return void
  hwmon: adt7x10: Make adt7x10_remove() return void
  hwmon: max31722: Warn about failure to put device in stand-by in
    .remove()
  input: adxl34xx: Make adxl34x_remove() return void
  input: touchscreen: tsc200x: Make tsc200x_remove() return void
  media: cxd2880: Eliminate dead code
  mfd: mc13xxx: Make mc13xxx_common_exit() return void
  mfd: stmpe: Make stmpe_remove() return void
  mfd: tps65912: Make tps65912_device_exit() return void
  serial: max310x: Make max310x_remove() return void
  serial: sc16is7xx: Make sc16is7xx_remove() return void
  staging: fbtft: Make fbtft_remove_common() return void
  tpm: st33zp24: Make st33zp24_remove() return void

 drivers/char/tpm/st33zp24/i2c.c                   |  5 +----
 drivers/char/tpm/st33zp24/spi.c                   |  5 +----
 drivers/char/tpm/st33zp24/st33zp24.c              |  3 +--
 drivers/char/tpm/st33zp24/st33zp24.h              |  2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c |  3 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c |  3 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c     |  4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h     |  2 +-
 drivers/hwmon/adt7310.c                           |  3 ++-
 drivers/hwmon/adt7410.c                           |  3 ++-
 drivers/hwmon/adt7x10.c                           |  3 +--
 drivers/hwmon/adt7x10.h                           |  2 +-
 drivers/hwmon/max31722.c                          |  8 +++++++-
 drivers/input/misc/adxl34x-i2c.c                  |  4 +++-
 drivers/input/misc/adxl34x-spi.c                  |  4 +++-
 drivers/input/misc/adxl34x.c                      |  4 +---
 drivers/input/misc/adxl34x.h                      |  2 +-
 drivers/input/touchscreen/tsc2004.c               |  4 +++-
 drivers/input/touchscreen/tsc2005.c               |  4 +++-
 drivers/input/touchscreen/tsc200x-core.c          |  4 +---
 drivers/input/touchscreen/tsc200x-core.h          |  2 +-
 drivers/media/spi/cxd2880-spi.c                   | 13 +------------
 drivers/mfd/mc13xxx-core.c                        |  4 +---
 drivers/mfd/mc13xxx-i2c.c                         |  3 ++-
 drivers/mfd/mc13xxx-spi.c                         |  3 ++-
 drivers/mfd/mc13xxx.h                             |  2 +-
 drivers/mfd/stmpe-i2c.c                           |  4 +++-
 drivers/mfd/stmpe-spi.c                           |  4 +++-
 drivers/mfd/stmpe.c                               |  4 +---
 drivers/mfd/stmpe.h                               |  2 +-
 drivers/mfd/tps65912-core.c                       |  4 +---
 drivers/mfd/tps65912-i2c.c                        |  4 +++-
 drivers/mfd/tps65912-spi.c                        |  4 +++-
 drivers/staging/fbtft/fbtft-core.c                |  8 +-------
 drivers/staging/fbtft/fbtft.h                     |  6 ++++--
 drivers/tty/serial/max310x.c                      |  7 +++----
 drivers/tty/serial/sc16is7xx.c                    | 10 +++++++---
 include/linux/mfd/tps65912.h                      |  2 +-
 38 files changed, 77 insertions(+), 81 deletions(-)


base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
-- 
2.30.2


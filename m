Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BE542CB0B
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 22:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhJMUeu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 16:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhJMUes (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 16:34:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7DAC06174E
        for <linux-i2c@vger.kernel.org>; Wed, 13 Oct 2021 13:32:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvR-0007EZ-Rj; Wed, 13 Oct 2021 22:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvP-0005mM-Lj; Wed, 13 Oct 2021 22:32:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1makvP-0000PF-KZ; Wed, 13 Oct 2021 22:32:31 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dan Robertson <dan@dlrobertson.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 00/15] iio: let spi drivers return 0 in .remove()
Date:   Wed, 13 Oct 2021 22:32:08 +0200
Message-Id: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
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

this series is part of my quest to change the return type of the spi
driver .remove() callback to void. In this first stage I fix all drivers
to return 0 to be able to mechanically change all drivers in the final
step.

Returning an error code (which actually very few drivers do) doesn't
make much sense, because the only effect is that the spi core emits an
error message.

The same holds try for i2c drivers, some of them are fixed en passant.

There are no interdependencies in this series, and there is some more
work to do for the final conversion, so apply the patches from this
series at will :-)

Best regards
Uwe

Uwe Kleine-König (15):
  iio: accel: bma400: Make bma400_remove() return void
  iio: accel: bmc150: Make bmc150_accel_core_remove() return void
  iio: accel: bmi088: Make bmi088_accel_core_remove() return void
  iio: accel: kxsd9: Make kxsd9_common_remove() return void
  iio: accel: mma7455: Make mma7455_core_remove() return void
  iio: accel: ad5064: Make ad5064_core_remove() return void
  iio: dac: ad5380: Make ad5380_remove() return void
  iio: dac: ad5446: Make ad5446_remove() return void
  iio: dac: ad5592r: Make ad5592r_remove() return void
  iio: dac: ad5686: Make ad5686_remove() return void
  iio: health: afe4403: Don't return an error in .remove()
  iio: imu: st_lsm9ds0: Make st_lsm9ds0_remove() return void
  iio: magn: hmc5843: Make hmc5843_common_remove() return void
  iio: potentiometer: max5487: Don't return an error in .remove()
  iio: pressure: ms5611: Make ms5611_remove() return void

 drivers/iio/accel/bma400.h                   |  2 +-
 drivers/iio/accel/bma400_core.c              |  7 ++++---
 drivers/iio/accel/bma400_i2c.c               |  4 +++-
 drivers/iio/accel/bma400_spi.c               |  4 +++-
 drivers/iio/accel/bmc150-accel-core.c        |  4 +---
 drivers/iio/accel/bmc150-accel-i2c.c         |  4 +++-
 drivers/iio/accel/bmc150-accel-spi.c         |  4 +++-
 drivers/iio/accel/bmc150-accel.h             |  2 +-
 drivers/iio/accel/bmi088-accel-core.c        |  4 +---
 drivers/iio/accel/bmi088-accel-spi.c         |  4 +++-
 drivers/iio/accel/bmi088-accel.h             |  2 +-
 drivers/iio/accel/kxsd9-i2c.c                |  4 +++-
 drivers/iio/accel/kxsd9-spi.c                |  4 +++-
 drivers/iio/accel/kxsd9.c                    |  4 +---
 drivers/iio/accel/kxsd9.h                    |  2 +-
 drivers/iio/accel/mma7455.h                  |  2 +-
 drivers/iio/accel/mma7455_core.c             |  4 +---
 drivers/iio/accel/mma7455_i2c.c              |  4 +++-
 drivers/iio/accel/mma7455_spi.c              |  4 +++-
 drivers/iio/dac/ad5064.c                     | 12 +++++++-----
 drivers/iio/dac/ad5380.c                     | 15 ++++++++-------
 drivers/iio/dac/ad5446.c                     | 12 +++++++-----
 drivers/iio/dac/ad5592r-base.c               |  4 +---
 drivers/iio/dac/ad5592r-base.h               |  2 +-
 drivers/iio/dac/ad5592r.c                    |  4 +++-
 drivers/iio/dac/ad5593r.c                    |  4 +++-
 drivers/iio/dac/ad5686-spi.c                 |  4 +++-
 drivers/iio/dac/ad5686.c                     |  4 +---
 drivers/iio/dac/ad5686.h                     |  2 +-
 drivers/iio/dac/ad5696-i2c.c                 |  4 +++-
 drivers/iio/health/afe4403.c                 |  6 ++----
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h      |  2 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c |  4 +---
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c  |  4 +++-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c  |  4 +++-
 drivers/iio/magnetometer/hmc5843.h           |  2 +-
 drivers/iio/magnetometer/hmc5843_core.c      |  4 +---
 drivers/iio/magnetometer/hmc5843_i2c.c       |  4 +++-
 drivers/iio/magnetometer/hmc5843_spi.c       |  4 +++-
 drivers/iio/potentiometer/max5487.c          |  7 ++++++-
 drivers/iio/pressure/ms5611.h                |  2 +-
 drivers/iio/pressure/ms5611_core.c           |  4 +---
 drivers/iio/pressure/ms5611_i2c.c            |  4 +++-
 drivers/iio/pressure/ms5611_spi.c            |  4 +++-
 44 files changed, 110 insertions(+), 81 deletions(-)


base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
-- 
2.30.2


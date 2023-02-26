Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63EDB6A34B2
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjBZW2R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjBZW2Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:28:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887541817E
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:46 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPU0-0000v4-Cx; Sun, 26 Feb 2023 23:27:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTv-000UbL-A7; Sun, 26 Feb 2023 23:26:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTu-000YPc-Ii; Sun, 26 Feb 2023 23:26:58 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
        Crt Mori <cmo@melexis.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean Delvare <jdelvare@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 0/9] i2c: Switch .probe() to not take an id parameter
Date:   Sun, 26 Feb 2023 23:26:45 +0100
Message-Id: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EenKKdT6RETFmVGwF2CrYShLqN5ZYnH65OR4Oth2DhU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yIsuD2BffFtVmTLqMLW9+LGg9CrL1S9JEyp A8isju5DgGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vciAAKCRDB/BR4rcrs CVArCACf5Exs+Q2fpw9bhFprBhf8Jn0zdE1HAJWqKw9geHnrqn2c77H0nb4l6za7xknleFOdFjl vT1oJ/Hil7ZZHfjj0Q02CEsZqvCUoh/T4UAse77L1aYyUPrZ0RZsOyTquharTxDIKLoriggp8O7 oibgm8zSD2bY1eFXyPkExlGm+6FBBRW8p3Smjl0DhgJHra46+W71KaqBmYkG1IBl5lrINIPfwRv 3ktxNmDCAgv/OMRMRji9mRAtfbTNBB8fvk22YGZXKc7/Ja9bBtoyWYo0UPM2LwcfDAfOnqJXu0d 8S7iE11b92EW7g3eeBkHU339ye95YJ2KDZ7wmHd7p+WkiVWd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

this is v2 of the series. I send it a bit earlier than I planned to do that
initially because I failed to send v1 completely to the linux-i2c list.

Changes since (implicit) v1:
 - Added Acks for patches #5, #6 and #8
 - Fixed kernel doc as pointed out by Luca Ceresoli (patch #7)
 - Send all patches to linux-i2c mailing list
 - Rebased to current Linus' tree.
   This reduces the list of prerequisite patches to two.

I updated

	https://git.pengutronix.de/git/ukl/linux i2c-probe-new

accordingly.

Best regards
Uwe

Uwe Kleine-König (9):
  misc: ad525x_dpot-i2c: Convert to i2c's .probe_new()
  mtd: maps: pismo: Convert to i2c's .probe_new()
  serial: sc16is7xx: Convert to i2c's .probe_new()
  w1: ds2482: Convert to i2c's .probe_new()
  media: i2c: ov5695: convert to i2c's .probe_new()
  media: i2c: ov2685: convert to i2c's .probe_new()
  i2c: Switch .probe() to not take an id parameter
  i2c: mux: Convert all drivers to new .probe() callback
  i2c: Convert drivers to new .probe() callback

 drivers/i2c/i2c-core-base.c         | 13 +++----------
 drivers/i2c/i2c-slave-eeprom.c      |  2 +-
 drivers/i2c/i2c-slave-testunit.c    |  2 +-
 drivers/i2c/i2c-smbus.c             |  2 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c |  2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c |  2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c |  2 +-
 drivers/media/i2c/ov2685.c          |  5 ++---
 drivers/media/i2c/ov5695.c          |  5 ++---
 drivers/misc/ad525x_dpot-i2c.c      |  6 +++---
 drivers/mtd/maps/pismo.c            |  5 ++---
 drivers/tty/serial/sc16is7xx.c      |  6 +++---
 drivers/w1/masters/ds2482.c         |  5 ++---
 include/linux/i2c.h                 | 18 +++++++++++-------
 14 files changed, 34 insertions(+), 41 deletions(-)


base-commit: f3a2439f20d918930cc4ae8f76fe1c1afd26958f
prerequisite-patch-id: 256857b4eee79540b271b8d4899b9ba0aa3c4c27
prerequisite-patch-id: bb49c9c71311ac1f1056c562f20f26aa356c95a6
-- 
2.39.1


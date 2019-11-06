Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD489F20B5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 22:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbfKFVVX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 16:21:23 -0500
Received: from sauhun.de ([88.99.104.3]:58966 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727921AbfKFVVX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 16:21:23 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 732742C053B;
        Wed,  6 Nov 2019 22:21:20 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/17] media: use new API for creating client devices
Date:   Wed,  6 Nov 2019 22:21:00 +0100
Message-Id: <20191106212120.27983-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

These media drivers create a new I2C client device with the deprecated
i2c_new_device() and check afterwards if the client exists and if a
driver is bound to it.

These series changes the drivers to use the now suggested
i2c_new_client_device() call and introduces a helper to check if the
driver is bound. This helper supports (for now) the old and the new API
and is also more readable.

The drivers were converted with the following coccinelle script:

@@
expression client;
statement S;
@@
	client =
-		i2c_new_device
+		i2c_new_client_device
			(...);
	... when != client
	if (
-		\( !client \| client == NULL \) || \( !client->dev.driver \| client->dev.driver == NULL \)
+		!i2c_client_has_driver(client)
			) {
			S
		}

The helper has been tested on a Renesas Salvator-XS board (R-Car M3-N).
The rest was build tested by me. buildbot has this still queued.

Although the first patch is in the I2C realm, I suggest that all patches
go through the media tree to avoid the dependency. There are no merge
conflicts with I2C currently and I don't see any coming (famous last
words).

This series is based on linux-next as of today. It does not depend on
the i2c_new_probed_device() conversion I sent out earlier today. This
series can be applied as is.

Looking forward to comments.

Thanks and happy hacking,

   Wolfram


Wolfram Sang (17):
  i2c: add helper to check if a client has a driver attached
  media: dvb-core: dvbdev: convert to use i2c_new_client_device()
  media: dvb-frontends: cxd2820r_core: convert to use
    i2c_new_client_device()
  media: dvb-frontends: lgdt330x: convert to use i2c_new_client_device()
  media: dvb-frontends: m88ds3103: convert to use
    i2c_new_client_device()
  media: dvb-frontends: ts2020: convert to use i2c_new_client_device()
  media: pci: cx23885: cx23885-dvb: convert to use
    i2c_new_client_device()
  media: pci: saa7164: saa7164-dvb: convert to use
    i2c_new_client_device()
  media: pci: smipcie: smipcie-main: convert to use
    i2c_new_client_device()
  media: platform: sti: c8sectpfe: c8sectpfe-dvb: convert to use
    i2c_new_client_device()
  media: usb: dvb-usb-v2: af9035: convert to use i2c_new_client_device()
  media: usb: dvb-usb-v2: anysee: convert to use i2c_new_client_device()
  media: usb: dvb-usb-v2: rtl28xxu: convert to use
    i2c_new_client_device()
  media: usb: dvb-usb-v2: zd1301: convert to use i2c_new_client_device()
  media: usb: dvb-usb: dib0700_devices: convert to use
    i2c_new_client_device()
  media: usb: dvb-usb: dw2102: convert to use i2c_new_client_device()
  media: v4l2-core: v4l2-i2c: convert to use i2c_new_client_device()

 drivers/media/dvb-core/dvbdev.c               |   4 +-
 drivers/media/dvb-frontends/cxd2820r_core.c   |   4 +-
 drivers/media/dvb-frontends/lgdt330x.c        |   4 +-
 drivers/media/dvb-frontends/m88ds3103.c       |   4 +-
 drivers/media/dvb-frontends/ts2020.c          |   4 +-
 drivers/media/pci/cx23885/cx23885-dvb.c       | 114 +++++++++---------
 drivers/media/pci/saa7164/saa7164-dvb.c       |  20 +--
 drivers/media/pci/smipcie/smipcie-main.c      |   4 +-
 .../platform/sti/c8sectpfe/c8sectpfe-dvb.c    |   4 +-
 drivers/media/usb/dvb-usb-v2/af9035.c         |   4 +-
 drivers/media/usb/dvb-usb-v2/anysee.c         |   4 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c       |  36 +++---
 drivers/media/usb/dvb-usb-v2/zd1301.c         |   4 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c   |   8 +-
 drivers/media/usb/dvb-usb/dw2102.c            |   8 +-
 drivers/media/v4l2-core/v4l2-i2c.c            |   2 +-
 include/linux/i2c.h                           |   5 +
 17 files changed, 116 insertions(+), 117 deletions(-)

-- 
2.20.1


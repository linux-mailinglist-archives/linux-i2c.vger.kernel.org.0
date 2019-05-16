Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9255720FE5
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 23:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfEPVNV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 17:13:21 -0400
Received: from sauhun.de ([88.99.104.3]:45586 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbfEPVNV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 May 2019 17:13:21 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id E94B42C04C2;
        Thu, 16 May 2019 23:13:18 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 0/3] i2c: improve i2c_new_{device|dummy}
Date:   Thu, 16 May 2019 23:13:07 +0200
Message-Id: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hiya,

so, here is a new version as a result of the discussion.

Changes since V7:

* dropped the 'errptr' suffix and renamed the functions to
  'i2c_new_client_device' and 'i2c_new_dummy_device'

* add EXPORT_SYMBOL_GPL to these new functions

I decided to convert the users of i2c_new_device and i2c_new_dummy to
the new functions after these functions are available. So, we can get
rid of the old functions somewhen. To speed this up, I'd like to send
them this merge window to Linus. Yeah, this is short notice, but I
simply couldn't work earlier on this because of my illness. So, if you
can support me with immediate (but still thorough!) reviews, that would
be much appreciated. If we can get it upstream this cycle, then I can
already start fixing the users.

Patch 3 is only for demonstration purposes, of course. I will send it to
the MFD list once the dependencies are upstream.

Tested on a Renesas Lager board (R-Car Gen2).

Looking forward to comments,

   Wolfram


Heiner Kallweit (2):
  i2c: core: improve return value handling of i2c_new_device and
    i2c_new_dummy
  i2c: core: add device-managed version of i2c_new_dummy

Wolfram Sang (1):
  mfd: da9063: occupy second I2C address, too

 Documentation/driver-model/devres.txt |   3 +
 drivers/i2c/i2c-core-base.c           | 118 +++++++++++++++++++++++---
 drivers/mfd/da9063-i2c.c              |   2 +
 include/linux/i2c.h                   |   3 +
 4 files changed, 113 insertions(+), 13 deletions(-)

-- 
2.19.1


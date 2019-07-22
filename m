Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA497706CB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731444AbfGVR00 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:26 -0400
Received: from sauhun.de ([88.99.104.3]:42308 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731425AbfGVR00 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:26 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 205654A149A;
        Mon, 22 Jul 2019 19:26:24 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 00/14] mfd: convert subsystem to i2c_new_dummy_device()
Date:   Mon, 22 Jul 2019 19:26:07 +0200
Message-Id: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series is part of a tree-wide movement to replace the I2C API call
'i2c_new_dummy' which returns NULL with its new counterpart returning an
ERRPTR.

The series was generated with coccinelle (audited afterwards, of course) and
build tested by me and by buildbot. No tests on HW have been performed.

The branch is based on v5.3-rc1. A branch (with some more stuff included) can
be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_dummy

Some drivers still need to be manually converted. Patches for those will be
sent out individually.


Wolfram Sang (14):
  mfd: 88pm800: convert to i2c_new_dummy_device
  mfd: 88pm860x-core: convert to i2c_new_dummy_device
  mfd: ab3100-core: convert to i2c_new_dummy_device
  mfd: bcm590xx: convert to i2c_new_dummy_device
  mfd: da9150-core: convert to i2c_new_dummy_device
  mfd: max14577: convert to i2c_new_dummy_device
  mfd: max77693: convert to i2c_new_dummy_device
  mfd: max77843: convert to i2c_new_dummy_device
  mfd: max8907: convert to i2c_new_dummy_device
  mfd: max8925-i2c: convert to i2c_new_dummy_device
  mfd: max8997: convert to i2c_new_dummy_device
  mfd: max8998: convert to i2c_new_dummy_device
  mfd: palmas: convert to i2c_new_dummy_device
  mfd: twl-core: convert to i2c_new_dummy_device

 drivers/mfd/88pm800.c       | 12 ++++++------
 drivers/mfd/88pm860x-core.c |  6 +++---
 drivers/mfd/ab3100-core.c   |  6 +++---
 drivers/mfd/bcm590xx.c      |  6 +++---
 drivers/mfd/da9150-core.c   |  6 +++---
 drivers/mfd/max14577.c      |  6 +++---
 drivers/mfd/max77693.c      | 12 ++++++------
 drivers/mfd/max77843.c      |  6 +++---
 drivers/mfd/max8907.c       |  6 +++---
 drivers/mfd/max8925-i2c.c   | 12 ++++++------
 drivers/mfd/max8997.c       | 18 +++++++++---------
 drivers/mfd/max8998.c       |  6 +++---
 drivers/mfd/palmas.c        |  6 +++---
 drivers/mfd/twl-core.c      |  6 +++---
 14 files changed, 57 insertions(+), 57 deletions(-)

-- 
2.20.1


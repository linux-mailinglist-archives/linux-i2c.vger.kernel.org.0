Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE62158159
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 18:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgBJR3b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 12:29:31 -0500
Received: from sauhun.de ([88.99.104.3]:43976 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbgBJR3b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 12:29:31 -0500
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id 6FAB62C07F3;
        Mon, 10 Feb 2020 18:29:29 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 0/3] i2c: updates to SMBus alert setup
Date:   Mon, 10 Feb 2020 18:29:24 +0100
Message-Id: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The main motivation for this series is to convert
i2c_setup_smbus_alert() to a function which returns an ERRPTR instead of
NULL. Because there are only a few driver using this function they are
all converted in one go (patch 1). The function is also renamed to make
sure out-of-tree users will note they have to update (or better
upstream). Patch 2 renames the of-equivalent, too, so both functions
keep in sync. Patch 3 cleans up some outdated documentation which was
discovered while working on the earlier patches.

Patches are on top of v5.6-rc1 and can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_client_device

Only build tested. Testing and reviews from people actually using SMBus
alert would be much appreciated!

Thanks,

   Wolfram


Wolfram Sang (3):
  i2c: convert SMBus alert setup function to return an ERRPTR
  i2c: rename of_i2c_setup_smbus_alert() to keep in sync
  i2c: smbus: remove outdated references to irq level triggers

 Documentation/i2c/smbus-protocol.rst     |  2 +-
 drivers/i2c/busses/i2c-parport.c         | 11 ++++++---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 11 ++++++---
 drivers/i2c/busses/i2c-xlp9xx.c          | 10 +++++---
 drivers/i2c/i2c-core-base.c              |  2 +-
 drivers/i2c/i2c-core-smbus.c             | 31 ++++++++++--------------
 drivers/i2c/i2c-smbus.c                  |  2 +-
 include/linux/i2c-smbus.h                | 11 +++------
 8 files changed, 41 insertions(+), 39 deletions(-)

-- 
2.20.1


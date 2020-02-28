Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 312FF173E08
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2020 18:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgB1RMc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Feb 2020 12:12:32 -0500
Received: from sauhun.de ([88.99.104.3]:60020 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgB1RMc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Feb 2020 12:12:32 -0500
Received: from localhost (p54B3301B.dip0.t-ipconnect.de [84.179.48.27])
        by pokefinder.org (Postfix) with ESMTPSA id 07E9B2C1E8B;
        Fri, 28 Feb 2020 18:12:30 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Robert Richter <rrichter@marvell.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] i2c: updates to SMBus alert setup
Date:   Fri, 28 Feb 2020 18:12:19 +0100
Message-Id: <20200228171221.5412-1-wsa+renesas@sang-engineering.com>
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
upstream). Patch 2 cleans up some outdated documentation which was
discovered while working on the earlier patches.

Changes since V1:
- used PTR_ERR_OR_ZERO in one place (thanks buildbot)
- better name of the new function (thanks Jean, Robert, and Luca for the
  discussion)
- one patch dropped from the old series, no need anymore to keep the
  function names in sync

Patches are on top of v5.6-rc3 and can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_client_device

Only build tested. Testing and reviews from people actually using SMBus
alert would be much appreciated!

Thanks,

   Wolfram


Wolfram Sang (2):
  i2c: convert SMBus alert setup function to return an ERRPTR
  i2c: smbus: remove outdated references to irq level triggers

 Documentation/i2c/smbus-protocol.rst     |  2 +-
 drivers/i2c/busses/i2c-parport.c         | 12 +++++++----
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 11 +++++++---
 drivers/i2c/busses/i2c-xlp9xx.c          | 10 ++++++---
 drivers/i2c/i2c-core-smbus.c             | 26 ++++++++----------------
 drivers/i2c/i2c-smbus.c                  |  2 +-
 include/linux/i2c-smbus.h                |  9 ++------
 7 files changed, 35 insertions(+), 37 deletions(-)

-- 
2.20.1


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 586A7139B18
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 22:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgAMVGx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 16:06:53 -0500
Received: from sauhun.de ([88.99.104.3]:42028 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbgAMVGx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 16:06:53 -0500
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
        by pokefinder.org (Postfix) with ESMTPSA id C7EAA2C06DA;
        Mon, 13 Jan 2020 22:06:50 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] i2c: for next API conversion, remove parport-light driver
Date:   Mon, 13 Jan 2020 22:06:40 +0100
Message-Id: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When checking how to convert i2c_setup_smbus_alert() to return ERRPTRs,
I decided it makes more sense to remove the parport-light driver than to
convert it. The justifications for its existance do not hold anymore
IMO. People can/should switch to the parport driver if needed.

And this led to some other minor updates to the parport driver. Only
build tested.

Opinions?

Wolfram Sang (3):
  i2c: parport-light: remove driver
  i2c: parport: simplify Kconfig description
  i2c: parport: move include file into main source

 .../i2c/busses/i2c-parport-light.rst          |  24 --
 Documentation/i2c/busses/index.rst            |   1 -
 MAINTAINERS                                   |   2 -
 drivers/i2c/busses/Kconfig                    |  38 +--
 drivers/i2c/busses/Makefile                   |   1 -
 drivers/i2c/busses/i2c-parport-light.c        | 267 ------------------
 drivers/i2c/busses/i2c-parport.c              | 100 ++++++-
 drivers/i2c/busses/i2c-parport.h              | 106 -------
 8 files changed, 101 insertions(+), 438 deletions(-)
 delete mode 100644 Documentation/i2c/busses/i2c-parport-light.rst
 delete mode 100644 drivers/i2c/busses/i2c-parport-light.c
 delete mode 100644 drivers/i2c/busses/i2c-parport.h

-- 
2.20.1


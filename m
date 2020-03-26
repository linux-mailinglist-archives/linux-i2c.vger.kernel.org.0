Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78759194A41
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgCZVJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:09:51 -0400
Received: from sauhun.de ([88.99.104.3]:54266 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgCZVJv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:09:51 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 3C38E2C1F84;
        Thu, 26 Mar 2020 22:09:48 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/6] media: convert to use new I2C API
Date:   Thu, 26 Mar 2020 22:09:40 +0100
Message-Id: <20200326210947.12747-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We are deprecating calls which return NULL in favor of new variants which
return an ERR_PTR. Only build tested.


Wolfram Sang (6):
  media: pci: cx88: convert to use i2c_new_client_device()
  media: pci: saa7134: convert to use i2c_new_client_device()
  media: marvell-ccic: convert to use i2c_new_client_device()
  media: usb: cx231xx: convert to use i2c_new_client_device()
  media: usb: hdpvr: convert to use i2c_new_client_device()
  media: usb: pvrusb2: convert to use i2c_new_client_device()

 drivers/media/pci/cx88/cx88-core.c                | 3 +--
 drivers/media/pci/cx88/cx88-input.c               | 2 +-
 drivers/media/pci/cx88/cx88-video.c               | 2 +-
 drivers/media/pci/saa7134/saa7134-input.c         | 2 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c | 2 +-
 drivers/media/usb/cx231xx/cx231xx-input.c         | 5 ++---
 drivers/media/usb/hdpvr/hdpvr-core.c              | 4 ++--
 drivers/media/usb/hdpvr/hdpvr-i2c.c               | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c      | 4 ++--
 9 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.20.1


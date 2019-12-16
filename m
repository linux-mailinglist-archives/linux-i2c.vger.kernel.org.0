Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 362771205C4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 13:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbfLPMac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 07:30:32 -0500
Received: from sauhun.de ([88.99.104.3]:39770 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727634AbfLPM3s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Dec 2019 07:29:48 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id 6D1362C2D79;
        Mon, 16 Dec 2019 13:29:46 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/5] media: replace i2c_new_probed_device with an ERR_PTR variant
Date:   Mon, 16 Dec 2019 13:29:40 +0100
Message-Id: <20191216122946.3495-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the on-going mission to let i2c_new_* calls return an ERR_PTR instead of
NULL, here is a series for this subsystem converting i2c_new_probed_device() to
the newly introduced i2c_new_scanned_device(). Based on v5.5-rc1 and build tested.
Please apply via your tree.

Thanks,

   Wolfram

Changes since RFC:
* changed commit message of cx88 patch to match the change
  (Thanks Hans!)
* added acks (Thanks Hans and Sean!)
* rebased to v5.5-rc1

Wolfram Sang (5):
  media: pci: cx23885: convert to i2c_new_scanned_device
  media: pci: cx88: convert to i2c_new_scanned_device
  media: pci: bt8xx: convert to i2c_new_scanned_device
  media: pci: cx18: convert to i2c_new_scanned_device
  media: pci: ivtv: convert to i2c_new_scanned_device

 drivers/media/pci/bt8xx/bttv-input.c    | 6 +++---
 drivers/media/pci/cx18/cx18-i2c.c       | 2 +-
 drivers/media/pci/cx23885/cx23885-i2c.c | 4 ++--
 drivers/media/pci/cx88/cx88-input.c     | 2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c       | 6 +++---
 drivers/media/pci/ivtv/ivtv-i2c.h       | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.20.1


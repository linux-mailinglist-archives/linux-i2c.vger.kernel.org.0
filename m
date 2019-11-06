Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A58F12E5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 10:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730886AbfKFJvW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 04:51:22 -0500
Received: from sauhun.de ([88.99.104.3]:50146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbfKFJug (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 04:50:36 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 65D0A2C053B;
        Wed,  6 Nov 2019 10:50:33 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 00/12] i2c: replace i2c_new_probed_device with an ERR_PTR variant
Date:   Wed,  6 Nov 2019 10:50:18 +0100
Message-Id: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Wolfram Sang <wsa@the-dreams.de>

In the on-going mission to let i2c_new_* calls return an ERR_PTR instead
of NULL, here is a series converting i2c_new_probed_device(). A new
function called i2c_new_scanned_device() is introduced with the new
retval, but for now, a compatibility helper is provided until all users
are converted. The rest of the patches convert all current in-tree
users.

Note that these patches are RFC because I want feedback on the approach
and hopefully collect acks on the driver conversions. If all goes well,
I'll apply the first two patches for the next merge window. Then, once
this dependency is upstream, I'll resend this series with all issues
fixed and acks collected.

Core changes tested on a Renesas Salvator-XS board (R-Car M3-N), driver
patches build tested by me and buildbot.

Wolfram Sang (12):
  i2c: replace i2c_new_probed_device with an ERR_PTR variant
  i2c: icy: convert to i2c_new_scanned_device
  macintosh: convert to i2c_new_scanned_device
  platform: chrome: convert to i2c_new_scanned_device
  video: fbdev: matrox: convert to i2c_new_scanned_device
  input: mouse: convert to i2c_new_scanned_device
  media: pci: cx23885: convert to i2c_new_scanned_device
  media: pci: cx88: convert to i2c_new_scanned_device
  media: pci: bt8xx: convert to i2c_new_scanned_device
  media: pci: cx18: convert to i2c_new_scanned_device
  media: pci: ivtv: convert to i2c_new_scanned_device
  media: v4l2-core: convert to i2c_new_scanned_device

 Documentation/i2c/instantiating-devices.rst | 10 ++++-----
 Documentation/i2c/writing-clients.rst       |  8 +++----
 drivers/i2c/busses/i2c-icy.c                |  8 +++----
 drivers/i2c/i2c-core-base.c                 | 25 ++++++++++++++++-----
 drivers/input/mouse/psmouse-smbus.c         |  8 ++++---
 drivers/macintosh/therm_windtunnel.c        |  4 ++--
 drivers/media/pci/bt8xx/bttv-input.c        |  6 ++---
 drivers/media/pci/cx18/cx18-i2c.c           |  2 +-
 drivers/media/pci/cx23885/cx23885-i2c.c     |  4 ++--
 drivers/media/pci/cx88/cx88-input.c         |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c           |  6 ++---
 drivers/media/pci/ivtv/ivtv-i2c.h           |  2 +-
 drivers/media/v4l2-core/v4l2-i2c.c          | 10 ++++-----
 drivers/platform/chrome/chromeos_laptop.c   | 18 ++++++++-------
 drivers/video/fbdev/matrox/i2c-matroxfb.c   |  4 ++--
 include/linux/i2c.h                         | 12 +++++++---
 16 files changed, 76 insertions(+), 53 deletions(-)

-- 
2.20.1


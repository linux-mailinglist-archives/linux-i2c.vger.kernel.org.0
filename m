Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D71FD132D79
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgAGRsd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:48:33 -0500
Received: from sauhun.de ([88.99.104.3]:53350 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728588AbgAGRsX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 12:48:23 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id 458E22C3955;
        Tue,  7 Jan 2020 18:48:22 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] docs: i2c: use the new API in 'writing-clients'
Date:   Tue,  7 Jan 2020 18:47:46 +0100
Message-Id: <20200107174748.9616-13-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_new_device is deprecated, use i2c_new_client_device. Also, align a
paragraph while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/writing-clients.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index ced309b5e0cc..0336909ca01b 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -175,8 +175,8 @@ Device Creation
 If you know for a fact that an I2C device is connected to a given I2C bus,
 you can instantiate that device by simply filling an i2c_board_info
 structure with the device address and driver name, and calling
-i2c_new_device().  This will create the device, then the driver core will
-take care of finding the right driver and will call its probe() method.
+i2c_new_client_device().  This will create the device, then the driver core
+will take care of finding the right driver and will call its probe() method.
 If a driver supports different device types, you can specify the type you
 want using the type field.  You can also specify an IRQ and platform data
 if needed.
@@ -186,14 +186,14 @@ don't know the exact address it uses.  This happens on TV adapters for
 example, where the same driver supports dozens of slightly different
 models, and I2C device addresses change from one model to the next.  In
 that case, you can use the i2c_new_scanned_device() variant, which is
-similar to i2c_new_device(), except that it takes an additional list of
-possible I2C addresses to probe.  A device is created for the first
+similar to i2c_new_client_device(), except that it takes an additional list
+of possible I2C addresses to probe.  A device is created for the first
 responsive address in the list.  If you expect more than one device to be
 present in the address range, simply call i2c_new_scanned_device() that
 many times.
 
-The call to i2c_new_device() or i2c_new_scanned_device() typically happens
-in the I2C bus driver. You may want to save the returned i2c_client
+The call to i2c_new_client_device() or i2c_new_scanned_device() typically
+happens in the I2C bus driver. You may want to save the returned i2c_client
 reference for later use.
 
 
@@ -236,11 +236,11 @@ possible.
 Device Deletion
 ---------------
 
-Each I2C device which has been created using i2c_new_device() or
-i2c_new_scanned_device() can be unregistered by calling
+Each I2C device which has been created using i2c_new_client_device()
+or i2c_new_scanned_device() can be unregistered by calling
 i2c_unregister_device().  If you don't call it explicitly, it will be
-called automatically before the underlying I2C bus itself is removed, as a
-device can't survive its parent in the device driver model.
+called automatically before the underlying I2C bus itself is removed,
+as a device can't survive its parent in the device driver model.
 
 
 Initializing the driver
-- 
2.20.1


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEE1E132D75
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgAGRsY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:48:24 -0500
Received: from sauhun.de ([88.99.104.3]:53374 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728553AbgAGRsX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 12:48:23 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id A6D5A2C3949;
        Tue,  7 Jan 2020 18:48:21 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] docs: i2c: use the new API in 'instantiating-devices.rst'
Date:   Tue,  7 Jan 2020 18:47:45 +0100
Message-Id: <20200107174748.9616-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_new_device is deprecated, use i2c_new_client_device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/instantiating-devices.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
index 875ebe9e78e3..b7b90b1b82f9 100644
--- a/Documentation/i2c/instantiating-devices.rst
+++ b/Documentation/i2c/instantiating-devices.rst
@@ -98,7 +98,7 @@ tuner, a video decoder, an audio decoder, etc. usually connected to the
 main chip by the means of an I2C bus. You won't know the number of the I2C
 bus in advance, so the method 1 described above can't be used. Instead,
 you can instantiate your I2C devices explicitly. This is done by filling
-a struct i2c_board_info and calling i2c_new_device().
+a struct i2c_board_info and calling i2c_new_client_device().
 
 Example (from the sfe4001 network driver)::
 
@@ -110,7 +110,7 @@ Example (from the sfe4001 network driver)::
   {
 	(...)
 	efx->board_info.hwmon_client =
-		i2c_new_device(&efx->i2c_adap, &sfe4001_hwmon_info);
+		i2c_new_client_device(&efx->i2c_adap, &sfe4001_hwmon_info);
 
 	(...)
   }
@@ -123,7 +123,7 @@ present or not (for example for an optional feature which is not present
 on cheap variants of a board but you have no way to tell them apart), or
 it may have different addresses from one board to the next (manufacturer
 changing its design without notice). In this case, you can call
-i2c_new_scanned_device() instead of i2c_new_device().
+i2c_new_scanned_device() instead of i2c_new_client_device().
 
 Example (from the nxp OHCI driver)::
 
@@ -152,7 +152,7 @@ simply gives up.
 
 The driver which instantiated the I2C device is responsible for destroying
 it on cleanup. This is done by calling i2c_unregister_device() on the
-pointer that was earlier returned by i2c_new_device() or
+pointer that was earlier returned by i2c_new_client_device() or
 i2c_new_scanned_device().
 
 
-- 
2.20.1


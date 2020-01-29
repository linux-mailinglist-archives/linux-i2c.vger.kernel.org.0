Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72AE514CE55
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 17:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgA2QX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 11:23:29 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39308 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727176AbgA2QWy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jan 2020 11:22:54 -0500
Received: from [109.168.11.45] (port=34038 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iwq7A-005NDl-2o; Wed, 29 Jan 2020 17:22:52 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/28] docs: i2c: instantiating-devices: use monospace for sysfs attributes
Date:   Wed, 29 Jan 2020 16:19:47 +0100
Message-Id: <20200129151953.31582-23-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129151953.31582-1-luca@lucaceresoli.net>
References: <20200129151953.31582-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Use a monospace (literal) formatting for better readability of sysfs
attributes.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - reword commit message to not mention filenames
---
 Documentation/i2c/instantiating-devices.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
index 665bf00792ba..e558e0a77e0c 100644
--- a/Documentation/i2c/instantiating-devices.rst
+++ b/Documentation/i2c/instantiating-devices.rst
@@ -225,15 +225,15 @@ In general, the kernel should know which I2C devices are connected and
 what addresses they live at. However, in certain cases, it does not, so a
 sysfs interface was added to let the user provide the information. This
 interface is made of 2 attribute files which are created in every I2C bus
-directory: new_device and delete_device. Both files are write only and you
-must write the right parameters to them in order to properly instantiate,
-respectively delete, an I2C device.
+directory: ``new_device`` and ``delete_device``. Both files are write
+only and you must write the right parameters to them in order to properly
+instantiate, respectively delete, an I2C device.
 
-File new_device takes 2 parameters: the name of the I2C device (a string)
-and the address of the I2C device (a number, typically expressed in
-hexadecimal starting with 0x, but can also be expressed in decimal.)
+File ``new_device`` takes 2 parameters: the name of the I2C device (a
+string) and the address of the I2C device (a number, typically expressed
+in hexadecimal starting with 0x, but can also be expressed in decimal.)
 
-File delete_device takes a single parameter: the address of the I2C
+File ``delete_device`` takes a single parameter: the address of the I2C
 device. As no two devices can live at the same address on a given I2C
 segment, the address is sufficient to uniquely identify the device to be
 deleted.
-- 
2.25.0


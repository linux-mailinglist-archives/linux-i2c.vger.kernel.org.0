Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5404F20C9B1
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jun 2020 20:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgF1SqD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 14:46:03 -0400
Received: from www.zeus03.de ([194.117.254.33]:49532 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbgF1SqC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 28 Jun 2020 14:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=a6xrq37McHjNGAyMgyOHvSKoKT/
        F4htXhJMNKmjgDp4=; b=fGDLvCRYUb/HLPfcM9BuoPBVRF4EhlvwFYG483gzPyC
        4dVkFX3o+cDqg+sTZwEvm0Gpwi2PpbaY3yqbnOB1lBD3yAUuuUR27RMka8exXgmv
        nyQ/NIZsA1pdxSIYElq9OW19yaOQC+lgWgva75XBcAlYrJe1dDXl++DqefjR0RhU
        =
Received: (qmail 1785945 invoked from network); 28 Jun 2020 20:46:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2020 20:46:00 +0200
X-UD-Smtp-Session: l3s3148p1@Z9aDWimpfK8gAwDPXykLAJ34nb66bSnN
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: slave-eeprom: update documentation
Date:   Sun, 28 Jun 2020 20:45:54 +0200
Message-Id: <20200628184554.4401-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add more details which have either been missing ever since or describe
recent additions.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-eeprom-backend.rst | 22 +++++++++++++++++-----
 drivers/i2c/Kconfig                        |  3 +++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/slave-eeprom-backend.rst b/Documentation/i2c/slave-eeprom-backend.rst
index 0b8cd83698e0..38d951f10302 100644
--- a/Documentation/i2c/slave-eeprom-backend.rst
+++ b/Documentation/i2c/slave-eeprom-backend.rst
@@ -1,14 +1,26 @@
 ==============================
-Linux I2C slave eeprom backend
+Linux I2C slave EEPROM backend
 ==============================
 
-by Wolfram Sang <wsa@sang-engineering.com> in 2014-15
+by Wolfram Sang <wsa@sang-engineering.com> in 2014-20
 
-This is a proof-of-concept backend which acts like an EEPROM on the connected
-I2C bus. The memory contents can be modified from userspace via this file
-located in sysfs::
+This backend simulates an EEPROM on the connected I2C bus. Its memory contents
+can be accessed from userspace via this file located in sysfs::
 
 	/sys/bus/i2c/devices/<device-directory>/slave-eeprom
 
+The following types are available: 24c02, 24c32, 24c64, and 24c512. Read-only
+variants are also supported. The name needed for instantiating has the form
+'slave-<type>[ro]'. Examples follow:
+
+24c02, read/write, address 0x64:
+  # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-1/new_device
+
+24c512, read-only, address 0x42:
+  # echo slave-24c512ro 0x1042 > /sys/bus/i2c/devices/i2c-1/new_device
+
+You can also preload data during boot if a device-property named
+'firmware-name' contains a valid filename (DT or ACPI only).
+
 As of 2015, Linux doesn't support poll on binary sysfs files, so there is no
 notification when another master changed the content.
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index ef39c83aaf33..53d916b8db47 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -119,6 +119,9 @@ if I2C_SLAVE
 config I2C_SLAVE_EEPROM
 	tristate "I2C eeprom slave driver"
 
+	  This backend makes Linux behave like an I2C EEPROM. Please read
+	  Documentation/i2c/slave-eeprom-backend.rst for further details.
+
 endif
 
 config I2C_DEBUG_CORE
-- 
2.20.1


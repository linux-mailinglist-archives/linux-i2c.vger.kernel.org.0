Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79F61469B6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 14:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAWNva (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 08:51:30 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43082 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726771AbgAWNva (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 08:51:30 -0500
Received: from [109.168.11.45] (port=47192 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iuctL-000CNg-Of; Thu, 23 Jan 2020 14:51:27 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/28] docs: i2c: sort index logically
Date:   Thu, 23 Jan 2020 14:50:36 +0100
Message-Id: <20200123135103.20540-2-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123135103.20540-1-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
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

The index page currently lists sections in alphabetical file order without
caring about their content. Sort sections based on their content logically,
according to the following structure:

 * Intro to I2C/SMBus and their usage in Linux: summary, i2c-protocol,
   smbus-protocol, instantiating-devices, busses/index, i2c-topology,
   muxes/i2c-mux-gpio
 * Implementing drivers: writing-clients, dev-interface,
   dma-considerations, fault-codes, functionality
 * Debugging: gpio-fault-injection, i2c-stub
 * Slave I2C: slave-interface, slave-eeprom-backend
 * Advanced: ten-bit-addresses
 * Obsolete info: upgrading-clients, old-module-parameters

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - split sections in groups (suggested by Jean Delvare)
 - remove consecutive blank lines (reported by Jean Delvare)
---
 Documentation/i2c/index.rst | 59 ++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index a0fbaf6d0675..f0f3b9c97abb 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -4,30 +4,67 @@
 I2C/SMBus Subsystem
 ===================
 
+Introduction
+============
+
+.. toctree::
+   :maxdepth: 1
+
+   summary
+   i2c-protocol
+   smbus-protocol
+   instantiating-devices
+   busses/index
+   i2c-topology
+   muxes/i2c-mux-gpio
+
+
+Writing device drivers
+======================
+
 .. toctree::
    :maxdepth: 1
 
+   writing-clients
    dev-interface
    dma-considerations
    fault-codes
    functionality
+
+Debugging
+=========
+
+.. toctree::
+   :maxdepth: 1
+
    gpio-fault-injection
-   i2c-protocol
    i2c-stub
-   i2c-topology
-   instantiating-devices
-   old-module-parameters
-   slave-eeprom-backend
+
+Slave I2C
+=========
+
+.. toctree::
+   :maxdepth: 1
+
    slave-interface
-   smbus-protocol
-   summary
+   slave-eeprom-backend
+
+Advanced topics
+===============
+
+.. toctree::
+   :maxdepth: 1
+
    ten-bit-addresses
-   upgrading-clients
-   writing-clients
 
-   muxes/i2c-mux-gpio
+Legacy documentation
+====================
 
-   busses/index
+.. toctree::
+   :maxdepth: 1
+
+   upgrading-clients
+   old-module-parameters
 
 .. only::  subproject and html
 
-- 
2.25.0


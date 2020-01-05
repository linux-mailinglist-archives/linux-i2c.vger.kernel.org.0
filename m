Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C63DA130A55
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jan 2020 23:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgAEWuc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 17:50:32 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:37715 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727139AbgAEWuc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 17:50:32 -0500
Received: from [37.160.42.38] (port=5507 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioEj7-00GSqI-9e; Sun, 05 Jan 2020 23:50:29 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 01/26] docs: i2c: sort index logically
Date:   Sun,  5 Jan 2020 23:49:47 +0100
Message-Id: <20200105225012.11701-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105224006.10321-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
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
---
 Documentation/i2c/index.rst | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index a0fbaf6d0675..bd0ff9d00793 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -7,27 +7,26 @@ I2C/SMBus Subsystem
 .. toctree::
    :maxdepth: 1
 
+   summary
+   i2c-protocol
+   smbus-protocol
+   instantiating-devices
+   busses/index
+   i2c-topology
+   muxes/i2c-mux-gpio
+   writing-clients
    dev-interface
    dma-considerations
    fault-codes
    functionality
    gpio-fault-injection
-   i2c-protocol
    i2c-stub
-   i2c-topology
-   instantiating-devices
-   old-module-parameters
-   slave-eeprom-backend
    slave-interface
-   smbus-protocol
-   summary
+   slave-eeprom-backend
    ten-bit-addresses
    upgrading-clients
-   writing-clients
-
-   muxes/i2c-mux-gpio
+   old-module-parameters
 
-   busses/index
 
 .. only::  subproject and html
 
-- 
2.24.1


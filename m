Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4D61469F0
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 14:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgAWNxq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 08:53:46 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59265 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726729AbgAWNxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 08:53:45 -0500
Received: from [109.168.11.45] (port=47192 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iucvX-000CNg-HE; Thu, 23 Jan 2020 14:53:43 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/28] docs: i2c: i2c-protocol: remove unneeded colons from table
Date:   Thu, 23 Jan 2020 14:50:44 +0100
Message-Id: <20200123135103.20540-10-luca@lucaceresoli.net>
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

These colons are not needed: the columns already nicely separate the
symbols from their description. They are also inconsistently preceded by
whitespace.

Remove the colons completely to simplify and clean up.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - fix typo in commit message (Jean Delvare)
---
 Documentation/i2c/i2c-protocol.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index c090003f55ed..66adac3a5afd 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -8,19 +8,19 @@ Key to symbols
 ==============
 
 =============== =============================================================
-S             : Start condition
-P             : Stop condition
-Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
-A, NA (1 bit) : Accept and reverse accept bit.
-Addr  (7 bits): I2C 7 bit address. Note that this can be expanded as usual to
+S               Start condition
+P               Stop condition
+Rd/Wr (1 bit)   Read/Write bit. Rd equals 1, Wr equals 0.
+A, NA (1 bit)   Accept and reverse accept bit.
+Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded as usual to
                 get a 10 bit I2C address.
-Comm  (8 bits): Command byte, a data byte which often selects a register on
+Comm  (8 bits)  Command byte, a data byte which often selects a register on
                 the device.
-Data  (8 bits): A plain data byte. Sometimes, I write DataLow, DataHigh
+Data  (8 bits)  A plain data byte. Sometimes, I write DataLow, DataHigh
                 for 16 bit data.
-Count (8 bits): A data byte containing the length of a block operation.
+Count (8 bits)  A data byte containing the length of a block operation.
 
-[..]:           Data sent by I2C device, as opposed to data sent by the
+[..]            Data sent by I2C device, as opposed to data sent by the
                 host adapter.
 =============== =============================================================
 
-- 
2.25.0


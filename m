Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94921469BA
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 14:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgAWNvh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 08:51:37 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:60471 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727312AbgAWNvh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 08:51:37 -0500
Received: from [109.168.11.45] (port=47192 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iuctS-000CNg-K8; Thu, 23 Jan 2020 14:51:34 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/28] docs: i2c: summary: extend introduction
Date:   Thu, 23 Jan 2020 14:50:37 +0100
Message-Id: <20200123135103.20540-3-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123135103.20540-1-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

 - state the "official" name (I²C, not I2C, according to the spec) at
   the beginning but keep using the more practical I2C elsewhere
 - mention some known different names
 - add link to the specification document

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - clarify sentence (Jean Delvare)
---
 Documentation/i2c/summary.rst | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 3a24eac17375..dbab737d5075 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -2,12 +2,18 @@
 I2C and SMBus
 =============
 
-I2C (pronounce: I squared C) is a protocol developed by Philips. It is a
-slow two-wire protocol (variable speed, up to 400 kHz), with a high speed
-extension (3.4 MHz).  It provides an inexpensive bus for connecting many
-types of devices with infrequent or low bandwidth communications needs.
-I2C is widely used with embedded systems.  Some systems use variants that
-don't meet branding requirements, and so are not advertised as being I2C.
+I²C (pronounce: I squared C and written I2C in the kernel documentation) is
+a protocol developed by Philips. It is a slow two-wire protocol (variable
+speed, up to 400 kHz), with a high speed extension (3.4 MHz).  It provides
+an inexpensive bus for connecting many types of devices with infrequent or
+low bandwidth communications needs.  I2C is widely used with embedded
+systems.  Some systems use variants that don't meet branding requirements,
+and so are not advertised as being I2C but come under different names,
+e.g. TWI (Two Wire Interface), IIC.
+
+The official I2C specification is the `"I2C-bus specification and user
+manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
+published by NXP Semiconductors.
 
 SMBus (System Management Bus) is based on the I2C protocol, and is mostly
 a subset of I2C protocols and signaling.  Many I2C devices will work on an
-- 
2.25.0


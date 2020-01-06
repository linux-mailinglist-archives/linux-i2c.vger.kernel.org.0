Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD14E130E2E
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 08:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgAFHtU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 02:49:20 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:36364 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725887AbgAFHtU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 02:49:20 -0500
Received: from [37.161.188.54] (port=58500 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioN8X-002OXl-Iu; Mon, 06 Jan 2020 08:49:17 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 26/26] docs: i2c: rename sections so the overall picture is clearer
Date:   Mon,  6 Jan 2020 08:49:05 +0100
Message-Id: <20200106074905.14438-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105224006.10321-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Some of the section names are not very clear. Reading those names in the
index.rst page does not help much in grasping what the content is supposed
to be.

Rename those sections to clarify their content, especially when reading
the index page.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Note: here checkpatch complains:

  WARNING: Missing or malformed SPDX-License-Identifier tag in line 1

Thas's because those files have no license line. I would gladly add a
proper license line, but what it the correct license here? Should I ask the
authors? GPLv2-only as the kernel default?

I'd appreciate a guidance here, thanks in advance.
---
 Documentation/i2c/dev-interface.rst         | 6 +++---
 Documentation/i2c/i2c-protocol.rst          | 6 +++---
 Documentation/i2c/i2c-topology.rst          | 6 +++---
 Documentation/i2c/old-module-parameters.rst | 6 +++---
 Documentation/i2c/smbus-protocol.rst        | 6 +++---
 Documentation/i2c/summary.rst               | 6 +++---
 Documentation/i2c/writing-clients.rst       | 6 +++---
 7 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index c3717a87df12..bdb247f2f11a 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -1,6 +1,6 @@
-====================
-I2C Device Interface
-====================
+============================================
+Implementing I2C device drivers in userspace
+============================================
 
 Usually, I2C devices are controlled by a kernel driver. But it is also
 possible to access all devices on an adapter from userspace, through
diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index 9a4ac944cf9d..6aafc3880bce 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -1,6 +1,6 @@
-============
-I2C Protocol
-============
+================
+The I2C Protocol
+================
 
 This document describes the I2C protocol. Or will, when it is finished :-)
 
diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 2a18b53e3508..7cb53819778e 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -1,6 +1,6 @@
-============
-I2C topology
-============
+================================
+I2C muxes and complex topologies
+================================
 
 There are a couple of reasons for building more complex I2C topologies
 than a straight-forward I2C bus with one adapter and one or more devices.
diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
index fdc470a5f999..f64d3cebc9a1 100644
--- a/Documentation/i2c/old-module-parameters.rst
+++ b/Documentation/i2c/old-module-parameters.rst
@@ -1,6 +1,6 @@
-=================================================
-I2C device driver binding control from user-space
-=================================================
+================================================================
+I2C device driver binding control from user-space in old kernels
+================================================================
 
 .. NOTE::
    Note: this section is only relevant if you are handling some old code
diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 0edaf6069ac1..c122ed239f7f 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -1,6 +1,6 @@
-======================
-SMBus Protocol Summary
-======================
+==================
+The SMBus Protocol
+==================
 
 The following is a summary of the SMBus protocol. It applies to
 all revisions of the protocol (1.0, 1.1, and 2.0).
diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index fc69d9567d9d..ae3bbb9fd8f1 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -1,6 +1,6 @@
-=============
-I2C and SMBus
-=============
+==============================
+Introductions to I2C and SMBus
+==============================
 
 I²C (pronounce: I squared C and written I2C in the kernel documentation) is
 a protocol developed by Philips. It is a slow two-wire protocol (variable
diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index 1bf4b973c673..5eddf20e983e 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -1,6 +1,6 @@
-===================
-Writing I2C Clients
-===================
+===============================
+Implementing I2C device drivers
+===============================
 
 This is a small guide for those who want to write kernel drivers for I2C
 or SMBus devices, using Linux as the protocol host/master (not slave).
-- 
2.24.1


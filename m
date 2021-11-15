Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9881A450336
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 12:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhKOLM2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 06:12:28 -0500
Received: from mslow1.mail.gandi.net ([217.70.178.240]:53619 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237593AbhKOLLw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 06:11:52 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 1D7BACC37A
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 11:08:56 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 48C55FF805;
        Mon, 15 Nov 2021 11:08:19 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] docs: i2c: smbus-protocol: mention the repeated start condition
Date:   Mon, 15 Nov 2021 12:08:18 +0100
Message-Id: <20211115110818.888974-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sr is a repeated start, it is used in both I2C and SMBus protocols.

Provide its description and replace start ("S") conditions with repeated
start ("Sr") conditions when relevant. This allows the documentation to
match the SMBus specification available at [1].

[1] http://www.smbus.org/specs/SMBus_3_1_20180319.pdf

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/i2c/smbus-protocol.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 9e07e6bbe6a3..00d8e17d0aca 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -36,6 +36,8 @@ Key to symbols
 
 =============== =============================================================
 S               Start condition
+Sr              Repeated start condition, used to switch from write to
+                read mode.
 P               Stop condition
 Rd/Wr (1 bit)   Read/Write bit. Rd equals 1, Wr equals 0.
 A, NA (1 bit)   Acknowledge (ACK) and Not Acknowledge (NACK) bit
@@ -100,7 +102,7 @@ Implemented by i2c_smbus_read_byte_data()
 This reads a single byte from a device, from a designated register.
 The register is specified through the Comm byte::
 
-  S Addr Wr [A] Comm [A] S Addr Rd [A] [Data] NA P
+  S Addr Wr [A] Comm [A] Sr Addr Rd [A] [Data] NA P
 
 Functionality flag: I2C_FUNC_SMBUS_READ_BYTE_DATA
 
@@ -114,7 +116,7 @@ This operation is very like Read Byte; again, data is read from a
 device, from a designated register that is specified through the Comm
 byte. But this time, the data is a complete word (16 bits)::
 
-  S Addr Wr [A] Comm [A] S Addr Rd [A] [DataLow] A [DataHigh] NA P
+  S Addr Wr [A] Comm [A] Sr Addr Rd [A] [DataLow] A [DataHigh] NA P
 
 Functionality flag: I2C_FUNC_SMBUS_READ_WORD_DATA
 
@@ -164,7 +166,7 @@ This command selects a device register (through the Comm byte), sends
 16 bits of data to it, and reads 16 bits of data in return::
 
   S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A]
-                               S Addr Rd [A] [DataLow] A [DataHigh] NA P
+                              Sr Addr Rd [A] [DataLow] A [DataHigh] NA P
 
 Functionality flag: I2C_FUNC_SMBUS_PROC_CALL
 
@@ -181,7 +183,7 @@ of data is specified by the device in the Count byte.
 ::
 
   S Addr Wr [A] Comm [A]
-             S Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P
+            Sr Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P
 
 Functionality flag: I2C_FUNC_SMBUS_READ_BLOCK_DATA
 
@@ -212,7 +214,7 @@ This command selects a device register (through the Comm byte), sends
 1 to 31 bytes of data to it, and reads 1 to 31 bytes of data in return::
 
   S Addr Wr [A] Comm [A] Count [A] Data [A] ...
-                               S Addr Rd [A] [Count] A [Data] ... A P
+                              Sr Addr Rd [A] [Count] A [Data] ... A P
 
 Functionality flag: I2C_FUNC_SMBUS_BLOCK_PROC_CALL
 
@@ -300,7 +302,7 @@ This command reads a block of bytes from a device, from a
 designated register that is specified through the Comm byte::
 
   S Addr Wr [A] Comm [A]
-             S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
+            Sr Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
 
 Functionality flag: I2C_FUNC_SMBUS_READ_I2C_BLOCK
 
-- 
2.27.0


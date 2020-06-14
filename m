Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA4E1F8A19
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 20:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbgFNSbJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 14:31:09 -0400
Received: from ciffreo.uberspace.de ([185.26.156.173]:43202 "EHLO
        ciffreo.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgFNSbJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 14:31:09 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Jun 2020 14:31:08 EDT
Received: (qmail 32141 invoked from network); 14 Jun 2020 18:24:25 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ciffreo.uberspace.de with SMTP; 14 Jun 2020 18:24:25 -0000
From:   git@danielschaefer.me
To:     linux-i2c@vger.kernel.org
Cc:     Daniel Schaefer <git@danielschaefer.me>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 1/1] Documentation/i2c: SMBus start signal is S not A
Date:   Sun, 14 Jun 2020 20:23:55 +0200
Message-Id: <20200614182355.19742-1-git@danielschaefer.me>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Daniel Schaefer <git@danielschaefer.me>

Just like all other I2C/SMBus commands, the start signal for the SMBus
Quick Command is S, not P.

Cc: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Daniel Schaefer <git@danielschaefer.me>
---
 Documentation/i2c/smbus-protocol.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index c2e29633071e..64689d19dd51 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -57,7 +57,7 @@ SMBus Quick Command
 
 This sends a single bit to the device, at the place of the Rd/Wr bit::
 
-  A Addr Rd/Wr [A] P
+  S Addr Rd/Wr [A] P
 
 Functionality flag: I2C_FUNC_SMBUS_QUICK
 
-- 
2.25.1


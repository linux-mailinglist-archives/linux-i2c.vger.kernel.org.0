Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5FF14CE4B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 17:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgA2QXU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 11:23:20 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43823 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727165AbgA2QWy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jan 2020 11:22:54 -0500
Received: from [109.168.11.45] (port=34038 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iwq79-005NDl-B9; Wed, 29 Jan 2020 17:22:51 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/28] docs: i2c: smbus-protocol: improve I2C Block transactions description
Date:   Wed, 29 Jan 2020 16:19:44 +0100
Message-Id: <20200129151953.31582-20-luca@lucaceresoli.net>
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


Clarify from the beginning what these transactions are, and specifically
how they differ from the SMBus counterparts, i.e. the lack of a Count byte.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 Documentation/i2c/smbus-protocol.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 7350e4b2c2fa..0edaf6069ac1 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -282,9 +282,10 @@ This is implemented the following way in the Linux kernel:
 I2C Block Transactions
 ======================
 
-The following I2C block transactions are supported by the
-SMBus layer and are described here for completeness.
-They are *NOT* defined by the SMBus specification.
+The following I2C block transactions are similar to the SMBus Block Read
+and Write operations, except these do not have a Count byte. They are
+supported by the SMBus layer and are described here for completeness, but
+they are *NOT* defined by the SMBus specification.
 
 I2C block transactions do not limit the number of bytes transferred
 but the SMBus layer places a limit of 32 bytes.
-- 
2.25.0


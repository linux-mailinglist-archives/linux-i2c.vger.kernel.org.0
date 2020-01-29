Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C3314CE45
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 17:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgA2QWx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 11:22:53 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:37444 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727089AbgA2QWx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jan 2020 11:22:53 -0500
Received: from [109.168.11.45] (port=34038 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iwq79-005NDl-2T; Wed, 29 Jan 2020 17:22:51 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/28] docs: i2c: smbus-protocol: fix punctuation
Date:   Wed, 29 Jan 2020 16:19:43 +0100
Message-Id: <20200129151953.31582-19-luca@lucaceresoli.net>
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


Remove misplaced dot before colon.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - fix subject line (Jean Delvare)
---
 Documentation/i2c/smbus-protocol.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index de7285de5e93..7350e4b2c2fa 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -146,7 +146,7 @@ Implemented by i2c_smbus_write_word_data()
 
 This is the opposite of the Read Word operation. 16 bits
 of data are written to a device, to the designated register that is
-specified through the Comm byte.::
+specified through the Comm byte::
 
   S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A] P
 
-- 
2.25.0


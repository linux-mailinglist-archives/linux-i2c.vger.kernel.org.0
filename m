Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2330130ABF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 00:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbgAEXPI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 18:15:08 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:36991 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727256AbgAEXPH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 18:15:07 -0500
Received: from [37.160.42.38] (port=5507 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioEkH-00GSqI-Mw; Sun, 05 Jan 2020 23:51:41 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 23/26] docs: i2c: old-module-parameters: fix internal hyperlink
Date:   Sun,  5 Jan 2020 23:50:09 +0100
Message-Id: <20200105225012.11701-23-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105225012.11701-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
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

Use ReST syntax so that a proper hyperlink is generated.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/i2c/old-module-parameters.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
index 78a6950e5763..0503d2f0b127 100644
--- a/Documentation/i2c/old-module-parameters.rst
+++ b/Documentation/i2c/old-module-parameters.rst
@@ -12,8 +12,7 @@ address), "force" (to forcibly attach the driver to a given device) and
 With the conversion of the I2C subsystem to the standard device driver
 binding model, it became clear that these per-module parameters were no
 longer needed, and that a centralized implementation was possible. The new,
-sysfs-based interface is described in the documentation file
-"instantiating-devices", section "Method 4: Instantiate from user-space".
+sysfs-based interface is described in :doc:`instantiating-devices`.
 
 Below is a mapping from the old module parameters to the new interface.
 
-- 
2.24.1


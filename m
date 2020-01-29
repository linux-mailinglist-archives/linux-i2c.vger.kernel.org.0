Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4105414CD25
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 16:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgA2PUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 10:20:22 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:33363 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727089AbgA2PUW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jan 2020 10:20:22 -0500
Received: from [109.168.11.45] (port=33588 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iwp8e-004sQJ-3c; Wed, 29 Jan 2020 16:20:20 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/28] docs: i2c: fix typo
Date:   Wed, 29 Jan 2020 16:19:30 +0100
Message-Id: <20200129151953.31582-6-luca@lucaceresoli.net>
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


Fix "issus" -> "issues".

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 Documentation/i2c/i2c-topology.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 0875090d6aeb..b413ef6a6773 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -169,7 +169,7 @@ PL1. If you build a topology with a parent-locked mux being the child
      of another mux, this might break a possible assumption from the
      child mux that the root adapter is unused between its select op
      and the actual transfer (e.g. if the child mux is auto-closing
-     and the parent mux issus I2C-transfers as part of its select).
+     and the parent mux issues I2C-transfers as part of its select).
      This is especially the case if the parent mux is mux-locked, but
      it may also happen if the parent mux is parent-locked.
 
-- 
2.25.0


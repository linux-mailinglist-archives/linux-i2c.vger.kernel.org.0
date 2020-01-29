Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B87AA14CD2D
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 16:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbgA2PUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 10:20:31 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59469 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727089AbgA2PUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jan 2020 10:20:30 -0500
Received: from [109.168.11.45] (port=33588 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iwp8l-004sQJ-QK; Wed, 29 Jan 2020 16:20:27 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/28] docs: i2c: i2c-protocol: fix kernel-doc function syntax
Date:   Wed, 29 Jan 2020 16:19:32 +0100
Message-Id: <20200129151953.31582-8-luca@lucaceresoli.net>
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


This clarifies these are functions and adds a hyperlink to the function
documentation.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 Documentation/i2c/i2c-protocol.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index 0222c97f3436..f289d7759a51 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -28,7 +28,7 @@ Count (8 bits): A data byte containing the length of a block operation.
 Simple send transaction
 =======================
 
-This corresponds to i2c_master_send::
+This corresponds to i2c_master_send()::
 
   S Addr Wr [A] Data [A] Data [A] ... [A] Data [A] P
 
@@ -36,7 +36,7 @@ This corresponds to i2c_master_send::
 Simple receive transaction
 ==========================
 
-This corresponds to i2c_master_recv::
+This corresponds to i2c_master_recv()::
 
   S Addr Rd [A] [Data] A [Data] A ... A [Data] NA P
 
@@ -44,7 +44,7 @@ This corresponds to i2c_master_recv::
 Combined transactions
 =====================
 
-This corresponds to i2c_transfer
+This corresponds to i2c_transfer().
 
 They are just like the above transactions, but instead of a stop bit P
 a start bit S is sent and the transaction continues. An example of
-- 
2.25.0


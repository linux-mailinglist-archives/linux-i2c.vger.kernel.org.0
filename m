Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A5832ABB
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 10:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfFCIZt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 04:25:49 -0400
Received: from sauhun.de ([88.99.104.3]:35890 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfFCIZt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 04:25:49 -0400
Received: from localhost (unknown [88.128.80.57])
        by pokefinder.org (Postfix) with ESMTPSA id BC0FA3E42EA;
        Mon,  3 Jun 2019 10:25:47 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 5/5] i2c: headers: reformat header comment and update copyright
Date:   Mon,  3 Jun 2019 10:25:35 +0200
Message-Id: <20190603082535.1566-6-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190603082535.1566-1-wsa@the-dreams.de>
References: <20190603082535.1566-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Let's stick to coding style.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 include/linux/i2c.h | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 9853fae9b505..d8f9060179d0 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1,16 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/* ------------------------------------------------------------------------- */
-/*									     */
-/* i2c.h - definitions for the i2c-bus interface			     */
-/*									     */
-/* ------------------------------------------------------------------------- */
-/*   Copyright (C) 1995-2000 Simon G. Vogl
-
+/*
+ * i2c.h - definitions for the Linux i2c bus interface
+ * Copyright (C) 1995-2000 Simon G. Vogl
+ * Copyright (C) 2013-2019 Wolfram Sang <wsa@the-dreams.de>
+ *
+ * With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and
+ * Frodo Looijaard <frodol@dds.nl>
  */
-/* ------------------------------------------------------------------------- */
-
-/* With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and
-   Frodo Looijaard <frodol@dds.nl> */
 #ifndef _LINUX_I2C_H
 #define _LINUX_I2C_H
 
-- 
2.19.1


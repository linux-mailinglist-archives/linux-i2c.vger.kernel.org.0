Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159082EFF9C
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbhAIMoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:44 -0500
Received: from www.zeus03.de ([194.117.254.33]:50312 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726407AbhAIMoL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=k1; bh=K
        8X3CPq/CAPJt2DXKVcSEfDZDBVeXKHQCrnUgcxZEcA=; b=aCBI2Q7aNMuTJz1fi
        ta4ngAUWg5OeKljC7tDEsZZKq0AN4j0A1jfQCWt7Bodknzy9RFI3JVa0wXcByekp
        bLPVAGqV4ESwgPDU+5x1uouTiZSLICYK4H5zh7B3yjHZsk7ZArrQPpsc4Lm0UBXK
        ETMAD1EfRkaNBxPghsEuikr5+8=
Received: (qmail 1725076 invoked from network); 9 Jan 2021 13:43:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:29 +0100
X-UD-Smtp-Session: l3s3148p1@ECwTBXe4SpYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] i2c: remove licence boilerplate from main UAPI header
Date:   Sat,  9 Jan 2021 13:43:06 +0100
Message-Id: <20210109124314.27466-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove boilerplate because we now have the SPDX header.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/uapi/linux/i2c.h | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 8d2f59f53324..7786551eb177 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -1,29 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
-/* ------------------------------------------------------------------------- */
-/*									     */
-/* i2c.h - definitions for the i2c-bus interface			     */
-/*									     */
-/* ------------------------------------------------------------------------- */
-/*   Copyright (C) 1995-2000 Simon G. Vogl
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.							     */
-/* ------------------------------------------------------------------------- */
-
-/* With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and
-   Frodo Looijaard <frodol@dds.nl> */
+/*
+ * i2c.h - definitions for the I2C bus interface
+ *
+ * Copyright (C) 1995-2000 Simon G. Vogl
+ * With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and
+ * Frodo Looijaard <frodol@dds.nl>
+ */
 
 #ifndef _UAPI_LINUX_I2C_H
 #define _UAPI_LINUX_I2C_H
-- 
2.29.2


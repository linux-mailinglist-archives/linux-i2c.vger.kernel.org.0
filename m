Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FBD2EFF92
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbhAIMoP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:15 -0500
Received: from www.zeus03.de ([194.117.254.33]:50342 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbhAIMoO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=SM2ZG0AKZok5sQ
        c1/qRDn6QvvOVexaRbbaWgfEF+PRs=; b=TTCsAe1qS8I0lyrrrG1bHkdT4PA+pV
        Wb3nzcaFECSCBVQ7xks8hQwYFLG8y9srJ4Lu+ds728vzeqHXeGhpmhrHBidYdUh2
        S3TDjMk9LkliBtInOaXwO82xJtYUPrW83NklXb1ZA+iNYj4tROADGOPzJUUDln1E
        X0YvOfbEp6sOU=
Received: (qmail 1725111 invoked from network); 9 Jan 2021 13:43:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:30 +0100
X-UD-Smtp-Session: l3s3148p1@6JIcBXe4TJYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] i2c: remove licence boilerplate from i2c-dev UAPI header
Date:   Sat,  9 Jan 2021 13:43:07 +0100
Message-Id: <20210109124314.27466-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove boilerplate because we now have the SPDX header.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/uapi/linux/i2c-dev.h | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/include/uapi/linux/i2c-dev.h b/include/uapi/linux/i2c-dev.h
index 85f8047afcf2..1c4cec4ddd84 100644
--- a/include/uapi/linux/i2c-dev.h
+++ b/include/uapi/linux/i2c-dev.h
@@ -1,25 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
 /*
-    i2c-dev.h - i2c-bus driver, char device interface
-
-    Copyright (C) 1995-97 Simon G. Vogl
-    Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
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
-    MA 02110-1301 USA.
-*/
+ * i2c-dev.h - I2C bus char device interface
+ *
+ * Copyright (C) 1995-97 Simon G. Vogl
+ * Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
+ */
 
 #ifndef _UAPI_LINUX_I2C_DEV_H
 #define _UAPI_LINUX_I2C_DEV_H
-- 
2.29.2


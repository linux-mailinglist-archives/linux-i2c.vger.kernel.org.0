Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C88322D7F5
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 16:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgGYOHt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 10:07:49 -0400
Received: from www.zeus03.de ([194.117.254.33]:60588 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgGYOHs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 10:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=uRINi20Q3Ja4CwSYsZY4lGH+yWf
        ie5RJvuXtVPHG+0w=; b=GCrbllSZB6uGnFxZzZgv433Rv9W9KAY4fotwunk2qdE
        51pdGCg85EriJXs0j2q7rYixJ+dAGreXeWcpFjYflIzicaY2xK+QCYgjX9tparv/
        EWyGYrOxnsxvDKSs3hQ/8d4rhQk0nH/1TDmF5YTI2zp7xUYni9mm61hvIsGSqxAY
        =
Received: (qmail 4007644 invoked from network); 25 Jul 2020 16:07:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2020 16:07:44 +0200
X-UD-Smtp-Session: l3s3148p1@9DULnUSrOqUgAwDPXyGYANurB2J6Dh5y
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: also convert placeholder function to return errno
Date:   Sat, 25 Jul 2020 16:07:36 +0200
Message-Id: <20200725140736.3629-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All i2c_new_device-alike functions return ERR_PTR these days, but this
fallback function was missed.

Fixes: 2dea645ffc21 ("i2c: acpi: Return error pointers from i2c_acpi_new_device()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I recall that -ENOSYS is returned in case something is not compiled in.
I am open for -ENODEV if this is deemed better...

 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index b8b8963f8bb9..83fe48304781 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1001,7 +1001,7 @@ static inline u32 i2c_acpi_find_bus_speed(struct device *dev)
 static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
 					int index, struct i2c_board_info *info)
 {
-	return NULL;
+	return ERR_PTR(-ENOSYS);
 }
 static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 {
-- 
2.27.0


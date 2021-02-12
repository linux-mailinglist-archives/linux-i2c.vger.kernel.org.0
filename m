Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B05531A33C
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Feb 2021 18:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhBLREo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 12:04:44 -0500
Received: from www.zeus03.de ([194.117.254.33]:38292 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhBLREm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Feb 2021 12:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=iJ/Viy3d4W4Tp4nXKMFzNdDVY8g
        HOpacrfQ9ONvrcy4=; b=TeWZXyF2RTMImSl8Hkull0aoqSYuHd7LcHUjqKm3kDZ
        hbUkC03jRuwyVC5ZW352iFxyIgvlDOIkbhgti9+DgHON8yoHwX4tgx2JWmiIJo/f
        KQd+9C/6M9rV9gC37tBoB+jnvlEY/EQBoZQObf6Gg4Sk6Z7CNGxflaVjzLllocc4
        =
Received: (qmail 1320473 invoked from network); 12 Feb 2021 18:03:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Feb 2021 18:03:59 +0100
X-UD-Smtp-Session: l3s3148p1@UDoVnya7GOwgAwDPXwX6ALT+xmQk9ITR
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: powermac: remove uncertainty about SMBUS_BLOCK transfers
Date:   Fri, 12 Feb 2021 18:03:50 +0100
Message-Id: <20210212170350.2491-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver does the correct thing, so no need to question it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-powermac.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 3e38e114948b..5241e6f414e9 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -76,11 +76,6 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	 * but I think the current API makes no sense and I don't want
 	 * any driver that I haven't verified for correctness to go
 	 * anywhere near a pmac i2c bus anyway ...
-	 *
-	 * I'm also not completely sure what kind of phases to do between
-	 * the actual command and the data (what I am _supposed_ to do that
-	 * is). For now, I assume writes are a single stream and reads have
-	 * a repeat start/addr phase (but not stop in between)
 	 */
         case I2C_SMBUS_BLOCK_DATA:
 		buf = data->block;
-- 
2.29.2


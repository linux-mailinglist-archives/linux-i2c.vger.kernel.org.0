Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCBF2F35FD
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 17:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389223AbhALQmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 11:42:18 -0500
Received: from www.zeus03.de ([194.117.254.33]:37358 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387949AbhALQmR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 11:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=USZv5Xj1zn1BNv
        Fhrvbgw063aItC84tami7kF4AxUT4=; b=MnEe0sYz8eYhCEIP5nuiRSO5aXO8yB
        0fU1GRBHalnH/WTvIxaOuFaK+ZyCprKHmhep5otfszu9eqHdnFiCdX0GJzph+Mml
        xru6hkxTMk47dtjVQ17mygXZuhxggvhLJhA428lBBsRH8pDym6HQVkG/2/inKNX9
        b5F76MqaFOkv8=
Received: (qmail 2812420 invoked from network); 12 Jan 2021 17:41:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 17:41:35 +0100
X-UD-Smtp-Session: l3s3148p1@dScdsra4SNEgAwDPXwxzAHrEwO71dOp2
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/3] media: i2c: adv7842: remove open coded version of SMBus block write
Date:   Tue, 12 Jan 2021 17:41:27 +0100
Message-Id: <20210112164130.47895-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The version here is identical to the one in the I2C core, so use a
define to keep the original name within the driver but call the I2C core
function instead.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/i2c/adv7842.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 0855f648416d..6ed6bcd1d64d 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -343,19 +343,7 @@ static void adv_smbus_write_byte_no_check(struct i2c_client *client,
 		       I2C_SMBUS_BYTE_DATA, &data);
 }
 
-static s32 adv_smbus_write_i2c_block_data(struct i2c_client *client,
-				  u8 command, unsigned length, const u8 *values)
-{
-	union i2c_smbus_data data;
-
-	if (length > I2C_SMBUS_BLOCK_MAX)
-		length = I2C_SMBUS_BLOCK_MAX;
-	data.block[0] = length;
-	memcpy(data.block + 1, values, length);
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_I2C_BLOCK_DATA, &data);
-}
+#define adv_smbus_write_i2c_block_data i2c_smbus_write_i2c_block_data
 
 /* ----------------------------------------------------------------------- */
 
-- 
2.29.2


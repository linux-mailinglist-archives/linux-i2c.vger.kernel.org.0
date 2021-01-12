Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535552F33DF
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 16:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404610AbhALPNT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 10:13:19 -0500
Received: from www.zeus03.de ([194.117.254.33]:42702 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404537AbhALPNR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 10:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=s6ihzi/H6SO91B
        NccpEWnsusP2MGY2Z0QbyU7t3aRUI=; b=tzqc+bW89Z/KHjBOXkEQAqHpyW7UC+
        fYJDrOR9bDIeZE9uBYFdnWY3B53KBDiOq0OX3Q7KRADCr5f5QHntOwIP5HoEl1pU
        i0jCfh1iUvjlT/wFRHIT6QCv0UyNQZg0FxeP9Tj8DWdBA97DAqUzD9CUoyZ+vkQA
        zfDEs73zlL83Q=
Received: (qmail 2786158 invoked from network); 12 Jan 2021 16:12:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 16:12:36 +0100
X-UD-Smtp-Session: l3s3148p1@jrrZc7W4dr4gAwDPXwxzAXsl+VVkdePs
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: smbus: don't abuse loop variable
Date:   Tue, 12 Jan 2021 16:12:29 +0100
Message-Id: <20210112151230.46518-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112151230.46518-1-wsa+renesas@sang-engineering.com>
References: <20210112151230.46518-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't use 'i' to carry data, make a specific variable for it. After the
move to memcpy recently, we can even remove 'i'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-smbus.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index bf6bfe7c5cfe..6cda46913d89 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -324,7 +324,6 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
 	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
 	int num = read_write == I2C_SMBUS_READ ? 2 : 1;
-	int i;
 	u8 partial_pec = 0;
 	int status;
 	struct i2c_msg msg[2] = {
@@ -340,6 +339,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			.buf = msgbuf1,
 		},
 	};
+	bool wants_pec = ((flags & I2C_CLIENT_PEC) && size != I2C_SMBUS_QUICK
+			  && size != I2C_SMBUS_I2C_BLOCK_DATA);
 
 	msgbuf0[0] = command;
 	switch (size) {
@@ -443,9 +444,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		return -EOPNOTSUPP;
 	}
 
-	i = ((flags & I2C_CLIENT_PEC) && size != I2C_SMBUS_QUICK
-				      && size != I2C_SMBUS_I2C_BLOCK_DATA);
-	if (i) {
+	if (wants_pec) {
 		/* Compute PEC if first message is a write */
 		if (!(msg[0].flags & I2C_M_RD)) {
 			if (num == 1) /* Write only */
@@ -468,7 +467,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	status = 0;
 
 	/* Check PEC if last message is a read */
-	if (i && (msg[num-1].flags & I2C_M_RD)) {
+	if (wants_pec && (msg[num-1].flags & I2C_M_RD)) {
 		status = i2c_smbus_check_pec(partial_pec, &msg[num-1]);
 		if (status < 0)
 			goto cleanup;
-- 
2.29.2


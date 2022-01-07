Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9454870B5
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 03:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345512AbiAGCpv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 21:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344689AbiAGCpu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 21:45:50 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB7FC061245;
        Thu,  6 Jan 2022 18:45:50 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id pj2so2821729pjb.2;
        Thu, 06 Jan 2022 18:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJhGdS30+uCnJBMCA7oLAq184lBQGokQoxsLttwuw5Y=;
        b=OuzpKPg6XeqgVM9LvSRfobOAOmK3Y2f+JDVe8zGX21j2a+3oIdpgmU5IkapBKoz7Eo
         aUnrZM9FcLarcg4YxCFGOVdNbQlcFme3vKigI0OpgvihwSVDZGdEdam1+EMwvaGHe8/8
         aNhfai+4O7XwYvtxIfbQV5VUk0cgXGimaImnOo6jBIoSUtsA3tO3fJWElvo1A/FrW2Gk
         x4qu1N+wD860uQRzi9ag+PaJRFnLnxCmH8qy2omFgHTzg615pak1kg7zWNlQvTY/SuHI
         chhYrpdf9ddvVbLXadOHHXAE11QwjkBifNu9SY1p/V1ncKqY1ase+a5TLkezwaOBED7E
         8GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJhGdS30+uCnJBMCA7oLAq184lBQGokQoxsLttwuw5Y=;
        b=Ehxw6UzdHC7qyTetZgcwFoA2OqWbEA4MdvIHeDAfKBTnhfd+dnXGH+5fhPhBFmVAki
         n6IZqBnSPJiceOPYcgFl/c9hRkRqs//bRocA/R3KhPgui1WmfswXEwDY+dJmZbtlScXI
         09Zjg4Kx8E+TmULGRt5Zd6EWYdh47S/W65ZGNslMyYEGAicshhoqWgSh4MZ4h5zBly/7
         H0jua3zD92V7He4I65WP+XEFmwAp6O1PymdDu/qaZCV1Ts0otm+GvC51sYaw22lwBDsZ
         MLpFEvnfUpYvrIwUgtxrZmo78czvnUN6VdLu/FnneqHboz3lyZJUDFuFEviL60y1nMnZ
         QLSA==
X-Gm-Message-State: AOAM531315n2ufQ3p+IvrNg6MDwrujtXDusff0pgldCoh1RKPHAlzRW0
        UaSnArh/UOWs/pLd8TX3Iwo=
X-Google-Smtp-Source: ABdhPJzyIk4GOWV1wfGptUIxf9J6mGghXrqwQtaFHmAcLvF8BMSQvXrTEsrKi3WItljjgSjZ0iZwNA==
X-Received: by 2002:a17:902:714b:b0:149:f3bc:c4d6 with SMTP id u11-20020a170902714b00b00149f3bcc4d6mr4957732plm.11.1641523549973;
        Thu, 06 Jan 2022 18:45:49 -0800 (PST)
Received: from localhost.localdomain ([8.212.10.173])
        by smtp.gmail.com with ESMTPSA id e9sm3049883pgp.39.2022.01.06.18.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:45:49 -0800 (PST)
From:   "Zhou,Junde" <junde.zhou@gmail.com>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhoujd@clounix.com
Subject: [PATCH] check parameter for i2c driver interface and improve efficieny for the issues.
Date:   Fri,  7 Jan 2022 10:45:24 +0800
Message-Id: <20220107024524.2293-1-junde.zhou@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: "Zhou,Junde" <zhoujd@clounix.com>

do parameter checking in drivers/i2c/i2c-core-smbus.c.

return -EINVAL when input parameter length is equal to 0.

Signed-off-by: Zhou,Junde <zhoujd@clounix.com>
---
 drivers/i2c/i2c-core-smbus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e5b2d1465e7e..9fbc96be6958 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -254,6 +254,8 @@ s32 i2c_smbus_write_block_data(const struct i2c_client *client, u8 command,
 
 	if (length > I2C_SMBUS_BLOCK_MAX)
 		length = I2C_SMBUS_BLOCK_MAX;
+	if (length == 0)
+		return -EINVAL;
 	data.block[0] = length;
 	memcpy(&data.block[1], values, length);
 	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
@@ -271,6 +273,8 @@ s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
 
 	if (length > I2C_SMBUS_BLOCK_MAX)
 		length = I2C_SMBUS_BLOCK_MAX;
+	if (length == 0)
+		return -EINVAL;
 	data.block[0] = length;
 	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 				I2C_SMBUS_READ, command,
@@ -290,6 +294,8 @@ s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client, u8 command,
 
 	if (length > I2C_SMBUS_BLOCK_MAX)
 		length = I2C_SMBUS_BLOCK_MAX;
+	if (length == 0)
+		return -EINVAL;
 	data.block[0] = length;
 	memcpy(data.block + 1, values, length);
 	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-- 
2.25.1


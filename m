Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59B22EFFA0
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbhAIMoz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:50698 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726688AbhAIMoy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=SrIMOhZ2Ymwiq3
        c747qFRw3y0YPS/JsbyabG07Zp8no=; b=NMSzx4D6ipyAxPSe57JaZOyJUnKsVi
        N0Ne1v1EFnXziW7SIxmoVAARjrjx8/W7Up5NDwkfzpINIK/G3lbggoflzi3BGOTu
        9G4h3b8FGYcM42ugm9Et7UB6FAMpyElEvLe3R8Wk1oSFRjSqvBKTI0dNYPyIy5uS
        rkNhmfdGBjaP4=
Received: (qmail 1725191 invoked from network); 9 Jan 2021 13:43:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:32 +0100
X-UD-Smtp-Session: l3s3148p1@ckNCBXe4VJYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] i2c: qup: advertise SMBus transfers using RECV_LEN
Date:   Sat,  9 Jan 2021 13:43:11 +0100
Message-Id: <20210109124314.27466-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver implements I2C_M_RECV_LEN, so it can advertise the SMBus
transfers needing it. This also enables client devices to check for the
RECV_LEN capability.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-qup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 5a47915869ae..61dc20fd1191 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1603,7 +1603,7 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
 
 static u32 qup_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL_ALL & ~I2C_FUNC_SMBUS_QUICK);
 }
 
 static const struct i2c_algorithm qup_i2c_algo = {
-- 
2.29.2


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9987D60A8
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 05:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbjJYDzl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 23:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjJYDzi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 23:55:38 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C24812A
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 20:55:36 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CBAA62C0880;
        Wed, 25 Oct 2023 16:55:34 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698206134;
        bh=T1rEcP7WERAfCaboA9zydj0UHF5JwfRPsC5OV0NENQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L+dZs5uthGiQaXqRn9TRixW+FoucJu9Dq6BJllzl2TG3mOb+SFC5NwTYeJUOmEa4l
         6ivGAnjNyCUatebNvGioQBvlSKSSSWnbvQmklq/JPzi4gXnQA1lZIw1uizh9ivUE5s
         gfd8ZCxX7ZUyOtU7a/v2LLO47TZUQASS2W/U6F2xiaLTGYiUT4PBh7Y3YAWLgGSOa/
         Uwxvd4KydwcsS58x7Kz6b83Jwfmv484Jjx+Fx+4uurOSlF2NfrEqHC79tm+bsaxEY3
         /3d5JaCEd/pw55megoUNyrRx+4dOxMbAfLCrdF5bVfF0bbDqBzgfOXdXDfCp49z38v
         ze1cZIH4BY0ZQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653891b60000>; Wed, 25 Oct 2023 16:55:34 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.11])
        by pat.atlnz.lc (Postfix) with ESMTP id AB77013EDA9;
        Wed, 25 Oct 2023 16:55:34 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id A9BF1242FEC; Wed, 25 Oct 2023 16:55:34 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        Enrik.Berkhan@inka.de, sven.zuehlsdorf@vigem.de
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 4/5] HID: mcp2221: Don't set bus speed on every transfer
Date:   Wed, 25 Oct 2023 16:55:13 +1300
Message-ID: <20231025035514.3450123-5-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
References: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=tGeSMbNTF7bCNvFDaJ4A:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since the initial commit of this driver the I2C bus speed has been
reconfigured for every single transfer. This is despite the fact that we
never change the speed and it is never "lost" by the chip.
Upon investigation we find that what was really happening was that the
setting of the bus speed had the side effect of cancelling a previous
failed command if there was one, thereby freeing the bus. This is the
part that was actually required to keep the bus operational in the face
of failed commands.

Instead of always setting the speed, we now correctly cancel any failed
commands as they are detected. This means we can just set the bus speed
at probe time and remove the previous speed sets on each transfer.
This has the effect of improving performance and reducing the number of
commands required to complete transfers.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/hid/hid-mcp2221.c | 41 ++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index a219cd2e3309..d0dd14cb4156 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -187,6 +187,25 @@ static int mcp_cancel_last_cmd(struct mcp2221 *mcp)
 	return mcp_send_data_req_status(mcp, mcp->txbuf, 8);
 }
=20
+/* Check if the last command succeeded or failed and return the result.
+ * If the command did fail, cancel that command which will free the i2c =
bus.
+ */
+static int mcp_chk_last_cmd_status_free_bus(struct mcp2221 *mcp)
+{
+	int ret;
+
+	ret =3D mcp_chk_last_cmd_status(mcp);
+	if (ret) {
+		/* The last command was a failure.
+		 * Send a cancel which will also free the bus.
+		 */
+		usleep_range(980, 1000);
+		mcp_cancel_last_cmd(mcp);
+	}
+
+	return ret;
+}
+
 static int mcp_set_i2c_speed(struct mcp2221 *mcp)
 {
 	int ret;
@@ -241,7 +260,7 @@ static int mcp_i2c_write(struct mcp2221 *mcp,
 		usleep_range(980, 1000);
=20
 		if (last_status) {
-			ret =3D mcp_chk_last_cmd_status(mcp);
+			ret =3D mcp_chk_last_cmd_status_free_bus(mcp);
 			if (ret)
 				return ret;
 		}
@@ -308,7 +327,7 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 		if (ret)
 			return ret;
=20
-		ret =3D mcp_chk_last_cmd_status(mcp);
+		ret =3D mcp_chk_last_cmd_status_free_bus(mcp);
 		if (ret)
 			return ret;
=20
@@ -328,11 +347,6 @@ static int mcp_i2c_xfer(struct i2c_adapter *adapter,
=20
 	mutex_lock(&mcp->lock);
=20
-	/* Setting speed before every transaction is required for mcp2221 */
-	ret =3D mcp_set_i2c_speed(mcp);
-	if (ret)
-		goto exit;
-
 	if (num =3D=3D 1) {
 		if (msgs->flags & I2C_M_RD) {
 			ret =3D mcp_i2c_smbus_read(mcp, msgs, MCP2221_I2C_RD_DATA,
@@ -417,9 +431,7 @@ static int mcp_smbus_write(struct mcp2221 *mcp, u16 a=
ddr,
 	if (last_status) {
 		usleep_range(980, 1000);
=20
-		ret =3D mcp_chk_last_cmd_status(mcp);
-		if (ret)
-			return ret;
+		ret =3D mcp_chk_last_cmd_status_free_bus(mcp);
 	}
=20
 	return ret;
@@ -437,10 +449,6 @@ static int mcp_smbus_xfer(struct i2c_adapter *adapte=
r, u16 addr,
=20
 	mutex_lock(&mcp->lock);
=20
-	ret =3D mcp_set_i2c_speed(mcp);
-	if (ret)
-		goto exit;
-
 	switch (size) {
=20
 	case I2C_SMBUS_QUICK:
@@ -1150,6 +1158,11 @@ static int mcp2221_probe(struct hid_device *hdev,
 	if (i2c_clk_freq < 50)
 		i2c_clk_freq =3D 50;
 	mcp->cur_i2c_clk_div =3D (12000000 / (i2c_clk_freq * 1000)) - 3;
+	ret =3D mcp_set_i2c_speed(mcp);
+	if (ret) {
+		hid_err(hdev, "can't set i2c speed: %d\n", ret);
+		return ret;
+	}
=20
 	mcp->adapter.owner =3D THIS_MODULE;
 	mcp->adapter.class =3D I2C_CLASS_HWMON;
--=20
2.42.0


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B207D60A9
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 05:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbjJYDzm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 23:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbjJYDzk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 23:55:40 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B123C0
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 20:55:38 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CDC1D2C08C9;
        Wed, 25 Oct 2023 16:55:36 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698206136;
        bh=w6roZGHMb0LOJxdVMG+K5YrKTIEQmrJ1Sow/7D1pHGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EU4IE1Sst4kQR7sBGOifbRQZsc59YAPS/8kIVqTiOqUC2LgIG7Ur3P3kTxhmBst/a
         n3MvSHpYlPimpoEqdVL5pjwwFAuaqOJU2Dn9WMXYHz4Zfh6lzaGwPFs9BB5WxWlSLR
         mthwJtBA1ZxKFeZfVMQQ3NcSmCVcpgg/t0hggthKVNxVFzMETt+g+Cs5eotbEc2i+0
         +hb6Qj4NdI3H2Nuf7shItTIqquFsbAj0RvxW+f6uXsB4an73KRJ89NMBALlPj+h5Zc
         +A05B9PFtYtL59Z/jnTrywDC5+Z3H85Bul3gUBLZT26J8Ax2HZkrjL+HYgeQ1BckUB
         598xhOMVg3Zxw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653891b80000>; Wed, 25 Oct 2023 16:55:36 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.11])
        by pat.atlnz.lc (Postfix) with ESMTP id 9532F13EDA9;
        Wed, 25 Oct 2023 16:55:36 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 93835242FEC; Wed, 25 Oct 2023 16:55:36 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     gupt21@gmail.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        Enrik.Berkhan@inka.de, sven.zuehlsdorf@vigem.de
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 5/5] HID: mcp2221: Handle reads greater than 60 bytes
Date:   Wed, 25 Oct 2023 16:55:14 +1300
Message-ID: <20231025035514.3450123-6-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
References: <20231025035514.3450123-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=9W1-fauBzXCwDuBwIPUA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When a user requests more than 60 bytes of data the MCP2221 must chunk
the data in chunks up to 60 bytes long (see command/response code 0x40
in the datasheet).
In order to signal that the device has more data the (undocumented) byte
at byte index 2 of the Get I2C Data response uses the value 0x54. This
contrasts with the case for the final data chunk where the value
returned is 0x55 (MCP2221_I2C_READ_COMPL). The fact that 0x55 was not
returned in the response was interpreted by the driver as a failure
meaning that all reads of more than 60 bytes would fail.

Add support for reads that are split over multiple chunks by looking for
the response code indicating that more data is expected and continuing
the read as the code intended. Some timing delays are required to ensure
the chip has time to refill its FIFO as data is read in from the I2C
bus. This timing has been tested in my system when configured for bus
speeds of 50KHz, 100KHz, and 400KHz and operates well.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/hid/hid-mcp2221.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index d0dd14cb4156..f9cceaeffd08 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -49,6 +49,7 @@ enum {
 	MCP2221_I2C_MASK_ADDR_NACK =3D 0x40,
 	MCP2221_I2C_WRADDRL_SEND =3D 0x21,
 	MCP2221_I2C_ADDR_NACK =3D 0x25,
+	MCP2221_I2C_READ_PARTIAL =3D 0x54,
 	MCP2221_I2C_READ_COMPL =3D 0x55,
 	MCP2221_ALT_F_NOT_GPIOV =3D 0xEE,
 	MCP2221_ALT_F_NOT_GPIOD =3D 0xEF,
@@ -297,6 +298,7 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 {
 	int ret;
 	u16 total_len;
+	int retries =3D 0;
=20
 	mcp->txbuf[0] =3D type;
 	if (msg) {
@@ -320,20 +322,31 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
 	mcp->rxbuf_idx =3D 0;
=20
 	do {
+		/* Wait for the data to be read by the device */
+		usleep_range(980, 1000);
+
 		memset(mcp->txbuf, 0, 4);
 		mcp->txbuf[0] =3D MCP2221_I2C_GET_DATA;
=20
 		ret =3D mcp_send_data_req_status(mcp, mcp->txbuf, 1);
-		if (ret)
-			return ret;
-
-		ret =3D mcp_chk_last_cmd_status_free_bus(mcp);
-		if (ret)
-			return ret;
-
-		usleep_range(980, 1000);
+		if (ret) {
+			if (retries < 5) {
+				/* The data wasn't ready to read.
+				 * Wait a bit longer and try again.
+				 */
+				usleep_range(90, 100);
+				retries++;
+			} else {
+				return ret;
+			}
+		} else {
+			retries =3D 0;
+		}
 	} while (mcp->rxbuf_idx < total_len);
=20
+	usleep_range(980, 1000);
+	ret =3D mcp_chk_last_cmd_status_free_bus(mcp);
+
 	return ret;
 }
=20
@@ -799,7 +812,8 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				mcp->status =3D -EIO;
 				break;
 			}
-			if (data[2] =3D=3D MCP2221_I2C_READ_COMPL) {
+			if (data[2] =3D=3D MCP2221_I2C_READ_COMPL ||
+			    data[2] =3D=3D MCP2221_I2C_READ_PARTIAL) {
 				buf =3D mcp->rxbuf;
 				memcpy(&buf[mcp->rxbuf_idx], &data[4], data[3]);
 				mcp->rxbuf_idx =3D mcp->rxbuf_idx + data[3];
--=20
2.42.0


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFED952D2FB
	for <lists+linux-i2c@lfdr.de>; Thu, 19 May 2022 14:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238133AbiESMum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 May 2022 08:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238164AbiESMuk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 May 2022 08:50:40 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD258BA57A;
        Thu, 19 May 2022 05:50:31 -0700 (PDT)
Date:   Thu, 19 May 2022 12:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wujek.eu;
        s=protonmail2; t=1652964628; x=1653223828;
        bh=+6dbY/snU3b6uCWUgyekqmraArOZDE0O1Do6Z1g28TA=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=M9q70UMjUe+S50Y/XwA+mERO7Nex8c1Hfssapd9f1q2X5Y8u1lPglwRW4oiT6eSkW
         XZCXD+90cYbj6MNmAV/e6yY+kIvzw+IqHoNNcBTn8tvm/Ndczy5zpr483sxcdQR2vk
         0Onx+5I5Dw5zMO4jwGh9OvMeF3sZ1gfhko4sPMjczBMmT8qHjV5mYuZ5av7p/yE++C
         Cd8C3caxWD5msQw+QTk79j0wbYqIbky4Pet2Y/+71TXc586ADxOC5L9jGKYzUfo0Zn
         3MlrvVHS6XDpzH0Lk8QUhjmPZanmRUt63X5zNFKRomF/uaNDv3J+BUvxBUzZx1tj5h
         +cBxBPZDJr1sw==
From:   Adam Wujek <dev_public@wujek.eu>
Cc:     Adam Wujek <dev_public@wujek.eu>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Adam Wujek <dev_public@wujek.eu>
Subject: [PATCH] i2c: busses: i2c-cadence: fix message length when receive block message
Message-ID: <20220519124946.387373-1-dev_public@wujek.eu>
Feedback-ID: 23425257:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Needed by hwmon/pmbus_core driver to correctly calculate PEC.
The hwmon/pmbus_core driver relies on bus drivers to update the message len=
gth
of received block transfers. Only in this type of smbus transfer, in which =
the
length is not known before the transfer is started.

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
---
 drivers/i2c/busses/i2c-cadence.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cade=
nce.c
index 20ac432a37ea..65f1979d4e6f 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -830,6 +830,11 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, s=
truct i2c_msg *msg,
 =09=09return -ETIMEDOUT;
 =09}

+=09/* Update message len, as i2c/smbus driver (function
+=09 * i2c_smbus_xfer_emulated) relies on i2c device drivers to do this */
+=09if ((msg->flags & I2C_M_RECV_LEN) && (msg->flags & I2C_M_RD))
+=09=09msg->len =3D msg->buf[0] + 2; /* add len byte + PEC byte */
+
 =09cdns_i2c_writereg(CDNS_I2C_IXR_ALL_INTR_MASK,
 =09=09=09  CDNS_I2C_IDR_OFFSET);

--
2.17.1



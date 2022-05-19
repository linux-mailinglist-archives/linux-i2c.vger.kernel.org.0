Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDBA252E04E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 01:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245689AbiESXLl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 May 2022 19:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbiESXLk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 May 2022 19:11:40 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF18C3D3D
        for <linux-i2c@vger.kernel.org>; Thu, 19 May 2022 16:11:39 -0700 (PDT)
Date:   Thu, 19 May 2022 23:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wujek.eu;
        s=protonmail2; t=1653001892; x=1653261092;
        bh=s+PX3ttgd2pqhf/X4X6oI+ne2p0Lx6BzbzmdfFsmb+E=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=P0jXOg7xBd7b1w+1w+YFAYZXxdDQwSRLFCpOewLBpEudkFpgNttzjtSQSY2EjkW5d
         QyFb82nQWuwPzl+m1GsNkuMS1tCv9B3tMX67z3bVidP32RGGO33ELd5C2Qf42SAmJh
         xlNQGELN5h6FELEbPlIfGNSWjxYX7kB3ywt1L6fV4IEgvH5jV+mVeWVlTwDoXXrBll
         syIfjrDzkFg9sFFOPyqNXqPokR5IyL75nxM8HTq5KpSpx2h/vufvedK+sJGi2m9GR4
         VemUaFxIUHWWTRL4ZPpAi5u8utBWw0Is1SMvB3g/1mv55QvHfYHOESk/mBKXSxpBaf
         9SGNrfRmHFDLQ==
From:   Adam Wujek <dev_public@wujek.eu>
Cc:     Adam Wujek <dev_public@wujek.eu>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Adam Wujek <dev_public@wujek.eu>
Subject: [PATCH v2] i2c: busses: i2c-cadence: fix message length when receive block message
Message-ID: <20220519231058.437365-1-dev_public@wujek.eu>
In-Reply-To: <20220519124946.387373-1-dev_public@wujek.eu>
References: <20220519124946.387373-1-dev_public@wujek.eu>
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

Needed by hwmon/pmbus_core driver to calculate PEC correctly.
The hwmon/pmbus_core driver relies on bus drivers to update the message
length of receive block transfers. Only in this type of smbus transfer
the length is not known before the transfer is started.

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
---
Notes:
    Changes in v2:
    - fix multiline comment

 drivers/i2c/busses/i2c-cadence.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cade=
nce.c
index 805c77143a0f..a679eb390ef5 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -794,6 +794,13 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, s=
truct i2c_msg *msg,
 =09=09return -ETIMEDOUT;
 =09}

+=09/*
+=09 * Update message len, as i2c/smbus driver (function
+=09 * i2c_smbus_xfer_emulated) relies on i2c device drivers to do this.
+=09 */
+=09if ((msg->flags & I2C_M_RECV_LEN) && (msg->flags & I2C_M_RD))
+=09=09msg->len =3D msg->buf[0] + 2; /* add len byte + PEC byte */
+
 =09cdns_i2c_writereg(CDNS_I2C_IXR_ALL_INTR_MASK,
 =09=09=09  CDNS_I2C_IDR_OFFSET);

--
2.17.1



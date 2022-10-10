Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15DB45F974C
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Oct 2022 06:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiJJEJe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Oct 2022 00:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbiJJEJb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Oct 2022 00:09:31 -0400
X-Greylist: delayed 1724 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 09 Oct 2022 21:09:29 PDT
Received: from mailout.sugon.com (mailout.sugon.com [1.202.226.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791084D819;
        Sun,  9 Oct 2022 21:09:29 -0700 (PDT)
Received: from mailout.sugon.com (localhost [127.0.0.2] (may be forged))
        by mailout.sugon.com with ESMTP id 29A3ejZa027149;
        Mon, 10 Oct 2022 11:40:45 +0800 (GMT-8)
        (envelope-from tianye@sugon.com)
Received: from mailout.sugon.com ([10.0.100.187])
        by mailout.sugon.com with ESMTP id 29A3eP6o026605;
        Mon, 10 Oct 2022 11:40:25 +0800 (GMT-8)
        (envelope-from tianye@sugon.com)
Received: from pt.sugon.com ([10.0.100.52])
          by mailout.sugon.com (IBM Domino Release 9.0.1FP10 HF383)
          with ESMTP id 2022101011402467-632533 ;
          Mon, 10 Oct 2022 11:40:24 +0800 
Received: from localhost.localdomain ([110.191.179.234])
          by pt.sugon.com (IBM Domino Release 9.0.1FP10 HF383)
          with ESMTP id 2022101011402379-336859 ;
          Mon, 10 Oct 2022 11:40:23 +0800 
From:   tianye@sugon.com
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tian Ye <tianye@sugon.com>
Subject: [PATCH] i2c: designware: slave should do WRITE_RECEIVED before SLAVE_STOP
Date:   Mon, 10 Oct 2022 11:40:15 +0800
Message-Id: <20221010034015.7526-1-tianye@sugon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on mail03/Dawning(Release 9.0.1FP10 HF383|November
 19, 2018) at 2022/10/10 11:40:24,
        Serialize by Router on mail03/Dawning(Release 9.0.1FP10 HF383|November 19, 2018) at
 2022/10/10 11:40:24,
        Itemize by SMTP Server on mailout/Dawning(Release 9.0.1FP10 HF383|November
 19, 2018) at 2022/10/10 11:40:24,
        Serialize by Router on mailout/Dawning(Release 9.0.1FP10 HF383|November 19, 2018) at
 2022/10/10 11:40:25,
        Serialize complete at 2022/10/10 11:40:25
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-DNSRBL: 
X-MAIL: mailout.sugon.com 29A3eP6o026605
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tian Ye <tianye@sugon.com>

Sometimes when designware slave receive 3byte in high speed mode:
0x1 STATUS SLAVE=5FACTIVITY=3D0x1 : RAW=5FINTR=5FSTAT=3D0x514 : INTR=5FSTAT=
=3D0x4
I2C=5FSLAVE=5FWRITE=5FREQUESTED
I2C=5FSLAVE=5FWRITE=5FRECEIVED
0x1 STATUS SLAVE=5FACTIVITY=3D0 : RAW=5FINTR=5FSTAT=3D0x714 : INTR=5FSTAT=
=3D0x204
I2C=5FSLAVE=5FWRITE=5FRECEIVED
I2C=5FSLAVE=5FSTOP
0x1 STATUS SLAVE=5FACTIVITY=3D0x1 : RAW=5FINTR=5FSTAT=3D0x514 : INTR=5FSTAT=
=3D0x4
I2C=5FSLAVE=5FWRITE=5FREQUESTED
I2C=5FSLAVE=5FWRITE=5FRECEIVED

When second slave interrupt occus:slave rx fifo receive two bytes and
stop interrupt occus at the same time.

Signed-off-by: Tian Ye <tianye@sugon.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses=
/i2c-designware-slave.c
index 0d15f4c1e9f7..801d84fa7e7d 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -158,6 +158,7 @@ static int i2c=5Fdw=5Firq=5Fhandler=5Fslave(struct dw=
=5Fi2c=5Fdev *dev)
 {
 	u32 raw=5Fstat, stat, enabled, tmp;
 	u8 val =3D 0, slave=5Factivity;
+	u32 rx=5Fvalid;
=20
 	regmap=5Fread(dev->map, DW=5FIC=5FENABLE, &enabled);
 	regmap=5Fread(dev->map, DW=5FIC=5FRAW=5FINTR=5FSTAT, &raw=5Fstat);
@@ -179,11 +180,14 @@ static int i2c=5Fdw=5Firq=5Fhandler=5Fslave(struct dw=
=5Fi2c=5Fdev *dev)
 					&val);
 		}
=20
-		regmap=5Fread(dev->map, DW=5FIC=5FDATA=5FCMD, &tmp);
-		val =3D tmp;
-		if (!i2c=5Fslave=5Fevent(dev->slave, I2C=5FSLAVE=5FWRITE=5FRECEIVED,
-				     &val))
-			dev=5Fvdbg(dev->dev, "Byte %X acked!", val);
+		regmap=5Fread(dev, DW=5FIC=5FRXFLR, &rx=5Fvalid);
+		for (; rx=5Fvalid > 0; rx=5Fvalid--) {
+			regmap=5Fread(dev->map, DW=5FIC=5FDATA=5FCMD, &tmp);
+			val =3D tmp;
+			if (!i2c=5Fslave=5Fevent(dev->slave, I2C=5FSLAVE=5FWRITE=5FRECEIVED,
+					     &val))
+				dev=5Fvdbg(dev->dev, "Byte %X acked!", val);
+		}
 	}
=20
 	if (stat & DW=5FIC=5FINTR=5FRD=5FREQ) {
--=20
2.25.1


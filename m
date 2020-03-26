Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97CF0194BB5
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 23:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgCZWof (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 18:44:35 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:54708 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCZWoe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 18:44:34 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 85ACB80237;
        Fri, 27 Mar 2020 11:44:30 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1585262670;
        bh=2Fu1F56pMbp3D0/7E20eRcBYY0hMFJhwaYQkwhroZrI=;
        h=From:To:Cc:Subject:Date;
        b=lUgyuUjL+nbCWsbxquejet2dDMzcwOwoPAzlVc4hupHxy4xdAJzW3/lw+BscH1JbU
         nb2FOTNMZbAAq/viRyeH9x5MlyjsVkqoV3zmsT3OwKxMZ9FgSPmSQZXVAFbPCOYZfk
         Qs9PIOF1pLjXBa07dMw3VUNMkDAKjXs99AQ+Rpw4e0kyb1ez1Q69lwR2hw7Zc7el3D
         icbk5pF9VXAz1BOU7rOGnmE3y/18YVsNVF6d7cLhW9IerGZXrJe1GmR0CQjDRxXORr
         8ytDoca9W48WOUmzsY/Hp3JxZIn+knj1GIX985icIkD+4XALPoIKYtFzGsq5Zgo8bH
         84f90qhbmojZQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e7d304a0000>; Fri, 27 Mar 2020 11:44:28 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id DFD1E13EEB7;
        Fri, 27 Mar 2020 11:44:27 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 07E7928006C; Fri, 27 Mar 2020 11:44:28 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@the-dreams.de, allison@lohutok.net, info@metux.net,
        linus.walleij@linaro.org, tglx@linutronix.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: pca-platform: Use platform_irq_get_optional
Date:   Fri, 27 Mar 2020 11:44:22 +1300
Message-Id: <20200326224422.31063-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The interrupt is not required so use platform_irq_get_optional() to
avoid error messages like

  i2c-pca-platform 22080000.i2c: IRQ index 0 not found

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-pca-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i=
2c-pca-platform.c
index a7a81846d5b1..635dd697ac0b 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -140,7 +140,7 @@ static int i2c_pca_pf_probe(struct platform_device *p=
dev)
 	int ret =3D 0;
 	int irq;
=20
-	irq =3D platform_get_irq(pdev, 0);
+	irq =3D platform_get_irq_optional(pdev, 0);
 	/* If irq is 0, we do polling. */
 	if (irq < 0)
 		irq =3D 0;
--=20
2.25.1


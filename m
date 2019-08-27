Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A9C9F119
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2019 19:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbfH0RFG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Aug 2019 13:05:06 -0400
Received: from mout.gmx.net ([212.227.15.19]:39457 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbfH0RFG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 27 Aug 2019 13:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566925496;
        bh=iHML+3J8Gz/ZoXa55rWlvuO5gxBAoQS0ShcVMHMoF+8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QIRU5LXEtpLxXDh5f4Tu8sKtaz3KCIFtqmFhU+C3bPOjwrcWwow6Wc6s5ei1cnDtZ
         kUQkf4QjjnqV9oVJec58sB0ERMGW9/V7NKmaW+OwfKU/y5Kw+zLqiOpcHtLnFh9xVq
         jT0owZ1x7wI289IWT+BlBVbjqyT7Sr7HinEjsLiQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MIuSH-1i4aq91kQD-002VXu; Tue, 27 Aug 2019 19:04:56 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Wolfram Sang <wsa@the-dreams.de>, Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 3/3] i2c: bcm2835: Add full name of devicetree node to adapter name
Date:   Tue, 27 Aug 2019 19:04:16 +0200
Message-Id: <1566925456-5928-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
References: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:aZYCnrYSUMa259o8XUY7VioHSFgAqtazTRKuK29qv+dxx4hlcWX
 y3W507fuap5c14ulqH8+mdcazpaWUShLGhu5I+k3ayg7Kwoh7HYWFfozjn8mihWipo166EI
 sUBCS75QNwWoMNgYORuMcxPV+Dn5tm0Y7xWcykJe1Zi1SuSiU7hpl+zB5HuF4UkmsxJqziI
 PbIK5Dh6YDWo5TU9CDaTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:te8ExPthDRw=:+1A4+agapq1RX9Pb4knZFi
 qgN1IUfIiJsvYeSE8DMBA8l0KJSLd+o1+EEXGa+8GzeEIt2RfBv5v3wOCa3XP8ZXmkpfkYU8+
 lgLZYAwxhMW0DhiksWtRhvlrl75myih6YgU3aUlPG3S4Fm6P9mfTKztTnQBI/6ntTIRcPJZ+5
 0yScBSID09fHIZfAyRNCnC/SUyaOiLMzPHz2cFD7ueXU2341JDvwTl8y6ugw2L0SBLw4SSgoP
 beOMXtp264Ki9CDjCLSHImUUR+yluM5uXZiwZXbZCpnmG1BgUM4/uSSVhjN3tJVlla9bC6M7m
 1h+dNnTojqAncg9Pn6ErKpPW1G8KLUb3pjoFNT8o0KbDtCuj98TUS5DkPzT9fjvFxdhpdtxzc
 Jrl6dwMDHbDhlWpxmoyRNBXSIbRE3STl6aOeNwFQJboWckHQ3parW1ZHQrz2o5Tf9KuN8aQqm
 BT+0EQsfLrNPdneD0LUug90psobgLYLzm4GTbkizSHT4GqIJ+0slyN+mVBxKeGIlHC6Mjss8X
 Tk65u4vHp49mjI3afTl6+bViCiAlncVm/obV0GY0bP6/UJnrbm7yNPUduKSjx0laU4FW7OD/W
 Mgo/C0eSZ5K4yC+CHYZLI/HvXSTzJP07dzTgDqiQHRI5NzE9fDe4olBbw/Erdcw+K/TyUomyJ
 gpEfJrpDMm1t2hgvGHUCBTYTo6OmpJ3tjqOn81f1dvrdVdFYAjaARoAGSTTdrhlj0FFT9U3Er
 CckhZybyO5x+OdAuCO/pJjPFAMdMvo84sHWX3IjNus9Lu+zO/SvdjbHeTZ98GexWDGsCZNcjw
 eIjhq0KGqruQn9K7eEfyt5cU5wwoO+TgFaNRoaCZZ41tGdBoIGzEFHozh1fxFr+hyhBrlq7MB
 JzG24VMXCf0DturZZ8AmIjQWwvBV8w9kSONe294TQAMzlqKpWastQOoIKJXDJpyLbskl+UM/Y
 KX8U0bAyWP7fanIERSmYAUU+EajnbUNjzX0ir8pvUsfosPiVLDJAUFMTRRzton2ZuTcnKEjOI
 Oec9ixThaaW0jTF9cTgsYBz4MZe1ksw3o71tU3jc4+J6rqKjNYMSvjU0TLY3AfK3HI7BHhhx1
 jYrnYKcGffNkLfoig7Tt+ScnyD33xir8nxt4aF2ZKDHie4XMnhAw1hjig==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Inspired by Lori Hikichi's patch for iproc, this adds the full name of
the devicetree node to the adapter name. With the introduction of
BCM2711 it's very difficult to distinguish between the multiple instances.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/i2c/busses/i2c-bcm2835.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm=
2835.c
index ab5502f..e01b2b5 100644
=2D-- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -472,7 +472,8 @@ static int bcm2835_i2c_probe(struct platform_device *p=
dev)
 	i2c_set_adapdata(adap, i2c_dev);
 	adap->owner =3D THIS_MODULE;
 	adap->class =3D I2C_CLASS_DEPRECATED;
-	strlcpy(adap->name, "bcm2835 I2C adapter", sizeof(adap->name));
+	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
+		 of_node_full_name(pdev->dev.of_node));
 	adap->algo =3D &bcm2835_i2c_algo;
 	adap->dev.parent =3D &pdev->dev;
 	adap->dev.of_node =3D pdev->dev.of_node;
=2D-
2.7.4


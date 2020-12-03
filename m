Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858952CDA00
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 16:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgLCPRv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 10:17:51 -0500
Received: from ns.omicron.at ([212.183.10.25]:39600 "EHLO ns.omicron.at"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbgLCPRv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 10:17:51 -0500
X-Greylist: delayed 844 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Dec 2020 10:17:50 EST
Received: from MGW02-ATKLA.omicron.at ([172.25.62.35])
        by ns.omicron.at (8.15.2/8.15.2) with ESMTPS id 0B3F34cq011728
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-i2c@vger.kernel.org>; Thu, 3 Dec 2020 16:03:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 ns.omicron.at 0B3F34cq011728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=omicronenergy.com;
        s=default; t=1607007784;
        bh=HlWDWQ04kzeXCYeEpumkCowKMmUm5szm+mKDK3bWOOE=;
        h=From:To:CC:Subject:Date:From;
        b=KEt+zVQ5juvbGSA0RoCSyxlOjQN1QhLrsB8pl/Sok/kQ2N4BhgkIi6Gi8vQgDCRex
         NDy1Zt70ArYLDJN+MX2DFt7IXqkwgwE6TDVenGdyE/TTokGGNxxiD0fCm98LA3DN14
         H5/Hp0YHwWTk0MhxrXTjgQgmA8vuZHPD7pkT07OE=
Received: from MGW02-ATKLA.omicron.at (localhost [127.0.0.1])
        by MGW02-ATKLA.omicron.at (Postfix) with ESMTP id 343D8A0072
        for <linux-i2c@vger.kernel.org>; Thu,  3 Dec 2020 16:03:04 +0100 (CET)
Received: from MGW01-ATKLA.omicron.at (unknown [172.25.62.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by MGW02-ATKLA.omicron.at (Postfix) with ESMTPS id F1837A0068
        for <linux-i2c@vger.kernel.org>; Thu,  3 Dec 2020 16:03:03 +0100 (CET)
Received: from EXC03-ATKLA.omicron.at ([172.22.100.188])
        by MGW01-ATKLA.omicron.at  with ESMTP id 0B3F34eL005112-0B3F34eN005112
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL);
        Thu, 3 Dec 2020 16:03:04 +0100
Received: from stelas00wl02.omicron.at (172.22.24.86) by
 EXC03-ATKLA.omicron.at (172.22.100.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 16:03:02 +0100
From:   =?UTF-8?q?Stefan=20L=C3=A4sser?= <stefan.laesser@omicronenergy.com>
To:     <peter@korsgaard.com>
CC:     <andrew@lunn.ch>, <linux-i2c@vger.kernel.org>,
        =?UTF-8?q?Stefan=20L=C3=A4sser?= <stefan.laesser@omicronenergy.com>
Subject: [PATCH] i2c: ocores: Avoid false-positive error log message.
Date:   Thu, 3 Dec 2020 16:02:52 +0100
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [172.22.24.86]
X-ClientProxiedBy: EXC03-ATKLA.omicron.at (172.22.100.188) To
 EXC03-ATKLA.omicron.at (172.22.100.188)
Message-ID: <6185f3fc-35ed-4de2-8bf7-fb991555580c@EXC03-ATKLA.omicron.at>
X-FE-Policy-ID: 1:1:1:SYSTEM
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since commit 7723f4c5ecdb ("driver core: platform: Add an error message t=
o
platform_get_irq*()"), platform_get_irq() will call dev_err() on an error=
.
In case of i2c ocores this leads to a false-positive error being logged:

[ 4.173989] 007: ocores-i2c ocores-i2c: IRQ index 0 not found

i2c ocores already handles the case when the IRQ cannot be found and
therefore there is no benefit in having this error message being logged.

This commit switches to platform_get_irq_optional(), which does not log
in case the IRQ cannot be found.

Signed-off-by: Stefan L=C3=A4sser <stefan.laesser@omicronenergy.com>
---
 drivers/i2c/busses/i2c-ocores.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-oco=
res.c
index a97cbaabd..273222e38 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -682,7 +682,7 @@ static int ocores_i2c_probe(struct platform_device *p=
dev)
=20
 	init_waitqueue_head(&i2c->wait);
=20
-	irq =3D platform_get_irq(pdev, 0);
+	irq =3D platform_get_irq_optional(pdev, 0);
 	/*
 	 * Since the SoC does have an interrupt, its DT has an interrupt
 	 * property - But this should be bypassed as the IRQ logic in this
--=20
2.25.1


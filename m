Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3D435FDD9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233412AbhDNWeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:34:18 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42405 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbhDNWeI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:34:08 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D8331806A8;
        Thu, 15 Apr 2021 10:33:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618439624;
        bh=Rf6OJrdsK2JWznpN19KSH6KRlgBOD4HiuC1YoSencj0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=vSaUXzBJoQvGm4524qbLTVEVjXUlqOeekV796BE6ozzTodCCKHOzUsZiVVuD1ZMKk
         AMziHrUKOFhqK1NvYWqGT1AaRlVmBPL6AdSGDCW0IPZeOUjwMCj814A+8D86X5VUq5
         PVpdZHw81qoLsaifYd6NmeEQDnQCcFBP01BPdmrE/O5d4fjphf7nFcnIpgDmoeNuS+
         zkHFxuOM/UDSaeBBK1Mm26rUxYwMHpakCRC2I7xosfwrbz5WMyTGBs6O+GY99W2DvU
         iPhr2akkLQlmB4lBUYtaPXdos731NCrCAIolucI9gNzqF3VjLR9jGHHSKauxHdp7KH
         P2CTlHf4fl9tA==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60776dc80000>; Thu, 15 Apr 2021 10:33:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 572E313EEED;
        Thu, 15 Apr 2021 10:34:05 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id B3BF928945B; Thu, 15 Apr 2021 10:33:44 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 6/6] i2c: mpc: Drop duplicate message from devm_platform_ioremap_resource()
Date:   Thu, 15 Apr 2021 10:33:25 +1200
Message-Id: <20210414223325.23352-7-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
References: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=twOyDPGeZ73IQfhE1VoA:9 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

devm_platform_ioremap_resource() prints a message in case of error.
Drop custom one.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 7a9abeeb6da0..30d9e89a3db2 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -711,10 +711,8 @@ static int fsl_i2c_probe(struct platform_device *op)
 	spin_lock_init(&i2c->lock);
=20
 	i2c->base =3D devm_platform_ioremap_resource(op, 0);
-	if (IS_ERR(i2c->base)) {
-		dev_err(i2c->dev, "failed to map controller\n");
+	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
-	}
=20
 	i2c->irq =3D platform_get_irq(op, 0);
 	if (i2c->irq < 0)
--=20
2.31.1


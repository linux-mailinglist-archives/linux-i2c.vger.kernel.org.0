Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF96421162E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 00:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgGAWj3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 18:39:29 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:47126 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgGAWj2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jul 2020 18:39:28 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9104E8066C;
        Thu,  2 Jul 2020 10:39:25 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1593643165;
        bh=XOd3RqAUK0HBEktw78iETxnsAIeZRaLFIqsEsFjCVc0=;
        h=From:To:Cc:Subject:Date;
        b=mUSxAdltir2ZdBOVEZrUgKtyR9UslVDksYpYoDJxlpOQz4p/Q9/ub1af8KyObSACD
         FN/GPSjAxkdJ12Pva2Ly3rwAtffyfsB7+v7uVBm9ycnwjtvd7287s/futX/3YFlZ+B
         msJ6Wzo+6CM/KGEmC59TEhJ2U/3TRCtCnP8KXj1bilX0a6JAMS+xTCQ0tJ1aWRmC5B
         lfBQVeflHmVLQqF4MCl9TO4kocZfyz0ikDoIVLvzsJsbIpugEfVU82f23NzmabgvPo
         Z0cymIBkpzr2VZSI+FYya/I6HQm9f2SyOYR9KNgJ1gYuzuu/fKBz/d1v2SM3mTQdht
         gmtYBT2fd9g4g==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5efd109d0000>; Thu, 02 Jul 2020 10:39:25 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id CCCBA13EDDC;
        Thu,  2 Jul 2020 10:39:23 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 4C734280081; Thu,  2 Jul 2020 10:39:25 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com
Cc:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] i2c: algo-pca: Add 0x78 as SCL stuck low status
Date:   Thu,  2 Jul 2020 10:39:11 +1200
Message-Id: <20200701223912.30864-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PCA9665 datasheet says that I2CSTA =3D 78h indicates that SCL is stuc=
k
low, this differs to the PCA9564 which uses 90h for this indication.
Treat either 0x78 or 0x90 as an indication that the SCL line is stuck.

Based on looking through the PCA9564 and PCA9665 datasheets this should
be safe for both chips. The PCA9564 should not return 0x78 for any valid
state and the PCA9665 should not return 0x90.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- Note which status corresponds to which chip
- Move patch commentary to commit message

 drivers/i2c/algos/i2c-algo-pca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-alg=
o-pca.c
index 7f10312d1b88..388978775be0 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -314,7 +314,8 @@ static int pca_xfer(struct i2c_adapter *i2c_adap,
 			DEB2("BUS ERROR - SDA Stuck low\n");
 			pca_reset(adap);
 			goto out;
-		case 0x90: /* Bus error - SCL stuck low */
+		case 0x78: /* Bus error - SCL stuck low (PCA9665) */
+		case 0x90: /* Bus error - SCL stuck low (PCA9564) */
 			DEB2("BUS ERROR - SCL Stuck low\n");
 			pca_reset(adap);
 			goto out;
--=20
2.27.0


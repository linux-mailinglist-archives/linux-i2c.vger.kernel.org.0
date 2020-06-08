Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F881F1ACD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jun 2020 16:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbgFHORo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jun 2020 10:17:44 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:49198 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgFHORo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jun 2020 10:17:44 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058ECLHI123298;
        Mon, 8 Jun 2020 14:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Mi5asG7r6LkYoD6DMG4zoOsefe0b2UM8z//tnyQuesQ=;
 b=S3zukJO8qon2yVqVGjEehnO3tgzyzJ8gv2FwZ4yJCRjnSQUYSvVDKDPiWVmkYXkxadjY
 JXaIBkxSWC/Eg0hxrhRHxvQNUbol3EqLdvPAutZhbQpbsfW0wgnbL54dcitrdna9Vdml
 PyPZk7EPggSxo+vUZIKZzU7SCUPgHCTzrWn0wYUbfaYuudxwb6Mz9pb/VZdrs+If3clj
 MdnFpi+Acut8FoewxLRf5CbFUJfgzxJse4vew+XSPlXH3+OF8wCLvZCDWI/KsC69oLY1
 TkWgniKrnbYLX4EE3GrnIrD0eaVbTIJruSx39XVmIUmSZmtJEFxBAyuZsCTefJSHXuzL tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 31g3smq1nf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 08 Jun 2020 14:17:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058EHcmv030073;
        Mon, 8 Jun 2020 14:17:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 31gn2v9ear-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Jun 2020 14:17:38 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 058EHX2k004779;
        Mon, 8 Jun 2020 14:17:33 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 08 Jun 2020 07:17:32 -0700
Date:   Mon, 8 Jun 2020 17:17:27 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry1@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: npcm7xx: Fix a couple error codes in probe
Message-ID: <20200608141727.GC1912173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 cotscore=-2147483648 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080105
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The code here is accidentally returning IS_ERR() which is 1 but it
should be returning negative error codes with PTR_ERR().

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index a8e75c3484f12..d679a04be0fd0 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2239,12 +2239,12 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 
 	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
 	if (IS_ERR(gcr_regmap))
-		return IS_ERR(gcr_regmap);
+		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
 
 	clk_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk");
 	if (IS_ERR(clk_regmap))
-		return IS_ERR(clk_regmap);
+		return PTR_ERR(clk_regmap);
 
 	bus->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->reg))
-- 
2.26.2


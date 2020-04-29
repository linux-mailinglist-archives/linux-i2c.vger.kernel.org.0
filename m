Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A879A1BDD7B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 15:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgD2NXl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 09:23:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44054 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgD2NXk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 09:23:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TDNJ3g138357;
        Wed, 29 Apr 2020 13:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=tNRNdLBshIc6ibNJ1XgsnMCjX7602JFV2oQLAaX80FU=;
 b=UCjcj1f4tVDHwIl2/HZuQdGfQJkzSr0qjcFu84YMu/B7cs7lGDh251m/8naRxdrb8Rnu
 0ZUNVzSPPodkfpUKY8Atzw6QCH6IhNRF8VbZJBkG4BUxk2NVuuiXtWCf4/MeVy9T3jSi
 GzV+Q3p9wXYLsbb0PDJPFgV+6fyawMIfikQWN7UFkf4WOA3hFnsMh96XVePJ1Qe81n0x
 pK9Ox4xg62dzLazilzNZxemRJNg6Fg2cEeFuhm/lfuPDeG5lV3Dwrlu/LNJyLJYNjQcY
 fJmVlFii2x8YQlZED4piGSMFI+tY+Ola6MPYviu0Oz6PM6wNLi19gfjinRvj/4At3l9/ 9w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 30p2p0b3ht-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Apr 2020 13:23:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TDN4Ej026942;
        Wed, 29 Apr 2020 13:23:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 30my0gwqja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Apr 2020 13:23:32 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03TDNUAU031565;
        Wed, 29 Apr 2020 13:23:31 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 29 Apr 2020 06:23:30 -0700
Date:   Wed, 29 Apr 2020 16:23:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Alain Volmat <alain.volmat@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: stm32f7: prevent array underflow in
 stm32f7_get_lower_rate()
Message-ID: <20200429132323.GB815283@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=787 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=836 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004290113
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We want to break with "i" set to zero whether we find the rate we want
or not.  In the current code, if we don't find the rate we want then it
exits the loop with "i" set to -1 and results in an array underflow.

Fixes: 09cc9a3bce91 ("i2c: stm32f7: allows for any bus frequency")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 9c9e10ea91991..bff3479fe122a 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -607,7 +607,7 @@ static u32 stm32f7_get_lower_rate(u32 rate)
 {
 	int i = ARRAY_SIZE(stm32f7_i2c_specs);
 
-	while (i--)
+	while (--i)
 		if (stm32f7_i2c_specs[i].rate < rate)
 			break;
 
-- 
2.26.2


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261B613A22F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 08:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgANHeX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jan 2020 02:34:23 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:35940 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbgANHeX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jan 2020 02:34:23 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E7TEk6172803;
        Tue, 14 Jan 2020 07:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=UaGSgT1rbPoNIUsnFhw2dKGfxppFu6+AxAWorBNHUyQ=;
 b=UqX2RrbYPdbrG/nSi5qkg+qJTqYER8ULcgZLNlOWEWuPxvBtbUOu52kYpqZEZjan4ag6
 SPR1MVg6xKQQaWhlkpsaG3VJBJLexAthvvnAeg6AmmrhBmFxFCA3xG7odkRO3jXtn0Mh
 khq0j1BdIsRyN9vHsj//w32DiPRuZpYugEwSydTbtgku8HIGV2grRcS/ohZ4wJBQxwl7
 HYpiRQKJcT7bc3/bsoXkb7kjq5o9/AwzF/0K3C0u1D0Iu24bi7QGrbRbcpQRa8/2m/ZT
 mQ2dHv+oXSUrPP/CPVjqdin78wieHkKQp/UfbfII84oqI9xwTN5VwCz8WrmkTrvHzXB6 dQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2xf73tm0d9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 07:34:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E7TLZB188445;
        Tue, 14 Jan 2020 07:34:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2xh2sc29cu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 07:34:16 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00E7YEx9010906;
        Tue, 14 Jan 2020 07:34:14 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jan 2020 23:34:13 -0800
Date:   Tue, 14 Jan 2020 10:34:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <khali@linux-fr.org>,
        Daniel Kurtz <djkurtz@chromium.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>
Subject: [PATCH] i2c: i801: Fix memory corruption in i801_isr_byte_done()
Message-ID: <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000009586b2059c13c7e1@google.com>
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=100 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=100 mlxscore=100 mlxlogscore=-1000
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=100 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=100 clxscore=1011
 lowpriorityscore=0 mlxscore=100 impostorscore=0 mlxlogscore=-1000
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140065
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Assigning "priv->data[-1] = priv->len;" obviously doesn't make sense.
What it does is it ends up corrupting the last byte of priv->len so
priv->len becomes a very high number.

Reported-by: syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com
Fixes: d3ff6ce40031 ("i2c-i801: Enable IRQ for byte_by_byte transactions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested.

 drivers/i2c/busses/i2c-i801.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index f5e69fe56532..420d8025901e 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -584,7 +584,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 					"SMBus block read size is %d\n",
 					priv->len);
 			}
-			priv->data[-1] = priv->len;
 		}
 
 		/* Read next byte */
-- 
2.11.0


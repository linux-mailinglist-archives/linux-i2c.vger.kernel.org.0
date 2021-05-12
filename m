Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9150237B9FC
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 12:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhELKIK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 06:08:10 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:57468 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhELKIJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 06:08:09 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14CA4wTC038841;
        Wed, 12 May 2021 10:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=B87cQ4v584O4FkKMME8/ydpzY2YF2ebI54DuXW7Q3hU=;
 b=Wu/hN90Gvyakq80rxhZT/e/BJdSBSeWnTVtefzBwnfApkKt0+VZHXscPnQM/DJocuPov
 jxSfNk20c3/8LoshBvAEV6vlzWW3vkT7jgugereislcdbES0cP1tm2M6gSqkeC+Eb3lX
 mPGTMrXf32RnzyGuxvlYtgH7AA1wrF+OkKs0/7wP3PbnarfqptvbgCPRcreCyVxS+A0E
 0+wPju+7B/95WnTApKRrxxtVRU6VF3ONUmfrL5FMWJHiMIejlnYGE6SU4OoaJN+O0BBk
 W2ILCPQBS3l44Oqoc6gt9X/Z6DM8tJfWf2gS6sxUG/w4viWuDvjHdmKbpNBGkYzjXhsn Gg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 38dg5bhmeh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 10:06:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14CA03JJ144996;
        Wed, 12 May 2021 10:06:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 38fh3y3fpt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 10:06:56 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14CA3XP0151672;
        Wed, 12 May 2021 10:06:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 38fh3y3fpb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 10:06:55 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14CA6nno015543;
        Wed, 12 May 2021 10:06:49 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 May 2021 03:06:49 -0700
Date:   Wed, 12 May 2021 13:06:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: cp2615: check for allocation failure in
 cp2615_i2c_recv()
Message-ID: <YJuosd6rew91vlyX@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: 1FQy3zDaTtiup3iBQki8WvIuh2_OZWI4
X-Proofpoint-ORIG-GUID: 1FQy3zDaTtiup3iBQki8WvIuh2_OZWI4
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9981 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120072
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We need to add a check for if the kzalloc() fails.

Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-cp2615.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index 78cfecd1ea76..3ded28632e4c 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -138,17 +138,23 @@ cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
 static int
 cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
 {
-	struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
-	struct cp2615_i2c_transfer_result *i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;
 	struct usb_device *usbdev = interface_to_usbdev(usbif);
-	int res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev, IOP_EP_IN),
-			       msg, sizeof(struct cp2615_iop_msg), NULL, 0);
+	struct cp2615_iop_msg *msg;
+	struct cp2615_i2c_transfer_result *i2c_r;
+	int res;
+
+	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
 
+	res = usb_bulk_msg(usbdev, usb_rcvbulkpipe(usbdev, IOP_EP_IN), msg,
+			   sizeof(struct cp2615_iop_msg), NULL, 0);
 	if (res < 0) {
 		kfree(msg);
 		return res;
 	}
 
+	i2c_r = (struct cp2615_i2c_transfer_result *)&msg->data;
 	if (msg->msg != htons(iop_I2cTransferResult) || i2c_r->tag != tag) {
 		kfree(msg);
 		return -EIO;
-- 
2.30.2


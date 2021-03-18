Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3452340391
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 11:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhCRKj7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:39:59 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:51640 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhCRKjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 06:39:49 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IAYPZY034662;
        Thu, 18 Mar 2021 10:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=GD8WYS+iipNBOR8UEjBiCP0s/hMSdX/AjNN8eYeXovs=;
 b=NxtqH075myWPN900Z475TgFevSXeGtboWFXpON74LxUnlljtkQzj2VBeJC7XmO1aUxVO
 jjNWS317YoPc73bcB5QyULew+opWHbC9lHhcKiNWx1YJBiOMKNH6d45+/hoRO1ABbYbn
 mS5/hbbKkLxOvshONM4FcF8KGt/MBLwXjmm8fB6vE6jB7TSW77Z6Gr+ynz4aSYOS0/N3
 yj9BOupBah7PTCOTLMAc20ixdnpFNN2olFMaqusFdAqJq4s2gQZkHamC5aSzsP2lHkRx
 h2Di7ybTo+vJUf00KcJlOOFg8tHNscWPtsbvLLm8VYFknc/W7eOeJhe4q3sfZdB2B2rK sA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 37a4ekuygc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 10:39:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IAYm9G093049;
        Thu, 18 Mar 2021 10:39:43 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 3796yw1hw9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 10:39:43 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12IAdfl9017260;
        Thu, 18 Mar 2021 10:39:42 GMT
Received: from mwanda (/10.175.214.245)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Mar 2021 10:39:41 +0000
Date:   Thu, 18 Mar 2021 13:39:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Zaidman <michael.zaidman@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: ft260: fix an error message in ft260_i2c_write_read()
Message-ID: <YFMt5pml1voGQkUy@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180078
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180078
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "len" variable is uninitialize.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/hid-ft260.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 047aa85a7c83..a5751607ce24 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -512,7 +512,8 @@ static int ft260_i2c_write_read(struct ft260_device *dev, struct i2c_msg *msgs)
 	struct hid_device *hdev = dev->hdev;
 
 	if (msgs[0].len > 2) {
-		hid_err(hdev, "%s: unsupported wr len: %d\n", __func__, len);
+		hid_err(hdev, "%s: unsupported wr len: %d\n", __func__,
+			msgs[0].len);
 		return -EOPNOTSUPP;
 	}
 
-- 
2.30.2


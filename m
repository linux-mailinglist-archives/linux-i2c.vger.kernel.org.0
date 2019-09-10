Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE26FAEBC5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 15:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbfIJNm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 09:42:57 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57806 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729662AbfIJNm5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Sep 2019 09:42:57 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ADdMpt142058;
        Tue, 10 Sep 2019 13:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=7V+VdFIn8y25ib8MlIvJJ80pwNpoFE00wXWasKQu7qo=;
 b=Nd8j00KHKMmI5YnGcSmqFX6RLB4GjVZO6Dq/p9+Ki85VBDq7kHytkTczaEyPQdFf9XGA
 ZcjhwgeBjSOxNUgZQHOHJut+yjpetp7pDzO9BqZmIzEM+bwma6j43tONSe5lFE6uVrY6
 9LFWNHuL3tzTDkHg05giNh6ub8ciVHzSEJLNMge5e4rEgTOYfOGpj9HARQRMBllyvMl4
 RrPBQBCK45uHo+kheM4cb4Azcf71eLruTJfO9YXmasUm1vOYmT4EVfLkCKbW8f0DjXV5
 XJRyzIaFz8xpkL7jDioYEiKwmgSyPHP5zPsmQDlmIfhKR2IAHC84zaes2XNgvn1BCxNw pA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2uw1m8uh3w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Sep 2019 13:42:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ADc2fB166795;
        Tue, 10 Sep 2019 13:42:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2uwpjvu2e0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Sep 2019 13:42:51 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8ADgnOS013774;
        Tue, 10 Sep 2019 13:42:49 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 10 Sep 2019 06:42:49 -0700
Date:   Tue, 10 Sep 2019 16:42:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Elie Morisse <syniurge@gmail.com>
Cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init()
 error handling
Message-ID: <20190910134242.GA6620@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909100134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909100134
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The problem is that we dereference "privdata->pci_dev" when we print
the error messages in amd_mp2_pci_init():

	dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
		^^^^^^^^^^^^^^^^^

Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style change

 drivers/i2c/busses/i2c-amd-mp2-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index 5e4800d72e00..cd3fd5ee5f65 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -349,12 +349,12 @@ static int amd_mp2_pci_probe(struct pci_dev *pci_dev,
 	if (!privdata)
 		return -ENOMEM;
 
+	privdata->pci_dev = pci_dev;
 	rc = amd_mp2_pci_init(privdata, pci_dev);
 	if (rc)
 		return rc;
 
 	mutex_init(&privdata->c2p_lock);
-	privdata->pci_dev = pci_dev;
 
 	pm_runtime_set_autosuspend_delay(&pci_dev->dev, 1000);
 	pm_runtime_use_autosuspend(&pci_dev->dev);
-- 
2.20.1


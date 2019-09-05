Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD447AA527
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbfIEN5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:57:36 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:54976 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730739AbfIEN5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 09:57:36 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85DsiJZ006461;
        Thu, 5 Sep 2019 13:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=LgsLEuYSSuSxdyB1142Y9m/yvZ92hSXbjFvXb1lpSpg=;
 b=sIzrX7fgd+ZF3vbce1v1COWb+vs33vP0XRYr/dGsRRCqV0/8UedCgjS0u+VKM+qjzG9g
 Frd0nmwg7r/aIbjdN42agTUhgdRxJDPhgGuLHUp0xNJNPurYjElPyb2JoKH34lfYZ1bS
 ebtGK1RkXk0u4x9bDpo7V3EWUxxr30H/jrvKCwbr45fttKYG+8jFXe3RvPeIJ6u1Wsc9
 MXgqyym3svgEiOh2y6OH0FljRjFZicXu7EiEzmnVbLWggufOuqz/UQ55cSlm/Ne73mZY
 9ekBF+p3q5/SbpVmezJWE/vdyaBjgPQnXujGLLljmMLovczoP1e5CjHooPrsHfuRETwr aQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2uu3ks02am-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 13:57:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x85DbeTl025204;
        Thu, 5 Sep 2019 13:52:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2utpmb8crd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 13:52:27 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x85DqQTc029430;
        Thu, 5 Sep 2019 13:52:26 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Sep 2019 06:52:26 -0700
Date:   Thu, 5 Sep 2019 16:52:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Elie Morisse <syniurge@gmail.com>
Cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init() error
 handling
Message-ID: <20190905135219.GA29629@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050135
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
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index 5e4800d72e00..6bbc89d0bb27 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -349,13 +349,13 @@ static int amd_mp2_pci_probe(struct pci_dev *pci_dev,
 	if (!privdata)
 		return -ENOMEM;
 
+	mutex_init(&privdata->c2p_lock);
+	privdata->pci_dev = pci_dev;
+
 	rc = amd_mp2_pci_init(privdata, pci_dev);
 	if (rc)
 		return rc;
 
-	mutex_init(&privdata->c2p_lock);
-	privdata->pci_dev = pci_dev;
-
 	pm_runtime_set_autosuspend_delay(&pci_dev->dev, 1000);
 	pm_runtime_use_autosuspend(&pci_dev->dev);
 	pm_runtime_put_autosuspend(&pci_dev->dev);
-- 
2.20.1


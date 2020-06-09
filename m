Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE3D1F47E8
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 22:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389459AbgFIUQE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 16:16:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17018 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387513AbgFIUQD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 16:16:03 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059K33oJ076744;
        Tue, 9 Jun 2020 16:15:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31jgshgt09-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 16:15:59 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 059K3Pra078783;
        Tue, 9 Jun 2020 16:15:59 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31jgshgt05-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 16:15:59 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 059KFA60031981;
        Tue, 9 Jun 2020 20:15:58 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma03dal.us.ibm.com with ESMTP id 31hw1be6w6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 20:15:58 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 059KFvjX35324360
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 9 Jun 2020 20:15:57 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A6349AE062;
        Tue,  9 Jun 2020 20:15:57 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D6B34AE05F;
        Tue,  9 Jun 2020 20:15:56 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.141.69])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  9 Jun 2020 20:15:56 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        wsa@kernel.org, joel@jms.id.au, eajames@linux.ibm.com
Subject: [PATCH v2 1/2] i2c: fsi: Fix the port number field in status register
Date:   Tue,  9 Jun 2020 15:15:54 -0500
Message-Id: <20200609201555.11401-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200609201555.11401-1-eajames@linux.ibm.com>
References: <20200609201555.11401-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-09_13:2020-06-09,2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=1
 clxscore=1015 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006090148
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The port number field in the status register was not correct, so fix it.

Fixes: d6ffb6300116 ("i2c: Add FSI-attached I2C master algorithm")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index e0c256922d4f..977d6f524649 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -98,7 +98,7 @@
 #define I2C_STAT_DAT_REQ	BIT(25)
 #define I2C_STAT_CMD_COMP	BIT(24)
 #define I2C_STAT_STOP_ERR	BIT(23)
-#define I2C_STAT_MAX_PORT	GENMASK(19, 16)
+#define I2C_STAT_MAX_PORT	GENMASK(22, 16)
 #define I2C_STAT_ANY_INT	BIT(15)
 #define I2C_STAT_SCL_IN		BIT(11)
 #define I2C_STAT_SDA_IN		BIT(10)
-- 
2.24.0


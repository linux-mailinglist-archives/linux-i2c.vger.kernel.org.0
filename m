Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE2F1F47EB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 22:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgFIURE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 16:17:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17478 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726184AbgFIURC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 16:17:02 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059K36SE077027;
        Tue, 9 Jun 2020 16:17:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31jgshgtt5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 16:17:00 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 059K32Dd076741;
        Tue, 9 Jun 2020 16:17:00 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31jgshgtsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 16:17:00 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 059KF0sM015724;
        Tue, 9 Jun 2020 20:16:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma01dal.us.ibm.com with ESMTP id 31hygy4q1b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 20:16:59 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 059KFwqH52298132
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 9 Jun 2020 20:15:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A3E5EAE05C;
        Tue,  9 Jun 2020 20:15:58 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D3578AE05F;
        Tue,  9 Jun 2020 20:15:57 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.141.69])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  9 Jun 2020 20:15:57 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        wsa@kernel.org, joel@jms.id.au, eajames@linux.ibm.com
Subject: [PATCH v2 2/2] i2c: fsi: Prevent adding adapters for ports without dts nodes
Date:   Tue,  9 Jun 2020 15:15:55 -0500
Message-Id: <20200609201555.11401-3-eajames@linux.ibm.com>
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

Ports should be defined in the devicetree if they are to be enabled on
the system.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Changes since v1:
 - Remove the check for null device node since that is checked in
   of_device_is_available

 drivers/i2c/busses/i2c-fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 977d6f524649..10332693edf0 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -703,7 +703,7 @@ static int fsi_i2c_probe(struct device *dev)
 
 	for (port_no = 0; port_no < ports; port_no++) {
 		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
-		if (np && !of_device_is_available(np))
+		if (!of_device_is_available(np))
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-- 
2.24.0


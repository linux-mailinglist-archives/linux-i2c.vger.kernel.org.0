Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC831F1CD9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jun 2020 18:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbgFHQF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jun 2020 12:05:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63702 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730403AbgFHQFt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jun 2020 12:05:49 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 058G336T188781;
        Mon, 8 Jun 2020 12:05:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31g7a1br9e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 12:05:48 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058G3ESm189706;
        Mon, 8 Jun 2020 12:05:48 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31g7a1br91-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 12:05:48 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058FoHTJ017200;
        Mon, 8 Jun 2020 16:05:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma04dal.us.ibm.com with ESMTP id 31g2s9fyr7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 16:05:47 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 058G5i9e10879630
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 8 Jun 2020 16:05:44 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DD5BD6A047;
        Mon,  8 Jun 2020 16:05:45 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 839976A04D;
        Mon,  8 Jun 2020 16:05:45 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.140.245])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  8 Jun 2020 16:05:45 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        wsa@kernel.org, joel@jms.id.au, eajames@linux.ibm.com
Subject: [PATCH 2/2] i2c: fsi: Prevent adding adapters for ports without dts nodes
Date:   Mon,  8 Jun 2020 11:05:44 -0500
Message-Id: <20200608160544.7134-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200608160544.7134-1-eajames@linux.ibm.com>
References: <20200608160544.7134-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-08_14:2020-06-08,2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1 bulkscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0 cotscore=-2147483648
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006080115
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ports should be defined in the devicetree if they are to be enabled on
the system.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/busses/i2c-fsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 977d6f524649..95b6b6bc1d78 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -703,7 +703,12 @@ static int fsi_i2c_probe(struct device *dev)
 
 	for (port_no = 0; port_no < ports; port_no++) {
 		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
-		if (np && !of_device_is_available(np))
+		/* Do not add port if it is not described in the device tree */
+		if (!np)
+			continue;
+
+		/* Do not add port if it is described as disabled */
+		if (!of_device_is_available(np))
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-- 
2.24.0


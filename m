Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8457F24C31A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 18:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbgHTQNH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 12:13:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37698 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728047AbgHTQMK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Aug 2020 12:12:10 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07KG1f0l183742;
        Thu, 20 Aug 2020 12:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AEDHEnEMFCq6WcLhJaRCU/vTIJcXf+PF8oNl/WaRVNg=;
 b=tAmRLfwIVK6RKgCy1QrvQ1r47Y8r7QTXxSPVbeimlS5gCcTujN/yJyxT49ka1jRUJteQ
 4ghP9wOjaG+jLNy4QSXWHLaY5bErcc1kMWyga0Qg+PJ5/9L9/yWf8EeFz41HLbAhC8Em
 lDf8WKAGzTI/fSGqTUwKdADHOog586M5E6IZYIlb3aTxIL+jCfgwS49//cB8n7PFOt5I
 CVSxqu9QoNJBrNZ4wa6v+wwQq+NPj8VCome4TAEmeIHJR+JkNwUNIBgw9XkAYqHq0Se7
 XULeuf5McMikDZBGFzpaoaeuYlI0g7Yqp3+T9L46c3V/KqsZsKqAiywToYPhk1z+RxwC vg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3304rveygn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:12:02 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07KG1rYt184413;
        Thu, 20 Aug 2020 12:12:02 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3304rveyg2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:12:02 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KGAIbv008332;
        Thu, 20 Aug 2020 16:12:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma03wdc.us.ibm.com with ESMTP id 3304cedj9q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 16:12:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07KGC0r746072308
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Aug 2020 16:12:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 639C3112063;
        Thu, 20 Aug 2020 16:12:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 24EF7112061;
        Thu, 20 Aug 2020 16:11:59 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.70.74])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 20 Aug 2020 16:11:59 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, eajames@linux.ibm.com
Subject: [PATCH 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel I2C device
Date:   Thu, 20 Aug 2020 11:11:51 -0500
Message-Id: <20200820161152.22751-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200820161152.22751-1-eajames@linux.ibm.com>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-20_03:2020-08-19,2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=971 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200127
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Set I2C bus 0 to multi-master mode and add the panel device that will
register as a slave.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 5f4ee67ac787..9cf2e02ae9e2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -438,7 +438,13 @@ aliases {
 };
 
 &i2c0 {
+	multi-master;
 	status = "okay";
+
+	ibm-panel@62 {
+		compatible = "ibm,op-panel";
+		reg = <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */
+	};
 };
 
 &i2c1 {
-- 
2.26.2


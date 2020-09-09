Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD7A26376D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 22:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgIIUbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 16:31:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3208 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729521AbgIIUbS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 16:31:18 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 089K3SuW192887;
        Wed, 9 Sep 2020 16:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d9Z1A13gqnSeYufwW0KlPFsz/dAJdIaf05kQSmmHkvM=;
 b=GGgwBzEwN3+z5MOitz2EkkDvQaOjjGNWe8a+y3FiLh5qdOEybLp+e46QNn2c7G9Uo0Ek
 Zpbz0+CsH01gVKA8q56jvef+QRxYckWnfnmQVP7tS8MklvZxkMCvFPYdKT4wI/cTkvF2
 KbLIOtOrfoYJTk6Mmhr1X1PNRVH8wRVxScdhBSSjfIA3jLm49lwAe8Ku/D9iVx9KJNXC
 VqIWgk0Ah0SLfszGijIJtNLpFTluwawqPCAVKnDuuBKEr+6+373Pp98QHalP/hd0H1kX
 5C70eNjNCFZw+KyvQ0fO6QeUgkrawyNDGSbxVCzX7cGYnVVxDpdXFc3il/PeUHDWA9Vq Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f5hyh1va-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:06 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 089K48Cx195359;
        Wed, 9 Sep 2020 16:31:06 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f5hyh1uy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089KRrGF004239;
        Wed, 9 Sep 2020 20:31:05 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma01dal.us.ibm.com with ESMTP id 33d46mwgg1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 20:31:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 089KV38s62783994
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Sep 2020 20:31:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DDD2678067;
        Wed,  9 Sep 2020 20:31:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3729C7805F;
        Wed,  9 Sep 2020 20:31:03 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.76.239])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  9 Sep 2020 20:31:03 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com, joel@jms.id.au,
        andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v3 5/5] ARM: dts: Aspeed: Rainier: Add IBM Operation Panel I2C device
Date:   Wed,  9 Sep 2020 15:30:59 -0500
Message-Id: <20200909203059.23427-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909203059.23427-1-eajames@linux.ibm.com>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_16:2020-09-09,2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090173
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Set I2C bus 7 to multi-master mode and add the panel device that will
register as a slave.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index b94421f6cbd5..50d528444f5d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -4,6 +4,7 @@
 
 #include "aspeed-g6.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
 #include <dt-bindings/leds/leds-pca955x.h>
 
 / {
@@ -698,6 +699,7 @@ eeprom@53 {
 };
 
 &i2c7 {
+	multi-master;
 	status = "okay";
 
 	si7021-a20@20 {
@@ -831,6 +833,11 @@ gpio@15 {
 		};
 	};
 
+	ibm-panel@62 {
+		compatible = "ibm,op-panel";
+		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	dps: dps310@76 {
 		compatible = "infineon,dps310";
 		reg = <0x76>;
-- 
2.26.2


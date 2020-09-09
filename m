Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E84F263761
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 22:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgIIUbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 16:31:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29242 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729507AbgIIUbR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 16:31:17 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 089KPvDh168843;
        Wed, 9 Sep 2020 16:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SqjvAXXx1fPCQt7yw5ZJIgr9oRhHRTjfK5p05tTBMP0=;
 b=qPYVRxQOpK3p/NRhRiOwA5+3ix/Tn75LSrDtknL2YjJHvshqJe248bDgY6ekYvzodbZE
 8VLRRsVh8OIJVOSAv9nfURMfgM8ICG8OFivoFEfiNE7TNLOt+Y88JvixeFKVhEVWKbQP
 hUZ1nEnX0mqIryZLE96SMR34SnThXuCj38lUZdz6BCKlXLsKykULdFMQiz//zStNcXIH
 XZ+0qmKUJUYU3Zb7RkQR6Rl8bfiz/bNyrThaA1HWdTLPx2tzHILYJNSQE9j9MQp3K9bT
 0JQdgTg0RbD3chodt+hfoZG+6jmMblHtCuL9ziXQE8XJ7Z/pkKpyxT56qD2eeuR804g1 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f632r31p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:05 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 089KPqxo168361;
        Wed, 9 Sep 2020 16:31:05 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f632r30u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:05 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089KRARI026604;
        Wed, 9 Sep 2020 20:31:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03wdc.us.ibm.com with ESMTP id 33cebuxg7e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 20:31:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 089KV38u61669768
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Sep 2020 20:31:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 23A3E7805C;
        Wed,  9 Sep 2020 20:31:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7120578060;
        Wed,  9 Sep 2020 20:31:02 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.76.239])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  9 Sep 2020 20:31:02 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com, joel@jms.id.au,
        andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v3 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel I2C device
Date:   Wed,  9 Sep 2020 15:30:58 -0500
Message-Id: <20200909203059.23427-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909203059.23427-1-eajames@linux.ibm.com>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_16:2020-09-09,2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=1 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090178
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Set I2C bus 0 to multi-master mode and add the panel device that will
register as a slave.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 5f4ee67ac787..4d070d6ba09f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -4,6 +4,7 @@
 
 #include "aspeed-g6.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
 #include <dt-bindings/leds/leds-pca955x.h>
 
 / {
@@ -438,7 +439,13 @@ aliases {
 };
 
 &i2c0 {
+	multi-master;
 	status = "okay";
+
+	ibm-panel@62 {
+		compatible = "ibm,op-panel";
+		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 };
 
 &i2c1 {
-- 
2.26.2


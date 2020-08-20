Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4914324C318
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 18:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729874AbgHTQNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 12:13:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27756 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729474AbgHTQMJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Aug 2020 12:12:09 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07KG14bW119116;
        Thu, 20 Aug 2020 12:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=B/woJmbaBhftP0bFrk9uDS8GLJjz5yJGm5+afF2Vppo=;
 b=eo2PKQWLHbsSf32pn/d1DXhxM1lL9aB7XWwtC62V9FzeEJn8c/Z/Djs7OsZaEBMJTNQQ
 cxDiHBK3+kv8qLUqxDKJzutvP3v8hegLpbE3LzBLQN+9sXlmY8+a2RNkY3BePVV5kNZC
 b2eDrDaW3pTU6bnBR8xw87v9819P23fUSbx2wVCnPA0AoQP3l2xtgaGvlebRtSrT3zeZ
 eDLnJkXaWmV5sZjDJ26KbvZtV1lauuTLX3imTA3uSSIJJZzO7nXyI6djPzGb5vVOBXAI
 F1v2P09FpvGjvsLXt5ibImNj+hPS2YTaLhgi6mLpY/qU4r5/X+wORVsrBnhkDAjt3t5f 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 331tkwmhqk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:11:55 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07KG15Xx119151;
        Thu, 20 Aug 2020 12:11:55 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0b-001b2d01.pphosted.com with ESMTP id 331tkwmhq2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:11:55 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KGAhX3019319;
        Thu, 20 Aug 2020 16:11:54 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma04wdc.us.ibm.com with ESMTP id 3304uewejr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 16:11:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07KGBsb955509490
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Aug 2020 16:11:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F2920112062;
        Thu, 20 Aug 2020 16:11:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B9E09112061;
        Thu, 20 Aug 2020 16:11:52 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.70.74])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 20 Aug 2020 16:11:52 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, eajames@linux.ibm.com
Subject: [PATCH 0/5] input: misc: Add IBM Operation Panel driver
Date:   Thu, 20 Aug 2020 11:11:47 -0500
Message-Id: <20200820161152.22751-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-20_03:2020-08-19,2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=1 priorityscore=1501
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008200127
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds support for input from the IBM Operation Panel, which is
a simple controller with three buttons and an LCD display meant for
interacting with a server. It's connected over I2C. This series only
supports the input from the panel, in which the panel masters the I2C bus
and sends data to the host system when someone presses a button on the
controller.

Eddie James (5):
  dt-bindings: input: Add documentation for IBM Operation Panel
  input: misc: Add IBM Operation Panel driver
  i2c: aspeed: Mask IRQ status to relevant bits
  ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel I2C device
  ARM: dts: Aspeed: Rainier: Add IBM Operation Panel I2C device

 .../bindings/input/ibm,op-panel.yaml          |  38 ++++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   6 +
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |   6 +
 drivers/i2c/busses/i2c-aspeed.c               |   1 +
 drivers/input/misc/Kconfig                    |  10 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/ibm-panel.c                | 186 ++++++++++++++++++
 8 files changed, 255 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml
 create mode 100644 drivers/input/misc/ibm-panel.c

-- 
2.26.2


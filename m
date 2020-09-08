Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC6261F46
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732616AbgIHUB3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:01:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27316 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731677AbgIHUBZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 16:01:25 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 088JopEo010906;
        Tue, 8 Sep 2020 16:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xn6nJGYqn/typqBsa9jcxXMbsjRVqECLKkhpsnYOQRU=;
 b=JXEjim+dFUxGFgaqD5ICzxeME9JGXWTwsI5IsNZxvcGCJvKUiQW/+ee/UUt8caNsuqKg
 PfTne/4oIgP77mHLbgN38GXu/TjzK075bDWJLLDM1Q+XXE73GBsq0kZAnnUEnTKEByI7
 Sr+P3VcB8EnVCbnydUbpqFVX+zgoLs4A1xCAvCxKgRaanjOUsoPPj6wMFi5F3lA2Zv9u
 B0GkR3y9A8iGUxoR2jYmbnrZMLDWi4fE6ILb0VDKGpk39Gekhd1oFtYWC2Z/sOT4SfdE
 8C5R2K8R+Y5Cy9QZAkJL9L/cC43NGWDbaCLLT/wkPsd1XxFpGIkZC+EZ6gM8i2xRy38E AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33egfm06ye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:05 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088JpLC6012539;
        Tue, 8 Sep 2020 16:01:04 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33egfm06y1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:04 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088Jvbgb002969;
        Tue, 8 Sep 2020 20:01:04 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma01wdc.us.ibm.com with ESMTP id 33c2a8svvr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 20:01:04 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 088K0x3C49480070
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 8 Sep 2020 20:00:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1A3C16A05D;
        Tue,  8 Sep 2020 20:01:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 67E936A047;
        Tue,  8 Sep 2020 20:01:02 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.24.203])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  8 Sep 2020 20:01:02 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v2 0/5] input: misc: Add IBM Operation Panel driver
Date:   Tue,  8 Sep 2020 15:00:56 -0500
Message-Id: <20200908200101.64974-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-08_09:2020-09-08,2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 suspectscore=1 clxscore=1011 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080179
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds support for input from the IBM Operation Panel, which is
a simple controller with three buttons and an LCD display meant for
interacting with a server. It's connected over I2C, typically to a service
processor. This series only supports the input from the panel, in which the
panel masters the I2C bus and sends data to the host system when someone
presses a button on the controller.

Changes since v1:
 - Redo DTS documentation example to use I2C_OWN_SLAVE_ADDRESS
 - Reject commands received in the input driver that are too long
 - Add a definition for the interrupt status mask in the Aspeed I2C driver
 - Use I2C_OWN_SLAVE_ADDRESS for both dts additions

Eddie James (5):
  dt-bindings: input: Add documentation for IBM Operation Panel
  input: misc: Add IBM Operation Panel driver
  i2c: aspeed: Mask IRQ status to relevant bits
  ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel I2C device
  ARM: dts: Aspeed: Rainier: Add IBM Operation Panel I2C device

 .../bindings/input/ibm,op-panel.yaml          |  39 ++++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   7 +
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |   7 +
 drivers/i2c/busses/i2c-aspeed.c               |   2 +
 drivers/input/misc/Kconfig                    |  18 ++
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/ibm-panel.c                | 192 ++++++++++++++++++
 8 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml
 create mode 100644 drivers/input/misc/ibm-panel.c

-- 
2.26.2


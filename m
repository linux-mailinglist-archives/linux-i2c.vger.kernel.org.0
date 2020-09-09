Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC27F263770
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 22:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgIIUbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 16:31:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46918 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729692AbgIIUbS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 16:31:18 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 089K2nuj123598;
        Wed, 9 Sep 2020 16:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PuadrHvm0MnklWOLHSJCPokf4kHEQnujJ5UtCKe7LCo=;
 b=R8UFtztdS16r8HauU/G2TL3nT39oAyRKhhBF8l+uXw2m0E70CWXPgwhljliWy5lTw+Af
 dbGjuVB/RxIsUVcagoB666I0TBqy8qGQZ2FjITuL+yhGxMkyznYYXMPsMUv9397DJNQ1
 yvS8vHjYtNgUAZ9maKL2Gk6jFyBW3ALdsbgDYizgwtRtwR3QTzWxGIavJx/oqqb8NTRE
 zR4LT7xf8LF58nhGIZo6zSZ0mZ8+RLQ9muaD0Xk9QqL8GMAPYOeHT3ioGdh1Y7q4emAQ
 9SDqC2T+hl+kfiZzDXVT+slHNPcb9CtRJooaw5h/Pv8e6AtIDUlfbVt9qd9ddwNZnT8a 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f55khkk4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:06 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 089K338r124703;
        Wed, 9 Sep 2020 16:31:03 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f55khkjj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:03 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089KS1Af004301;
        Wed, 9 Sep 2020 20:31:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma01dal.us.ibm.com with ESMTP id 33d46mwgfd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 20:31:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 089KUtP141746762
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Sep 2020 20:30:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2EC5178063;
        Wed,  9 Sep 2020 20:31:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 834797805F;
        Wed,  9 Sep 2020 20:30:59 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.76.239])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  9 Sep 2020 20:30:59 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com, joel@jms.id.au,
        andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v3 0/5] input: misc: Add IBM Operation Panel driver
Date:   Wed,  9 Sep 2020 15:30:54 -0500
Message-Id: <20200909203059.23427-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_16:2020-09-09,2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1 bulkscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090178
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

Changes since v2:
 - Add "additionalProperties: false" to dts doc
 - Refactor switch statement in the input driver; check command size and call
   the processing function within the STOP case
 - Use a different definition name for Aspeed interrupt status mask

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

 .../bindings/input/ibm,op-panel.yaml          |  41 ++++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   7 +
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |   7 +
 drivers/i2c/busses/i2c-aspeed.c               |   2 +
 drivers/input/misc/Kconfig                    |  18 ++
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/ibm-panel.c                | 189 ++++++++++++++++++
 8 files changed, 272 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml
 create mode 100644 drivers/input/misc/ibm-panel.c

-- 
2.26.2


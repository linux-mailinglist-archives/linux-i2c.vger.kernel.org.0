Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96DB564F10F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 19:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbiLPShb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 13:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiLPSha (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 13:37:30 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636752B243;
        Fri, 16 Dec 2022 10:37:29 -0800 (PST)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGI8655015728;
        Fri, 16 Dec 2022 18:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id; s=pps0720;
 bh=JGznEBvqolHM8sVI9Mvu5DgoJw84DIiaRFIzqstSSpM=;
 b=VcaN4WrC700LnJDaF6SGnyKmcDA+zdINuvzMH1J9dKxCs/hAwm0RhuBkvA/q1/xFYMT2
 i7Tvv0z56ovZfkn3ei3sPJcTuiU2S8l//Z+2TLuFWMQSIE9yuKfvFAlwdCjD7LbyglTM
 FjTpe+wOWb7o2EGKbVXk2BZgMVvMbYLmJjOQ/CCczWUiBSE2rPnUM3cGRszrEDF84p4Q
 GGsY/cUWBE3Ja7Nk49V+C4XIRxgEfIaQHD4moof6TP8jCaGL1DV9pKwBU10rIA1PuLq3
 hFVKZt2a491p2AHb1A/DrY5PSEzk/ikrGNYTgOlhXtKEWhWpWDXO+grY1U9D5N4u3e9d QA== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3mgwp405cu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Dec 2022 18:37:06 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 72E3F310AC;
        Fri, 16 Dec 2022 18:37:05 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 79817805745;
        Fri, 16 Dec 2022 18:37:04 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/6] ARM: Add GXP I2C Support
Date:   Fri, 16 Dec 2022 12:35:26 -0600
Message-Id: <20221216183532.78933-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: UsNOGp3-6jZl_2jPCqfGo-PAOZ0AnNn9
X-Proofpoint-ORIG-GUID: UsNOGp3-6jZl_2jPCqfGo-PAOZ0AnNn9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_12,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=663
 impostorscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160162
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

The GXP SoC supports 10 I2C engines. Each I2C engine is completely
independent and can function both as an I2C master and I2C slave. The
I2C master can operate in a multi master environment. The engines support
a scalable speed from 8kHZ to 1.5 Mhz.

Nick Hawkins (6):
  i2c: hpe: Add GXP SoC I2C Controller
  dt-bindings: i2c: hpe,gxp-i2c
  dt-bindings: mfd: syscon: Document GXP register compatible
  ARM: dts: hpe: Add I2C Topology
  ARM: multi_v7_defconfig: add gxp i2c module
  MAINTAINERS: Add HPE GXP I2C Support

 .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  |  63 ++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts      |  72 ++
 arch/arm/boot/dts/hpe-gxp.dtsi                | 115 ++++
 arch/arm/configs/multi_v7_defconfig           |   1 +
 drivers/i2c/busses/Kconfig                    |   7 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-gxp.c                  | 641 ++++++++++++++++++
 9 files changed, 903 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-gxp.c

-- 
2.17.1


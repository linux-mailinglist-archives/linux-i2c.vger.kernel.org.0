Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBE367B9D1
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 19:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235360AbjAYSrN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 13:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235394AbjAYSrH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 13:47:07 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392C35619C;
        Wed, 25 Jan 2023 10:47:06 -0800 (PST)
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PIFR3X011376;
        Wed, 25 Jan 2023 18:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id; s=pps0720;
 bh=YKF5DYJPhIrVAXlXwOYGcigxfIp2850usBGmHFx3nA8=;
 b=gaap69jIIb8hib+X1L6pqyLaf3/+co2ECqJM6hIPlwMqUN4hdd30IUo2wTwAxeQ7dSBb
 YWIEYjsnwySEuM30V7NVUUwgeo9u5Nl1T6bIRXw2E0cvCN4dT17tUS8bqEiLtDem8rGS
 b/jDwYffL1xCQVtE0xN2Be/XRLIZ3rjwz2NiI3hxsFT+WvldpAQjvpiEbFcHqp+6w1cW
 XazRcNiGNWqnTAPnceIgnjddilZuLHRiiZUi2LK0uSqvKNl07QBJa4w/BT0puv8fo8fn
 lVc/Hoq9k4mCQwwm2XMx7gXjeLJ4HBFnNQ3uoOv/HESygu9XfTE/XEZqRF8T05IYfssm 4g== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nb9038jc3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 18:46:44 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 78686336E0;
        Wed, 25 Jan 2023 18:46:43 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 60FFB8089A9;
        Wed, 25 Jan 2023 18:46:42 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
Subject: [PATCH v4 0/5] ARM: Add GXP I2C Support
Date:   Wed, 25 Jan 2023 12:44:33 -0600
Message-Id: <20230125184438.28483-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-ORIG-GUID: X9Nx9LwVcbWGZu6MHNLStvYgxQbYRhOo
X-Proofpoint-GUID: X9Nx9LwVcbWGZu6MHNLStvYgxQbYRhOo
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_12,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=968 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301250166
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

---

Changes since v3:
 *Switch engine variable to u32
 *Disable IRQ on device remove with register write instead
 *Provided even greater description with the use of Phandle
Changes since v2:
 *Disable IRQ on a device remove
 *Remove use of I2C_CLASS_DEPRECATED
 *Use i2c_parse_fw_timings instead of of_property_read_u32
 *Remove redundant dev_err_probe as platform_get_irq already has one
 *Used __iomem instead of res->start to find physical address
 *Use BIT in gxp_i2c_irq_handler
 *Made value u8 instead of u16 for u8 read
 *Provided a better description of Phandle in yaml
Changes since v1:
 *Removed yaml documentation of hpe,gxp-sysreg as it has been
  applied to syscon.yaml
 *Made i2cX a generic node name i2c in dts file
 *Added status field to the dtsi and the dts for i2c bus
 *Removed unnecessary size-cells and address-cells from yaml
 *Removed phandle from hpe,sysreg-phandle
 *Changed hpe,i2c-max-bus-freq to clock-frequency
 *Removed rogue tab in structure definition
 *Removed use of __iomem *base local variables as it was
  unnecessary
 *Switched #if IS_ENABLED() -> if (IS_ENABLED()) inside
  functions
 *Removed use of pr_* functions
 *Removed informational prints in register and unregister
  functions
 *Removed print from interrupt handler
 *Removed informational prints from probe function
 *Switched dev_err -> dev_err_probe in probe function
 *Used the respective helper for mapping the resource to
  __iomem

Nick Hawkins (5):
  i2c: hpe: Add GXP SoC I2C Controller
  dt-bindings: i2c: Add hpe,gxp-i2c
  ARM: dts: hpe: Add I2C Topology
  ARM: multi_v7_defconfig: add gxp i2c module
  MAINTAINERS: Add HPE GXP I2C Support

 .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  |  59 ++
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts      | 109 ++++
 arch/arm/boot/dts/hpe-gxp.dtsi                | 125 ++++
 arch/arm/configs/multi_v7_defconfig           |   1 +
 drivers/i2c/busses/Kconfig                    |   7 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-gxp.c                  | 603 ++++++++++++++++++
 8 files changed, 907 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-gxp.c

-- 
2.17.1


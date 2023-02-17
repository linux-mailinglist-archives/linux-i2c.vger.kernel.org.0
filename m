Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247E169AFE2
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 16:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjBQPzV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 10:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjBQPzS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 10:55:18 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2526782F;
        Fri, 17 Feb 2023 07:55:17 -0800 (PST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HEP4UB005924;
        Fri, 17 Feb 2023 15:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id; s=pps0720;
 bh=4OUr6pL09KN9lLfyZ7+aT6RKEnK7PkGU9uIG3Tj1ADg=;
 b=b/fB4xvy49JGUD/Ydgi91DeWbsfAE2O8PMTxvMScgqo3g3/M0LlUyxwkuyhGbXrVQrRR
 xApIp34Z2L+8o7WNL/bXSeyeBHElvawTQu/2wjymjc7pP1JHHPNuB/ew55662cBx4dW2
 MQu6snhhckxCFoNFtAN30ylMSv73GzlPo62MqjUd6Uc/1KWIb1QDCqdkFAPtkbaYKOR7
 vX6omDMVfqAD9fns8/QPUuxsX1Js5gn3FCfphfthrszoH0vWbwGOL0CI+Nef/eg3X3j4
 FcqygeEzEVM3FlPi2GYOawY05qnoMdv8VCci6AC3xnRII83QM91XJczVBo8WNlBwJr8a CA== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3ntbak8xk8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Feb 2023 15:54:56 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 06508800354;
        Fri, 17 Feb 2023 15:54:54 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id D22978071C3;
        Fri, 17 Feb 2023 15:54:53 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wsa@kernel.org
Subject: [PATCH v5 0/5] ARM: Add GXP I2C Support
Date:   Fri, 17 Feb 2023 09:50:49 -0600
Message-Id: <20230217155054.99757-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-ORIG-GUID: xXcB28YSWEo46jHpmwW9z7fsc_bV8GxF
X-Proofpoint-GUID: xXcB28YSWEo46jHpmwW9z7fsc_bV8GxF
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=952 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170140
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
Changes since v4:
 *Removed use of i2c_global_init_done
 *Removed use of if else case for inline conditional
 *Removed error messages for timeouts and NACKS
 *Added bit definitions to replace magic values
 *Fix build error
 *Relocate Kconfig definition
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
  __iomem*

Nick Hawkins (5):
  i2c: hpe: Add GXP SoC I2C Controller
  dt-bindings: i2c: Add hpe,gxp-i2c
  ARM: dts: hpe: Add I2C Topology
  ARM: multi_v7_defconfig: add gxp i2c module
  MAINTAINERS: Add HPE GXP I2C Support

 .../devicetree/bindings/i2c/hpe,gxp-i2c.yaml  |  59 ++
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts      | 109 +++
 arch/arm/boot/dts/hpe-gxp.dtsi                | 125 ++++
 arch/arm/configs/multi_v7_defconfig           |   1 +
 drivers/i2c/busses/Kconfig                    |   7 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-gxp.c                  | 620 ++++++++++++++++++
 8 files changed, 924 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-gxp.c

-- 
2.17.1


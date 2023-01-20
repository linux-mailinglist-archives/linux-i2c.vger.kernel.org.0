Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24CF8675D8E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 20:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjATTEX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 14:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjATTEW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 14:04:22 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC47270E;
        Fri, 20 Jan 2023 11:04:21 -0800 (PST)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KIxxmF017225;
        Fri, 20 Jan 2023 19:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=zgpfiTFlMSbVrQo2PsGJs7OL5J9HpeuVbiryZ8xeQpo=;
 b=ZOLRorfo7J4GYYV04HrHQLckUwPMieEKMHwpdNt0aCEuGu8U/zCeBvr7rluTH5lJOIi2
 MckL2suBk9AFJkGhkfVVlwknBuZwiWztUmynUpzXOKXunf9fwEgqS8QRmgHfwhZFEP5J
 C4i5zulN9qvtMVPIBrzVIn2r1Sv3L9rIXeom/oGolpkyJuQqCWmGijq4ya8oALvRG1Uj
 3Vmbs9laHYNWmhQoAXk8fwwJLbsL7TAl/dOBx0vObvldzHbDpv40EdcGtF9UzZCTvFKs
 W6J9H0DsO1MGXQpYdcY2nvZg49X/G3/sldqTY6zyEf+NfADr++HV+vOxtI4i4eXdzRVE 4A== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3n80qhr3xr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Jan 2023 19:03:57 +0000
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 288C3802B85;
        Fri, 20 Jan 2023 19:03:57 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id A4382808EB4;
        Fri, 20 Jan 2023 19:03:56 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/5] ARM: multi_v7_defconfig: add gxp i2c module
Date:   Fri, 20 Jan 2023 13:01:58 -0600
Message-Id: <20230120190159.23459-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230120190159.23459-1-nick.hawkins@hpe.com>
References: <20230120190159.23459-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: mbD6TlHhle1oLhSS-B6SYh9KAf1xQKX4
X-Proofpoint-ORIG-GUID: mbD6TlHhle1oLhSS-B6SYh9KAf1xQKX4
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_10,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=987
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200180
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

Add the CONFIG_I2C_GXP symbol to enable the GXP SoC I2C capabilities.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---

v3:
 *No change
v2:
 *No change
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b61b2e3d116b..8a19b1dc10d0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -411,6 +411,7 @@ CONFIG_I2C_DAVINCI=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_DIGICOLOR=m
 CONFIG_I2C_EMEV2=m
+CONFIG_I2C_GXP=m
 CONFIG_I2C_IMX=y
 CONFIG_I2C_MESON=y
 CONFIG_I2C_MV64XXX=y
-- 
2.17.1


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33AA569AFD9
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 16:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjBQPzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 10:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjBQPzQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 10:55:16 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB50642F6;
        Fri, 17 Feb 2023 07:55:15 -0800 (PST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HFDM4i019592;
        Fri, 17 Feb 2023 15:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=8jNKl5BBjV4BPv2vJZsBMghlC2avYeAe/sYCyPSZe3k=;
 b=WxyTqc+KECWgXjy7GBaK+g1TfuSDp7Iwff8jIPlY8AcKYsARaN7IKrdDDDLyNC7ubVjv
 /0wSYog6a1glC8LEPkhWVeK5x1GrkaEjQtvyyKJG/nUFzNRueopnqAzLziPU/1Dl20uc
 r3xJE5AptH6K7aI0vABbd5n1ZghUy4aXKOustkNjJkUMaL2y5cs/VDHXk3mVANEITEK2
 IAMPRxui60GuGkZh5SXRuMmADaGTddxSSK0o6zdm1ybckbX9/3k24O3qrPyJ0GK+27xo
 /LUHp+CAupM3U+6XEdRgGrMT01tHb3JrUORHqAuny3md1jRxMc8JwFnt24EIDp8J058L 7A== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3ntbrt8n1t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Feb 2023 15:54:58 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 2AA1A805E67;
        Fri, 17 Feb 2023 15:54:58 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 67D478071C3;
        Fri, 17 Feb 2023 15:54:57 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wsa@kernel.org
Subject: [PATCH v5 4/5] ARM: multi_v7_defconfig: add gxp i2c module
Date:   Fri, 17 Feb 2023 09:50:53 -0600
Message-Id: <20230217155054.99757-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230217155054.99757-1-nick.hawkins@hpe.com>
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: VsB8Bms46iYFlIfPa42olydGurPBN2yN
X-Proofpoint-ORIG-GUID: VsB8Bms46iYFlIfPa42olydGurPBN2yN
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=986
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170140
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

v5:
 *No change
v4:
 *No change
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


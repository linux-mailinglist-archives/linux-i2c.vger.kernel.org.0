Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3DF864F10E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 19:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiLPSh3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 13:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbiLPSh2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 13:37:28 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9F62B19B;
        Fri, 16 Dec 2022 10:37:27 -0800 (PST)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGFLFui032462;
        Fri, 16 Dec 2022 18:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=Fz5XTwBCb8LOB+OGCGAEKYrMx/I8DUIe2X3g73uMLug=;
 b=JyF91qSXmsNC9kLoRPfbIdzMqil9c5Su21MSfCS2d/qmymJR95UeeFAyYgj2GMNfAIO4
 2mzuJtf1V9MEG8ekNp9Lyw4EKO3k5lBxQSdesnqkwedptEwB93Ph9aYRhERux6ynmBu1
 Bw5WqAvLN0J5CypAvlfWD4J6vzs+LOwucN34X3M8uc3Jh9VcZD0eLQMQ2P++ubUX93Cp
 rZ2K1gmGoHbvcrOJtKBDDZKTtiQ3+Wa9mFC2y4VirzJsoTfXtKiI1kr2Y9NmJyhM/Bgx
 IFVZqSoRxcckO5871aZeBuL7/c7vezVS6ZTweZkTjOrVjvq10pF04IY0NeXgrMYaYlei qw== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3mgu8898yw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Dec 2022 18:37:09 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 6EEB82FB3D;
        Fri, 16 Dec 2022 18:37:08 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id DA7948052FC;
        Fri, 16 Dec 2022 18:37:07 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 5/6] ARM: multi_v7_defconfig: add gxp i2c module
Date:   Fri, 16 Dec 2022 12:35:31 -0600
Message-Id: <20221216183532.78933-6-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216183532.78933-1-nick.hawkins@hpe.com>
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: QwQXlsXOrKtpics1ySzbrSwIZvEmwL3t
X-Proofpoint-ORIG-GUID: QwQXlsXOrKtpics1ySzbrSwIZvEmwL3t
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_12,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=962 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212160162
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


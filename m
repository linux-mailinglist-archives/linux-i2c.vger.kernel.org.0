Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8ED67B9CE
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 19:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbjAYSrL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 13:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235356AbjAYSrH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 13:47:07 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27DF5AB45;
        Wed, 25 Jan 2023 10:47:05 -0800 (PST)
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PIFiDp011632;
        Wed, 25 Jan 2023 18:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=H8p2fQtfdj2KWbnf1XcKaulI6u0kXOtPYbQRE7yBKks=;
 b=jQcRmyuGzUhqVkCo5Wy7/Ve9F/LwDjW35FPKdzroU/QlZwGnLtuESb9Bpt1s0G8rFq0P
 6St3H4/vy9BQ/EkGAScAeTXtQImvdYbTdarGlf4OBda/kwaXI9vi1ljcMFbZaxR6fWrF
 xObTkfTsrWRcMyN+PN3dQr+Jg5MrwViSbw2Y1SKn/Mw2ya4g2eeKXP92/+CWGTP8ri0N
 KAH6XiSn1uTHmll4G3MoAnXkwKMwamfn9HJvCy5RTYUoQafjv0uPQ6Pg9wcJNu5acj6T
 3prDJWTQT2qF/SVeCT84u2Y7jcYTGuPXC/OAkNbvnT0JIG+sJ8eBaryKB1CXmNV5iseq ag== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nb9038jca-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 18:46:45 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 5C061310DD;
        Wed, 25 Jan 2023 18:46:45 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id DBAB7808D86;
        Wed, 25 Jan 2023 18:46:44 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
Subject: [PATCH v4 4/5] ARM: multi_v7_defconfig: add gxp i2c module
Date:   Wed, 25 Jan 2023 12:44:37 -0600
Message-Id: <20230125184438.28483-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125184438.28483-1-nick.hawkins@hpe.com>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: iolWoa3uG5SKR2UZ_et5m-bs8hHf5boj
X-Proofpoint-GUID: iolWoa3uG5SKR2UZ_et5m-bs8hHf5boj
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_12,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=986 phishscore=0
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

Add the CONFIG_I2C_GXP symbol to enable the GXP SoC I2C capabilities.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---

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


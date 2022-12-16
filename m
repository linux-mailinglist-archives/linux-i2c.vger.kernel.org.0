Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8DC64F112
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 19:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiLPShc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 13:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiLPSha (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 13:37:30 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A39C31EF1;
        Fri, 16 Dec 2022 10:37:30 -0800 (PST)
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGCSiCI014754;
        Fri, 16 Dec 2022 18:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=57jMhzIY6ocGNR3ZkZzrIW51OdLQY115RWIYg4DbMFc=;
 b=HFUfN3Cnw26eawx/Fg3UuixB5Z3MESGRzV+HrlyAGnW6XzXHzX5epebKUR7GlO3KAu0E
 weu8xx5vRI7tg35kvdmzApo+7XHNNnyxlWv0Y8LnrZpF1L3O6Bg9bfCi1MiuQdqlUPmM
 Mx2FNQwndIivts0+dTpFZmqIgQMD2Ou5b7nFOGkzW2LIcjrtaQtoucUw9M4I2M3h50rC
 gL0z9aKui8gFpruUIrnPSEDd4TFAHf+N/aGgkSxSlTATn6/qRqZNUKYY6GWPieZ71kFP
 wTEHrzDVylZI3axRK+6QycToMZCZUdr9MEy33vcslJSwAMimZ+2D9juBOOSBC7tSKQAQ RQ== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3mgnbrmj40-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Dec 2022 18:37:07 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 496D8807120;
        Fri, 16 Dec 2022 18:37:07 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id A1900808065;
        Fri, 16 Dec 2022 18:37:06 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/6] dt-bindings: mfd: syscon: Document GXP register compatible
Date:   Fri, 16 Dec 2022 12:35:29 -0600
Message-Id: <20221216183532.78933-4-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216183532.78933-1-nick.hawkins@hpe.com>
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: 2ALtkL1SVC_4BIdeDgr8aigbFxdDtKVH
X-Proofpoint-ORIG-GUID: 2ALtkL1SVC_4BIdeDgr8aigbFxdDtKVH
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_12,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 suspectscore=0 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Document hpe,gxp-sysreg compatible for GXP registers.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4e4baf53796d..a20f7bdfc5df 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -46,6 +46,7 @@ properties:
               - hisilicon,hi6220-sramctrl
               - hisilicon,pcie-sas-subctrl
               - hisilicon,peri-subctrl
+              - hpe,gxp-sysreg
               - intel,lgm-syscon
               - marvell,armada-3700-usb2-host-misc
               - mediatek,mt8135-pctl-a-syscfg
-- 
2.17.1


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7EB67B9D0
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 19:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235525AbjAYSrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 13:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235360AbjAYSrH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 13:47:07 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC1A5420B;
        Wed, 25 Jan 2023 10:47:05 -0800 (PST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PGc3uB005428;
        Wed, 25 Jan 2023 18:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=lf1JrEL6GKOzP4PS0ec23yDiLZvxtEWCgefmJb4f5HA=;
 b=VIGsp+JPbXEE0NZoKo/TO6ajVO9WJqdCtu8jw9n7y/GFobyoI9w6sAPDAVlsofWBgtL4
 bsdVia42Zv0tnaqPdr53uRbv0d9dEtiQ9C9KHv5jd22veeBdbPHWxRGrxXxLNoPOdmXr
 P3B87WxI1sK7tqQgFLoSgHEkHNRiHVkcBm7R/O5mJDyvmhoqGO6t7gN/89EmPNEx+0Gs
 JiTrlEoUNrg4PXhHNKNyN1qse5OkzFbcNC8RldPXLx36kEM8MYt4sT3O4VJz1GOOfhNX
 Wc0w3Lu+y+bjVoI3wAk2NWMgjLHA0F7xeS6MQ2TgX8OLWmuhyDRWenHPO3wDIlXyards nA== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nb83xsagt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 18:46:46 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14878.it.hpe.com (Postfix) with ESMTPS id D8EB013197;
        Wed, 25 Jan 2023 18:46:45 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 610598089A9;
        Wed, 25 Jan 2023 18:46:45 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
Subject: [PATCH v4 5/5] MAINTAINERS: Add HPE GXP I2C Support
Date:   Wed, 25 Jan 2023 12:44:38 -0600
Message-Id: <20230125184438.28483-6-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125184438.28483-1-nick.hawkins@hpe.com>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: ctwJSBnIvxms2MNXcAATn4T_p7DcFahd
X-Proofpoint-GUID: ctwJSBnIvxms2MNXcAATn4T_p7DcFahd
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_12,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250166
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

Add the I2C controller source and bindings.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---

v4:
 *No change
v3:
 *No change
v2:
 *No change
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1daadaa4d48b..d671a8b6968e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2217,12 +2217,14 @@ M:	Jean-Marie Verdun <verdun@hpe.com>
 M:	Nick Hawkins <nick.hawkins@hpe.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/hpe,gxp.yaml
+F:	Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.yaml
 F:	Documentation/devicetree/bindings/spi/hpe,gxp-spifi.yaml
 F:	Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
 F:	arch/arm/boot/dts/hpe-bmc*
 F:	arch/arm/boot/dts/hpe-gxp*
 F:	arch/arm/mach-hpe/
 F:	drivers/clocksource/timer-gxp.c
+F:	drivers/i2c/busses/i2c-gxp.c
 F:	drivers/spi/spi-gxp.c
 F:	drivers/watchdog/gxp-wdt.c
 
-- 
2.17.1


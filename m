Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1A0670D70
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 00:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjAQXaj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 18:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjAQXaM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 18:30:12 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9414A22A;
        Tue, 17 Jan 2023 12:46:59 -0800 (PST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HKjeb5007173;
        Tue, 17 Jan 2023 20:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=0fhS1i3cwroIMdKx2Mx0SoLlPqsHEdH3PNHz5x02UcA=;
 b=k6BxD/zLTrZDTyuqJu/CcaLUVJRfdjbzjOSbWYwsW2ceVD7CNr4sjSgO80tkADSX4V/I
 +9JQpqNPhRt96m11BxYOyYPOUx6hiEulx3+1EghoPt3TulhzNv58meXKD1zu9RjTLATu
 YTHkdruQZfg6sHFYEwxWCsPqhHWpC5PqM3GJvbveo/c4HMvBfUpxks1WIjUW8vyytdoZ
 uxkzf83evLGcoGSW+/d3spKgEQ67NBf60ecVfuf8OeiI52rgenRfR727QYzLbSMUF21q
 2nCWRSZdrMSpnTC5cjxN/v3WYpSCQSjdAKtOOl6YQxOnIXoIadIpaWPWqhtB+PQfCGfT 8g== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3n5wag3mry-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Jan 2023 20:46:40 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 16E5A80172A;
        Tue, 17 Jan 2023 20:46:39 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 9A44D8071D1;
        Tue, 17 Jan 2023 20:46:38 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/5] MAINTAINERS: Add HPE GXP I2C Support
Date:   Tue, 17 Jan 2023 14:44:39 -0600
Message-Id: <20230117204439.76841-6-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117204439.76841-1-nick.hawkins@hpe.com>
References: <20230117204439.76841-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: 0XfQRr4HQByIDIedhajjvaOqPXe9NCT8
X-Proofpoint-GUID: 0XfQRr4HQByIDIedhajjvaOqPXe9NCT8
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170166
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


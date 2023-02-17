Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF38A69AFDE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 16:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjBQPzT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 10:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjBQPzS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 10:55:18 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3BC64B2C;
        Fri, 17 Feb 2023 07:55:17 -0800 (PST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HEOven005206;
        Fri, 17 Feb 2023 15:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=z2ZjrINj/Q1T10z726hJcbWPMqSFuqr2P2E5Vdq2cr0=;
 b=d/N2W34junQo+uElWj9HMHE7X06A4sP2ErjXhoJ49/pZ78oidwhcJDkKr0JGRRW++hVe
 91Zzav2AykOQ+qk0731Nd+yx5pEAumxnKqOsDvKlcFCGouMKQe0MFrJKMv+VeR6Cj5Ne
 Q7VgD2TjDhohOtAsU7DpMtUr6BgcdNbBR9ywCPyYYTzxiFPtA72UfVr+9jV6L/mda+5y
 guH11MvwA07Jru6KFRwoc28YzIOCGGDWlYAj3uBZrXMB1+hmpTFbGsis09gokVbnuihk
 aCQyIPNmsi3XFuJbX949HGnC72tyUJDkSw9jizxE9rLXIL4ze06OIT4khkXZYM/TP9Hx 7Q== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3ntbak8xkj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Feb 2023 15:54:59 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 07EEF132D3;
        Fri, 17 Feb 2023 15:54:58 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 3B04E8071C3;
        Fri, 17 Feb 2023 15:54:58 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wsa@kernel.org
Subject: [PATCH v5 5/5] MAINTAINERS: Add HPE GXP I2C Support
Date:   Fri, 17 Feb 2023 09:50:54 -0600
Message-Id: <20230217155054.99757-6-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230217155054.99757-1-nick.hawkins@hpe.com>
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: kVppx3nHJuCwlecbvZFn4wXtA7nEvU9s
X-Proofpoint-GUID: kVppx3nHJuCwlecbvZFn4wXtA7nEvU9s
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
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

Add the I2C controller source and bindings.

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


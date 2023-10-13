Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 074B97C7DB2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 08:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjJMGaR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 02:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjJMGaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 02:30:16 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE380BC;
        Thu, 12 Oct 2023 23:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697178614; x=1728714614;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c8NemQmEEtATdCtPjluXwUnrBkqItgm8r0eFaVBUzMw=;
  b=I760LBV9USYelfzJyg5/eSLL6clOrUvTZx/HV36iSa8AIIeKFzZQYF8D
   l8XjeOPllZxXWuJsyJRRSu12fKTYFbFfMdZL3GDWFslTwXnOWJgqPo6WO
   J8D6gdV6z3VIWOGaJ0IIbpkhSUs9c2pqmsrASw30oHYoDUzsi0yVo2CM7
   jzdv1tFweMRccD8BImO6X6MB3kqw0x3GjryvWkHe0k+sPOP4/M5dfvuvB
   NQFD59LJqE5KNrw5kHYTzQoRRPMnGJUeMoRFZKYGwQksOGBEvlKcFCeRH
   YsXF2VKYOblmTOVER4uWxDvTDASkJXU8nn1HJLkoaGI/JGDMn30VH4jUC
   w==;
X-IronPort-AV: E=Sophos;i="6.03,221,1694728800"; 
   d="scan'208";a="33444546"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2023 08:30:11 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 529E7280082;
        Fri, 13 Oct 2023 08:30:11 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] dt-bindings: at24: add ST M24C64-D Additional Write lockable page
Date:   Fri, 13 Oct 2023 08:30:07 +0200
Message-Id: <20231013063008.2879314-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The ST M24C64-D behaves as a regular M24C64, except for the -D variant
which uses up another I2C address for Additional Write lockable page.
This page is 32 Bytes long and can contain additional data. Document
compatible string for it, so users can describe that page in DT. Note
that users still have to describe the main M24C64 area separately as
that is on separate I2C address from this page.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is a copy & paste of [1] for ST M24C64-D. I reused the same pattern and
also used Marek's commit message.

[1] https://lore.kernel.org/all/20231010190926.57674-1-marex@denx.de/#t

 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 7be127e9b2507..6385b05a1e62f 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -73,6 +73,8 @@ properties:
                   pattern: cs32$
               - items:
                   pattern: c64$
+              - items:
+                  pattern: c64d-wl$
               - items:
                   pattern: cs64$
               - items:
-- 
2.34.1


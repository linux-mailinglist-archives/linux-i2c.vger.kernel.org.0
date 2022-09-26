Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354A85EB290
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 22:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiIZUq7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 16:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIZUq6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 16:46:58 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962939FA9E;
        Mon, 26 Sep 2022 13:46:57 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id CF13784DD8;
        Mon, 26 Sep 2022 22:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664225216;
        bh=bytvNaBMLeIzSt7wgun++4S3YDzieYxFdobxwsXK7UA=;
        h=From:To:Cc:Subject:Date:From;
        b=lltB2zsLDvZ5w3z0GFJ0DhaORd4kefYqzwq8tiXhgFeGUlXFV35V07RvcpQEbywGx
         O2zePGTI555z8EN8M5ifHe42hhfD6PDTN/nIevopIIk+v1OJdqxQFV+yBajEVKcQ9r
         WxPUmpCj9w+eB1QlytsxVCQZXs/olhPiedUth6rJGhdqoD+nvabFwgeJGwxJaK7zgY
         iSI6K2bfiiu6oUBiqX02+XVaodiMz2MB8A14te9E/pNAU8gCeY14PjP7n/Wz60ISvI
         b9VjBIBnBh5xs8VqVJi8WclQWX5nU9D1jxR1EfHuHIe5AAkzvkGE/62L35xFD9H64I
         rZjpMEPmF1Ndw==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: i2c: st,stm32-i2c: Document wakeup-source property
Date:   Mon, 26 Sep 2022 22:46:53 +0200
Message-Id: <20220926204653.381722-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document wakeup-source property. This fixes dtbs_check warnings
when building current Linux DTs:

"
arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 63958cac339b7..bf396e9466aaf 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -97,6 +97,8 @@ properties:
           - description: register offset within syscfg
           - description: register bitmask for FMP bit
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.35.1


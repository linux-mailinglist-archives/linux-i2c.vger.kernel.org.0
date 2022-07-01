Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4097563C9E
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 00:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbiGAWzJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 18:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiGAWzJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 18:55:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB8A59257
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 15:55:08 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e12so6138985lfr.6
        for <linux-i2c@vger.kernel.org>; Fri, 01 Jul 2022 15:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sibl1Y9gMtcNPO1NV41AlirNzs/0+ErrpX8oT6iT1Qo=;
        b=Fpg08CaSIO0UO1TMdUxmQksK7Z8AMxSA86SFmvOL1LwEddCPRiZ4/2qYpMF6tw/rqx
         AQjkDg5Oy4vKiVKhxsfr92HD48GAK/b3KvbXL5kxY+V/n4GAiJ48axmOe01Ph7kmqr4U
         y97XevwNrYyh55vriLkKMwhhfljmzUfL8UltmL78q9LlYLmQNnp9ZhltaGgIs4xLrhbG
         ZSd5mw8iJlkdBUaak8JrA8Kapb5/7G18XekwLq0pAP9uZMDkGofW/GoJ1C8bkj82FQ26
         acfpKgsGLE3DK1no8Cw05TtRBk6tOYCDIMbJ1egfTk1nXHlr6VpxIjB0F+iJdxMcWtwQ
         jyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sibl1Y9gMtcNPO1NV41AlirNzs/0+ErrpX8oT6iT1Qo=;
        b=FxfhZ4cXp+60evUIjpOca21jaNe9OATv7kiVq291ZdaVrIvTo++qZiOqDOELJMF6KK
         O72EiHjYvQNSYHxwI1n8aJx1geKX56LmEZjq3CBbo7eGHCwFBcYdCirGRn7lSMi9edhr
         TmXZ/6NOZPgQMDgJlq3GW6P9aqaMxVoQwOvMR9xFeKEi/zSn68E12aKiXC8L0NFgtzKY
         tyghyp5XcudOzJ8czZXELZ5hLov1ggqMhlpg4vgA8MqAxa7/xJDL/eYTCk+/QMkunfHF
         afTclrFnH7UJHMjAR5Y+SrAhKvBdIajBzFQaFzaxKdwn5lC7rypcQbEp/pWWSQaJT/0C
         hOXQ==
X-Gm-Message-State: AJIora8X6eXfRGULljRkojNFOK2ARiPtHjrj9UQA50akwFEAY/9HmyDK
        OcVytnxuikOemZ1eiV2aQg5wqQo6cLHEOA==
X-Google-Smtp-Source: AGRyM1tTjcyTboI0at9NKBnxACdD4ShwS8pg1HrDt8wgkC7MVWfxUQME3DDg0nJTIdzRhCv3brgOWA==
X-Received: by 2002:a05:6512:234b:b0:47f:62aa:5771 with SMTP id p11-20020a056512234b00b0047f62aa5771mr10496619lfu.405.1656716106494;
        Fri, 01 Jul 2022 15:55:06 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id k10-20020a2ea26a000000b0025bbf597b8asm2517406ljm.71.2022.07.01.15.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 15:55:05 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: i2c: Add power domain to binding
Date:   Sat,  2 Jul 2022 00:53:03 +0200
Message-Id: <20220701225303.814888-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The power domain is used in the example and in the device trees
for this IP block. Add it.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index 41623bd0306c..42c5974ec7b0 100644
--- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
@@ -60,6 +60,9 @@ properties:
           - const: i2cclk
           - const: apb_pclk
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
-- 
2.36.1


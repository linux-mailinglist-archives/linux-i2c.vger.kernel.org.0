Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1F3391F97
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 20:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233762AbhEZSuc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 14:50:32 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:39480 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbhEZSu1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 14:50:27 -0400
Received: by mail-ot1-f46.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so1987809otc.6;
        Wed, 26 May 2021 11:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mNKNtAI43Z/nC3L+rfhHTkgzIxEjqQehyJ1O9ZC2MQY=;
        b=XfjVNv09z0hfGqQcpoMZaV74GI6Gk9bpgtcgN9/Y3w5Ddflgfqd1u1ST9dQsMta1uB
         92SGi2Tn0sayEklzr47L3R9qDPQV9Y7SQOR0NSnmylVn1BxN2k2Xj+IOcJFWVr013P6+
         ZK9xAdXBG1N/qoeR83yAmFyAszUP+IQ1c0cLARHM6DUwXzjiBsEwvm54KHISUX0xDS8B
         oL7zS0LgzFEd4h6J92YzPjvY2LMOtrT57abn1L97iXGqn1yDpJI/U071tj6B3jZJk9AC
         NEITz8bTs4AniPxhypN0T1Nj9YUqDK0Oqov3EkSUy8UBQYkrb5DS8M4B7LsHGRGqtWpN
         Ym4Q==
X-Gm-Message-State: AOAM530n0TLChJPy9s0V4TGAF8Xl52YQVe30M+WazL7tYwn0jWbxHVWg
        HX4SFaOkyUW7+VTDV1M43fLJP0uUwA==
X-Google-Smtp-Source: ABdhPJxKEDxjvVnbKXErJL/F82kbMFfB0uGc/GViWS/EWSonIJC+X3SF90OTp8zuJRUQETyLIeEitA==
X-Received: by 2002:a05:6830:14d:: with SMTP id j13mr3424433otp.232.1622054934401;
        Wed, 26 May 2021 11:48:54 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x65sm7224otb.59.2021.05.26.11.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:48:53 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 6/6] dt-bindings: i2c: maxim,max9286: Use the i2c-mux.yaml schema
Date:   Wed, 26 May 2021 13:48:39 -0500
Message-Id: <20210526184839.2937899-7-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526184839.2937899-1-robh@kernel.org>
References: <20210526184839.2937899-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the i2c-mux.yaml schema in the maxim,max9286 binding schema. With this,
several properties can be dropped as they are defined in i2c-mux.yaml
already.

Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++----------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index ee16102fdfe7..02f656e78700 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -111,17 +111,10 @@ properties:
 
   i2c-mux:
     type: object
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    unevaluatedProperties: false
     description: |
-      Each GMSL link is modelled as a child bus of an i2c bus
-      multiplexer/switch, in accordance with bindings described in
-      Documentation/devicetree/bindings/i2c/i2c-mux.txt.
-
-    properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
+      Each GMSL link is modelled as a child bus of an i2c bus multiplexer/switch.
 
     patternProperties:
       "^i2c@[0-3]$":
@@ -133,12 +126,6 @@ properties:
           channels.
 
         properties:
-          '#address-cells':
-            const: 1
-
-          '#size-cells':
-            const: 0
-
           reg:
             description: The index of the GMSL channel.
             maxItems: 1
@@ -173,10 +160,6 @@ properties:
 
             additionalProperties: false
 
-        additionalProperties: false
-
-    additionalProperties: false
-
 required:
   - compatible
   - reg
-- 
2.27.0


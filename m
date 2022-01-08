Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01C3488576
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 19:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbiAHS7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 13:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbiAHS7K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 13:59:10 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D6EC061401
        for <linux-i2c@vger.kernel.org>; Sat,  8 Jan 2022 10:59:10 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso6849347wmj.2
        for <linux-i2c@vger.kernel.org>; Sat, 08 Jan 2022 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nYh2HXtJRHDLyiqHjumy8SGr/ilHKwnU20CoAfLk/k4=;
        b=W0BLse+MIvxhQMBBTpCdSM81w9hDph/TF393Uus+VnlaAyGIBKw5sj4Qq6TpAaHVGO
         Av1SLjUcdjJpb6NV8PqyyPs6HplO4pIPK3YuIC7U5h0vUBQhLLIqNzLiMdfVpeNegvR6
         6PqOCxZk3bVj+UNaPGE0pY9XlbA/AO2rpAMSSb0YpOW0RRybmSSaMLU56+6e1vGP5UAR
         1ZQOPGEepjFq8XBOErp0vRdRN5n+3EOTMu5pPnPHwOwrEPGKjbYB2yvMjHpt5KAjhaIR
         xP9FP3T5nLOv8VhC4HIFNUwH+6uiQWnCFt23fVBU02b0qSOp4/bgW8CXvH47cfVmB5NV
         t6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nYh2HXtJRHDLyiqHjumy8SGr/ilHKwnU20CoAfLk/k4=;
        b=YTg0xuCaVZsD+8SpUGiXOMFMlibu/vbmS1u+djTwYe00NUchYQEPMhZJKg3cO+t9hu
         FgBQdUdQ6i3+xQd7RcvGP2Tv7YwpBtvpblcQWe3YnbumlAQPkGIUEU/KVh5t82r7RxeW
         pG0SjaJdYCz59cmxz69rjnKpWiRemDVFEmdnAlTTMabRUOaoQrB9SuSC9/G5VZ0JJ4Do
         x/8L0yOi0bGXY+Q9AUFVkr9YHlFX0PPV28dvXsqgcuLA1eChyAgcj79bkGAg/GLYo/xc
         EcbxpXgEBCvN/L/Oca950EWHJKm4EefjDcoFReKfxQt8sKPXJLuiC2iDXSLdBvyMans9
         8xqg==
X-Gm-Message-State: AOAM533EY8IhTZpUCEVCM7Ge9ff5DfxjOwP/7ncq1XdRtvCQIXKWNpsg
        qqzSuAn4I0TbGxR680vecnDq5w==
X-Google-Smtp-Source: ABdhPJwQn6yYUwxfhwSA0o1WBiGl15jl2VyPd2YfD7g3pyifIUlNmazaPnzAHEbGAKkr+lCZ90bOHA==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr15036595wma.185.1641668348732;
        Sat, 08 Jan 2022 10:59:08 -0800 (PST)
Received: from fedora.sec.9e.network (ip-88-153-139-166.hsi04.unitymediagroup.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id bg12sm2886209wmb.5.2022.01.08.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 10:59:08 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: i2c: Add regulator to pca954x and max735x
Date:   Sat,  8 Jan 2022 19:57:57 +0100
Message-Id: <20220108185759.2086347-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
References: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a regulator called vdd also present in datasheets of PCA954x
and MAX735x and update the examples.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml | 5 +++++
 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
index dc924ec934ca..93eda07718e8 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml
@@ -57,6 +57,9 @@ properties:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
 
+  vdd-supply:
+    description: A voltage regulator supplying power to the chip.
+
 required:
   - compatible
   - reg
@@ -75,6 +78,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             i2c@1 {
                 #address-cells = <1>;
                 #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..b28d05dc956d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -59,6 +59,9 @@ properties:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
 
+  vdd-supply:
+    description: A voltage regulator supplying power to the chip.
+
 required:
   - compatible
   - reg
@@ -79,6 +82,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.33.1


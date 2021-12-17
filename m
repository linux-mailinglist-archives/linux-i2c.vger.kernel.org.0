Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84586479217
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 17:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239461AbhLQQ5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 11:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239481AbhLQQ5H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 11:57:07 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A48CC061574;
        Fri, 17 Dec 2021 08:57:07 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id a83-20020a1c9856000000b00344731e044bso1945522wme.1;
        Fri, 17 Dec 2021 08:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+SD4ZFM2uj2rtOINnzlRwjIYdkxm3Tv0C5VQwp/gCfo=;
        b=cWkuQGweSPIo02s+Lr2GpswkTLX/UqpBt1I2Qll5UVRYFsX+8BeRQtVcuNxs1Bn5Jw
         kbmSK6oNaQprM6Kpv141GLli0C5MxTPOf2jc36mYFsZSejU3hal3xu4T1GwOWM6RBrxI
         +PuG04zUU84lYJeqpABS3svs+J4/HcIuVC7ZS+QtXhagtOoS0u7n9gSFCzRzurgWLDQf
         3L5NS7IVDef4D7ObyApCSsruaLYxURRf0zpNJT9MS8+nn1K8yPakok++tnlB+Zbl5KJi
         M2vgFe64qt87m7EPE3BgsYRr6KzeqRRkf5dpmeY/SDKvER893gkXkPQ3/cqEr3jFG6D8
         qmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+SD4ZFM2uj2rtOINnzlRwjIYdkxm3Tv0C5VQwp/gCfo=;
        b=qZxvDmKn34lMB7Ys+g/95JYZwW02mqUtpPYq9zDt3f5gJH3mDJ6APWwarCFDNMwcjC
         mzsKxQCtOYXFu0+LuESzGxThIGeU15kBh/BO4OQj96nAmxe23Po1VIAnaxErSt0fxbWb
         K8u58UDLDndRFZc1a+C7J3AORsBZ66drXZemXovOeretUVhk88/XfTlXeAxcgDjk0u+d
         r/1gIfCLCUOFYMQNlidV5fbGk1SsK2tRVA1RZav+C8Vi4XhrrYI6USUYNs0+LDobkhE8
         3utPUgAU8Wwk2nx1erfnkw6cMgn+nEC+QNTuH41+XPBuxL+rcoiLl8n3kU75Z4oAnI5c
         zTog==
X-Gm-Message-State: AOAM532PVgZo8Pmzv//sEJ4t8QicO6ywYVlcXOaJlyCJ0CMvOV3kTQYY
        KG1FqbxDdS/lGxcNxaDCyMA=
X-Google-Smtp-Source: ABdhPJxEMG5C4v2prpIyTasLaZH4YeEs2wf+fq/aebUYuhwDDxQMuYPl1QzBaoyBHKyI50EjQWcBXA==
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr10072509wma.170.1639760225963;
        Fri, 17 Dec 2021 08:57:05 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l7sm9226599wry.86.2021.12.17.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:57:05 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: i2c: aspeed: Document interrupt controller properties
Date:   Fri, 17 Dec 2021 17:56:57 +0100
Message-Id: <20211217165658.2650677-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217165658.2650677-1-thierry.reding@gmail.com>
References: <20211217165658.2650677-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the interrupt-controller and #interrupt-cells properties that
are used by some instances of the aspeed-i2c device tree nodes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index f597f73ccd87..2a74551c72c0 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -28,6 +28,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  interrupt-controller:
+    description: marks this device as being an interrupt provider
+
+  "#interrupt-cells":
+    const: 1
+
   clocks:
     maxItems: 1
     description:
-- 
2.34.1


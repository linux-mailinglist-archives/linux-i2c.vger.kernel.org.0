Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625FA3D52A6
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 06:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhGZELk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 00:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhGZELh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jul 2021 00:11:37 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0FCC061765
        for <linux-i2c@vger.kernel.org>; Sun, 25 Jul 2021 21:52:06 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so12636933pjd.0
        for <linux-i2c@vger.kernel.org>; Sun, 25 Jul 2021 21:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=25stCq9hJ2wceSqg94GCYZ0IegUstb1Ha6+CpcC6mxE=;
        b=w3jI5G4dOmRLxP2MlxkQOM2/L+5kcH9M9Un+WZvOEFtFgbL1253v+O6A900H9pX1OR
         qw9GFzKgAHqsrSJv+xKzkMtnxu1u/k2FsfUMM1jvwQ7qiqwCBoEnT2kKN5BFtfFCrJrT
         zLaW0eb8OTIpMtSe7SRO+IeJrGQkCkhy0oq2jYpTMgEpeBMMX1acx7jWiBTtABkWiX09
         Naj0FNAJXC7dcbn4cIjgDHkKmWbDsYNlvr19r4z7ob4upxnluKGyAwX8INWrwqjTjOeW
         +xVP8Pg8xLAdzd55q5lvBBX9Vr/Nv+DCBhy7jd1sGD2JEonDcgIvAs5XUlq2VGQwP95Y
         AsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=25stCq9hJ2wceSqg94GCYZ0IegUstb1Ha6+CpcC6mxE=;
        b=H3mA7O5OYEdtq7dMHQF8asS3XLhhjrSCqCfGHc3ZYzUD1X14IpQu/rq4b21aScG83I
         fjipVM+5BvVIKrfVISdvzHrDnZ7iVvdL82bjqOGX9F9a1COH3IceUKIYeNLQ6L4jnwXK
         iZc/mFhbFPZT6YbN6CKdHb9or6MmwPvX+ONgF19h/6KTypYyhhr89zQjbTkBYI1gCooj
         LTPMX1ozwynRyy7XYSzi+Q2W7JFBQu8HsJyxinXLIbcomts32ptA9CyM4uiCrBlBRQAh
         DZXOUMxSPymJnQ/S8PXNcks19eyaHF/SUWIWRpoinfB5AzTbOv9EgKzi7eYMvhx7kaJY
         gq6w==
X-Gm-Message-State: AOAM5311DmJJgMZAQcwA7Ct3vOK2RcxKplTRpomZ8eEi/UaYk14qeNhk
        zRB0JP6jEZkjCCZ/W14JCQidhw==
X-Google-Smtp-Source: ABdhPJwNPhh3+pdzKQ+M8usE3bVyjxSjNPWjsz7M3m6jZ8gVABNHZmWDEQUzTbhje9b+6aWj/M6+jg==
X-Received: by 2002:a65:6a0d:: with SMTP id m13mr16774454pgu.356.1627275126102;
        Sun, 25 Jul 2021 21:52:06 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id q18sm41345108pfj.178.2021.07.25.21.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 21:52:04 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH V3 2/5] dt-bindings: i2c: Add bindings for i2c-virtio
Date:   Mon, 26 Jul 2021 10:21:42 +0530
Message-Id: <4182aff2d1437b30025f3d17d11e5fdc21845239.1627273794.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1627273794.git.viresh.kumar@linaro.org>
References: <cover.1627273794.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds binding for virtio I2C device, it is based on
virtio-device bindings.

Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../devicetree/bindings/i2c/i2c-virtio.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml b/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
new file mode 100644
index 000000000000..0381d9065287
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio I2C Adapter
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+description:
+  Virtio I2C device, see /schemas/virtio/virtio-device.yaml for more details.
+
+properties:
+  $nodename:
+    pattern: '^i2c-virtio(-[a-z0-9]+)?$'
+
+  compatible:
+    const: virtio,22
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        i2c-virtio {
+            compatible = "virtio,22";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            light-sensor@1c {
+                compatible = "dynaimage,al3320a";
+                reg = <0x20>;
+            };
+        };
+    };
+
+...
-- 
2.31.1.272.g89b43f80a514


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB223D2161
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 11:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhGVJQV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 05:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhGVJQU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jul 2021 05:16:20 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870A5C061575
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 02:56:55 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k4-20020a17090a5144b02901731c776526so3484770pjm.4
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LFAzq1cRRdIrI+QwSGEpAIXO66croLV9YsUkTYMA32Q=;
        b=PsrOoWAkqh6dkfonRpDr/SK5Ku7QwJrkh6mKhluNLjg5DjbVNMFlGXZw4a7YGAkdZm
         UqZJ8F2/JN9Ph8FlGK0B9aVzABv+AR24uG84Bn1qAu8XaJ1M5OVR/QU/EQq6/M1+tNeM
         3i6uxRk5VLJvwL4DIigV3L50d0zf6f688z3RfxIgjWnMZ1eyHAREjpjPyJvNnZfwi5Qa
         Fa8EFUYBur8UmwAJnSel2XjzEGfUyx+qiIr3RbHM7qIShqzQMJpH4fyq/A4lRdKWhsvR
         bDrmM4NSQTn28JrQDtrJuFT+9dO59RUp8+HluBSYizWcrftarjvpZw7b7z/17eDM8Dmi
         cEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LFAzq1cRRdIrI+QwSGEpAIXO66croLV9YsUkTYMA32Q=;
        b=qrViuqyBQs/1EnZ1zejXW1Ev1/Z7ltQxQzlACkbucPB8eThHxOCkGVmGQXNa0pi9sV
         D1yOZfYSB3oyontNisLAY+9OXv+9BInHaEJlvt9Fx2JhhX2eCHdOCy2q2UPlSvC+Qbwa
         ZUACBCK9T12PGru0J4U9Laa2gdZuy+Ff1tB6PGeig/SiGf4w7tSezm14nKFBiqqwcnes
         fEBvaHkglwlNk03hCfgekwVNPGoLFB1tWymZ/BHIMHa3WG/YGPfjph3pRxikMqkGvf83
         juCsr+bUUOhjfbKGfkgYZ96Gd2dN4428ZDa0GunInfMlzZtL9Qo8Cr1hDHCStxUw34u1
         CHFg==
X-Gm-Message-State: AOAM533BFhGLFJ5fxHgEQ239EaMf2tTYqe6kPUFp9+3bEvC3BMF/ej5+
        Xd9GM73UkwMVkJlhuhJVi1zfrg==
X-Google-Smtp-Source: ABdhPJze27vHgBf6eiFDra5TYfTzpjUkBnln1aIygHD9XY8Tsdi4Y9Lf6xpc29kX3KftmTw+79L18w==
X-Received: by 2002:a17:90a:bf88:: with SMTP id d8mr39945553pjs.222.1626947815074;
        Thu, 22 Jul 2021 02:56:55 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id l10sm6274768pjg.11.2021.07.22.02.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 02:56:54 -0700 (PDT)
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
Subject: [PATCH V2 2/5] dt-bindings: i2c: Add bindings for i2c-virtio
Date:   Thu, 22 Jul 2021 15:26:40 +0530
Message-Id: <705f4426a17a395bf190ee6ed6c341ac25550f6b.1626947324.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1626947324.git.viresh.kumar@linaro.org>
References: <cover.1626947324.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds binding for virtio I2C device, it is based on
virtio-device bindings.

Cc: Wolfram Sang <wsa@kernel.org>
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


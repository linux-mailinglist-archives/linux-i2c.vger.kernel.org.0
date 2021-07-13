Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9813C6EF7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 12:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235808AbhGMKxs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 06:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235716AbhGMKxq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 06:53:46 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B10C0613E9
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jul 2021 03:50:55 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 21so19209429pfp.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jul 2021 03:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EnYeCy+chnb7U/9RWgipxfZ5cRd0rbKv0JJVnp8Co5Y=;
        b=uQicnpu80puHC1nV5JPxVpt/PFOS7yVYWyaQTg4Uwxzc4iiZk+ry2Cx73baKppSbd4
         S1Wse1LRZHJlQ16GIA6bUJUSbYpSOzn2g3Kbqyhvhs1B1XsdFEjn64Q5XJh6cambq301
         z1PnI1cya47F89QVVf3lMh1zNiIO0ljJ4R03zP+/pRZ3uv3l+vQPtfdOSVgtAnwqNNzG
         7xluKvxfcU8k8H3ZRG8bRYBUyCRyVGEpQCp5uN8SS9iCJow6P+QZuIyXWtpIQu9UwS5C
         ZbspVAbJIVcxm3Bpk4dxPbudsz5ZfItF2VMrj72D+yM6NRLpOA4daWGQUW1YMimZPZEh
         uzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EnYeCy+chnb7U/9RWgipxfZ5cRd0rbKv0JJVnp8Co5Y=;
        b=BHQOcuW6wThk4Q3+55rS2xjk6PgWunm5NwWSrUXOcNY46/fgw0dX3LruLfcd1+S+yG
         1k4h9X3MWuxOfwVjAa0FNxbfhV4JcpBONB4aGKGQHGL2gd1SSvlf6z347atutPU6nzzA
         9Mj3UaFH7ELpCIND0NKCPPPsGOU3cOyM+DG/KMceuF+OveoxXEPa1Tmxxo0JhVS1prE6
         FtcM07K8MkISQ65vnp+1vCiBADv3th4mCZtU83duHQUg0x06LGG6OOi58emZpmQfd4rA
         zCUYUakYPGaMINDGxa840aMYlyRbsVvSN4aA9FKj9eFt2NkcUB/9KsWijWG5tZvjULkR
         uzOQ==
X-Gm-Message-State: AOAM5334giILjUVaGDPQL2DlHcqTFArNsjt86JNnIpvtbx4lUDdnN5lM
        8dWvOC9AZa4WD9ytKs8T5BgvHw==
X-Google-Smtp-Source: ABdhPJzFwJQQV87UPyudup1orSZesAxle9qt6HNR9V+7tkc+MisiAKwdUthQ6nJGgGCAmI7jR7v9Zg==
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id p30-20020a056a000a1eb02902e289d85c87mr4096815pfh.73.1626173455525;
        Tue, 13 Jul 2021 03:50:55 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id gb10sm2411155pjb.43.2021.07.13.03.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 03:50:55 -0700 (PDT)
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
Subject: [PATCH 3/5] dt-bindings: i2c: Add bindings for i2c-virtio
Date:   Tue, 13 Jul 2021 16:20:32 +0530
Message-Id: <e650cecb3bc6a0ed16eb37460ac57cb191ba92e4.1626173013.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1626173013.git.viresh.kumar@linaro.org>
References: <cover.1626173013.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-virtio represents a virtio I2C device and this patch adds binding
for the same. The i2c-virtio subnode can be part of a virtio,mmio node
and is based on its binding.

Cc: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../devicetree/bindings/i2c/i2c-virtio.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml b/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
new file mode 100644
index 000000000000..6b6538f9a3d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio memory mapped I2C Adapter
+
+maintainers:
+  - Viresh Kumar <viresh.kumar@linaro.org>
+
+description:
+  Virtio I2C device, see /schemas/virtio/mmio.yaml for more details.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  $nodename:
+    pattern: '^i2c-virtio@[0-9]+$'
+
+  reg:
+    description:
+      The cell is the device ID of the I2C device (VIRTIO_ID_I2C_ADAPTER) as per
+      dt-bindings/virtio/virtio_ids.h.
+    const: 34
+    $ref: /schemas/virtio/mmio.yaml#/properties/reg
+
+required:
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/virtio/virtio_ids.h>
+
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-virtio@0 {
+            reg = <VIRTIO_ID_I2C_ADAPTER>;
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


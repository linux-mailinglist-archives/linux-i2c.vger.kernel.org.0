Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797A2473FCD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 10:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhLNJuv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 04:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbhLNJuu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Dec 2021 04:50:50 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F072C061574
        for <linux-i2c@vger.kernel.org>; Tue, 14 Dec 2021 01:50:50 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o29so13828217wms.2
        for <linux-i2c@vger.kernel.org>; Tue, 14 Dec 2021 01:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WHH4WiI2MxaNbM7UzjVUxrr+ROoXv/5adPxzCtUwAhQ=;
        b=XgVBB9UHALlGPIuK58KdiVRAPLtWiUfbLh3J0qXQf8w1DsVfquHKVtRSdooUN6XSON
         +wAFgwDhmrkV3lxmUSgbscXp6noFb9Cx8Fr+PnZ3qKRcTHHIThTJNerRcszAOCN1/gWf
         CTWwUNbQrD4lVqgvFDhY0WYCo+lFKLF4U1d2obV0f4x6dwxzwwDnn5wQoBqDzniqdx5X
         gW4JFycYbEBleAObCucbfLZcDlTCxSV5LWLWMytSuxCxGi7oMzJlKKnBcT+gJXeZt+rd
         attBewvsz07pmBI48EgQG/+ojwfzOUnYfY+OLEu9I6vb/8kt+vtZvsF9ngfgMIBG91iz
         S9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WHH4WiI2MxaNbM7UzjVUxrr+ROoXv/5adPxzCtUwAhQ=;
        b=7lHhZ3iQx+YNrkXmC2Ngx7PbczjQKh9K5Q1ugHqstSOLXyfhKO1+Nb3Y0sg5Q3n7xO
         h0F72HwwepxibccTUo5Woz9kVNQzhXjGQDR24rOXPYZQDvEyQpi1tnMGSxWEYhhVfpO6
         Nqd1bB2KN8BL3N47Q82SP+11ZvjTGXqsd0AcJEhh8g0LbFT6OKN2Mbt8nx1NF9vVHoHp
         Ako1R3x3NzWDX7saiKr21K15lGx0ZJuHdNZQOg/IXSqAY7tljQLq2MIEKg+d694at9js
         HtrWvh6sp2/27/IhBIIf5Z7S6Iatwz9oJXUmDUJkLl3p3DBNenmhmUHoojt6rp+OJ1rm
         7dqA==
X-Gm-Message-State: AOAM532n26eiR91OknXGDieX4wPKc/yGg6Jga7HM93QPX/bmQOgEy3wn
        RfcgY/CGMKhZm/wCgt8SQKSkkA==
X-Google-Smtp-Source: ABdhPJxd2AGCGNV2VrCPH24TV5pJ1pfhEkqXewGMXeGsNA2mh0yIGtTBTdgm+ToOl7+coLT1Z22puw==
X-Received: by 2002:a05:600c:2309:: with SMTP id 9mr1376636wmo.174.1639475448937;
        Tue, 14 Dec 2021 01:50:48 -0800 (PST)
Received: from fedora.sec.9e.network (ip-88-153-139-166.hsi04.unitymediagroup.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id s24sm1522757wmj.26.2021.12.14.01.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 01:50:48 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: i2c Update PCA954x
Date:   Tue, 14 Dec 2021 10:50:18 +0100
Message-Id: <20211214095021.572799-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the Maxim MAX735x as supported chip to PCA954x and add an
example how to use it.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..bd794cb80c11 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 description:
   The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
+  Compatible with Maxim MAX7356 - MAX7358 I2C mux/switch devices.
 
 allOf:
   - $ref: /schemas/i2c/i2c-mux.yaml#
@@ -19,6 +20,9 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - maxim,max7356
+          - maxim,max7357
+          - maxim,max7358
           - nxp,pca9540
           - nxp,pca9542
           - nxp,pca9543
@@ -40,6 +44,7 @@ properties:
 
   interrupts:
     maxItems: 1
+    description: Only supported on NXP devices. Unsupported on Maxim MAX735x.
 
   "#interrupt-cells":
     const: 2
@@ -100,6 +105,41 @@ examples:
                 #size-cells = <0>;
                 reg = <4>;
 
+                rtc@51 {
+                    compatible = "nxp,pcf8563";
+                    reg = <0x51>;
+                };
+            };
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-mux@74 {
+            compatible = "maxim,max7357";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x74>;
+
+            i2c@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                eeprom@54 {
+                    compatible = "atmel,24c08";
+                    reg = <0x54>;
+                };
+            };
+
+            i2c@7 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <7>;
+
                 rtc@51 {
                     compatible = "nxp,pcf8563";
                     reg = <0x51>;
-- 
2.33.1


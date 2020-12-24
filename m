Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357882E260B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Dec 2020 12:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgLXLNt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Dec 2020 06:13:49 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1807 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgLXLNt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Dec 2020 06:13:49 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 24 Dec 2020 03:12:54 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 24 Dec 2020 03:12:52 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Dec 2020 16:42:14 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 83A402DCA; Thu, 24 Dec 2020 16:42:13 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        parashar@codeaurora.org, rnayak@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 1/3] dt-bindings: power: Introduce 'assigned-performance-states' property
Date:   Thu, 24 Dec 2020 16:42:08 +0530
Message-Id: <20201224111210.1214-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201224111210.1214-1-rojay@codeaurora.org>
References: <20201224111210.1214-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While most devices within power-domains which support performance states,
scale the performance state dynamically, some devices might want to
set a static/default performance state while the device is active.
These devices typically would also run off a fixed clock and not support
dynamically scaling the device's performance, also known as DVFS
techniques.

Add a property 'assigned-performance-states' which client devices can
use to set this default performance state on their power-domains.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 .../bindings/power/power-domain.yaml          | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index aed51e9dcb11..a42977a82d06 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -66,6 +66,18 @@ properties:
       by the given provider should be subdomains of the domain specified
       by this binding.
 
+  assigned-performance-states:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+       Some devices might need to configure their power domains in a default
+       performance state while the device is active. These devices typcially
+       would also run off a fixed clock and not support dynamically scaling
+       the device's performance, also known as DVFS techniques. Each cell in
+       performance state value corresponds to one power domain specified as
+       part of the power-domains property. Performance state value can be an
+       opp-level inside an OPP table of the power-domain and need not match
+       with any OPP table performance state.
+
 required:
   - "#power-domain-cells"
 
@@ -131,3 +143,40 @@ examples:
             min-residency-us = <7000>;
         };
     };
+
+  - |
+    parent4: power-controller@12340000 {
+        compatible = "foo,power-controller";
+        reg = <0x12340000 0x1000>;
+        #power-domain-cells = <0>;
+    };
+
+    parent5: power-controller@43210000 {
+        compatible = "foo,power-controller";
+        reg = <0x43210000 0x1000>;
+        #power-domain-cells = <0>;
+        operating-points-v2 = <&power_opp_table>;
+
+        power_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            power_opp_low: opp1 {
+                opp-level = <16>;
+            };
+
+            rpmpd_opp_ret: opp2 {
+                opp-level = <64>;
+            };
+
+            rpmpd_opp_svs: opp3 {
+                opp-level = <256>;
+            };
+        };
+    };
+
+    child4: consumer@12341000 {
+        compatible = "foo,consumer";
+        reg = <0x12341000 0x1000>;
+        power-domains = <&parent4>, <&parent5>;
+        assigned-performance-states = <0>, <256>;
+    };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation


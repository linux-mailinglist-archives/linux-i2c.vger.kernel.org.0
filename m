Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF19243E14F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Oct 2021 14:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhJ1Mzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Oct 2021 08:55:33 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:7110 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhJ1Mzc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Oct 2021 08:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635425585; x=1666961585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ApmTtNYykL0F0HhfQGV4INCWvBCa1XW3z80iRjKyXhQ=;
  b=Yq5ai5sMHnjkPdD8ndKqTu1tiVmEWPgndeJvhyjSEUVXJ5p02dj5Aff/
   CMMFjf5WiFsyawc278JFnq06Cu1BjO6aHfj7EhO3jkSF1fvlB0fED5a1q
   dGvbgzPNkHohM8yqBy+DMxnV+/6PYP+wyABGZiJTstFJpelSsU1NLvPAQ
   Foj915tyh7fC1tf1HxplsOsi4BEmfTt2K+cB0tjDMViF/zYv3WJGH03nk
   9J+PF8aNFC0B6HaCZGFvMyTV1DojkI8vnjy21npaOVr2OftK6MGk/Ct5Z
   IhT9mVCCESp8AWW4uZaTD//FjaJe1pweZoP6SFyNgAD4OmEH3eByIpj+s
   A==;
IronPort-SDR: cTpWb38hlSYKwR/R48NuvONxcxkNkuBkaSUQ9xfNGAZnzLOaJrFOa+3buvld8HFEuRMa9NNYrl
 wUpPHit/DvMbwmgKv/HKU2STprx0k1z/Sttt7WdSNlhHifLaFd8ENb75GL87ZG1gCEyRwB5OQN
 12rn0p4tDhXKkoJ3BTNR1bgVuZt8jU2UD3wlYTeYF7YBh0b2MWiyd5KfsmDgcK901BVu0b4IO0
 Z0GW/fuI7KKEJdbgEM+7D6djiAlcGxb98q+PsaaSgBshqGjzM/3UZswETkk4CejfFOI5Yr738b
 Fp9XxTWmFz888CgwAIGn5cKA
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; 
   d="scan'208";a="141996004"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Oct 2021 05:53:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 28 Oct 2021 05:53:04 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 28 Oct 2021 05:53:03 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c-mux-gpmux: Add property for settle time
Date:   Thu, 28 Oct 2021 14:53:40 +0200
Message-ID: <20211028125341.2457171-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028125341.2457171-1-horatiu.vultur@microchip.com>
References: <20211028125341.2457171-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some HW requires some time for the signals to settle after the muxing is
changed. Allow this time to be specified in device tree.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
index 9b0603a72f40..4fef5aad360b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
@@ -67,6 +67,11 @@ properties:
       The properties of mux-locked and parent-locked multiplexers are discussed
       in more detail in Documentation/i2c/i2c-topology.rst.
 
+  settle-time-us:
+    default: 0
+    description:
+      The time required for the signals to settle.
+
 required:
   - compatible
   - i2c-parent
-- 
2.33.0


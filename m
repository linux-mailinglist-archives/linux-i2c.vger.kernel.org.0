Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE42A441B22
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 13:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbhKAM2w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 08:28:52 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:51132 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbhKAM2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 08:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635769578; x=1667305578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XY+GqJvzRm3FJN2iMZalD2Y1pYwtMDzs3Z5p77lzu8E=;
  b=pDPwnfg6Rtr7rRZ6SH8sKD0vVtwzfPg8GPD2mSqrIE0lGbrMInrVP8bw
   oWnE3Q7hrgQEI+b17HTl9bp7hvKQBr8szaK2korG2UbLTG/EcAbIsao39
   x7lCyW9dcIrG5AcSTI3kPrsStQIE8uL7/npo0TJmcYTKYv9pC+kbDhILs
   pIIDc+eOJ80tVrvw7ZO0KCiIDm2TW347/k7BG3ypiLAO4PXjDWl/XloSu
   YCHUJkbEKcJAWqFbyhqpX2HrVs+Enl+nC5GhlrGMF2Ed/jkoOmawA5Cu8
   iYmtVpOFpcE8+9nJbIK7GWyrjmonf8FOwv6a3qYKelyaM7fE0gDEN4Tiz
   Q==;
IronPort-SDR: R8KIFBExevldoq62Chikar7ct30Pq8zjgfekIk6SciTw30EZ+ONVg+b8/gf8jlULr1HH+os7yh
 naCo57myNIxIssAPOGlEuexu5R4qijR5uN/gEX7is/t0IsP1PCe0bnAq9e/UgpAhVtWIUhb/bo
 oTRsK9EIgPP93M4wGq93wIFtWyOuaFDnXIQyUcPvO6y8q264bE2ttwTPLKId9n38lmlEoBXW5D
 2LvC1PYWTweK7/04RXDt6bWH6qFCDK8UxnzTRmp7zxea5lHhQnxHWaBsc0U+Ma7l5IVJv5ebRC
 aT4p8PSO28sCroP2naYp1Lud
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="137580103"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2021 05:26:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 1 Nov 2021 05:26:07 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 1 Nov 2021 05:26:05 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c-mux: Add property for settle time
Date:   Mon, 1 Nov 2021 13:25:44 +0100
Message-ID: <20211101122545.3417624-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
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
 Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
index 24cac36037f5..4628ff6340c1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
@@ -29,6 +29,12 @@ properties:
   '#size-cells':
     const: 0
 
+  settle-time-us:
+    default: 0
+    description:
+      The time required for the signals to settle. Currently only the
+      i2c-mux-gpmux driver supports this optional binding.
+
 patternProperties:
   '^i2c@[0-9a-f]+$':
     $ref: /schemas/i2c/i2c-controller.yaml
-- 
2.33.0


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FCE443F23
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 10:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhKCJVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 05:21:00 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19427 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbhKCJU7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Nov 2021 05:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635931103; x=1667467103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9OUOtrjeX6mQNL04gX3kZXVqEkYApfSJYw2DXQIGJnA=;
  b=eL44FzszubPrFETJOI38SYgafU7EWNr5a7y5AopwWY2ggek3W5DI/Tb2
   9laCZuRA6pJ6S+JA2KZ7LA+W/suvNrXv49cSekJWZXnluKCDd0P14j5Hv
   HAz+XqSzxWmk9ar2CPQnPjUxR7s4vmvzoX9kd5vJs0kQvELLs7HZrsHld
   +EI55ZQy5Xp1z3Qiwy8NF8/ElzYki11ebBnx0gzN5yaZ/wKz+jc7wGOhp
   B0EklLnshnTZzheEBzbmcal1JulOzxXw/2ozFMeIn+Jp92n2lq/eFYGZQ
   jSovZObUWCy3+fkk4QrAN8ifclUp+JCjclFvrAES9zGwnhhFH8OSntyOb
   g==;
IronPort-SDR: mq6pRgjQHWnSNjfzJ/wJgEaiaxlKgQDmGbBPPUTFCRAbsUVv4SevaC5cClzy4vgn6HCi0BNPHY
 fP8nb9Egqy+/3T6Rx3js0aSUHL5xCVCz1+3yJeM3S71pdR+laKsJeXPy5fucWn1I73yxHe/s3j
 0OduUVTB/Anyda9/AwVZcCsIpH/31ypyHl+Gsrd/nQ22k3Nb3Z6BzzUuEL2WLknxar5vMaSEfe
 7zBfjlaE/+5kspBEU1adjR8EOu32hKt0NyGjdWYLMmIsAslbbgDJS6e1UuqqHa2e4tDLoS82Kv
 e377XXtYU+3W2zAwzaMYUozg
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; 
   d="scan'208";a="142631586"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Nov 2021 02:18:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 3 Nov 2021 02:18:22 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 3 Nov 2021 02:18:21 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: i2c-mux: Add property for settle time
Date:   Wed, 3 Nov 2021 10:18:38 +0100
Message-ID: <20211103091839.1665672-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211103091839.1665672-1-horatiu.vultur@microchip.com>
References: <20211103091839.1665672-1-horatiu.vultur@microchip.com>
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
 Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
index 24cac36037f5..4c81e56d02f7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
@@ -19,6 +19,11 @@ description: |+
   populating the i2c child busses.  If an 'i2c-mux' subnode is present, only
   subnodes of this will be considered as i2c child busses.
 
+  Optional properties may not be supported by all drivers. However, if a driver
+  wants to support one of the below features, it should adopt these bindings.
+
+select: false
+
 properties:
   $nodename:
     pattern: '^(i2c-?)?mux'
@@ -29,6 +34,11 @@ properties:
   '#size-cells':
     const: 0
 
+  settle-time-us:
+    default: 0
+    description:
+      The time required for the signals to settle.
+
 patternProperties:
   '^i2c@[0-9a-f]+$':
     $ref: /schemas/i2c/i2c-controller.yaml
@@ -41,6 +51,10 @@ patternProperties:
 
 additionalProperties: true
 
+required:
+  - '#address-cells'
+  - '#size-cells'
+
 examples:
   - |
     /*
-- 
2.33.0


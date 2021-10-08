Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3F9426F14
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbhJHQiU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:38:20 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40857 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231237AbhJHQiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6A26A580FF2;
        Fri,  8 Oct 2021 12:36:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 08 Oct 2021 12:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=gDYXv/fFdnWqv
        tr1uvd+CSFoRdT7CSrilcDcl3UTHuQ=; b=cBcp12SubnOlXqasSnxaobasEiOwF
        mSjVU2l40AdmXOu5HTu8mHWmb3xY01sIBp5W94Mr/JZB7w4lhmOGNFaRUCVlJdU4
        sfkt/cpJ/q20log4d5lZLjh0hstQ8Ern5hI69vC34HLY1u5cuwmXhDyoihp8rd8i
        3XxM/jW/ESQonp3j6JyPyQZPJHdODON3lp0KaP3ohc3ME5uIz+AvwLvNInq1Tssd
        29YOuzAd2xwKBj0eRrWz1cCqJ/s9szeYytGIdGlhpVdP72+cHfroBz8muZtKURl2
        29Ib2VVw+ezOTtfdc2V1zxlpTPWdUGL3W0TguUQA66zd19RgMqfcy4jrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=gDYXv/fFdnWqvtr1uvd+CSFoRdT7CSrilcDcl3UTHuQ=; b=oLcZbuWl
        WKf8fLTS1YJZhD52MysFL91NDHh7lH5QSE+c9ZPqiVE2168GQnWLKSXgh7AW4hpj
        FX1swTpZaPO+i9eZqaPNE6pTfNnFlVMiDUCaDygJ+xZsAjC3WP4Cn+A4F4V/jx5S
        PJakhLLB+4+jiv2jOeAHSltcZ6hh0Gx7GpyRnCHKQ+rSxLuk3o62kfraZWlTqNtp
        EH6frBbgN7NYr4HqywY6YOuPAEYygrdVKfw9cD2Ffcmu8FEM4HszJ6A2Gfh+AXEO
        uJ5aZx2Q1WWjbPqXdF3mhnkOupQCaFKuvtlXHbL7bXWGHWzzUCC1skS/mJioytxq
        WiKZvIcsFieJNg==
X-ME-Sender: <xms:gXNgYRUXQOwxOUsVuhVr14_bsZlhUAlfwqLARr5z_WUj1_K0uFLlag>
    <xme:gXNgYRnOWPFgi4CRvh4ZP_lwi5Yij6G82f3Ap_QsUO1SPxZxgBOJ2RfufIfHTGm0M
    7uOGvYOmLmLrTmEyUI>
X-ME-Received: <xmr:gXNgYdaOZjDfcTNJ1b6SN8mdXwkvxACl7BTpGvZt-Z4_dYD9MPAVA-Mh0lDhPNNde9OxnHZX3Al8UD2NIxCYIQZ3wLg2tT29oXnX1w2UY84q7F8dqnN_aCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeeivdduffetvdeiveeiffdvjeevieevudfhieefgeehheehtdfgheffueehfefh
    leenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdhgihhthhhusgdrtghomh
    dpohhfthgtrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:gXNgYUWBKkbDaAYDulQQp0Q0u5OvCEoAFfWw6oiMn3OkR1G2milGVA>
    <xmx:gXNgYbnMHE52Gt8f9r_7OA7dy78R9RtlA6QymOiggdZkR8z4f5ZXqA>
    <xmx:gXNgYRf9o8vcMfqoPQpCcvLiR7ehh5Ml6OAsjg63R9wwrOIZbW97Ag>
    <xmx:gXNgYafyOOLqJhTkg6uqg2IE-PsSNGWnwycOAqJADbojS6GS7Y1q3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:13 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/11] dt-bindings: i2c: Add Apple I2C controller bindings
Date:   Fri,  8 Oct 2021 18:35:22 +0200
Message-Id: <20211008163532.75569-2-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Apple I2C controller is based on the PASemi I2C controller.
It is present on Apple SoCs such as the M1.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 .../devicetree/bindings/i2c/apple,i2c.yaml    | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
new file mode 100644
index 000000000000..22fc8483256f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Apple/PASemi I2C controller
+
+maintainers:
+  - Sven Peter <sven@svenpeter.dev>
+
+description: |
+  Apple SoCs such as the M1 come with a I2C controller based on the one found
+  in machines with P. A. Semi's PWRficient processors.
+  The bus is used to communicate with e.g. USB PD chips or the speaker
+  amp.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - apple,t8103-i2c
+      - apple,i2c
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: I2C bus reference clock
+
+  interrupts:
+    maxItems: 1
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. If not specified, 100 kHz will be
+      used. This frequency is generated by dividing the reference clock.
+      Allowed values are between ref_clk/(16*4) and ref_clk/(16*255).
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@35010000 {
+      compatible = "apple,t8103-i2c";
+      reg = <0x35010000 0x4000>;
+      interrupt-parent = <&aic>;
+      interrupts = <0 627 4>;
+      clocks = <&ref_clk>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 7cfd63ce7122..74aa85967ca3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1735,6 +1735,7 @@ B:	https://github.com/AsahiLinux/linux/issues
 C:	irc://irc.oftc.net/asahi-dev
 T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/apple.yaml
+F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
-- 
2.25.1


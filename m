Return-Path: <linux-i2c+bounces-774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB9812D7A
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 11:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 595F01C20F35
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 10:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B2F3D990;
	Thu, 14 Dec 2023 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GO+aZo3R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EFC138
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:52:55 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c41df5577so47845875e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551174; x=1703155974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uni2IevXVLxWfb8CoVcIQYuHYfYSTP7QTj2/YzSprck=;
        b=GO+aZo3RWFDSo5tZ2ULlCkNMhOx2dZxSfN30vKiOzxIBML6P8IKVVXAmpv5jsjPbLy
         q2u6SNwmPBZWETwM1jIalirh+M3JTP6RjUAIfJE9bPp496d2J9Qqt6t4bf1hzQ3kxk+1
         XJKgUnViYwWrZmbfev5uorBqKluIGqmhOn6r5zdL6BcZvscAmX+bU/SAmP6m/htKHFk3
         N1pvU7FK++i54OQCgiSvqxL3/5lTOgGamfAdZld8+UO6MMj0I1OK1JgmJFP9K17d/DfP
         XK4KtputzM8dlIE0a5h/srmgoSl8ykxswjd7GwKGAZS2Xiw++DWuP++nYdNL4WgdZ2lz
         Xl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551174; x=1703155974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uni2IevXVLxWfb8CoVcIQYuHYfYSTP7QTj2/YzSprck=;
        b=ZvJgg2KZ+sFOkXWoYctqyzOZrVPAkpjvwnQxGm1bO03R3Mxf/GXRQCxRB5b1ZCggVz
         sg6rb8iSyopuNJiYvFr5EeC3Ub+FaSOMMsjdMQn6bOROUqtFUxLmVDaFrNGkxHH3XrFV
         Fv850WbOrbLDuk5Ph+b79D0qFqj+cJlHesdXdOtorEbC77yc6dNXDEK0zCYtf7DQqJHs
         eA8P3nR3n553xkusNF+A6/lG/HT67uNaXFWFkDaTbks0RXqoni7Li82iLoZLfihNFQnW
         u0c+lspk8YjKQqz0saPM3+igxx0OzYdg+0ZqBfIGZGLZKFtl4e+wavaSMqW6rfC6OZAA
         nHmA==
X-Gm-Message-State: AOJu0YzrEUYXziOd51g3gbP7551T3S1rRzh7pqF/YhtEST4TkMalp+6B
	XthWWRnYQi4nThjMAq9ORFP69A==
X-Google-Smtp-Source: AGHT+IF/dpPnC1aOyxsiIUbpq+FHwoAHeLKTjdup8H0ycPqMEYCePvIF5ZRoGWvsLq6ZxBMBrAWDWg==
X-Received: by 2002:a05:600c:917:b0:40b:4b67:3028 with SMTP id m23-20020a05600c091700b0040b4b673028mr2492400wmp.34.1702551173928;
        Thu, 14 Dec 2023 02:52:53 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:52:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 02/13] dt-bindings: clock: google,gs101-clock: add PERIC0 clock management unit
Date: Thu, 14 Dec 2023 10:52:32 +0000
Message-ID: <20231214105243.3707730-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
clock management unit.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
 include/dt-bindings/clock/google,gs101.h      | 86 +++++++++++++++++++
 2 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 3eebc03a309b..ba54c13c55bc 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -30,14 +30,15 @@ properties:
       - google,gs101-cmu-top
       - google,gs101-cmu-apm
       - google,gs101-cmu-misc
+      - google,gs101-cmu-peric0
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   "#clock-cells":
     const: 1
@@ -88,6 +89,26 @@ allOf:
             - const: dout_cmu_misc_bus
             - const: dout_cmu_misc_sss
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_peric0_bus
+            - const: dout_cmu_peric0_ip
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 21adec22387c..7d7a896416a7 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -389,4 +389,90 @@
 #define CLK_GOUT_MISC_WDT_CLUSTER1_PCLK			73
 #define CLK_GOUT_MISC_XIU_D_MISC_ACLK			74
 
+/* CMU_PERIC0 */
+/* CMU_PERIC0 MUX */
+#define CLK_MOUT_PERIC0_BUS_USER			1
+#define CLK_MOUT_PERIC0_I3C_USER			2
+#define CLK_MOUT_PERIC0_USI0_UART_USER			3
+#define CLK_MOUT_PERIC0_USI14_USI_USER			4
+#define CLK_MOUT_PERIC0_USI1_USI_USER			5
+#define CLK_MOUT_PERIC0_USI2_USI_USER			6
+#define CLK_MOUT_PERIC0_USI3_USI_USER			7
+#define CLK_MOUT_PERIC0_USI4_USI_USER			8
+#define CLK_MOUT_PERIC0_USI5_USI_USER			9
+#define CLK_MOUT_PERIC0_USI6_USI_USER			10
+#define CLK_MOUT_PERIC0_USI7_USI_USER			11
+#define CLK_MOUT_PERIC0_USI8_USI_USER			12
+
+/* CMU_PERIC0 Dividers */
+#define CLK_DOUT_PERIC0_I3C				13
+#define CLK_DOUT_PERIC0_USI0_UART			14
+#define CLK_DOUT_PERIC0_USI14_USI			15
+#define CLK_DOUT_PERIC0_USI1_USI			16
+#define CLK_DOUT_PERIC0_USI2_USI			17
+#define CLK_DOUT_PERIC0_USI3_USI			18
+#define CLK_DOUT_PERIC0_USI4_USI			19
+#define CLK_DOUT_PERIC0_USI5_USI			20
+#define CLK_DOUT_PERIC0_USI6_USI			21
+#define CLK_DOUT_PERIC0_USI7_USI			22
+#define CLK_DOUT_PERIC0_USI8_USI			23
+
+/* CMU_PERIC0 Gates */
+#define CLK_GOUT_PERIC0_IP				24
+#define CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK		25
+#define CLK_GOUT_PERIC0_CLK_PERIC0_OSCCLK_CLK		26
+#define CLK_GOUT_PERIC0_D_TZPC_PERIC0_PCLK		27
+#define CLK_GOUT_PERIC0_GPC_PERIC0_PCLK			28
+#define CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK		29
+#define CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK		30
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0		31
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1		32
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_10		33
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_11		34
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_12		35
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_13		36
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_14		37
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_15		38
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2		39
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3		40
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4		41
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5		42
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6		43
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7		44
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_8		45
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_9		46
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0		47
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1		48
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_10		49
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_11		50
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_12		51
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_13		52
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_14		53
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_15		54
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2		55
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3		56
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4		57
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5		58
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6		59
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7		60
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_8		61
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_9		62
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0		63
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2		64
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0		65
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2		66
+#define CLK_GOUT_PERIC0_CLK_PERIC0_BUSP_CLK		67
+#define CLK_GOUT_PERIC0_CLK_PERIC0_I3C_CLK		68
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK	69
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI14_USI_CLK	70
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI1_USI_CLK		71
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI2_USI_CLK		72
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI3_USI_CLK		73
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI4_USI_CLK		74
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI5_USI_CLK		75
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI6_USI_CLK		76
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI7_USI_CLK		77
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK		78
+#define CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK		79
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.43.0.472.g3155946c3a-goog



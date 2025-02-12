Return-Path: <linux-i2c+bounces-9365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C8A31ABD
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 01:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EDD11889015
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 00:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58D5FC0E;
	Wed, 12 Feb 2025 00:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m17bi5FV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B906B1F94D;
	Wed, 12 Feb 2025 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321333; cv=none; b=jL0Zf6lC4YolXdaRCGaYR4KK+j/weim9T3aARouMWkLk0cSqFF5UFFvEHPGd13nsatLAQ5wui9ehq+LSD7bWR+uYrsA2jGdN+DYN0pIRHgeHK/ST0MvPhaK6k4N5SJF8jJV3uymklwzMF1NGScu0x/HWj+rZSw00bCquzFgHiUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321333; c=relaxed/simple;
	bh=7XzbACUQoi4dAWfPtiC8nT+Wi/j7SSIsF0bZveV9t1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dFJEDdXfZA6Xr3k2WFYZSVqbp+cIKWs4HccEzBvIxTYRks2szlUJfbJ/WY1GclnuXYNk3CGRwvWTVd7PgpIec5eoU3qqUG+ogafxx4sUsX2reEFqSgRqJ7MDHd8y6vAGx49UD11uUGbVDiegqYqFQw9zG6iZ7xZbdDf6ug4OIyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m17bi5FV; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8670d630d2dso1172564241.1;
        Tue, 11 Feb 2025 16:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321331; x=1739926131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isfA0SNs+wfkilPmRRKeVTcQKuXYPXL/vBWgpcfK6EI=;
        b=m17bi5FV9C9VL5fv4XmgzWk7DghwsqkwFYHB8hcRXXSdMUmqJ+gth8LDmMf+uyGdkt
         xVpVcVRU6UErI0zC77YFLAqyWgvXG+hSAX173H3v/jOjr314QFtGEB8tTbm0CZRY6E0U
         2thooYHfPK1pYVafh7O0XP8O3ZkPdL/xdzrXJIM3oL9brTRS9qIsizZifzgZC/+KFU4F
         PM85uuHhOlUfzFDpjbqfeS9D6O0PKB8YrdiLnH3HkpZ8V85VrZAh/x22F8sTrMeR83cS
         PvgjvhgGpqU/WKn7RssYWeWRwKMNI0Ftb2xYmLcFZWVQCEQogQ3bR0Qy5/kQ67pay7SE
         0K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321331; x=1739926131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isfA0SNs+wfkilPmRRKeVTcQKuXYPXL/vBWgpcfK6EI=;
        b=DslVlKNH/wyKVf7ZaM14xtegle9512oGQWue1RwlkKKyrw2nx7BN5xha8WUxKPs8xv
         M+/k3mSJlgWjC08+24smuxEv4oTTVFj82E1u8F5Jm66gCz2cNf/MQEcFdxzEBzEhJ/F+
         dQoCKK3YIgTbZW2YMFv+Mal9/cHyjOucYALIi06Teh+06/IBHZQMT09DfIA2NFfTcuR6
         M2NcDHlDtABUF+D9Prw8QFPywjwv5kTOSX2X/DdBf3ZUhRmXDHRaYEjwBT4PaCd0IHEI
         dW8Rsv3aF9KfauHhrjF8IGq8D4L1rWJFTKdPVcw1xp+c87OtvPck+FX4U4ARnuc4I1lW
         2K4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwWSLhumqEHckjJwl1ZGt8Oe6yj4dWHTEJswkFufjOld6qtftsF8MbcFjnyrfzm3vzeyTzCA6Oj7Aa@vger.kernel.org, AJvYcCVNbmJvlAEYndNRK91FB3dA+xwBcmv77wUgkxC+85DPcNgkg+DaCiGpTmclK6ssL+LGaf6rdyOsjL8Hp4sKPz4Q+Ew=@vger.kernel.org, AJvYcCVYhX1IXbWb7h8qrzmu3jEUOm+843GC8eAvbgmnQL1MSuvmTThKoprbyGzEXkvGSYuV/rmzeItsw0HRuiue@vger.kernel.org, AJvYcCWkxFehfU2KsvifDCYjPy/WuTmPvzgr5I5D7e6O5tfPz9nTr1r2j0lDAhFkwBA/645r6KF2PSGwNdgt@vger.kernel.org, AJvYcCX0kbH4XG/KKxjcOc+aUbvYabB6Dhzx6Qp+yILst7rpSFMMFEGKJQS7ciXnLRVLaKQuSIEyyKOKM4+e@vger.kernel.org
X-Gm-Message-State: AOJu0YwqIFfCw4VV47lFwWVmON7tsffsrGKDGe1NmLKJVcbLqtQht2VT
	a21HMKRPRaapGUbFCiOnM3tKkexPPQmycb87G+cNSbnab0WqfoVx
X-Gm-Gg: ASbGnct42EF8zxuSYU2g3MhWFL0b2R5Ey5fyQ/8U3GA1ZkKlIX2xJh5kA0ZbHdUUqEw
	0mBewLqat+IdEXhavln0FIO/EXMdSk2t4YP0zOobRb2wnMPgIZuIDSV+q18s5ajS1jG98oGgLc0
	RWI2NJLrdpw96Nph7JjerA93na7brfGhgLOt8hmAIjwUejkgXRo+ykGEKSCpYS9Wgr6okHV+xMK
	AuJSDkSgmGhe85jFM8jyn9JwfIQx7xHiuv2IBJDKV7OwbiDFAgMgTZhFMIK9ZbsB8EAuoMbU2nN
	ramjVxXjyId51eyZObhLtt1+JXIjFMWy1svf1lxKWMdn+LZG7vm85SgDxALyd6S9ONSFp1fqXu7
	IZQ==
X-Google-Smtp-Source: AGHT+IG4uCU+APGBvxqLpuH1ja/IYygMakhsrEWy+UTE1O6RH0zqZyOcucVuJtVsB1n0p23lIUsmwg==
X-Received: by 2002:a05:6102:2ad4:b0:4bb:c9bd:8dc5 with SMTP id ada2fe7eead31-4bbf216cce7mr1387460137.3.1739321330555;
        Tue, 11 Feb 2025 16:48:50 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:48:50 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock management unit
Date: Wed, 12 Feb 2025 00:48:21 +0000
Message-Id: <20250212004824.1011-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-schema documentation for the Connectivity Peripheral 0 / 1
(PERIC0/1) clock management unit.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../clock/samsung,exynos990-clock.yaml        |  24 +++
 include/dt-bindings/clock/samsung,exynos990.h | 176 ++++++++++++++++++
 2 files changed, 200 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
index c15cc1752..dd301deda 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -30,6 +30,8 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos990-cmu-peric0
+      - samsung,exynos990-cmu-peric1
       - samsung,exynos990-cmu-hsi0
       - samsung,exynos990-cmu-peris
       - samsung,exynos990-cmu-top
@@ -56,6 +58,28 @@ required:
   - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-cmu-peric1
+              - samsung,exynos990-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: Connectivity Peripheral 0/1 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ip
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2..e94bdcc7b 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -233,6 +233,182 @@
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
 
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER		1
+#define CLK_MOUT_PERIC0_USI00_USI_USER		2
+#define CLK_MOUT_PERIC0_USI01_USI_USER		3
+#define CLK_MOUT_PERIC0_USI02_USI_USER		4
+#define CLK_MOUT_PERIC0_USI03_USI_USER		5
+#define CLK_MOUT_PERIC0_USI04_USI_USER		6
+#define CLK_MOUT_PERIC0_USI05_USI_USER		7
+#define CLK_MOUT_PERIC0_USI_I2C_USER		8
+#define CLK_MOUT_PERIC0_UART_DBG		9
+#define CLK_MOUT_PERIC0_USI13_USI_USER		10
+#define CLK_MOUT_PERIC0_USI14_USI_USER		11
+#define CLK_MOUT_PERIC0_USI15_USI_USER		12
+#define CLK_DOUT_PERIC0_USI00_USI		13
+#define CLK_DOUT_PERIC0_USI01_USI		14
+#define CLK_DOUT_PERIC0_USI02_USI		15
+#define CLK_DOUT_PERIC0_USI03_USI		16
+#define CLK_DOUT_PERIC0_USI04_USI		17
+#define CLK_DOUT_PERIC0_USI05_USI		18
+#define CLK_DOUT_PERIC0_USI_I2C			19
+#define CLK_DOUT_PERIC0_UART_DBG		20
+#define CLK_DOUT_PERIC0_USI13_USI		21
+#define CLK_DOUT_PERIC0_USI14_USI		22
+#define CLK_DOUT_PERIC0_USI15_USI		23
+#define CLK_GOUT_PERIC0_GPIO_PCLK		24
+#define CLK_GOUT_PERIC0_SYSREG_PCLK		25
+#define CLK_GOUT_PERIC0_CMU_PCLK		26
+#define CLK_GOUT_PERIC0_BUSP_CLK		27
+#define CLK_GOUT_PERIC0_OSCCLK_CLK		28
+#define CLK_GOUT_PERIC0_USI00_USI_CLK		29
+#define CLK_GOUT_PERIC0_USI_I2C_CLK		30
+#define CLK_GOUT_PERIC0_USI01_USI_CLK		31
+#define CLK_GOUT_PERIC0_USI02_USI_CLK		32
+#define CLK_GOUT_PERIC0_USI03_USI_CLK		33
+#define CLK_GOUT_PERIC0_USI04_USI_CLK		34
+#define CLK_GOUT_PERIC0_USI05_USI_CLK		35
+#define CLK_GOUT_PERIC0_UART_DBG_CLK		36
+#define CLK_GOUT_PERIC0_LHM_AXI_P_CLK		37
+#define CLK_GOUT_PERIC0_USI13_USI_CLK		38
+#define CLK_GOUT_PERIC0_USI14_USI_CLK		39
+#define CLK_GOUT_PERIC0_D_TZPC_PCLK		40
+#define CLK_GOUT_PERIC0_USI15_USI_CLK		41
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_4		42
+#define CLK_GOUT_PERIC0_TOP0_PCLK_4		43
+#define CLK_GOUT_PERIC0_TOP0_PCLK_5		44
+#define CLK_GOUT_PERIC0_TOP0_PCLK_6		45
+#define CLK_GOUT_PERIC0_TOP0_PCLK_7		46
+#define CLK_GOUT_PERIC0_TOP0_PCLK_8		47
+#define CLK_GOUT_PERIC0_TOP0_PCLK_9		48
+#define CLK_GOUT_PERIC0_TOP0_PCLK_10		49
+#define CLK_GOUT_PERIC0_TOP0_PCLK_11		50
+#define CLK_GOUT_PERIC0_TOP0_PCLK_12		51
+#define CLK_GOUT_PERIC0_TOP0_PCLK_13		52
+#define CLK_GOUT_PERIC0_TOP0_PCLK_14		53
+#define CLK_GOUT_PERIC0_TOP0_PCLK_15		54
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_5		55
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_6		56
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_7		57
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_8		58
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_9		59
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_10		60
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_11		61
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_12		62
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_13		63
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_14		64
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_15		65
+#define CLK_GOUT_PERIC0_TOP1_PCLK_0		66
+#define CLK_GOUT_PERIC0_TOP1_PCLK_3		67
+#define CLK_GOUT_PERIC0_TOP1_PCLK_4		68
+#define CLK_GOUT_PERIC0_TOP1_PCLK_5		69
+#define CLK_GOUT_PERIC0_TOP1_PCLK_6		70
+#define CLK_GOUT_PERIC0_TOP1_PCLK_7		71
+#define CLK_GOUT_PERIC0_TOP1_PCLK_8		72
+#define CLK_GOUT_PERIC0_TOP1_PCLK_15		73
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_0		74
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_3		75
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_4		76
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_5		77
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_6		78
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_7		79
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_8		80
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER		1
+#define CLK_MOUT_PERIC1_UART_BT_USER		2
+#define CLK_MOUT_PERIC1_USI_I2C_USER		3
+#define CLK_MOUT_PERIC1_USI06_USI_USER		4
+#define CLK_MOUT_PERIC1_USI07_USI_USER		5
+#define CLK_MOUT_PERIC1_USI08_USI_USER		6
+#define CLK_MOUT_PERIC1_USI09_USI_USER		7
+#define CLK_MOUT_PERIC1_USI10_USI_USER		8
+#define CLK_MOUT_PERIC1_USI11_USI_USER		9
+#define CLK_MOUT_PERIC1_USI12_USI_USER		10
+#define CLK_MOUT_PERIC1_USI18_USI_USER		11
+#define CLK_MOUT_PERIC1_USI16_USI_USER		12
+#define CLK_MOUT_PERIC1_USI17_USI_USER		13
+#define CLK_DOUT_PERIC1_UART_BT			14
+#define CLK_DOUT_PERIC1_USI_I2C			15
+#define CLK_DOUT_PERIC1_USI06_USI		16
+#define CLK_DOUT_PERIC1_USI07_USI		17
+#define CLK_DOUT_PERIC1_USI08_USI		18
+#define CLK_DOUT_PERIC1_USI18_USI		19
+#define CLK_DOUT_PERIC1_USI12_USI		20
+#define CLK_DOUT_PERIC1_USI09_USI		21
+#define CLK_DOUT_PERIC1_USI10_USI		22
+#define CLK_DOUT_PERIC1_USI11_USI		23
+#define CLK_DOUT_PERIC1_USI16_USI		24
+#define CLK_DOUT_PERIC1_USI17_USI		25
+#define CLK_GOUT_PERIC1_GPIO_PCLK		26
+#define CLK_GOUT_PERIC1_SYSREG_PCLK		27
+#define CLK_GOUT_PERIC1_CMU_PCLK		28
+#define CLK_GOUT_PERIC1_BUSP_CLK		29
+#define CLK_GOUT_PERIC1_USI06_USI_CLK		30
+#define CLK_GOUT_PERIC1_USI07_USI_CLK		31
+#define CLK_GOUT_PERIC1_USI08_USI_CLK		32
+#define CLK_GOUT_PERIC1_USI09_USI_CLK		33
+#define CLK_GOUT_PERIC1_USI10_USI_CLK		34
+#define CLK_GOUT_PERIC1_USI_I2C_CLK		35
+#define CLK_GOUT_PERIC1_UART_BT_CLK		36
+#define CLK_GOUT_PERIC1_USI12_USI_CLK		37
+#define CLK_GOUT_PERIC1_USI18_USI_CLK		38
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CLK		39
+#define CLK_GOUT_PERIC1_USI11_USI_CLK		40
+#define CLK_GOUT_PERIC1_D_TZPC_PCLK		41
+#define CLK_GOUT_PERIC1_USI16_USI_CLK		42
+#define CLK_GOUT_PERIC1_USI17_USI_CLK		43
+#define CLK_GOUT_PERIC1_TOP0_PCLK_4		44
+#define CLK_GOUT_PERIC1_TOP0_PCLK_10		45
+#define CLK_GOUT_PERIC1_TOP0_PCLK_11		46
+#define CLK_GOUT_PERIC1_TOP0_PCLK_12		47
+#define CLK_GOUT_PERIC1_TOP0_PCLK_13		48
+#define CLK_GOUT_PERIC1_TOP0_PCLK_14		49
+#define CLK_GOUT_PERIC1_TOP0_PCLK_15		50
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_4		51
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_10		52
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_11		53
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_12		54
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_13		55
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_14		56
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_15		57
+#define CLK_GOUT_PERIC1_TOP1_PCLK_1		58
+#define CLK_GOUT_PERIC1_TOP1_PCLK_0		59
+#define CLK_GOUT_PERIC1_TOP1_PCLK_2		60
+#define CLK_GOUT_PERIC1_TOP1_PCLK_3		61
+#define CLK_GOUT_PERIC1_TOP1_PCLK_4		62
+#define CLK_GOUT_PERIC1_TOP1_PCLK_5		63
+#define CLK_GOUT_PERIC1_TOP1_PCLK_6		64
+#define CLK_GOUT_PERIC1_TOP1_PCLK_7		65
+#define CLK_GOUT_PERIC1_TOP1_PCLK_9		66
+#define CLK_GOUT_PERIC1_TOP1_PCLK_10		67
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_0		68
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_1		69
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_2		70
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_3		71
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_4		72
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_5		73
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_6		74
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_7		75
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_9		76
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_10		77
+#define CLK_GOUT_PERIC1_OSCCLK_CLK		78
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CSIS_CLK	79
+#define CLK_GOUT_PERIC1_XIU_P_ACLK		80
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_12		81
+#define CLK_GOUT_PERIC1_TOP1_PCLK_12		82
+#define CLK_GOUT_PERIC1_TOP1_PCLK_13		83
+#define CLK_GOUT_PERIC1_TOP1_PCLK_14		84
+#define CLK_GOUT_PERIC1_TOP1_PCLK_15		85
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_13		86
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_14		87
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_15		88
+#define CLK_GOUT_PERIC1_USI16_I3C_PCLK		89
+#define CLK_GOUT_PERIC1_USI16_I3C_SCLK		90
+#define CLK_GOUT_PERIC1_USI17_I3C_SCLK		91
+#define CLK_GOUT_PERIC1_USI17_I3C_PCLK		92
+
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER			1
 #define CLK_MOUT_PERIS_CLK_PERIS_GIC		2
-- 
2.48.1



Return-Path: <linux-i2c+bounces-10113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F2A7D18D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B07D188D15A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98DB13DB9F;
	Mon,  7 Apr 2025 01:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVA/Cy0/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E8C13A86C;
	Mon,  7 Apr 2025 01:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988053; cv=none; b=jPCUxeauCFqJjRU7PMgM4ByC8GThG94O+tGNNZ6QJnHu7CcDXAy/0cqANEcz59RFPO8qxncbuG0YMc3qVWcp0VGRIUPwSekMiU0e9MPs4jpW1hdzemTW7Mo4RsvdSM8J8uXHXo7dWhNYhys32/kqsiTY9bkaCtTItRhh/9Bpr1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988053; c=relaxed/simple;
	bh=QfeMgxtQ8abHzSdGZdDL4trjG+PR3srJFkJWlHLruFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUksRJZlmd14jbrTBbb31dHhdF2MfmwAu/wXyZcIR0BOsPfLI5Jzqz1BnBtG1YPUmQA21Z5d4cgHbqdpgPpRpaC90ByhUtp/+7etJdi9DKcMwcLFLsbOH6gs+O/SIyIwo9/KUu8OIb29dYNBT4ZIo/xyz3mgIGa/qomqAtcY654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVA/Cy0/; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso36066176d6.1;
        Sun, 06 Apr 2025 18:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988048; x=1744592848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIiQZrhDOZB3T9ZEzYzuko3bqDdUeLpNJqwMLRUR70Q=;
        b=YVA/Cy0/FvOEPQpnDmTOkK4cjXOtFpV6PK+ePJ9uLFQXE+BdXZuYzIl66jn+0QraW/
         SXJmsfbc84736uIKRrDcexyDixcKeBmj4lMD/K5u00GPz1G1NXHoDZ/+IwtTvvr6IgVe
         o61DxeplOp9HnSCyRE8bR9qk0vz5Rzw3SBSLxyjlhUK8wGJ+CqE42ys3c39USBSd0ueD
         9evpy9/py5GqPyBtqdSWMDCDAeVA2FSp5xVqZtunH2j5L22tmnsVoIAt/CNU18GAvQj9
         vfCUr9dZnv23yhSX/4j34O2Sq14eoz9agv6+T/NmDIsAZRLUUo4oqPO/gn5SavvqnfcX
         f4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988048; x=1744592848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIiQZrhDOZB3T9ZEzYzuko3bqDdUeLpNJqwMLRUR70Q=;
        b=aBpxQNP8Ay4yb+kz5x/1F40xpHWxXdbUWfYx/EL2SkQzxwhdt8cJnmOvYLnKHoxr4v
         CdsL4nCi/pY0EECNmtf1bO1lTAW6fU6G4ZcBZgQYw8nzbjz0aKcXdvL2iTf2e55D3Udr
         pwIetVl5o1sIu6IrK3BBaZMcDZ049nps6uwmhgfocAXytb9/N2b1i2UNyxtiY4VzIApI
         CLjuDwSB5sRRvNkJ22E2kvAB5Rg4icBw1E8Hzz+9jA4WR4kJP8xAXntW0Oa1ZSblb05L
         YW1kjgVJatZtIFSzax60QyYC/LObaEYw9ijwLqjB737T4PLY5wz5qIsZo1NTn4G02Y8H
         rSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmGAV4Ip5cKa7/8c2PBd8xVk5sg46ckTYln3qqSB0Ta3UvNXenBU58a3e7LrbvjeGXAqLD+KDfDurs@vger.kernel.org, AJvYcCWS7RCjHfT2KfQy5G/dbSL9Z5s8CKVYWGx8q0cSSd9/ExKltrr72tDCCJNF3kAFPTLG97OZR8RItQ+UXr5n@vger.kernel.org, AJvYcCWou0sTIyLs0G460S3wM50/tRFN5p4uhbjVzCjSma6xcFJnPiJ8U+iFfeNiZAOzVvHLKOv2iHrFjPau@vger.kernel.org, AJvYcCXfPibp0okHq1h4DaZrg3arpn5v4YPvwUas3yNaGIkPiBrAhjz+m7k6d/O/Nj0lrYR1mwh+HgFS1GYA@vger.kernel.org
X-Gm-Message-State: AOJu0YxwR9HqBmH9ZU8MvCx6WmhhKz/zvrYBx+0eBX121aAshIbOtnga
	qutzAtU9IdE5/1EKyhgPPq2j7ExbXtsCwMJw/Twh27EHsNPyPkCL
X-Gm-Gg: ASbGncss+b0W8u96L4jjPmwIC7WQZbRZUFlPQ3yLmAgkfFIkTnTQYNVCCTCww+b4M63
	+LWc0NhHB2ndHGVSd8cT3VEjFt+ZXRPXUpktdLbWfO+aygo+YYuhTXcMx6g9CQ900rXsXsrAxvQ
	7lsZhAFuSZZFfLGhgHF8LaGHMnQyu6lQ8khUAo380LE+bn27DAw48tyP/Fg6dSDurddJrAEK85Q
	e/5gwmMuq6/fNa3buzwqKWc9UM7owO0x4zFaTHH2FkdcfvFWZfu+zgoeFT+Y1VqkvoUF7oRnudP
	C4nzvnv6wty5EzoObBI2
X-Google-Smtp-Source: AGHT+IG+a4C0uFC3f6pnl48yl9IGJnTWEUbKcyDUG9ZSeQZr0QkX6f+b6/Tm11Z6elulmXAxdz2omw==
X-Received: by 2002:a05:6214:2027:b0:6d4:1bad:740c with SMTP id 6a1803df08f44-6f05830322amr186432506d6.4.1743988047335;
        Sun, 06 Apr 2025 18:07:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f0483a3sm51830396d6.63.2025.04.06.18.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
Date: Mon,  7 Apr 2025 09:06:14 +0800
Message-ID: <20250407010616.749833-10-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2044 SRD3-10 board bases on Sophgo SG2044 SoC.
This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
1 microSD slot.

Add initial device tree of this board with uart support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |    1 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
 5 files changed, 3249 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 47d4243a8f35..85966306801e 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
new file mode 100644
index 000000000000..2dab3de637ba
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -0,0 +1,3002 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Sophgo Technology Inc. All rights reserved.
+ */
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <50000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c920", "riscv";
+			reg = <0>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache0>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "thead,c920", "riscv";
+			reg = <1>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache0>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "thead,c920", "riscv";
+			reg = <2>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache0>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "thead,c920", "riscv";
+			reg = <3>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache0>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu4: cpu@4 {
+			compatible = "thead,c920", "riscv";
+			reg = <4>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache1>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu5: cpu@5 {
+			compatible = "thead,c920", "riscv";
+			reg = <5>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache1>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu6: cpu@6 {
+			compatible = "thead,c920", "riscv";
+			reg = <6>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache1>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu7: cpu@7 {
+			compatible = "thead,c920", "riscv";
+			reg = <7>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache1>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu8: cpu@8 {
+			compatible = "thead,c920", "riscv";
+			reg = <8>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache2>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu8_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu9: cpu@9 {
+			compatible = "thead,c920", "riscv";
+			reg = <9>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache2>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu9_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu10: cpu@10 {
+			compatible = "thead,c920", "riscv";
+			reg = <10>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache2>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu10_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu11: cpu@11 {
+			compatible = "thead,c920", "riscv";
+			reg = <11>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache2>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu11_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu12: cpu@12 {
+			compatible = "thead,c920", "riscv";
+			reg = <12>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache3>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu12_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu13: cpu@13 {
+			compatible = "thead,c920", "riscv";
+			reg = <13>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache3>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu13_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu14: cpu@14 {
+			compatible = "thead,c920", "riscv";
+			reg = <14>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache3>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu14_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu15: cpu@15 {
+			compatible = "thead,c920", "riscv";
+			reg = <15>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache3>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu15_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu16: cpu@16 {
+			compatible = "thead,c920", "riscv";
+			reg = <16>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache4>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu16_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu17: cpu@17 {
+			compatible = "thead,c920", "riscv";
+			reg = <17>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache4>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu17_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu18: cpu@18 {
+			compatible = "thead,c920", "riscv";
+			reg = <18>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache4>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu18_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu19: cpu@19 {
+			compatible = "thead,c920", "riscv";
+			reg = <19>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache4>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu19_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu20: cpu@20 {
+			compatible = "thead,c920", "riscv";
+			reg = <20>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache5>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu20_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu21: cpu@21 {
+			compatible = "thead,c920", "riscv";
+			reg = <21>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache5>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu21_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu22: cpu@22 {
+			compatible = "thead,c920", "riscv";
+			reg = <22>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache5>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu22_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu23: cpu@23 {
+			compatible = "thead,c920", "riscv";
+			reg = <23>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache5>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu23_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu24: cpu@24 {
+			compatible = "thead,c920", "riscv";
+			reg = <24>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache6>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu24_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu25: cpu@25 {
+			compatible = "thead,c920", "riscv";
+			reg = <25>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache6>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu25_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu26: cpu@26 {
+			compatible = "thead,c920", "riscv";
+			reg = <26>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache6>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu26_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu27: cpu@27 {
+			compatible = "thead,c920", "riscv";
+			reg = <27>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache6>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu27_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu28: cpu@28 {
+			compatible = "thead,c920", "riscv";
+			reg = <28>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache7>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu28_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu29: cpu@29 {
+			compatible = "thead,c920", "riscv";
+			reg = <29>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache7>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu29_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu30: cpu@30 {
+			compatible = "thead,c920", "riscv";
+			reg = <30>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache7>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu30_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu31: cpu@31 {
+			compatible = "thead,c920", "riscv";
+			reg = <31>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache7>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu31_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu32: cpu@32 {
+			compatible = "thead,c920", "riscv";
+			reg = <32>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache8>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu32_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu33: cpu@33 {
+			compatible = "thead,c920", "riscv";
+			reg = <33>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache8>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu33_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu34: cpu@34 {
+			compatible = "thead,c920", "riscv";
+			reg = <34>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache8>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu34_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu35: cpu@35 {
+			compatible = "thead,c920", "riscv";
+			reg = <35>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache8>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu35_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu36: cpu@36 {
+			compatible = "thead,c920", "riscv";
+			reg = <36>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache9>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu36_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu37: cpu@37 {
+			compatible = "thead,c920", "riscv";
+			reg = <37>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache9>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu37_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu38: cpu@38 {
+			compatible = "thead,c920", "riscv";
+			reg = <38>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache9>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu38_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu39: cpu@39 {
+			compatible = "thead,c920", "riscv";
+			reg = <39>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache9>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu39_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu40: cpu@40 {
+			compatible = "thead,c920", "riscv";
+			reg = <40>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache10>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu40_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu41: cpu@41 {
+			compatible = "thead,c920", "riscv";
+			reg = <41>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache10>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu41_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu42: cpu@42 {
+			compatible = "thead,c920", "riscv";
+			reg = <42>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache10>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu42_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu43: cpu@43 {
+			compatible = "thead,c920", "riscv";
+			reg = <43>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache10>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu43_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu44: cpu@44 {
+			compatible = "thead,c920", "riscv";
+			reg = <44>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache11>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu44_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu45: cpu@45 {
+			compatible = "thead,c920", "riscv";
+			reg = <45>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache11>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu45_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu46: cpu@46 {
+			compatible = "thead,c920", "riscv";
+			reg = <46>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache11>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu46_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu47: cpu@47 {
+			compatible = "thead,c920", "riscv";
+			reg = <47>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache11>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu47_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu48: cpu@48 {
+			compatible = "thead,c920", "riscv";
+			reg = <48>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache12>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu48_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu49: cpu@49 {
+			compatible = "thead,c920", "riscv";
+			reg = <49>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache12>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu49_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu50: cpu@50 {
+			compatible = "thead,c920", "riscv";
+			reg = <50>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache12>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu50_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu51: cpu@51 {
+			compatible = "thead,c920", "riscv";
+			reg = <51>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache12>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu51_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu52: cpu@52 {
+			compatible = "thead,c920", "riscv";
+			reg = <52>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache13>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu52_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu53: cpu@53 {
+			compatible = "thead,c920", "riscv";
+			reg = <53>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache13>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu53_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu54: cpu@54 {
+			compatible = "thead,c920", "riscv";
+			reg = <54>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache13>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu54_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu55: cpu@55 {
+			compatible = "thead,c920", "riscv";
+			reg = <55>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache13>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu55_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu56: cpu@56 {
+			compatible = "thead,c920", "riscv";
+			reg = <56>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache14>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu56_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu57: cpu@57 {
+			compatible = "thead,c920", "riscv";
+			reg = <57>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache14>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu57_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu58: cpu@58 {
+			compatible = "thead,c920", "riscv";
+			reg = <58>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache14>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu58_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu59: cpu@59 {
+			compatible = "thead,c920", "riscv";
+			reg = <59>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache14>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu59_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu60: cpu@60 {
+			compatible = "thead,c920", "riscv";
+			reg = <60>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache15>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu60_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu61: cpu@61 {
+			compatible = "thead,c920", "riscv";
+			reg = <61>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache15>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu61_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu62: cpu@62 {
+			compatible = "thead,c920", "riscv";
+			reg = <62>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache15>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu62_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu63: cpu@63 {
+			compatible = "thead,c920", "riscv";
+			reg = <63>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			device_type = "cpu";
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache15>;
+			riscv,isa = "rv64imafdcv";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "v", "sscofpmf", "sstc",
+					       "svinval", "svnapot", "svpbmt",
+					       "zawrs", "zba", "zbb", "zbc",
+					       "zbs", "zca", "zcb", "zcd",
+					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond","zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm",
+					       "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin";
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu63_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu-map {
+			socket0 {
+				cluster0 {
+					core0 {
+						cpu = <&cpu0>;
+					};
+
+					core1 {
+						cpu = <&cpu1>;
+					};
+
+					core2 {
+						cpu = <&cpu2>;
+					};
+
+					core3 {
+						cpu = <&cpu3>;
+					};
+				};
+
+				cluster1 {
+					core0 {
+						cpu = <&cpu4>;
+					};
+
+					core1 {
+						cpu = <&cpu5>;
+					};
+
+					core2 {
+						cpu = <&cpu6>;
+					};
+
+					core3 {
+						cpu = <&cpu7>;
+					};
+				};
+
+				cluster2 {
+					core0 {
+						cpu = <&cpu8>;
+					};
+
+					core1 {
+						cpu = <&cpu9>;
+					};
+
+					core2 {
+						cpu = <&cpu10>;
+					};
+
+					core3 {
+						cpu = <&cpu11>;
+					};
+				};
+
+				cluster3 {
+					core0 {
+						cpu = <&cpu12>;
+					};
+
+					core1 {
+						cpu = <&cpu13>;
+					};
+
+					core2 {
+						cpu = <&cpu14>;
+					};
+
+					core3 {
+						cpu = <&cpu15>;
+					};
+				};
+
+				cluster4 {
+					core0 {
+						cpu = <&cpu16>;
+					};
+
+					core1 {
+						cpu = <&cpu17>;
+					};
+
+					core2 {
+						cpu = <&cpu18>;
+					};
+
+					core3 {
+						cpu = <&cpu19>;
+					};
+				};
+
+				cluster5 {
+					core0 {
+						cpu = <&cpu20>;
+					};
+
+					core1 {
+						cpu = <&cpu21>;
+					};
+
+					core2 {
+						cpu = <&cpu22>;
+					};
+
+					core3 {
+						cpu = <&cpu23>;
+					};
+				};
+
+				cluster6 {
+					core0 {
+						cpu = <&cpu24>;
+					};
+
+					core1 {
+						cpu = <&cpu25>;
+					};
+
+					core2 {
+						cpu = <&cpu26>;
+					};
+
+					core3 {
+						cpu = <&cpu27>;
+					};
+				};
+
+				cluster7 {
+					core0 {
+						cpu = <&cpu28>;
+					};
+
+					core1 {
+						cpu = <&cpu29>;
+					};
+
+					core2 {
+						cpu = <&cpu30>;
+					};
+
+					core3 {
+						cpu = <&cpu31>;
+					};
+				};
+
+				cluster8 {
+					core0 {
+						cpu = <&cpu32>;
+					};
+
+					core1 {
+						cpu = <&cpu33>;
+					};
+
+					core2 {
+						cpu = <&cpu34>;
+					};
+
+					core3 {
+						cpu = <&cpu35>;
+					};
+				};
+
+				cluster9 {
+					core0 {
+						cpu = <&cpu36>;
+					};
+
+					core1 {
+						cpu = <&cpu37>;
+					};
+
+					core2 {
+						cpu = <&cpu38>;
+					};
+
+					core3 {
+						cpu = <&cpu39>;
+					};
+				};
+
+				cluster10 {
+					core0 {
+						cpu = <&cpu40>;
+					};
+
+					core1 {
+						cpu = <&cpu41>;
+					};
+
+					core2 {
+						cpu = <&cpu42>;
+					};
+
+					core3 {
+						cpu = <&cpu43>;
+					};
+				};
+
+				cluster11 {
+					core0 {
+						cpu = <&cpu44>;
+					};
+
+					core1 {
+						cpu = <&cpu45>;
+					};
+
+					core2 {
+						cpu = <&cpu46>;
+					};
+
+					core3 {
+						cpu = <&cpu47>;
+					};
+				};
+
+				cluster12 {
+					core0 {
+						cpu = <&cpu48>;
+					};
+
+					core1 {
+						cpu = <&cpu49>;
+					};
+
+					core2 {
+						cpu = <&cpu50>;
+					};
+
+					core3 {
+						cpu = <&cpu51>;
+					};
+				};
+
+				cluster13 {
+					core0 {
+						cpu = <&cpu52>;
+					};
+
+					core1 {
+						cpu = <&cpu53>;
+					};
+
+					core2 {
+						cpu = <&cpu54>;
+					};
+
+					core3 {
+						cpu = <&cpu55>;
+					};
+				};
+
+				cluster14 {
+					core0 {
+						cpu = <&cpu56>;
+					};
+
+					core1 {
+						cpu = <&cpu57>;
+					};
+
+					core2 {
+						cpu = <&cpu58>;
+					};
+
+					core3 {
+						cpu = <&cpu59>;
+					};
+				};
+
+				cluster15 {
+					core0 {
+						cpu = <&cpu60>;
+					};
+
+					core1 {
+						cpu = <&cpu61>;
+					};
+
+					core2 {
+						cpu = <&cpu62>;
+					};
+
+					core3 {
+						cpu = <&cpu63>;
+					};
+				};
+			};
+		};
+
+		l2_cache0: cache-controller-0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache1: cache-controller-1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache2: cache-controller-2 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache3: cache-controller-3 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache4: cache-controller-4 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache5: cache-controller-5 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache6: cache-controller-6 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache7: cache-controller-7 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache8: cache-controller-8 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache9: cache-controller-9 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache10: cache-controller-10 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache11: cache-controller-11 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache12: cache-controller-12 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache13: cache-controller-13 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache14: cache-controller-14 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache15: cache-controller-15 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <2097152>;
+			cache-sets = <2048>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l3_cache: cache-controller-16 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-size = <67108864>;
+			cache-sets = <4096>;
+			cache-unified;
+		};
+	};
+
+	soc {
+		intc: interrupt-controller@6d40000000 {
+			compatible = "sophgo,sg2044-plic", "thead,c900-plic";
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			reg = <0x6d 0x40000000 0x0 0x4000000>;
+			interrupt-controller;
+			interrupts-extended =
+				<&cpu0_intc 11>, <&cpu0_intc 9>,
+				<&cpu1_intc 11>, <&cpu1_intc 9>,
+				<&cpu2_intc 11>, <&cpu2_intc 9>,
+				<&cpu3_intc 11>, <&cpu3_intc 9>,
+				<&cpu4_intc 11>, <&cpu4_intc 9>,
+				<&cpu5_intc 11>, <&cpu5_intc 9>,
+				<&cpu6_intc 11>, <&cpu6_intc 9>,
+				<&cpu7_intc 11>, <&cpu7_intc 9>,
+				<&cpu8_intc 11>, <&cpu8_intc 9>,
+				<&cpu9_intc 11>, <&cpu9_intc 9>,
+				<&cpu10_intc 11>, <&cpu10_intc 9>,
+				<&cpu11_intc 11>, <&cpu11_intc 9>,
+				<&cpu12_intc 11>, <&cpu12_intc 9>,
+				<&cpu13_intc 11>, <&cpu13_intc 9>,
+				<&cpu14_intc 11>, <&cpu14_intc 9>,
+				<&cpu15_intc 11>, <&cpu15_intc 9>,
+				<&cpu16_intc 11>, <&cpu16_intc 9>,
+				<&cpu17_intc 11>, <&cpu17_intc 9>,
+				<&cpu18_intc 11>, <&cpu18_intc 9>,
+				<&cpu19_intc 11>, <&cpu19_intc 9>,
+				<&cpu20_intc 11>, <&cpu20_intc 9>,
+				<&cpu21_intc 11>, <&cpu21_intc 9>,
+				<&cpu22_intc 11>, <&cpu22_intc 9>,
+				<&cpu23_intc 11>, <&cpu23_intc 9>,
+				<&cpu24_intc 11>, <&cpu24_intc 9>,
+				<&cpu25_intc 11>, <&cpu25_intc 9>,
+				<&cpu26_intc 11>, <&cpu26_intc 9>,
+				<&cpu27_intc 11>, <&cpu27_intc 9>,
+				<&cpu28_intc 11>, <&cpu28_intc 9>,
+				<&cpu29_intc 11>, <&cpu29_intc 9>,
+				<&cpu30_intc 11>, <&cpu30_intc 9>,
+				<&cpu31_intc 11>, <&cpu31_intc 9>,
+				<&cpu32_intc 11>, <&cpu32_intc 9>,
+				<&cpu33_intc 11>, <&cpu33_intc 9>,
+				<&cpu34_intc 11>, <&cpu34_intc 9>,
+				<&cpu35_intc 11>, <&cpu35_intc 9>,
+				<&cpu36_intc 11>, <&cpu36_intc 9>,
+				<&cpu37_intc 11>, <&cpu37_intc 9>,
+				<&cpu38_intc 11>, <&cpu38_intc 9>,
+				<&cpu39_intc 11>, <&cpu39_intc 9>,
+				<&cpu40_intc 11>, <&cpu40_intc 9>,
+				<&cpu41_intc 11>, <&cpu41_intc 9>,
+				<&cpu42_intc 11>, <&cpu42_intc 9>,
+				<&cpu43_intc 11>, <&cpu43_intc 9>,
+				<&cpu44_intc 11>, <&cpu44_intc 9>,
+				<&cpu45_intc 11>, <&cpu45_intc 9>,
+				<&cpu46_intc 11>, <&cpu46_intc 9>,
+				<&cpu47_intc 11>, <&cpu47_intc 9>,
+				<&cpu48_intc 11>, <&cpu48_intc 9>,
+				<&cpu49_intc 11>, <&cpu49_intc 9>,
+				<&cpu50_intc 11>, <&cpu50_intc 9>,
+				<&cpu51_intc 11>, <&cpu51_intc 9>,
+				<&cpu52_intc 11>, <&cpu52_intc 9>,
+				<&cpu53_intc 11>, <&cpu53_intc 9>,
+				<&cpu54_intc 11>, <&cpu54_intc 9>,
+				<&cpu55_intc 11>, <&cpu55_intc 9>,
+				<&cpu56_intc 11>, <&cpu56_intc 9>,
+				<&cpu57_intc 11>, <&cpu57_intc 9>,
+				<&cpu58_intc 11>, <&cpu58_intc 9>,
+				<&cpu59_intc 11>, <&cpu59_intc 9>,
+				<&cpu60_intc 11>, <&cpu60_intc 9>,
+				<&cpu61_intc 11>, <&cpu61_intc 9>,
+				<&cpu62_intc 11>, <&cpu62_intc 9>,
+				<&cpu63_intc 11>, <&cpu63_intc 9>;
+			riscv,ndev = <863>;
+		};
+
+		aclint_mswi: interrupt-controller@6d44000000 {
+			compatible = "sophgo,sg2044-aclint-mswi", "thead,c900-aclint-mswi";
+			reg = <0x6d 0x44000000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>,
+					      <&cpu1_intc 3>,
+					      <&cpu2_intc 3>,
+					      <&cpu3_intc 3>,
+					      <&cpu4_intc 3>,
+					      <&cpu5_intc 3>,
+					      <&cpu6_intc 3>,
+					      <&cpu7_intc 3>,
+					      <&cpu8_intc 3>,
+					      <&cpu9_intc 3>,
+					      <&cpu10_intc 3>,
+					      <&cpu11_intc 3>,
+					      <&cpu12_intc 3>,
+					      <&cpu13_intc 3>,
+					      <&cpu14_intc 3>,
+					      <&cpu15_intc 3>,
+					      <&cpu16_intc 3>,
+					      <&cpu17_intc 3>,
+					      <&cpu18_intc 3>,
+					      <&cpu19_intc 3>,
+					      <&cpu20_intc 3>,
+					      <&cpu21_intc 3>,
+					      <&cpu22_intc 3>,
+					      <&cpu23_intc 3>,
+					      <&cpu24_intc 3>,
+					      <&cpu25_intc 3>,
+					      <&cpu26_intc 3>,
+					      <&cpu27_intc 3>,
+					      <&cpu28_intc 3>,
+					      <&cpu29_intc 3>,
+					      <&cpu30_intc 3>,
+					      <&cpu31_intc 3>,
+					      <&cpu32_intc 3>,
+					      <&cpu33_intc 3>,
+					      <&cpu34_intc 3>,
+					      <&cpu35_intc 3>,
+					      <&cpu36_intc 3>,
+					      <&cpu37_intc 3>,
+					      <&cpu38_intc 3>,
+					      <&cpu39_intc 3>,
+					      <&cpu40_intc 3>,
+					      <&cpu41_intc 3>,
+					      <&cpu42_intc 3>,
+					      <&cpu43_intc 3>,
+					      <&cpu44_intc 3>,
+					      <&cpu45_intc 3>,
+					      <&cpu46_intc 3>,
+					      <&cpu47_intc 3>,
+					      <&cpu48_intc 3>,
+					      <&cpu49_intc 3>,
+					      <&cpu50_intc 3>,
+					      <&cpu51_intc 3>,
+					      <&cpu52_intc 3>,
+					      <&cpu53_intc 3>,
+					      <&cpu54_intc 3>,
+					      <&cpu55_intc 3>,
+					      <&cpu56_intc 3>,
+					      <&cpu57_intc 3>,
+					      <&cpu58_intc 3>,
+					      <&cpu59_intc 3>,
+					      <&cpu60_intc 3>,
+					      <&cpu61_intc 3>,
+					      <&cpu62_intc 3>,
+					      <&cpu63_intc 3>;
+		};
+
+		aclint_mtimer: timer@6d44004000 {
+			compatible = "sophgo,sg2044-aclint-mtimer", "thead,c900-aclint-mtimer";
+			reg = <0x6d 0x44004000 0x0 0x8000>;
+			reg-names = "mtimecmp";
+			interrupts-extended = <&cpu0_intc 7>,
+					      <&cpu1_intc 7>,
+					      <&cpu2_intc 7>,
+					      <&cpu3_intc 7>,
+					      <&cpu4_intc 7>,
+					      <&cpu5_intc 7>,
+					      <&cpu6_intc 7>,
+					      <&cpu7_intc 7>,
+					      <&cpu8_intc 7>,
+					      <&cpu9_intc 7>,
+					      <&cpu10_intc 7>,
+					      <&cpu11_intc 7>,
+					      <&cpu12_intc 7>,
+					      <&cpu13_intc 7>,
+					      <&cpu14_intc 7>,
+					      <&cpu15_intc 7>,
+					      <&cpu16_intc 7>,
+					      <&cpu17_intc 7>,
+					      <&cpu18_intc 7>,
+					      <&cpu19_intc 7>,
+					      <&cpu20_intc 7>,
+					      <&cpu21_intc 7>,
+					      <&cpu22_intc 7>,
+					      <&cpu23_intc 7>,
+					      <&cpu24_intc 7>,
+					      <&cpu25_intc 7>,
+					      <&cpu26_intc 7>,
+					      <&cpu27_intc 7>,
+					      <&cpu28_intc 7>,
+					      <&cpu29_intc 7>,
+					      <&cpu30_intc 7>,
+					      <&cpu31_intc 7>,
+					      <&cpu32_intc 7>,
+					      <&cpu33_intc 7>,
+					      <&cpu34_intc 7>,
+					      <&cpu35_intc 7>,
+					      <&cpu36_intc 7>,
+					      <&cpu37_intc 7>,
+					      <&cpu38_intc 7>,
+					      <&cpu39_intc 7>,
+					      <&cpu40_intc 7>,
+					      <&cpu41_intc 7>,
+					      <&cpu42_intc 7>,
+					      <&cpu43_intc 7>,
+					      <&cpu44_intc 7>,
+					      <&cpu45_intc 7>,
+					      <&cpu46_intc 7>,
+					      <&cpu47_intc 7>,
+					      <&cpu48_intc 7>,
+					      <&cpu49_intc 7>,
+					      <&cpu50_intc 7>,
+					      <&cpu51_intc 7>,
+					      <&cpu52_intc 7>,
+					      <&cpu53_intc 7>,
+					      <&cpu54_intc 7>,
+					      <&cpu55_intc 7>,
+					      <&cpu56_intc 7>,
+					      <&cpu57_intc 7>,
+					      <&cpu58_intc 7>,
+					      <&cpu59_intc 7>,
+					      <&cpu60_intc 7>,
+					      <&cpu61_intc 7>,
+					      <&cpu62_intc 7>,
+					      <&cpu63_intc 7>;
+		};
+
+		aclint_sswi: interrupt-controller@6d4400c000 {
+			compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
+			reg = <0x6d 0x4400c000 0x0 0x1000>;
+			#interrupt-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 1>,
+					      <&cpu1_intc 1>,
+					      <&cpu2_intc 1>,
+					      <&cpu3_intc 1>,
+					      <&cpu4_intc 1>,
+					      <&cpu5_intc 1>,
+					      <&cpu6_intc 1>,
+					      <&cpu7_intc 1>,
+					      <&cpu8_intc 1>,
+					      <&cpu9_intc 1>,
+					      <&cpu10_intc 1>,
+					      <&cpu11_intc 1>,
+					      <&cpu12_intc 1>,
+					      <&cpu13_intc 1>,
+					      <&cpu14_intc 1>,
+					      <&cpu15_intc 1>,
+					      <&cpu16_intc 1>,
+					      <&cpu17_intc 1>,
+					      <&cpu18_intc 1>,
+					      <&cpu19_intc 1>,
+					      <&cpu20_intc 1>,
+					      <&cpu21_intc 1>,
+					      <&cpu22_intc 1>,
+					      <&cpu23_intc 1>,
+					      <&cpu24_intc 1>,
+					      <&cpu25_intc 1>,
+					      <&cpu26_intc 1>,
+					      <&cpu27_intc 1>,
+					      <&cpu28_intc 1>,
+					      <&cpu29_intc 1>,
+					      <&cpu30_intc 1>,
+					      <&cpu31_intc 1>,
+					      <&cpu32_intc 1>,
+					      <&cpu33_intc 1>,
+					      <&cpu34_intc 1>,
+					      <&cpu35_intc 1>,
+					      <&cpu36_intc 1>,
+					      <&cpu37_intc 1>,
+					      <&cpu38_intc 1>,
+					      <&cpu39_intc 1>,
+					      <&cpu40_intc 1>,
+					      <&cpu41_intc 1>,
+					      <&cpu42_intc 1>,
+					      <&cpu43_intc 1>,
+					      <&cpu44_intc 1>,
+					      <&cpu45_intc 1>,
+					      <&cpu46_intc 1>,
+					      <&cpu47_intc 1>,
+					      <&cpu48_intc 1>,
+					      <&cpu49_intc 1>,
+					      <&cpu50_intc 1>,
+					      <&cpu51_intc 1>,
+					      <&cpu52_intc 1>,
+					      <&cpu53_intc 1>,
+					      <&cpu54_intc 1>,
+					      <&cpu55_intc 1>,
+					      <&cpu56_intc 1>,
+					      <&cpu57_intc 1>,
+					      <&cpu58_intc 1>,
+					      <&cpu59_intc 1>,
+					      <&cpu60_intc 1>,
+					      <&cpu61_intc 1>,
+					      <&cpu62_intc 1>,
+					      <&cpu63_intc 1>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2044-reset.h b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
new file mode 100644
index 000000000000..94ed1e3777c3
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _SG2044_RESET_H
+#define _SG2044_RESET_H
+
+#define RST_AP_SYS			0
+#define RST_AP_SYS_CORE0		1
+#define RST_AP_SYS_CORE1		2
+#define RST_AP_SYS_CORE2		3
+#define RST_AP_SYS_CORE3		4
+#define RST_AP_PIC			5
+#define RST_AP_TDT			6
+#define RST_RP_PIC_TDT			7
+#define RST_HSDMA			8
+#define RST_SYSDMA			9
+#define RST_EFUSE0			10
+#define RST_EFUSE1			11
+#define RST_RTC				12
+#define RST_TIMER			13
+#define RST_WDT				14
+#define RST_AHB_ROM0			15
+#define RST_AHB_ROM1			16
+#define RST_I2C0			17
+#define RST_I2C1			18
+#define RST_I2C2			19
+#define RST_I2C3			20
+#define RST_GPIO0			21
+#define RST_GPIO1			22
+#define RST_GPIO2			23
+#define RST_PWM				24
+#define RST_AXI_SRAM0			25
+#define RST_AXI_SRAM1			26
+#define RST_SPIFMC0			27
+#define RST_SPIFMC1			28
+#define RST_MAILBOX			29
+#define RST_ETH0			30
+#define RST_EMMC			31
+#define RST_SD				32
+#define RST_UART0			33
+#define RST_UART1			34
+#define RST_UART2			35
+#define RST_UART3			36
+#define RST_SPI0			37
+#define RST_SPI1			38
+#define RST_MTLI			39
+#define RST_DBG_I2C			40
+#define RST_C2C0			41
+#define RST_C2C1			42
+#define RST_C2C2			43
+#define RST_C2C3			44
+#define RST_CXP				45
+#define RST_DDR0			46
+#define RST_DDR1			47
+#define RST_DDR2			48
+#define RST_DDR3			49
+#define RST_DDR4			50
+#define RST_DDR5			51
+#define RST_DDR6			52
+#define RST_DDR7			53
+#define RST_DDR8			54
+#define RST_DDR9			55
+#define RST_DDR10			56
+#define RST_DDR11			57
+#define RST_DDR12			58
+#define RST_DDR13			59
+#define RST_DDR14			60
+#define RST_DDR15			61
+#define RST_BAR				62
+#define RST_K2K				63
+#define RST_CC_SYS_X1Y1			64
+#define RST_CC_SYS_X1Y2			65
+#define RST_CC_SYS_X1Y3			66
+#define RST_CC_SYS_X1Y4			67
+#define RST_CC_SYS_X0Y1			68
+#define RST_CC_SYS_X0Y2			69
+#define RST_CC_SYS_X0Y3			70
+#define RST_CC_SYS_X0Y4			71
+#define RST_SC_X1Y1			80
+#define RST_SC_X1Y2			81
+#define RST_SC_X1Y3			82
+#define RST_SC_X1Y4			83
+#define RST_SC_X0Y1			84
+#define RST_SC_X0Y2			85
+#define RST_SC_X0Y3			86
+#define RST_SC_X0Y4			87
+#define RST_RP_CLUSTER_X1Y1_S0		160
+#define RST_RP_CLUSTER_X1Y1_S1		161
+#define RST_RP_CLUSTER_X1Y2_S0		162
+#define RST_RP_CLUSTER_X1Y2_S1		163
+#define RST_RP_CLUSTER_X1Y3_S0		164
+#define RST_RP_CLUSTER_X1Y3_S1		165
+#define RST_RP_CLUSTER_X1Y4_S0		166
+#define RST_RP_CLUSTER_X1Y4_S1		167
+#define RST_RP_CLUSTER_X0Y1_W0		168
+#define RST_RP_CLUSTER_X0Y1_W1		169
+#define RST_RP_CLUSTER_X0Y2_W0		170
+#define RST_RP_CLUSTER_X0Y2_W1		171
+#define RST_RP_CLUSTER_X0Y3_W0		172
+#define RST_RP_CLUSTER_X0Y3_W1		173
+#define RST_RP_CLUSTER_X0Y4_W0		174
+#define RST_RP_CLUSTER_X0Y4_W1		175
+#define RST_TPSYS_X1Y1			180
+#define RST_TPSYS_X1Y2			181
+#define RST_TPSYS_X1Y3			182
+#define RST_TPSYS_X1Y4			183
+#define RST_TPSYS_X0Y1			184
+#define RST_TPSYS_X0Y2			185
+#define RST_TPSYS_X0Y3			186
+#define RST_TPSYS_X0Y4			187
+#define RST_SPACC			188
+#define RST_PKA				189
+#define RST_SE_TRNG			190
+#define RST_SE_DBG			191
+#define RST_SE_FAB_FW			192
+#define RST_SE_CTRL			193
+#define RST_MAILBOX0			194
+#define RST_MAILBOX1			195
+#define RST_MAILBOX2			196
+#define RST_MAILBOX3			197
+#define RST_INTC0			198
+#define RST_INTC1			199
+#define RST_INTC2			200
+#define RST_INTC3			201
+
+#endif /* _DT_BINDINGS_SG2044_RESET_H */
diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
new file mode 100644
index 000000000000..3cca0ef89e0b
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/dts-v1/;
+
+#include "sg2044.dtsi"
+
+/ {
+	model = "Sophgo SG2044 SRD3-10";
+	compatible = "sophgo,srd3-10", "sophgo,sg2044";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
new file mode 100644
index 000000000000..1b377349ac42
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Sophgo Technology Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "sg2044-cpus.dtsi"
+#include "sg2044-reset.h"
+
+/ {
+	compatible = "sophgo,sg2044";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0x00000010 0x00000000>;
+	};
+
+	osc: oscillator {
+		compatible = "fixed-clock";
+		clock-output-names = "osc";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		uart0: serial@7030000000 {
+			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
+			reg = <0x70 0x30000000 0x0 0x1000>;
+			clock-frequency = <500000000>;
+			interrupt-parent = <&intc>;
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			resets = <&rst RST_UART0>;
+			status = "disabled";
+		};
+
+		uart1: serial@7030001000 {
+			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
+			reg = <0x70 0x30001000 0x0 0x1000>;
+			clock-frequency = <500000000>;
+			interrupt-parent = <&intc>;
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			resets = <&rst RST_UART1>;
+			status = "disabled";
+		};
+
+		uart2: serial@7030002000 {
+			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
+			reg = <0x70 0x30002000 0x0 0x1000>;
+			clock-frequency = <500000000>;
+			interrupt-parent = <&intc>;
+			interrupts = <43 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			resets = <&rst RST_UART2>;
+			status = "disabled";
+		};
+
+		uart3: serial@7030003000 {
+			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
+			reg = <0x70 0x30003000 0x0 0x1000>;
+			clock-frequency = <500000000>;
+			interrupt-parent = <&intc>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			resets = <&rst RST_UART3>;
+			status = "disabled";
+		};
+
+		rst: reset-controller@7050003000 {
+			compatible = "sophgo,sg2044-reset",
+				     "sophgo,sg2042-reset";
+			reg = <0x70 0x50003000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+	};
+};
-- 
2.49.0



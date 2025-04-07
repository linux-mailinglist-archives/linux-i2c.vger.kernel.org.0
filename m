Return-Path: <linux-i2c+bounces-10104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA5A7D166
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A9C67A4247
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8844E11CA0;
	Mon,  7 Apr 2025 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYY5BCwY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A0134A8;
	Mon,  7 Apr 2025 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988016; cv=none; b=cQhRXSRi3TkcqICSUvK+S6W5h/nlxcxyzjbF2UZhjdUZgusOPwCtN4W9GGnFTaN7dQsZCSxhCmUN5bOcsKt5JlnZgpRd1pcdafF2NFNvBSLu/FmG5l5d26EKGBVyqzYWve+YorxvT+1sPYbNbg2eBckBxdtFTI46XjCqNI5TWOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988016; c=relaxed/simple;
	bh=sdp+G67QR0HwPQHeagpP0IIY/Vorgo7L/yl/QyQQ2Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uVGBq1u04GEgdxjWbkiIrNr8ViLBXRXL4hlucksnwswKZb9x/mo2luan1e4fAQDU0yZFJJ0rV6Rn8Lv+uoBVMGFYTw55SVpLFIBuCbJAnbhpAmbCsalYZ5nFLpKzAHRHvkhB+HW7S8kooQkv/CbgeqLfqeMOzy1Um1Qh73Jv28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYY5BCwY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4775ce8a4b0so72291881cf.1;
        Sun, 06 Apr 2025 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988013; x=1744592813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4a6js1q8OOEGyyd0wjaSrE6JWZSzZDovznFnBmj8zs=;
        b=UYY5BCwYatfzKnz6WMBKeIvVcWAfYH+06ebRO1hfdHmZduqLY3zTTOxYuH8FmktHbA
         Us4e341jQJCbC/0PbJ/W1roxCoLJp/kdWykVVj+ELl64aK1NcqgLfZzKFf/HcvqXHSop
         /BkEFxr+YAq9R5skZPFOUTqElLvd9wKk04vTRKAr2HDIWBIl1HYjrSdhzyz1eTLk1wQD
         ZpPYlQAnKSO25MUNEX5TX3tHfJAfp3va90UZ+FaFcydv6XhKbapurv89rENzqtOQ7A+q
         lsi9ESeWqvn1YwzxmSxV2QLZVoYeJtepGyzqcJSQtpNp/1B1HNlZEnYUMh5B9WGdhIt7
         RsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988013; x=1744592813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4a6js1q8OOEGyyd0wjaSrE6JWZSzZDovznFnBmj8zs=;
        b=t1L3eVXb+lsFMOQN6sr69OgKGvBBKZh2MQb0CymPjEDg9N+8IB/VY3IIGrk/ud8lnJ
         9VukC6bYN5M2SQ5BvshUxegFY3Zc27IOeaZeXCASuJTaxotMn/f8aEcps30diCSo7047
         pvaQtK6k6Ei6vaRXWJnEy8E/cvJdofhtf20zF9OpAUyPRvs7pBf38XHh5nKw23kcZIU1
         Nfc1cjxe1s1CLZuTn4mTPpJL927Vbgr+OqtxVZG9dfB5QKPQ3qR6g6IZxgODFcnwW629
         IDvVv8y+8vNZVE84Jpz9T8EjeOlWXff8ExHpcYvX8KJBB39KFr6JX6K+vG3rRwJYiRRV
         iGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3dtaYIA5Jzrx0ZnXSlC9VMOvWH4ZPAbjEdOMbY49LvzC7P/x6xTec5MG3f0qY4LSPRQeDYaEL91kc@vger.kernel.org, AJvYcCX0lRPv2m9L8SQN98S/kZD/8WcSx6LMx9zx4GWJ+6bDQeyzzzs4x7F+Q7cEvp0PuIx/IX0M1tFFVuAe@vger.kernel.org, AJvYcCX9W+PNaxgJtqqFj6cfdpPouPTWwIu6ZhECt+vD4IjFpbebOqAi2oQj8s6P2g4iaiEzxuFqqMFE2lpz3jce@vger.kernel.org, AJvYcCXNLLe8w4w1fWIWxZmENd+BMzQIj5mGrAHCFdGbjv2trjG/rRGxn/70pURYYgZAjO+PO8UutGCs3YQU@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJOayjD+jt7NqsjcZO9Y83a1V/4EbVaIDe+XAPAuCcIP2T96e
	x5js0a30lW3G4dLgsEamFjMN0PyN47ca9g/BWZIGmjDK/OuFAEtF
X-Gm-Gg: ASbGncsAmboVdhasR34fGy2yemx/Zhz1U6qnUftLOqpbHDgkYRhpqUFBAb5D4dES2YU
	yOIgUJpDliET7FwccYwzmzu87/TZhiyBbMr2f30SD9vI5zOI1+oOV54i0Xzo1hLbflrgjRhwSSz
	OK2BRsAHOPMWZYtnsQdRy/fYhB2XFsxji/ZQXTVVATDwAOg5hQ6tNha+2XL9V1D8tYtxreVZUds
	2OGXvcduyv5JCrOFp2cDWVQU1tR3Znzt5FoPo1etjZTvhQeyF10t2vmvsqPHNibhYR2NoR8h+5D
	QTDKGx2GLN7Fv01F3lx5
X-Google-Smtp-Source: AGHT+IHkC+AE89umfaDeyIGjjiCSVOcB7pf9Ijef1ekZ2c/N5mi+YxnKKu0aH8SynK3OvfNoFND1bw==
X-Received: by 2002:ad4:5d6e:0:b0:6e8:9843:ec99 with SMTP id 6a1803df08f44-6f01e7996demr163789416d6.41.1743988013630;
        Sun, 06 Apr 2025 18:06:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00f09fsm51936316d6.48.2025.04.06.18.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:06:53 -0700 (PDT)
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
Subject: [PATCH 0/9] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Mon,  7 Apr 2025 09:06:05 +0800
Message-ID: <20250407010616.749833-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
1 microSD slot.

Introduce basic support for this board and Sophgo SG2044 SoC

Inochi Amaoto (9):
  dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
  dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
  dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
  dt-bindings: reset: sophgo: Add SG2044 bindings.
  dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor
    support
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
  dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
  dt-bindings: riscv: sophgo: Add SG2044 compatible string
  riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10

 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |    6 +-
 .../bindings/i2c/snps,designware-i2c.yaml     |    4 +
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../thead,c900-aclint-mswi.yaml               |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    7 +-
 .../bindings/reset/sophgo,sg2042-reset.yaml   |    7 +-
 .../devicetree/bindings/riscv/sophgo.yaml     |    4 +
 .../timer/thead,c900-aclint-mtimer.yaml       |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    1 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
 13 files changed, 3277 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

--
2.49.0



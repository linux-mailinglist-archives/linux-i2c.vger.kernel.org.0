Return-Path: <linux-i2c+bounces-10299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA7A87447
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1089F18921B9
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3451922DC;
	Sun, 13 Apr 2025 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1YZoYqY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F4517C210;
	Sun, 13 Apr 2025 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583753; cv=none; b=DYJ4KOAAYVisDu3e6u1rgLLvIGQWuYHdZifUL+T57+4O6Wgfd/wiKqiBiac6je8NnN3+9TXcMOJAfkLKmPRaNwqndpPdFWX4ER1LbF9CdsszB+/VOAemvctgdLorDDlge/OfiNtxLgQekdnS/A+cOshw0EqNLd9UGNQJOp4qrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583753; c=relaxed/simple;
	bh=INPGhkFetjITTXnuZyQwyYqly3zYX7iaDoWJaIaXge8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZeHLfpqVPNoRylhbyWNFvedwGSHKJNkPScuNrhYP5L4pPuxEX+mWlFZHftPyo1F1eMcuJdvRAIHXO4AEITDhJW6QTYlP22JVF0mWtr8/rpLHig9nXTwfp6U2kTfyUtNSWsjiy2HOg9iiAnx1VLxxNRAFoXv9Anq3iq0RPjpTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1YZoYqY; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5e39d1db2so209523085a.3;
        Sun, 13 Apr 2025 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583750; x=1745188550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5YjA/KfpvY46CadYlUcHuNncn9tBNGFY7tmTjqFT+k=;
        b=A1YZoYqY0GO1CpBafuev+rzWO92rsdtRwk5a0bNVjcSbSQy+7VsBo/rdPPevOFVlnJ
         cixIlnXc2xDLmnHIPddyt8R3mmIx3kg1nLszBX4EBWI5INjgepqUMVhyvImjEmGRo6x3
         6Y6tXxoXnHy7yyqR3B0urWd9ZuSn44Qg5GuOliEAEuaQecSus1+JfxaIqbziej2Fi611
         tkc5TqtJaTxjzYAfv+daH1RgpbGSGcAtbK4HFvDNil4Np02WoIBqA6bzywB9NZFBlv8e
         Ev7OBnCN2++irzAPiWskIfOlhN9rG7XoBJZJNn0x1Mt6+hug0QOdfo2hYa/7Rcg9oNiK
         6VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583750; x=1745188550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5YjA/KfpvY46CadYlUcHuNncn9tBNGFY7tmTjqFT+k=;
        b=Ukp1XUZKy8dvtC8eJ54WjgFScwxp+Nq/airMkjHvNVE3ix0vTLuTQYllVOhALCKSZQ
         gVaDbsz4YERhNrT/w2J8RPmge5c8P5MWdLHhR6ZrjSxtLX8lFib2EqGlxlpQUt2cDn/o
         Qw0MRdBhE88ZInuDrCxncCejZEh+c6RdR+TD3dBg/eRR799MKTIZycz917SHwhpHlaQP
         Rxb69IYXnaEGVaqI66vtP3yzcIenCg7uNnn9E+x7viWXtGqjo8QdKik2FH/1NE9HZ982
         JIbfsvRXRJAEh5gEmSpZQnB1R4sHH/5fZK//I/9HiRf14STmho08lpi+QBW8KL/W467J
         ZMOw==
X-Forwarded-Encrypted: i=1; AJvYcCUpRKHNUYeTJ6bL6sglB2NtizJNEQ67O7yTh70WN4gAF6ienszal03iZE6dQWHGiiGTq/7h8H7BCgRIuaH1@vger.kernel.org, AJvYcCVsp9VGLawnkZAIEVu4783E9Yw4/E5cCyO8DnsCH+CWGLnmiMqp1hxM/gQfJBsgScOI32sSQVwvHEO7@vger.kernel.org, AJvYcCWFacJ906yWauL5BSVDPPvih/e1dHE5kkODQj4WzHDxAal5V9N59bILqzHSYro3ZW1vANtRC43omLns@vger.kernel.org, AJvYcCXer7JKArpT2m9Z2dZkw97yO17IyiiTp2Wj4QMflpH1hh6hBpFaeW2Wse+AFRMez/dCX+oUmSdZIScW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wMpLvsdTRNLjdWEqTRmE+Sy6yfCE56d9FcTdvxXKvSpi/xnu
	PoGqyHbO5w2pmZ3JIqUMUa8yTI65ecu/+uwPypVpwH1kCU4vlCt+
X-Gm-Gg: ASbGncucvYhsF+0u7DhyIs3ishE/QMTBwf8zgwKbK7hc9hyLmUvB6uPKFuEi4KzxcwE
	reOaGZ/qC7L9NePJ8FhxqlU+6+7z8bgJlTTBFtchd7KNIhiUocq0rIwiY2vp6vvq1SJLookxUHP
	/noG0mF5229koIN7vhaP19RKXESFgAfShRmf11MIpoy7eMsX5Il89vYAuvN4Q8P/3Cn/e6vNNEE
	U1IJp7btOEKXX/Xy05QM0TSptJWK1X2gwbJC5kJfriL0C10LPd9ROjwh6AUOL0K0udRTBh+DJWE
	pXYDVrCAh6aB5dRV
X-Google-Smtp-Source: AGHT+IF4AYfNDX6fmR9rMqMQ3rY8l2Lo4PsLhdNiIgvJGGBJRv29yNF11cYAsmD/700LbzKyzcIlsA==
X-Received: by 2002:a05:620a:2586:b0:7c5:9b12:f53c with SMTP id af79cd13be357-7c7af0b97femr1590502385a.5.1744583750449;
        Sun, 13 Apr 2025 15:35:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942eb8sm617762685a.12.2025.04.13.15.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:50 -0700 (PDT)
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
Subject: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Mon, 14 Apr 2025 06:34:54 +0800
Message-ID: <20250413223507.46480-1-inochiama@gmail.com>
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

Changed from v1:
- https://lore.kernel.org/all/20250407010616.749833-1-inochiama@gmail.com
1. apply Rob's tag
2. patch 1: new patch for grouping all similar compatible ids.
3. patch 7: remove unnecessary compatible check
4. patch 8: adapt for the new patch 1
5. patch 9: fix copyright e-mail

Inochi Amaoto (10):
  dt-bindings: i2c: dw: merge duplicate compatible entry.
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
 .../bindings/i2c/snps,designware-i2c.yaml     |   12 +-
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../thead,c900-aclint-mswi.yaml               |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    3 +
 .../bindings/reset/sophgo,sg2042-reset.yaml   |    7 +-
 .../devicetree/bindings/riscv/sophgo.yaml     |    4 +
 .../timer/thead,c900-aclint-mtimer.yaml       |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    1 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
 13 files changed, 3275 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

--
2.49.0



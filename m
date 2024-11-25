Return-Path: <linux-i2c+bounces-8179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FCA9D7BB4
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 07:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B441B22A5E
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 06:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CB617DFF2;
	Mon, 25 Nov 2024 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYXCPqk7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC781E517;
	Mon, 25 Nov 2024 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517423; cv=none; b=Km4wsI6O8h53FxQM0vbADhuO7PzAYs4aNgANRZcXNpv5GxHtRJ5dYyph/zVqAVnVVve3osVl9nS4yt0lkv3foIfvkx9tafg5DHTc+6xvs24Qrd19fTSOOtsM6LMGrRzJ0FVhW52Pj3xWuf0gD0nX5bgM793omMtAgU5+FPRbNU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517423; c=relaxed/simple;
	bh=1nZwnEquKXcy7GGTwO7kdWhYhjDx37thIvrPjHriPW8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EXe5c9QRiaaSXk8P6oHYWnB19lS0zVYmxPNL/0+C1CIVKmo6tGPQ/DQynrtODLVejAmS1NzUmw2iaS9vBrJt/NWTd3xvBeg7fPBViGzqZCV1UiyNj0OQTyxupTcDiuVrmvqJKBjGtD0ATb2l2IuWmZ2iZSImcQjYtPKrGZ5DEo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYXCPqk7; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-724f1ce1732so1173635b3a.1;
        Sun, 24 Nov 2024 22:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732517421; x=1733122221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaUBodTeKOMwsXvRCsOPXaAE6ByN08W7o0boJeoo43k=;
        b=FYXCPqk7INMr1yXXGL8QzSM6wDKqXywWNT8hpr8kXsWE+xAfx95877PbKSWVJvdi+G
         fr9YeUD2MVUJqZ8oTXho7cpF/KYYiRhmiFrQqxq39IfUxmNIb0VIXW/AIDeYOoYOQyoO
         +fCk97D++LWgLxTAuvBpSXql0ISgIY76wOIqtBqF3MVI2a5Wg98YurW1QtBVgzu9eWLQ
         6Y1VgI+H5bAf4mS6rrjvl8acUsCJLB3vSHT50Opp5Z5uj+XeTzBUwHdQUhbhe1U12/G5
         qJiCyTewyU8Fe6oQ4BYn6uBctPES6nMJ8UOOcIF5t7WKDRcf7IXt+PaicrBUmTnRSprQ
         WBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732517421; x=1733122221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaUBodTeKOMwsXvRCsOPXaAE6ByN08W7o0boJeoo43k=;
        b=f+QDy8Ao8u2rk68EkyragCSIPdtMhcIDIo47rUUX2yR93bIKusOlVzdK+kXbbLHf38
         7ntHNEbBCZyn6jEFOg1AJdWcTyjrFCLjU/ixOGA0wmqXVSY5Mo7fqhALBf/nRl3DuRjO
         His9qNohfYKsv5+/h7YVyj7N724Q5V0JN48vLZIhk5mowsOCWMvbsd440SDa/UhLTXRA
         HH+62mDe3LtpUtuj4oPuHY8DPTT7paZyJ79zpQ0spY8431fZ4Y3nDtCOOPKlQgBH4Ne8
         q6iWgAgrUOMrmP6uYMqVvKMj4qM0/kMTyYkpTr+Z2hJBJ6dqQezfiYwISmNcXnDziKP9
         2FsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLLrkYsvEYY3bNJkStdyCGVT5uDsDQGiTdPaHHaWcSxpcWuZ76fLvmy9M3JUSzhnr0ZpgOiapuQhzbXve1@vger.kernel.org, AJvYcCVLYKk9XOaQgsXGTrpajGwYn/KtQqco9iv8OUpqadKCHMq7YZKlQRA4gFbOUiX1jj+kj7BS+0H354Jv@vger.kernel.org, AJvYcCWy4mOkbtj8EGULSCHoVNujKxSYbKgk5M3vBagHmA0tmFZP6eSpet/NfECy5By5sqz98D0Pjtz4Bn2p@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyqm3jUfNV4X5JHSPr4QODVP+XBu3NYm0TCVOhxEF+pZNfetkH
	K7w5zvqCyKJNXaYHPF4I+zsMA8eVGbHY6UHoD7IU20BKO+90ihDn
X-Gm-Gg: ASbGnctENplUYObq/Ii5y3PG83Yj6aQC/GRm9tuErRgiMgJnkYsL2GYQHE7GdbTWKsN
	d6IvLuMYjOgkzll4WO+HUohlx1L9SmJlM95v1aDKWI6ecCT+yG+NNpSsDQJoaSaaVcp/TmVcuHw
	GMja8IS14aup5TyASmCBaNrF/55UtJErLdoUxnaZIzDmdiyMsW5Iz6wS0MnpJmZQh/QEJF8uNnJ
	nXFTYuZd4ymPBSvLqMmmgRKnJ8xLpe+cBW1rpuBNm3P/0jrBCJQ9fqjig==
X-Google-Smtp-Source: AGHT+IEc+76jN1fkoIiZAGxUnf5EhQ1FQiLr+0/KShts3aQix02JzSOioD8v2fzd9/wAkNJFjG9c3Q==
X-Received: by 2002:a05:6300:8004:b0:1e0:ca1c:8581 with SMTP id adf61e73a8af0-1e0ca1c8735mr3389903637.21.1732517420552;
        Sun, 24 Nov 2024 22:50:20 -0800 (PST)
Received: from [127.0.1.1] ([106.114.39.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454b41sm5649602b3a.32.2024.11.24.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 22:50:20 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Subject: [PATCH v4 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Mon, 25 Nov 2024 14:49:52 +0800
Message-Id: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABEeRGcC/12Qy07DMBBFfyXymqnG40fjrPoD7NihLhxn0lg0D
 Tgmoqr67zgBiYrl1WiOzr03MXOKPIumuonES5zjdClBP1UiDP5yYohdyYKQtEQl4U1CpACjnzM
 n6Hnf71vsAjslys974j5+bbzXY8l9mkbIQ2L/QKEajSLCndKWagUSXtJ0fY45DHw+u7o+nEYfz
 7swjb/MxB+fRS3/gP/MmmoloiW7eqGE1s8xQJdBeq8kM7eho2YxK6fcGApzjLmpanbkQmu0ZdY
 UnLeyI917tmjRsGMlHSmjxdpiiHOe0nUbaVGbwtZESvq3x6IAwSCadl9GIXyscrzf79+GPNObc
 AEAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732517408; l=4593;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=1nZwnEquKXcy7GGTwO7kdWhYhjDx37thIvrPjHriPW8=;
 b=0HJBlFx0e73AwOz6hU7262B65AuIsBm8C9RrrM1fnuZAIUzlwNmI7C376IhawutOUr8r4qrsD
 KIzaSArrN4sDfBCLgrZYDPccR+F3b9+efZoERyvS96YT8QRoKw+ZnXz
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Hi all,

This patch implements I2C driver for the SpacemiT K1 SoC,
providing basic support for I2C read/write communication which
compatible with standard I2C bus specifications.

In this version, the driver defaults to use fast-speed-mode and
interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.

The docs of I2C can be found here, in chapter 16.1 I2C [1]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
---
Change in v4:
- Patch #1:
	- Change the default value of clock-frequency from 100000 to
	  400000. This is to correspond to the driver's default value.
	- Drop the minimum of clock-frequency
	- Modify the description of clock-frequency
- Patch #2:
	- Drop the `inline` qualifier from the `spacemit_i2c_xfer_core` function
	- Drop the initialization of `ret` to 0 in `spacemit_i2c_xfer_core` function
	- Drop useless wrap
Link to v3:
https://lore.kernel.org/all/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com/

Change in v3:
- Patch #1:
	- Change the maxItems of reg from 2 to 1 in properties
	- Modify reg in dts example 
	- Changed the enum selection for clock-frequency to a range,
	  setting a minimum value of 1 and a maximum value of 3,300,000.
- Patch #2:
	- Drop unused judgement in `spacemit_i2c_xfer_msg`
	- Fix the dangling else warning in `spacemit_i2c_is_last_msg`
	- Fix the error check for `i2c->base`
	- Modify Kconfig dependencies
Link to v2:
https://lore.kernel.org/all/20241028053220.346283-1-TroyMitchell988@gmail.com/

Change in v2:
- Patch #1:
	- Change the maxItems of reg from 1 to 2 in properties
	- Change 'i2c' to 'I2C' in the commit message.
	- Drop fifo-disable property
	- Drop alias in dts example
	- Move `unevaluatedProperties` after `required:` block
- Patch #2:
	- Alphabetize Makefile and Kconfig
	- Change `.remove_new` to `.remove` in `struct platform_driver`
	- Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
	- Change `spacemit_i2c_read/write_reg` to `read/writel`
	- Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
	- Clean up code flow
	- Fix unnecessary line wraps
	- Move `spacemit_i2c_handle_err` to a suitable location
	- Modify Kconfig dependencies
	- Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
	  the intermediate variable
Link to v1:
https://lore.kernel.org/all/20241015075134.1449458-1-TroyMitchell988@gmail.com/
---

Troy Mitchell (2):
  dt-bindings: i2c: spacemit: add support for K1 SoC
  i2c: spacemit: add support for SpacemiT K1 SoC

 .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
 drivers/i2c/busses/Kconfig                    |  18 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

--
2.34.1

---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com

---
Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  53 ++
 drivers/i2c/busses/Kconfig                         |  19 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 655 +++++++++++++++++++++
 4 files changed, 728 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241031-k1-i2c-master-fe7f7b0dce93
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Troy Mitchell <TroyMitchell988@gmail.com>



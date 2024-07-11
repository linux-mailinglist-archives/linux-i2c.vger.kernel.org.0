Return-Path: <linux-i2c+bounces-4915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC692E774
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A3F51F243AA
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097DF157A74;
	Thu, 11 Jul 2024 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LqcQmOhE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F172904
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698740; cv=none; b=brCW1qaChcXPkHZoitAT7lRAN6EMfZcxh0wBPl4HQwMS1sjww5aapnXFPuB9zAxFCK77q7uyNoBaSwRI5lrMD0sQVNMC637HjaNEzs4NvQW4DCCw65W6czh6p62D7fa4urfFO5rzpjIXTH3hmVdlaBQE4RekGnbr3f8m2II3+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698740; c=relaxed/simple;
	bh=zWdcfiTIyyPAuOM52fLQggpwTWoly0MTLKNObUuKJ2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J3Ba1e3Pto2fbhrEz+P1QUP2btbRt4WV2hmwc5Zr0SRP7Ye8zaTlU0l7bQ+ItLQKl/wiFlopPQ7gZTYOPqnlxwIULwqSS95jREKxOUeFzavvK2oy33sh6sNEMHkk2KB2edQInFlksUmr2LZOiYX+TyBoUYDQ4eC3owVvT9yoB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LqcQmOhE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4267345e746so5334785e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698737; x=1721303537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AReyoq8j0UYL28c9GONhdzqknSDiTsmJyCU02ojVz8Q=;
        b=LqcQmOhEfI5QUc9UptUSejeuVDJRCIz1fjVx6RV8WwHxv8MnpGnrKd1OKq6AQNu1Js
         uio/9+8cY9W3mrvVVpw/pvrRngYUBeQi+xwv6qTOy/9/Irg4SFeTWPIPuW/q5n7KLTgZ
         HA3EezxzPXrHzlfqZnUjddNbzVWXq56RJ8vAOZDcjMMtjFbsS1y992sJ9ns4Lbgakcab
         xOaNu/Ur9dvyikbqJRCSWUNWCTI97izwyT5s458L/0bahC5LEbV0XT7arN9/8X3zg7g+
         HSZ+2aRt2JB63nSuKParW6WV3j+nv/F+7lTstcbwubvkWquE+qvjRIsv53IKvq6mjoQB
         2zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698737; x=1721303537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AReyoq8j0UYL28c9GONhdzqknSDiTsmJyCU02ojVz8Q=;
        b=jjrbV+Qt4Yr1u6rQMrvf39tqIdRpMUPuEvYyt67o8FH46F6FzHl87EkpFT5ZJ5283U
         8BKbMV7oIG9DbRXkNIhjg1n4y2WrQaTOMwZlkta7vknSZvOhAgE0G5SKa84qDpq4k0mv
         ryc11FyWzlnFt1Ih+0bBOyLr/XwaFrJNKZX7E1hWDhlKTeKSOWJZlpBeHO3V+Vth3U5c
         gX9Bwq24bqOA14HDwz7MzrdRqJJRgqBTTP1R6JUHR5pXCYstSpj2nCs7UDVHHsoqS68B
         dIej7hL91oa5VuqVrEBnq2kgvT6c12f8UM4u0/LeztZDsNkz5BWBc80YDGD7gD8Qw8hK
         rpBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzMazUZ9LkfnJ0QuxDwwlrVjOPrnTq1BBTdkq+jFNOzOFz/hMgRJFwCRxc10LKo7cyT5gDk5zIg4mVlyZXaPF1UJE01KKxqwaR
X-Gm-Message-State: AOJu0Yzz9ireciLeMB+mJbCb2tTwcj8etP+nJpj9z4JN6lHNYiohfvUi
	IB+7HLSS3u+ZUzrLWGqlF/Mk1xk175xBq6V5YCGamLkB38WZriKe/58Q99aLfxY=
X-Google-Smtp-Source: AGHT+IGdLSdp5aZa1rJO1UP5f+gQwkUgUvwswdqEDXPCExjrog+7nUhfU+Oi8UbcqLZhvZJFGluzTg==
X-Received: by 2002:a05:600c:54e6:b0:426:5b22:4d61 with SMTP id 5b1f17b1804b1-426707e355dmr56946085e9.22.1720698737418;
        Thu, 11 Jul 2024 04:52:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 00/11] i2c: riic: Add support for Renesas RZ/G3S
Date: Thu, 11 Jul 2024 14:51:56 +0300
Message-Id: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds I2C support for the Renesas RZ/G3S SoC.

Series is split as follows:
- patch 01-03/12   - add some cleanups on RIIC driver
- patch 04/12      - enable runtime autosuspend support on the RIIC driver
- patch 05/12      - add suspend to RAM support on the RIIC driver
- patch 06/12      - prepares for the addition of fast mode plus
- patch 07/12      - updates the I2C documentation for the RZ/G3S SoC
- patch 08/12      - add fast mode plus support on the RIIC driver
- patches 09-11/11 - device tree support

Thank you,
Claudiu Beznea

Changes in v3:
- dropped patch "clk: renesas: r9a08g045: Add clock, reset and power
  domain support for I2C" as it was already integrated
- addressed review comments

Changes in v2:
- change the i2c clock names to match the documentation
- update commit description for patch "i2c: riic: Use temporary
  variable for struct device"
- addressed review comments
- dropped renesas,riic-no-fast-mode-plus DT property and associated code

Claudiu Beznea (11):
  i2c: riic: Use temporary variable for struct device
  i2c: riic: Call pm_runtime_get_sync() when need to access registers
  i2c: riic: Use pm_runtime_resume_and_get()
  i2c: riic: Enable runtime PM autosuspend support
  i2c: riic: Add suspend/resume support
  i2c: riic: Define individual arrays to describe the register offsets
  dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
  i2c: riic: Add support for fast mode plus
  arm64: dts: renesas: r9a08g045: Add I2C nodes
  arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
  arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node

 .../devicetree/bindings/i2c/renesas,riic.yaml |   4 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  88 +++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   7 +
 drivers/i2c/busses/i2c-riic.c                 | 220 ++++++++++++------
 5 files changed, 255 insertions(+), 69 deletions(-)

-- 
2.39.2



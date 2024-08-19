Return-Path: <linux-i2c+bounces-5494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4B956848
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D9B1C215E0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D371A161900;
	Mon, 19 Aug 2024 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cezkf42g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF966160883
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063045; cv=none; b=CfB5XinJn7yivPeYuFrhJM7BhqUyO2yr0EUylOVA3AGI+nttnmgXMYvTuZ4SNZmroaELs7PiczKDQ/gg00hs8RCcMh7+zQZKZutligG8JG1AK8L3uOfkYMdI90CnXZUwxxuc57bir1jzABc4IJxufjwBiZd0VVMKUnhcsp0S/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063045; c=relaxed/simple;
	bh=dmc0y/kWfY6Cc8jLZorl5FTPhvTODwkyztEgSx9S+Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GJr1UPQ+sYdRKmN5nP0HQTbB8r8iB7Ik0uWpyJ79qNjIrqzgYeWSGEt39R5G7gSMTlCq6O9q+q3TRF0UMwfZfhoV6Pb1HczEstSWuQ9/3wVBKoq2oS1+Y6k7DtN73JXlvJoGWISzu5MJh9/AmtqU6+aexrKUEtFI5wx7r0uciOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cezkf42g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-371bb8322b2so423905f8f.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063042; x=1724667842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDAZtsT6d3mahbQ02zCEF4gWDXuIPAzZhJkrRtcP+C4=;
        b=cezkf42gNGJJah5vY0Bu+h0suotzcr0Vkn3qxp3Cp91zohPfaqULumvO1Dkq9YGRTZ
         RbjtKFBsV0D1WDs4hovo1DirBFq91z6Bq0pHR8beYIqrBKllJ0hW1+l2cgUGka+1jCFs
         rUv7O5KmDMF3uv+Dw4SKmdsdhaLsC1s+ptAyrCXHLtqjeh8X5krI9ciqEqCCqwPmfFC2
         8ChJNLg+RJI+2Gkzp+kg3VQsteWx8o3W3P1ICSevO/BGAY3SwxJ0mYW396ly1InoNvPL
         QExFa62bV4WcWx4mi4qlqqXzoLBYLX+0hHeLdL6AQAIy6KTRpIZaiNn5wPrhXjFGagmm
         sEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063042; x=1724667842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDAZtsT6d3mahbQ02zCEF4gWDXuIPAzZhJkrRtcP+C4=;
        b=uvlJlyG3CKaMo2QOQWNfBJ/afEwJBjhrhHyiUBVMpazt3exm3w9LWd7ZBt5j3qZS6m
         V1DlL7gR38xRa36wk7G18QcUZWrad6tkwUdEvwxQo9ODcCZOWO/w+l5Wv+V3MI7JZYWB
         5FPIgM77ZgxFQmgK4VRsegv428HJBXB7YDtrLjKORuim0E23lMQhQVwz78D2JAKKgytG
         BsOcGCUVDi561bJhh/0ph15Hm7tokPjEW/KUNQeRL4YxSBtn0Z3mqSs4iJ+UqQM4YTNf
         Z9SF2XxSKfmuA5pY1B9rvwI9q/PuGPlGhnfBSnsbhapPm84Uc5AgUhnIlZWeXLyk0NAk
         gYQA==
X-Forwarded-Encrypted: i=1; AJvYcCVmwXZiegPW5gOOvnERgZQ6Xm6ePM+fCF/g66BkBY8GV0C2QSqgESRTxgOM7+CpGdStwOqhJTy4gth4tMijLaPKkcFInLXsuzZ2
X-Gm-Message-State: AOJu0YxIz/fzFOdMhuovLfJDOba5wd31rPAmaH/UMy08r4Iq4PupTk5M
	Bdl5a/nG79RRMDemhCXWw/rYB8cDEp4oM+BGBayopTawYpY3Qoeamf4Tk8cVb9Y=
X-Google-Smtp-Source: AGHT+IHhgJykbmREGclvTsJOq15gSZSew6esBvPJJgp2rqvyLR0+ob6kzyl5jQLdhetgliiq2P096A==
X-Received: by 2002:a5d:6305:0:b0:36b:b174:5256 with SMTP id ffacd0b85a97d-37186bbd0d0mr9221544f8f.6.1724063041873;
        Mon, 19 Aug 2024 03:24:01 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:01 -0700 (PDT)
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
Subject: [PATCH v4 00/11] i2c: riic: Add support for Renesas RZ/G3S
Date: Mon, 19 Aug 2024 13:23:37 +0300
Message-Id: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- collected tags
- addressed review comments

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
 drivers/i2c/busses/i2c-riic.c                 | 221 ++++++++++++------
 5 files changed, 256 insertions(+), 69 deletions(-)

-- 
2.39.2



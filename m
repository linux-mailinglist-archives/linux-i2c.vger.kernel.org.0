Return-Path: <linux-i2c+bounces-12947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23092B56FFA
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 08:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26503B93E8
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 06:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90056276020;
	Mon, 15 Sep 2025 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGPA1C5N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAF1F463E
	for <linux-i2c@vger.kernel.org>; Mon, 15 Sep 2025 06:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757916123; cv=none; b=CpkizdyhPEFkCK7/Kx5j2d3/uCCiSdI9EfmyXxi8inMcegNgUAtVoq8/XDjP/NHmsoF7ey3QD7qg4lt0LYNObb1E2qc/zMfz/y/gMdVAMcEd7Hee7kWC1syFybMcwRMOeaHavK3izIQFQWcLyvhNW5Rt/uDuLeEOikPgQ5iLYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757916123; c=relaxed/simple;
	bh=0i8+DknoxQAjvpBVwLLCnjqj1KkrlAyOUec1giywe+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j5StRslUFUL+DFcShVXSEdu6gDIumVFkocuKxfJS0fkcBou8ZVFZ9OTyt4+MGMhrMAftMMjqrdHgeb87MD9kFdCryP7p4Htweai3RhH38NS4bvtOiKkbw782k77Z+7LEbweLV9yEcmh9RPtAvB/raFgR13AI5G9ht5Dt/E2+vPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGPA1C5N; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso3602341e87.1
        for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 23:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757916120; x=1758520920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZUcnCRcwQHZ20XjWalfDU23D3XdkLxWMGXACq1syco=;
        b=IGPA1C5NBFhAp4EUg3Zdc/FUc8obGmBmha5eAy2nVDlxnr7TrYrwCMe/8e4TZAfBMD
         rsn48LoK9Ve0VfLjiOa/ZRjiJWnH9Vg1wvvwQP9upkcta35OuT+OmAPcJd0DTU82sW0I
         SEvzdheR7kyHy5hRJObVhzlUxunOMRwbhLc0shjLUEK6PONdRFUXfhBiZb4qIHMlR9hJ
         /Grpa2ipd4Tn8XtdPjNRHEi4ChQ6GX/XZtTgm53zjBUPcEdjehz3JUvwEO5kYHVCdCXE
         CU476MxnlbYei3Itg2EuLoUCeGG3nx+X+jA6wmSclGKKYpNtpayPgJFwZifuV/bWvbYH
         f/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757916120; x=1758520920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZUcnCRcwQHZ20XjWalfDU23D3XdkLxWMGXACq1syco=;
        b=nBaUd287P2pbJ2jzJmnci2AbCkT84P0s6ax8PxL25ZbepKgdhxyVwZOYc6c3AEA4jx
         mz8PAHGN/BF5ITjCOu39DNz2HpTEO4l0h2UPm8qlUqVeBov9Ln823ZpP7QIVmZQzd+02
         2pQbZkUMNtZ0rGHACeZVyNnKaUsWDwrObHr5/IcQCSqWuAALgPSL6AdPLPtUlIPDEWMi
         LnpXFIHyw9hHLvfG7vcRCA5hklMMriAcjP3kBVQQSleStUcfrx9UFJVJKWVq2LO7uRL+
         9XHvyW0BbybjsjurWdqumrs7u/Q6h1ltRSl2PXP87IwMyods9Zrc2X/cQVomipG4Jmr0
         oMpA==
X-Gm-Message-State: AOJu0YxvR4et1GUSjP6Uqb/C+QdanLZTQprp2zpE2Rcn8HjR2/0EHIWB
	hdnD95t82KMbTYPIS067LpScbVkxosAtB+fvAeA0d6I5j6Ci7i7FUePg
X-Gm-Gg: ASbGncuN3hYYKwzBFDTVDU2fQsyX2wo0K5NQNAh0g0EiGCxstDC032MYqd8vANdP3IS
	ZCmeSBmv1FRnUqR84zuHmbO1alvUaGB4uS0zTP6MMvbvpwU58ZRWxjqdkyvhnvVfsmxAN1Y/uA9
	pTgIUhuSqGKZqNTWgNaT6f8Pv5DlmVf0+hDtstDpEB7UDGYYuN9XHP0lBtxo7PxFqewqe2T+KOa
	gHSotxzwaYalgFr5Catw9ohcXAp2F+JlwIwkNzBSU+7oqwwqjo5YABmOOKqqxMR5PbmHoZRwKYY
	fRJYP4UxVwFh+6+ggTtL4ljOZINxI9bjCm3bsV7PMz8GKecaXnFCTmVgM0aJbIm6xZxyTdlWotk
	awaZgEGNwbllDiA==
X-Google-Smtp-Source: AGHT+IHDjCsT9FHnjoOO4pQ1o6E03HlGS5iXY22PkYNYih/D6j5nfiMo/CGz7SI8qhM2srkPhzPUKw==
X-Received: by 2002:a05:6512:361a:b0:560:95c0:a523 with SMTP id 2adb3069b0e04-5704fb86b89mr3166947e87.35.1757916119435;
        Sun, 14 Sep 2025 23:01:59 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571d16e79d0sm2062214e87.86.2025.09.14.23.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 23:01:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: muxes: Add GPIO-detected hotplug I2C
Date: Mon, 15 Sep 2025 09:01:36 +0300
Message-ID: <20250915060141.12540-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement driver for hot-plugged I2C busses, where some devices on
a bus are hot-pluggable and their presence is indicated by GPIO line.
This feature is used by the ASUS Transformers family, by the  Microsoft
Surface RT/2 and maybe more.

ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
that line through optional dock accessory. Devices in the dock are
connected to this i2c line and docks presence is detected by a dedicted
GPIO.

Michał Mirosław (1):
  i2c: muxes: Add GPIO-detected hotplug I2C

Svyatoslav Ryhel (1):
  dt-bindings: i2c: Document GPIO detected hot-plugged I2C bus

 .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
 drivers/i2c/muxes/Kconfig                     |  11 +
 drivers/i2c/muxes/Makefile                    |   1 +
 drivers/i2c/muxes/i2c-hotplug-gpio.c          | 263 ++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
 create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c

-- 
2.48.1



Return-Path: <linux-i2c+bounces-9364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C9A31AB7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 01:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4DB167F86
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 00:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96FCFBF6;
	Wed, 12 Feb 2025 00:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQv2QRuu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA809444;
	Wed, 12 Feb 2025 00:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321323; cv=none; b=CbSkUWup8Sk7i4F7DsztfJF6O1hSBrwYU7PKb4ll5WlITBdDA198bZwh8qklDOHjD6vIzV4oVOm23WrB54bX8KsU0kl1iO5pLM3+/8JiuqVoe5XimK9HKJACD8IcXchKc/OTWlZkxfEfn1k7c6VnGSW/iYl/3mPe0KOc8bw8Prk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321323; c=relaxed/simple;
	bh=Z/rHAQx2OqbfhVfOdlBKmvPFBySyvQyJzqeq6noW/ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uLQuu2BZcG7Hhi8MlSKJ9MOawCJsul9G1O68VNibr0YylAlBXxjwA3okdMA/hYDd+o2l8qb7/4+75mw/6xJlyTzoLx/0k7yRD6FWoEhmVq/V0MD4nLugGAaNDxCRuEqvajOxbEljjHwP/zxpF3L8+8x9n/UdI8YGYSaNDWyQjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQv2QRuu; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so1464672241.1;
        Tue, 11 Feb 2025 16:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321320; x=1739926120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr7k0IHaHpwdUMHUz8Ci6MZfiR8HqsaiWGJUMuypOjo=;
        b=RQv2QRuuMkYRsMYlo0YpfdJqJODdO6rqV+CAlefFSd0YWh3phKoI1mTWRvKRsyr2x2
         j/SXZsYnRnG0nazT4bJ4cjD46vWjcCU1p0czfLyKZuanExiEtitft8qamozRAiG9Ly2y
         RhpEUD6eAthslXgrngSFxtb7TJ11aeG4UB/tDqlRN0lL8Or90ydVM4mx1r5p4wQHzHMy
         4Ml6RNUpIRKKnRFOVScFi+HaW3MgLU5TErjJE0qlRomL2YlZbkq5kvFZuqUZIEyquGTl
         y/FW8dT7LZ6yG+2e7Gad8KjLjsy5oVAEJGdqnUksgM3MoqGZ7/cqluriDZF7K8JoQ9EG
         2CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321320; x=1739926120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr7k0IHaHpwdUMHUz8Ci6MZfiR8HqsaiWGJUMuypOjo=;
        b=Q5qjEYTDZl/wbiMJbJqnlmmoeomgr1uhlPWfHgxbVkJoyfYDrOXJKOrUN+EiKqedi9
         4wl0kFSdT9Kg1+uz1nD3Cx367HNvBcllBnJKUyOvcCZbndJmur/BxE2BFRWMuAhgHQ1k
         tq3SmcA6fVjMoHE9HCXuRP8LxVzVTtL6xjCVyQMIKiTxRcRbK0+eyvo0cNLM5cbA/Kxz
         oC2sFb2jqrKoKcXwDfbC9yOAr2NvE4NgtcmwN+zwj5l4Gln47PgUR4rL4CYgBTAlBHna
         U8ghf+CYAR7cthKtYEpYq2iYGe8BaYFyonBLV9Aph3HjK3bMYfxpT+BtPLCn1D5OxkJU
         fEww==
X-Forwarded-Encrypted: i=1; AJvYcCUOwexQ8T2T8nm/aXrjXgrhsMps9z/M4TTZMgdrsP7g3GDmzDqbIpHgZqgnJd1nUShZoc0rG9XJqPdX@vger.kernel.org, AJvYcCVrEvzJIlnLv4UVtbU1a7cv117g/EGKECc2lUH+kSSwUmr39u/eg+cxW+ozlqb10a341ZMGEa0dfBOD@vger.kernel.org, AJvYcCWAgVifQOaYNj0cHhVE2qZSOWuMq7r5KmX1X1p5OI4XwyRcwRjr2x0518y5TCmsqRDC94bEYPIKkXXJ@vger.kernel.org, AJvYcCWaMaZVpX19YnTgqonzEazuLVvlJr3sBxrpRWutPFWZ3BL9eLdb2E2hLEs8UC5uOjdREENRxALn0dJcsWhydg14cHQ=@vger.kernel.org, AJvYcCXLA15hvlMXjFHh+L5le+GryCuJvwbgaMXBHPf/eenvTCezcKbGiX+4nCEHJ2aUEt3MstwOGJzLT8bB5wpb@vger.kernel.org
X-Gm-Message-State: AOJu0YyJP5Hl+IGAYNz228RFngbr6vaOh3h1MabF98ggldsZVP0MRx1t
	bCUkJ4chJF3OThUSB9wuQyi/lOGlnVGHxAf9d4iMCT2bxue9jwKJ
X-Gm-Gg: ASbGncvn9nAgyP6NJ+MEdUBhibbBUjUx5BhBtQKQREWhi7a6QhKbe/9Js4sycGnuiHf
	WpN1HHvBS1lDYKIPjEuRrvYSUAgtaa9Bc48bwBJ9d7hfpVOmui7h3pYFRyyeYkuI0QzYxyEddPH
	Pz2ofu56sbA6gHFW0yDmYJGGxkNxP4zAkGlChXjbFHpp557E59EggNLCgVY0KGXwJivyjo4uJak
	8KzbXoP9DJ/l9WhYgNuki8seTpFCUioOhFqjt0BuLdsjKGKRnvgEcSabtmSFOkNFV3ilWjM6pk9
	ZymnyzbH6wUf/GKfLgzr2QATmITTQb4TuY5rMh4LLNiA5E2aJ5a/HoRD1SXIhbiZDriMjrmtjFE
	eKA==
X-Google-Smtp-Source: AGHT+IF8umUXWJxzA7jwMoQFHJEnI99UvjDxrLCD+9RYrpwz/h5a76AK44gMco+fgsKHyYP6Hw7zgg==
X-Received: by 2002:a05:6102:3f46:b0:4b6:5e0f:6ddc with SMTP id ada2fe7eead31-4bbf556ea52mr389873137.14.1739321320485;
        Tue, 11 Feb 2025 16:48:40 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:48:39 -0800 (PST)
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
Subject: [PATCH v2 0/4] Add PERIC0/1 support for Exynos 990 and hsi2c compatible
Date: Wed, 12 Feb 2025 00:48:20 +0000
Message-Id: <20250212004824.1011-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series enables the PERIC0/1 (Peripheral Connectivity)
and compatible hsi2 for Exynos990:

- PERIC0/1 feeds HSI2C, SPI and UART

This part tests one by one to see which clock hangs without
the CLK_IGNORE_UNUSED flag.

Changes v2:
 - Remove other unnecessary patches which is nothing related
   to linux shipping style.

Denzeel Oliva (4):
  dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock
    management unit
  dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
  clk: samsung: exynos990: add support for CMU_PERIC0/1
  arm64: dts: exyno990: enable cmu-peric0/1 clock controller

 .../clock/samsung,exynos990-clock.yaml        |   24 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |    1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi     |   22 +
 drivers/clk/samsung/clk-exynos990.c           | 1148 +++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h |  176 +++
 5 files changed, 1371 insertions(+)

-- 
2.48.1



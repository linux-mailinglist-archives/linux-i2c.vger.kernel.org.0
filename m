Return-Path: <linux-i2c+bounces-14650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B514CCECEE
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 08:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31A753033D54
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 07:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00802D838C;
	Fri, 19 Dec 2025 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc1WJmks"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334F22BEC27
	for <linux-i2c@vger.kernel.org>; Fri, 19 Dec 2025 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130154; cv=none; b=FqKwms0ln4YVjYC8JMfF/gfVu+A6bmsC7aQRmBcoEPy5vyL8iawZdPqjpctgdkukJoKmMymxqbUyC2GfNzz3BNK0IS2k6S0kr+Qio58EsN7Emm2TzvZV1XQU1Ghykn0BMR96IE7+I4To9Dk902jZowb4Wj6J4RsMxfJoAuYbBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130154; c=relaxed/simple;
	bh=qNd7Kkg/H2zhSsCmeKqv5XE2BPxplo29/JW30z7IwFc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hnpsUZ3lyCSF3FeXnDPqYzi87T2MVbRK7WEFRy+q78jhuxB5zLXf+1ELqiv1UIRttvYBwhNaiPBVukEJm3la3ks6TruS1Yg6npZ0ua8Daydw5aiasNBI20HxZeQ61f3TboKIYbN8k3zzxwzkGs3v6FoD2BKfLDDD/HjUWP0j/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc1WJmks; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1301547b3a.0
        for <linux-i2c@vger.kernel.org>; Thu, 18 Dec 2025 23:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130152; x=1766734952; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGrTuvEwjjViNUMt3QJcRhb16ogXp7GtzCI+L0Kabag=;
        b=gc1WJmksF1zmwkXjLOJCzqXbDBQaLbN445ip2IHqYpJQe+5pbFqOvlSY861Nd7+wgn
         I+lrtQVJm8y5ls34p4bSOfVnHxCvK2d76iRq3UwuGPySN5lBJICJ9Er0EZayvGb1fxRL
         1gInMvTTNbTtxFCslAgI8Bx6S4gxe3N86J9fAy20ircw2cBhPUJmB/3C9fls/7TcQuzp
         tIpyVuW5ODyTYKuLsQrEKyJKiNy6sru/+BDbpozwSK5EdD2+e9wVnpoUQQN+j2GFoqN/
         NjDSfcUiOVSAxf1ax22n9qtsoUBTdBPLE3XmKe4jP4VDZccTXk+5xPr18RWS0JbkdYVG
         QE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130152; x=1766734952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGrTuvEwjjViNUMt3QJcRhb16ogXp7GtzCI+L0Kabag=;
        b=uOGXMAyM4a/F3vM3cuGdxw76V4QgCjCaKHp6fhtLrEYtDnVJsT2LRDWEdsY4qxW3PV
         B4338ahBttD1iOJS7U1vKFraOSnS7tjS7++X2c8IEUkeP4x2S5uKPuP5cab/UJFjD8bT
         NeDbAznvDf1FpAypH2kxjcpWhTdE1sAXsrm1wp+DEz6jymzj86qG72DZSPsmw7bzk7jZ
         EgqXMOOBSHgQYDA9tL7+zm1dADhPrKpubsnEgrlxWH+0eiyz7DT98m0q9K6FfBCG4o+M
         nOPVXaE0W108v6WXluJnElHX55KZD+smRwbXAJPXrF8DuUwz+Gorj0Y3Y0J7hnsWRDo8
         5x8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1vbK856nJRwo66H8WDnp9mwSGpcUHw79lH3NyssvHr/WoonLdI06Vgx38yShPqa9Fu39mBCZAGHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9Vx0SeR6lmLjsTq/ThKQtoXzKtbWSriy+BcUmSE5C8OShA20
	UoPuXuYlzQdRnpZins6jisLtXVEy4NbmtnXGL+X5MCl0rV7ZpBmje7X6
X-Gm-Gg: AY/fxX5svag8FJG/35+y3FX/JN7uXSIF3wQxwt1RfBbuwsOhqQfGCAvu2zSusPegYmA
	4WAnNfKagkuBgxuqcXjhnKEYuJoPCXAaCpZk7LJFEubf7Geb/35HSRHGiUBJuKjLtzTL6N91BG1
	Lhm38XXE7b2tKLYh5/3VPGKx5QOcH00Map7T01WQsqGT4nupswJhKKAFIHYd+i1rFFIqPc6Q2Vu
	dEYo1NAeQ6wUoFUFhcUJno5gwIO5rV+7wbyGdYqUrZwLSIL7wdDI9RqEOR7Ll4RQ7ogPdyjtMgO
	FJw+B6gwav7EvS/zAwvbdurzMrUvTjKaACFfESqy5E4GyLVogz+AqQ+vApBBvCFSHl6XYL/Aw6y
	S/qQBLFXLqvCBYalUkcBfDrnBuZ8TLOAO+gynSSO6kQQ0w7WRkFk1
X-Google-Smtp-Source: AGHT+IHvlxajrZyvgu5NAl/VwkuEOt/upecy4ZBkpxVWB19Jg5A5qRKqAiwdH54bqOmcRQaHwjRFZg==
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr1631925b3a.50.1766130152282;
        Thu, 18 Dec 2025 23:42:32 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm1489676b3a.50.2025.12.18.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:31 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH v2 0/3] i2c: spacemit: add reset support
Date: Fri, 19 Dec 2025 15:42:19 +0800
Message-Id: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsBRWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ML3UyjZN2i1OLUEt1E86RUQ2NLI0PjlFQloPqCotS0zAqwWdGxtbU
 Ao4A1YFsAAAA=
X-Change-ID: 20251218-i2c-reset-a7be139213de
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=1131;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=qNd7Kkg/H2zhSsCmeKqv5XE2BPxplo29/JW30z7IwFc=;
 b=IP9PYiLnxh4jarsPPV3BBgqvdAZV84EWSlqmOsx0gleAv9VAbPkrnmv1JaYOb/jF/whJbat21
 mM7tks7h+8dDHF63uWqww3whwCH//d9Myr1eKBAj41dpiIhog/DiS+4
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset support for the K1 I2C driver. A reset ensures that the
controller starts in a clean and known state.

Reset ensures that the I2C hardware is in a clean state. We cannot assume
that no program used I2C before the kernel booted.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Changes in v2:
- Replace reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v1: https://lore.kernel.org/r/20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com

---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       | 8 ++++++++
 drivers/i2c/busses/i2c-k1.c                                | 7 +++++++
 3 files changed, 18 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-i2c-reset-a7be139213de

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>



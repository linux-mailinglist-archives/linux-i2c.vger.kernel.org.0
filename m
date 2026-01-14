Return-Path: <linux-i2c+bounces-15159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9998D1F53A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 15:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E04D23045CE1
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 14:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4612D6E75;
	Wed, 14 Jan 2026 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcrVMDcp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80C2D5940
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400038; cv=none; b=ohlC/0ykB0g4Hx+O6NVQZ2OSEefyVvaxAjysuknfy887IGBXZod4oPsqEiTOshb3mI9n2X1u2kLk4CNMRXBygQdbleteVDg1CGjqZuk577jB7zm+oZ4rdbwjjnHnnp1C4V5/X0ZyFQP14q4QjbrQXNa55B3l1MbDdhe2zG3LgCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400038; c=relaxed/simple;
	bh=2ZuEqHB2s7ah7FGTDfrXv3UYcyU0SV1LLoyilbUsaO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VWsObmWjTOcN+841PK8X3UZG+EHcSFJYq+OvM3bzv4n++k9AKVnHOS6n4wseJA0cokV/8Vhs5E5/uYrVc6yVufG4kpVGa+kzdQ4ejzqPWBazHun/Gl1JaW4ViqDfb3xqye8NxsyzYLg/Ss648Nly7lxQlKJe0FWzgzf5n5vy7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcrVMDcp; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b876f3f603eso61592566b.0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 06:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400035; x=1769004835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWwco69CM3nOKB/ZfiZ+mwx8pHkqDra/uagvyFegtpU=;
        b=YcrVMDcpmCtt2YKOdySeBkf4VKqhkqiYws80A85jtNqR6oP7choSPuR/TPOkRgWtrG
         rjiMfsr/cgitfevstDyMlBFcGMP3hgtc9Xgj2idQM0MyGPhPExGqMpq0JbWUwT/26UCT
         AI17l1oxzZR9o7egWOgCWCBkimSXmtGNxsYQVfKc5oZNRez/f+eMQuFhqyfqxdlNS3Tq
         zOcjz/8MR2j2FBiOBc1m1d4LDzgwReVbhTRhbur3wPFpBHUyh3+YXlHYQxEF9+grfvIe
         a1OdA3Oc9Cz9jJGF+kyKnR7jGLFsx/j3eKn2cGUUHUuPw8dvLuJyzAHI9MXxbHZ14PL7
         WH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400035; x=1769004835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWwco69CM3nOKB/ZfiZ+mwx8pHkqDra/uagvyFegtpU=;
        b=o0gx0PiMAeHbjvMKH2crzh1e7UHggXkpD2/FcMU2QsS2m2kkwzzBliDFu10MbIDh9J
         RXhiJGTIIU9Evjbyfv4AVlzLAGs+nO9aZUn2qtUMCuGDWWw6YyYogOlbW/PUqHd+7JAH
         cozpNX+sKdUpXA+IXBaKYj65e1Upx+1ict06uf3ba+G75TA52VJ864D4ezun5BPdLDvz
         IWFMSKAs5upu4TkRHPrJh4qZrf8etnSsteQ3do+RfbkGBGIqu1FBhxLThTBw6Xc4ZNRH
         ChchKENxiZg3wo1ypugRJkxuOZ5XwXI7mXIulfQl8D19Eee3mwYrnr1Bx4w2XCBng54/
         bLnA==
X-Gm-Message-State: AOJu0YxOxKvqQUbwGNe/u/NcyUitgp0VPvkJxRs+tzeAQiGcY516y7vB
	s8GE+WFFfDUeKODpDT516rfUeNvSOQFIj2vVPhLycehFwny/U7n0Nnw4
X-Gm-Gg: AY/fxX77aeegFGkz4l/xbAypoUG584H4S6ToR/A4WqnZJ+cmhVRsdh0Nt75eWIeW2EY
	1IX7q7ZnygNeIFk3ZwmLqdQ7zvzlb+GhYR7mKnM16kUnNAXI24RS9u2nF1BCqkqwPzL6B+t2sNg
	vTWJrHAW58KYQbM4YTErRr6qZI29irnB7hgZrJQTX4jb5n8HlZ3AIYK8hZG0wL0pPU4RfFFY7cE
	uqj8L5JNET/Lw4heH5FAHPNTcDzbkAzdxDvOJlnmuZcVUIZcsD8VyupS+Uz3CJ/HxVwVu1rJ97E
	EsatcIP+DmRHjZRXt3pMCeRCl+LQcsgKuGUnv9Omkz7TtqJTzp9+Jjdr7Ps3QlnQ5BQaxF8pk/r
	KojyT7IRHpV7TVI71cq/Z63ZoRBjJGKvt+pBWr+MMDwetTL47iCY6mWAkV6NCzb8i/5ZNkv0mEC
	spy08rz9EDm/Qlb8MY1VE8lQ==
X-Received: by 2002:a17:907:6e8c:b0:b87:225f:2e74 with SMTP id a640c23a62f3a-b87610180c3mr230198366b.14.1768400034484;
        Wed, 14 Jan 2026 06:13:54 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.248.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22651950a12.29.2026.01.14.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:13:54 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org
Cc: linux-i2c@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: add support for forced SDA recovery
Date: Wed, 14 Jan 2026 15:13:50 +0100
Message-ID: <20260114141352.103425-1-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings,

This series addresses a limitation in the I2C bus recovery mechanism when 
dealing with certain open-drain GPIO configurations where the direction 
cannot be automatically detected.

Jie Li (2):
  i2c: core: add "force-set-sda" flag for open-drain SDA recovery
  dt-bindings: i2c: add force-set-sda property

 .../devicetree/bindings/i2c/i2c-gpio.yaml     |  7 +++++++
 drivers/i2c/i2c-core-base.c                   | 21 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.43.0



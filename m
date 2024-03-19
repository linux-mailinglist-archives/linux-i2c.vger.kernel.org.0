Return-Path: <linux-i2c+bounces-2405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAA87FEBE
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 14:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B151C227B8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 13:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6398004B;
	Tue, 19 Mar 2024 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVa/GDGh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DE57F7ED;
	Tue, 19 Mar 2024 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854772; cv=none; b=mFXiJhBGkeID4s/v4u1ca9YsY36eZhMlN/LJ3bh0cSzTsBm14K+DvHbrkdTcN0awIgbMojBQtoNNiayN0oDhKR6IxGwCmKIopk5Y/3Mf8ohrgRgUS5fUWGPWxgVsc82/WSUMa7MWmJCEQ5U8Z6iYbeX75zVoYFFzNRx8r6C2Hqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854772; c=relaxed/simple;
	bh=+Lf9yfo6mkbfFEH+Juha5BSbT1+36sEDAJTijaXsEcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZIkih+yf9CzIIxrTfp0ZcLxBDVNBLnh3InYMoQquMt3aFnySRBC0D5wMVAd9l62+z0mtmS/xdDjyHTlBVEHVnVw2rAns7tsat8PY4cRpGoDXZEv1qlU71Hcu3125Az9jiWYFJf+TjDm66iAXYW41SJVCGQ/OdMF+xY52fx3xEYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVa/GDGh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41462295004so7593255e9.0;
        Tue, 19 Mar 2024 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710854768; x=1711459568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEOjV6AJZtNxCuHMhEml9OSDSgFvsq54cZ/lHYpo9oA=;
        b=mVa/GDGhBJqaW/3qUR/fRSWxxT9nLW4L/eGZ3u5W+JMi7yP9Qzyf/jcc2yLenjI/nR
         Ktq1TvcnxtZpO1lnopk8bYRxVcQKqRaUjU9if53YbHyGp3qy2TGnwzyruT1AJoJNFl1s
         mAFQ9XkBhgMTfQPC5pz+9s9snVizvwqkWoRdSRKI33h+h+P/irJSttoLoVer+ONf+DFy
         ytqpWx5yL6VjZ8DYIWBXh5jYzgGDLCqLINrwSTzQ69TtP46E54lHWToPEDyRKYCzf4uA
         Cq66xw1+QmzrcdK3Sse/pTBZuRXoofE9q647ijaGQEeX/K28evb6oz0nCTCZJHKK81XP
         6cgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854768; x=1711459568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEOjV6AJZtNxCuHMhEml9OSDSgFvsq54cZ/lHYpo9oA=;
        b=SSK1gcehtYioJJlUq1BwD4WdZRs35sBkqb/YuFpazCYtWqeT5qjn/ct64kLs4qZEfa
         dfC2LT2k6t4kpxTxR4z6uThHnzLVD9thioTH1AadYswcoNh1E/P5H03nx85iV+mnem9W
         TK4daLKKmZv1XYrPkJl7lHVNSsxIQlod7AEIhNXL3UqNZPfGB7TxIU+fV2SBjQVU9nFP
         ei12jFTHRIfXn6alPTTTQqBr7q/6pe1DxEunP1duzOPq0Efprcl0I9x6gN0tsJy1w/K3
         f5Km3+hQ78j6uSm4oUHU2tcJLKngGEydGYKL09SEbDICbQo3QltB9+g7y0XSRu24fmtq
         cuCw==
X-Forwarded-Encrypted: i=1; AJvYcCV4pD6sr+v8RJ1VfwKrVpczW5v4Ii3V4XOBvqdnIZ6yQICG0TyzjOgEkeLLyueEfPEMEPPfpqXMtb3jCPfvenNXX6DfV/mTCUVp96NRWxhSMcufBUnB90yiMhYBnBpezkHZfReBJgnZccYJ/+2LG5boatWPH5F4YI1gl+6briZTboKPxw==
X-Gm-Message-State: AOJu0YzH3mIpAiTjQUYL5KjLuhdj2D8ezN1nNPhJPlJU6vfDdvsa9YpX
	zTwUNF8110nANTLQ+HuTAU25LGWZn75wqKiBJvvfDe0M2Stvp89N
X-Google-Smtp-Source: AGHT+IGhb4DPnIcwetsmnjlwEq6a03j52n4/F6VPdXGJpjtmE63SNwm9Z70GYrH3UiatbHtqGFWiyw==
X-Received: by 2002:adf:cf08:0:b0:33d:c657:6ae3 with SMTP id o8-20020adfcf08000000b0033dc6576ae3mr11982182wrj.7.1710854768345;
        Tue, 19 Mar 2024 06:26:08 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c11:2c6f:3ba9:bab])
        by smtp.gmail.com with ESMTPSA id g4-20020adfe404000000b0033dd2a7167fsm12370020wrm.29.2024.03.19.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:26:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/4] Add RIIC support for Renesas RZ/V2H SoC
Date: Tue, 19 Mar 2024 13:24:59 +0000
Message-Id: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add RIIC support for Renesas RZ/V2H(P) SoC.

v2->v3
- Included RB tags
- For riic_writeb() now passing val as second argument and 
  offset as third argument

v1->v2
- Dropped dt binding which update the comment.
- Used a const for V2H SoC instead of enum in items list
- Dropped internal review tags
- Renamed i2c read/write to riic_readb/riic_writeb
- Made riic as first parameter for riic_writeb
- Dropped family from struct riic_of_data
- Included RIIC_REG_END in enum list as flexible array member
  in a struct with no named members is not allowed

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: i2c: renesas,riic: Document R9A09G057 support
  i2c: riic: Introduce helper functions for I2C read/write operations
  i2c: riic: Pass register offsets and chip details as OF data
  i2c: riic: Add support for R9A09G057 SoC

 .../devicetree/bindings/i2c/renesas,riic.yaml |  19 +--
 drivers/i2c/busses/i2c-riic.c                 | 125 +++++++++++++-----
 2 files changed, 100 insertions(+), 44 deletions(-)

-- 
2.34.1



Return-Path: <linux-i2c+bounces-9043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B5A0B6D5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17E157A4948
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5569B22A4F7;
	Mon, 13 Jan 2025 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEmBGprq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DA1CAA76;
	Mon, 13 Jan 2025 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771218; cv=none; b=BTSmrCTE+zouMBgpnhDiTxEsUk0S5tZUvBUQbIsV4eq6esCxDfYvjTj9sippygPR3mPp7gnc+rdqXIa1wacVtgdKqljehxNng2RyU5H7eeU4F9PPNpU93Wr1iJTTwILwh2tTyJ3f7ZqEV4Fg+hLgUUuh+WB4fAoriDeOjRGGJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771218; c=relaxed/simple;
	bh=LIsg4krud41VsNzOgYH2aAkOUWt8UublmXdUAc6M/mM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1AT5gIOkm4RBQiRilyvd2HuH1S6xAUm/FNB58e2n/+nW0O1XSFUryeItwlPW5Q9+M92ExIvV6HxCM5hgpacxC94m+QCeazZ7buuUFTkJZXrPX9OSXe3Lgl2Nbx8itUW0WrefDTv2/EGzG5zT4+VCAiBo687cWL7dmMq7mDR3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEmBGprq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso40566075e9.0;
        Mon, 13 Jan 2025 04:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771215; x=1737376015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZgHyPddi9DJc5WEeaGd2GUDOZmGct63NUcayz4itBI=;
        b=EEmBGprqRU/U6fs1Nyeit1xb0bSrNJOID2E1wjszXmRS3lDWkXdZ1xbcDEvwPC2JUe
         ymQ7u80jMX9E1jZj4rTT51pj9MSQJyIP+G/l1dVNWiwloYOVAuxvKCLfnmJU+crpcKNi
         bvxzobzAgDtbv+r0IAbQIEcAeTD6QQLY3OsaD2hl/GfeyMbPUk9XNUzCUXTrBA7L//b5
         wt4ATf9S5ONoc3duNvEk56aztyih9ZI3oD8b7v4zUvE93KtbCenmMdUDhh5Cd2PeZQlI
         kx/DQAWnKYdojtVixEtOtDggpvMoRdYbqxWcH6kzLyCuVBrm/gYQU0mnTKRZ6orAI3R+
         B1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771215; x=1737376015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZgHyPddi9DJc5WEeaGd2GUDOZmGct63NUcayz4itBI=;
        b=krWjMhtQ315Dd6QnaiMJkK1r5M86pOja5b+lsNtO9iixtQKqs8DWrBhNlPCq4YAnou
         vOJBE8jFl0XufeUWB04uTyt4t3Ffw5+M7P+mnn2Ps4oYDStN4NSS3rqP0Ko5iE/zKVur
         89cp7UPqkl+4Gy1Y3nzPf1UY0E85+CEkS7/fG5p90Qkz3xci5IqI0jqSVi0h+DIhbSkU
         tWiq62KUcxAkhIlCy8FMqWDA7PLmNgiYTju8noRM5zuBQgA1XkbGE/FqtAP3iKrbEZ5b
         r7xLU0R0L/APMXO/yx9wA9KPrqrAjZP1tYC8PPM/Ebf/oMwqykiaiCXH1NMMG9dpPdVq
         UhNg==
X-Forwarded-Encrypted: i=1; AJvYcCVrH3jhg7kgcQi+6UNCuGupVH3h/IoxqDxtul5pnN/5wU13kjRix1HD+zPymaqEirvHfoxwliQOKtM=@vger.kernel.org, AJvYcCXTdt++7kzsFLywKpchS6/RaPLVQgKABx+fDU9bXrwn0JcAVqsogPlw+Obylf2Ix4CenWySvovrhoYdYcqn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3FsjXKj9XZc2T3+Yk/YYkue6ZoQmxd1EnUudN5aCMyWbRL1R
	IrCt4BrtuNf1DCRb8WNb6TdBq8tO15bP0VVSPjIIp574IredMCvh
X-Gm-Gg: ASbGnctO1/Tbuy+kyu6diRcYUymWyocUtPFOX31B9tjICxBfqWmFjdD9J5ZkMl9gZJ4
	el2F6otjowUdZeNINH34FMlbK0vyfGf17DRGtjrWTyDkkanm9rKiEIHoOAUJNwjK4tKPOedmp+I
	NupaMJEzwycv6zSVVogrAUtXIHBaA8rfTbtiMfTyZeuR1ccdPwVEvd0vCszWLxckINMCp9Cg2Kt
	AFFSIlT9ttdAF9EoH1/GwXMxIc5uDoFMEWp7FYEnJ0cCpIx8mASoIAo4BAAUsjI4+V6mpbsi3+y
	e00MBy/PSA==
X-Google-Smtp-Source: AGHT+IE/Y5UqAlwl5q6OqfJbbnnThD/sfuKBLwmcgh+JMxMLHhkEM4FI4R5Pm1WjJDn1au7iUsEDnQ==
X-Received: by 2002:a05:600c:46d5:b0:434:ffd7:6fd2 with SMTP id 5b1f17b1804b1-436e26aeb4fmr28173895e9.7.1736771214566;
        Mon, 13 Jan 2025 04:26:54 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:26:54 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 00/10] i2c: riic: Add support for I2C bus recovery, along with driver cleanup and improvements
Date: Mon, 13 Jan 2025 12:26:33 +0000
Message-ID: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series introduces support for I2C bus recovery in the RIIC
driver, which is utilized in RZ series SoCs. The addition of bus recovery
functionality enhances the reliability of the I2C interface by allowing it
to recover from error conditions that might leave the bus in an unusable
state.

Alongside the bus recovery implementation, the series includes several
cleanup and improvement patches that simplify and modernize the driver
code. These include replacing `dev_err` calls with `dev_err_probe`,
consistent usage of the `BIT` and `GENMASK` macros, leveraging devres
helpers for reset management, and improving code readability by marking
static data as `const`.

v5->v6
- Swicthed to use `linux/bits.h` in patch 4/10
- Dropped `linux/bits.h` in patch 5/10
- Swicthed to use `linux/time.h` in patch 8/10
- Included RB/TB tags
- Included I2C bus recovery patch

v4->v5
- Only patch 1/10 was sent out to ML

v3->v4
-> Created new patch 1/9
-> Dropped RB/TB tags from patch 8/9
-> Dropped `unsigned long` cast and updated the format specifier while
   printing bus frequency
-> Included required headers
-> Propogated the error

v1->v2
- Fixed review comments and collected RB tags from Geert

v1:
https://lore.kernel.org/all/20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (10):
  i2c: riic: Introduce a separate variable for IRQ
  i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
  i2c: riic: Use local `dev` pointer in `dev_err_probe()`
  i2c: riic: Use BIT macro consistently
  i2c: riic: Use GENMASK() macro for bitmask definitions
  i2c: riic: Make use of devres helper to request deasserted reset line
  i2c: riic: Mark riic_irqs array as const
  i2c: riic: Use predefined macro and simplify clock tick calculation
  i2c: riic: Add `riic_bus_barrier()` to check bus availability
  i2c: riic: Implement bus recovery

 drivers/i2c/busses/i2c-riic.c | 234 +++++++++++++++++++++++-----------
 1 file changed, 162 insertions(+), 72 deletions(-)

-- 
2.43.0



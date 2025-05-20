Return-Path: <linux-i2c+bounces-11074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59102ABE3ED
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1A797B3BFD
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E01027FD79;
	Tue, 20 May 2025 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNz9XylJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED025A645
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770253; cv=none; b=ZzKBVdx/8+SZDjB9EnTUDeL8xIsw1xPzCHe7ZzhmeKzYvNhOgvD4vneS076E6nVercDfYegmNR3svS6SQYjH2J2393XV5y5LqfPQtJ6AA8foQc5iIR+kyHhZ8b0xmTZulH84auW2n3W+DmT/Ie6rutgFt7Ni3HAfEfxHJTGlGQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770253; c=relaxed/simple;
	bh=xzyZwr8VXXZWTgyRzF+mah9q1aQvL1+gFL8ZJWMWZnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXJwnrcNbV0NIqnYU2tPz3nJ7FVEu3Jv3c6bkWdyV4xqfGgCBRQDcsW5fiQZ2KgiO48KdYJo/z6ArOAEMCEWsN4sqrP3E3bAowiEzl8x2b2Xz5OcLP1PqjZSCfUv498gicCc1ZGOIIBcYE4SP9qZTFE1zWTdqRUxbQA3EmYzOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNz9XylJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6019b564d0bso7164812a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770248; x=1748375048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9lG7wlzCX6TGAYBMFS4yglLxCj/ORFwZwVOjwkziv4=;
        b=iNz9XylJkyJ67UbjOr9qo+RPe249wVqU/h3585E92lzVXTXVinTMlnYEC5TjYk+kM3
         2Hz8a55EWDmfwtBrK6LYROHDLdCRyfFpIUcx471Az3T9Eb1hQ7v5Ygh/xkosZAPta1Qn
         VVcMx7Owsicai7gNf7JOmQfKSUwqq405ZMOdaiY9e8wBpRU3hTgIdLUOdA7NFLhHaOZ1
         R05lSVNsZ5czxAPA7f2pBmGa+j1/U6i4fVp8rLmj0vwXHEiYuh3iGAKes8ZO4kHlBEqo
         q0cHtU2F271P29CojX1D8T62Uq+cq/BY5ru0G8l8BIdBUCAyfbYvQrhJdRStwNBB4x39
         TthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770248; x=1748375048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9lG7wlzCX6TGAYBMFS4yglLxCj/ORFwZwVOjwkziv4=;
        b=bLfcjC7cf5tXyeCSXfiuTzpBe4mfY4o/yyC76GaDsm1e+UpBlMmbMuTxQqXqerYTM0
         9FGXCp6iwGnnKZ59ypjbCsZYd4t6LYx1wgehZm7L1rvXJd3pXd+wjlT8gIxgiyw4LOqH
         K++J2+2TtB/uBW9NjeS5v3IojqKQElKI2Gm1bgZuwA0+iR/KHpa8n1LI8w60G53ucMJh
         VL1BMfKOmnwnPGG46HshMrX8CAGXPm+SYR8YesD3R79FYdWWuB/72J0uk9VuBKBT/ilc
         DoDDCdhvO/MY6dJ32Pe5MH7q3JDUSLM1rlrfCX8FHvH/FRAJXt6UeKDLIW7ofDNaBtrM
         xxNQ==
X-Gm-Message-State: AOJu0Yz2FFMHNFLaxdm4PMIy3SHixw0TYcXKw1rhadhKHP9khYalRKCl
	N7X7B5BBXLPIaij3rOmMRldiWXKywvl8vIEic7uICgjWXOZFW6FvgSclLf3k0x+Tbx4=
X-Gm-Gg: ASbGncvk2E0Kz97hLVcdVGVnFYlgziaV6MkSM04ILypMAuOyMMabVcNAwnXVciKJUuU
	mABYzkC27HGNGTIiCxe7MEyw53jjLVVuVw5eVa80QUFp88eZbkANxXUKp2Jl+q1Dm9t+irsK/PS
	96B1jhF+9r0yRhdiBC2SHYMY34SJrw9m2H1lK8o/sIlajyb1tR1bolU3mCmZvYgQ9G/6YKhTNBp
	nN0U8WKZeRMGHxEmdRox7vO55LlXSwQ6ExLaAuA6CRW7UcynxNBD52L8gQNCkhz0kU+Vn1KSHgq
	dbVW6vipDYkhQEZNtZ8PfjiEiTertT7892CjSMy1nFCdLWSlIFaQMqBzEH0Hwcttyz6tP1Jf/0s
	Jiybwtw==
X-Google-Smtp-Source: AGHT+IGR8Bhra5RkmJI3kIf46rDOPsTHYLIn+kpAoJM8zxRi8LaWruVBwtoF57yUlurbGbcPD4H6fA==
X-Received: by 2002:a05:6402:348b:b0:601:834a:e678 with SMTP id 4fb4d7f45d1cf-601834ae764mr14793783a12.17.1747770248487;
        Tue, 20 May 2025 12:44:08 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:08 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 00/10] i2c: Replace dev_err() with dev_err_probe()
Date: Tue, 20 May 2025 21:43:50 +0200
Message-ID: <20250520194400.341079-1-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series replaces dev_err() with dev_err_probe() in the probe() 
functions of each module.
This simplifies the code and improves logs.

Enrico Zanda (10):
  i2c: tiny-usb: Replace dev_err() with dev_err_probe() in probe
    function
  i2c: tegra: Replace dev_err() with dev_err_probe() in probe function
  i2c: sun6i-p2wi: Replace dev_err() with dev_err_probe() in probe
    function
  i2c: stm32f7: Replace dev_err() with dev_err_probe() in probe function
  i2c: stm32f4: Replace dev_err() with dev_err_probe() in probe function
  i2c: stm32: Replace dev_err() with dev_err_probe() in probe function
  i2c: st: Replace dev_err() with dev_err_probe() in probe function
  i2c: sprd: Replace dev_err() with dev_err_probe() in probe function
  i2c: sis96x: Replace dev_err() with dev_err_probe() in probe function
  i2c: sis630: Replace dev_err() with dev_err_probe() in probe function

 drivers/i2c/busses/i2c-sis630.c     | 31 +++++-------
 drivers/i2c/busses/i2c-sis96x.c     | 30 +++++------
 drivers/i2c/busses/i2c-sprd.c       | 13 +++--
 drivers/i2c/busses/i2c-st.c         | 34 ++++++-------
 drivers/i2c/busses/i2c-stm32.c      |  4 +-
 drivers/i2c/busses/i2c-stm32f4.c    | 53 ++++++++------------
 drivers/i2c/busses/i2c-stm32f7.c    | 78 +++++++++++------------------
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++------------
 drivers/i2c/busses/i2c-tegra.c      | 12 ++---
 drivers/i2c/busses/i2c-tiny-usb.c   |  5 +-
 10 files changed, 127 insertions(+), 188 deletions(-)

-- 
2.43.0



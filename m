Return-Path: <linux-i2c+bounces-2853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA089F098
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABEE32846B0
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3209A15A491;
	Wed, 10 Apr 2024 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jT0Gk8bA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F561598EF
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748311; cv=none; b=rxacTyb/W3kAFZJwRm+pmFdJFeB1yrqnxO8CyqGi866b8W7M9ASX+G+pFDeksY9XB/YPnVrFxDH8Bo9hc4d53nTA2u2c/YKlKas5IRqru2omviJCR2Of9tvKjJwUMxWxB37ZUF9zwucNQQJFfCNImgLc98+njAXOVLXJovQKQHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748311; c=relaxed/simple;
	bh=/oCMXaEKV0wQv6hyJYOzYspxu2mEEpt92nD4lJq5TVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lH4kG/ZtRj0UpV/Pa+ausKWxSvb8YHoeLmH7ZjCzED0F7qLRwZJ37kOcw2n3wyt9k+vmFdNrhvyFz4P3O1kREHI4WcOKiEJJvRuOUpMpuO9yDBMMOsK4CfDC40czs7gEfPdM0/JlgcaL/O89qbyXxQHP9PIYgCZQTOQBnQc/B9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jT0Gk8bA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=RNanGQGWfzY8Ld
	dZN9BtmYbNVKTZHZwObn8fItBAqK8=; b=jT0Gk8bAMORCC3fi5dKtBczdT+SWtS
	Ur90S3Q1uouDlicdfEpBcNSLJfpzszbswwlEqlBkKEo/gJqZgyTYwNnT/l42kg1u
	jCKNParrdoy5IN5KtrND/ODxJjODWMBThyQKunrC8uL76dtK8cijYPbbgs6iM+X9
	oFSOW30Rsp/9ZLXlttGMTaO3E08kWFL0hNIfEIBjQBW2sZJeRUSQge0X2s3omTnq
	n5piJX/YYxgLyxigGcxQANsKl+wdagoI2ckzGc5M+DvPUuA1l9Tehh4xQfo48iZJ
	eKCIINO7NvQHjCrr8EVgyW1i2doKHn0NqksAVd/TzyZNURLygSmZfMGA==
Received: (qmail 521287 invoked from network); 10 Apr 2024 13:24:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:24:57 +0200
X-UD-Smtp-Session: l3s3148p1@pzTdSbwVgwhtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 00/18] i2c: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:14 +0200
Message-ID: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on another cleanup series, I stumbled over the fact that
some drivers print an error on I2C or SMBus related timeouts. This is
wrong because it may be an expected state. The client driver on top
knows this, so let's keep error handling on this level and remove the
prinouts from controller drivers.

Looking forward to comments,

   Wolfram


Wolfram Sang (18):
  i2c: at91-master: remove printout on handled timeouts
  i2c: bcm-iproc: remove printout on handled timeouts
  i2c: bcm2835: remove printout on handled timeouts
  i2c: cadence: remove printout on handled timeouts
  i2c: davinci: remove printout on handled timeouts
  i2c: i801: remove printout on handled timeouts
  i2c: img-scb: remove printout on handled timeouts
  i2c: ismt: remove printout on handled timeouts
  i2c: nomadik: remove printout on handled timeouts
  i2c: omap: remove printout on handled timeouts
  i2c: qcom-geni: remove printout on handled timeouts
  i2c: qup: remove printout on handled timeouts
  i2c: rk3x: remove printout on handled timeouts
  i2c: sh_mobile: remove printout on handled timeouts
  i2c: st: remove printout on handled timeouts
  i2c: tegra: remove printout on handled timeouts
  i2c: uniphier-f: remove printout on handled timeouts
  i2c: uniphier: remove printout on handled timeouts

 drivers/i2c/busses/i2c-at91-master.c | 1 -
 drivers/i2c/busses/i2c-bcm-iproc.c   | 2 --
 drivers/i2c/busses/i2c-bcm2835.c     | 1 -
 drivers/i2c/busses/i2c-cadence.c     | 2 --
 drivers/i2c/busses/i2c-davinci.c     | 1 -
 drivers/i2c/busses/i2c-i801.c        | 4 ++--
 drivers/i2c/busses/i2c-img-scb.c     | 5 +----
 drivers/i2c/busses/i2c-ismt.c        | 1 -
 drivers/i2c/busses/i2c-nomadik.c     | 7 ++-----
 drivers/i2c/busses/i2c-omap.c        | 1 -
 drivers/i2c/busses/i2c-qcom-geni.c   | 5 +----
 drivers/i2c/busses/i2c-qup.c         | 4 +---
 drivers/i2c/busses/i2c-rk3x.c        | 3 ---
 drivers/i2c/busses/i2c-sh_mobile.c   | 1 -
 drivers/i2c/busses/i2c-st.c          | 5 +----
 drivers/i2c/busses/i2c-tegra.c       | 2 --
 drivers/i2c/busses/i2c-uniphier-f.c  | 1 -
 drivers/i2c/busses/i2c-uniphier.c    | 4 +---
 18 files changed, 9 insertions(+), 41 deletions(-)

-- 
2.43.0



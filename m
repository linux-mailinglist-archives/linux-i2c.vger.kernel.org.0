Return-Path: <linux-i2c+bounces-12357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B38B2E182
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082BB1C226BE
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FA3322542;
	Wed, 20 Aug 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t61T6vXx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBEA31DD8D;
	Wed, 20 Aug 2025 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755704921; cv=none; b=HbfSn1z/0g4zkTUMRQ8yiDgnkQEkmunsSmHSSuRKHRU0ASE8irH86s6gKNZq6SyU0H5i+Itg0Dpxx8CEVomUG3QgDakigUH881H8yHCvIrwiMZ2UhCAzM1E5QaoBPNltjjM7uDsYh6OoqHxe8sjoVe0Z+yYMl2DyEdvZW8S/cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755704921; c=relaxed/simple;
	bh=NXbp/ComZ2cLCfbD91NKUWgSMDPMsuj7G64T2YMYbxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gr1u7q9VAzHrUhspuNV78jE6l5EhXa8BW+oVTZhc3FoLV6sMQkMR73ShsWQZ33yIF4/3IEsSIcsqaSNYos+G3QkMdTaZ5e1emFvGiSedVb7gxpubDzjQkqTI9/Fp7Tz9sDTF8eFBJ6W6yDEAApfvzWGup+ePYlv9ioMrtzl5QPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t61T6vXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E68C4CEE7;
	Wed, 20 Aug 2025 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755704920;
	bh=NXbp/ComZ2cLCfbD91NKUWgSMDPMsuj7G64T2YMYbxY=;
	h=From:To:Cc:Subject:Date:From;
	b=t61T6vXxYewSiEwJanRAPGxFsOCy2x8mPxeGePKXu23Qgi/ZqbMarZvBht0OuiReS
	 y5oFglIzi/LcebSpwUPCx3PFJoDMyUwyGIF049P/ZekPMrd7d70ViqkzQuCTb42klt
	 ltVSDPeNYfVLJfcez+0AFzWVsK6DuSx9qJaS5QfN//S0cloxVlhCyNsTHXhe0ihgys
	 7YZ7058TmVFGuPGj/8QkW+U49kOFIcM6oBj9qA3yJXJvvxEUBXkMMXGlvD0BVhkrUu
	 UXsAzgUWPVL+95GVnnsiRis6ROo01ZKw+l4XsOVNAh8jy+HIKD9fTS/bW79qrSrqig
	 xFDxwNHJ9y02Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/2] i2c: designware: Implement atomic transfer suppot
Date: Wed, 20 Aug 2025 23:31:23 +0800
Message-ID: <20250820153125.22002-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement atomic transfer support for designware i2c. This increases
complexity but is necessary for atomic I2C transfers required by some
hardware configurations, e.g., to trigger reboots on an external PMIC chip.

patch1 is bug fix
patch2 is the atomic transfer implementation patch.

Jisheng Zhang (2):
  i2c: designware: Avoid taking clk_prepare mutex in PM callbacks
  i2c: designware: Implement atomic transfer suppot

 drivers/i2c/busses/i2c-designware-common.c | 47 +++++++++----
 drivers/i2c/busses/i2c-designware-core.h   |  5 +-
 drivers/i2c/busses/i2c-designware-master.c | 80 +++++++++++++++++++---
 3 files changed, 106 insertions(+), 26 deletions(-)

-- 
2.50.1



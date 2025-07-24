Return-Path: <linux-i2c+bounces-12014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE64B0FEAF
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 04:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1CFC1C242DD
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 02:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D9419F424;
	Thu, 24 Jul 2025 02:14:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68B519CC3E;
	Thu, 24 Jul 2025 02:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753323287; cv=none; b=rTEzLRBa9DSV2BUuiINzwK4hjdYGxInYDFelRMGHauOdxGmDIy1nRgUenPbeaXE+rblAosR5gBRLRTojSxsvX5qVY7xtbLZaN+6UKz/4UMDfrtqDt6IlGRb1yJDTC52+fsMqSWbd4r3kekKCUm2NZKLMXDVmKcIAWvlWqkUdvvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753323287; c=relaxed/simple;
	bh=bRpOIuTv+KtGESnvWWr8CPS6zaymO0jHbaEWYHDAQhY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lHLkz9XrBN1HBOHxPIL+vrGGVSjW5rvreShEfXe/QHYREUt1PSSnXyzQkGkyBDD56TleGxzPXEF5kmilHkwwquft5o+3EHLFGTFpCNrMrt6v+pYd6g1zKHXOL5E0jnzErRnP/dPzhes9hBvI9xJx/hMWHsqYp6akTUrSPuDWpgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 24 Jul 2025 11:13:34 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id D9B2C2069FF1;
	Thu, 24 Jul 2025 11:13:34 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Thu, 24 Jul 2025 11:13:34 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id CC16B1C5A;
	Thu, 24 Jul 2025 11:13:33 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Kohei Ito <ito.kohei@socionext.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/2] i2c: designware: Fixes clock issues with platform driver
Date: Thu, 24 Jul 2025 11:13:15 +0900
Message-Id: <20250724021317.2116943-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two clock issues with i2c-designware-platdrv driver.

The first is that the clocks aren't disabled when the driver exits if
CONFIG_PM=n, the other is that the clocks aren't disabled when the probe
function fails.

Kunihiko Hayashi (2):
  i2c: designware: Fix clock issue when PM is disabled
  i2c: designware: Add disabling clocks when probe fails

 drivers/i2c/busses/i2c-designware-platdrv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1



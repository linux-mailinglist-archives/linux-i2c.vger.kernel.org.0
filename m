Return-Path: <linux-i2c+bounces-12020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBBBB0FF82
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 06:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC345586D2E
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 04:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C461F0E56;
	Thu, 24 Jul 2025 04:22:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557148F4A;
	Thu, 24 Jul 2025 04:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753330940; cv=none; b=Ni3CBB+AwMp6s4z75Pf4heypMIC4BeAhXwQ4oIWGvDyFK7tFAR0ie2il0hszCWeZVMHUw+ZvhbR0nw2erFj61isZGhgaRchRmGxlOa2osqQoT01uFZlPtJe427pNchZHamoevBb4IQPVvixrIBTbGHPWtmvf7ozFuX/aEV8ls0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753330940; c=relaxed/simple;
	bh=ILrb1XQg7C0Fk2p2CkffUt5IbF5dMg/YTbFW7sSn2Ps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l3xX+PA9xln1psjBWgqNuU20tVLSO7wmP4k9RtW+0j80NteUhze/APyYpeiaxr46gLTecYlzfSzwGpCuov8hDsAElpq0ETmBtyt/5KnUQIhyBvFhJ+2FjCM0m1QugkWG6Em28wV9cb3rovelk/UjD3bJAmfatMIDLXMAAFku520=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 24 Jul 2025 13:22:15 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 937E22069FF1;
	Thu, 24 Jul 2025 13:22:15 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Thu, 24 Jul 2025 13:22:15 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 0EC211C5A;
	Thu, 24 Jul 2025 13:22:15 +0900 (JST)
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
Subject: [PATCH v2 0/2] i2c: designware: Fixes clock issues with platform driver
Date: Thu, 24 Jul 2025 13:22:09 +0900
Message-Id: <20250724042211.2160339-1-hayashi.kunihiko@socionext.com>
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

Changes since v1:
- Fix the description about pm_runtime_put_noidle()

Kunihiko Hayashi (2):
  i2c: designware: Fix clock issue when PM is disabled
  i2c: designware: Add disabling clocks when probe fails

 drivers/i2c/busses/i2c-designware-platdrv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1



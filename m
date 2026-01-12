Return-Path: <linux-i2c+bounces-15057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2739ED12E82
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375CD3023D41
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB7135B14C;
	Mon, 12 Jan 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKguUDeO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A03164B5;
	Mon, 12 Jan 2026 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225753; cv=none; b=aFwiRew+cJRw9xatQ3Uw0iSUXV26Jxo6DLTK3X41ZNtLWeOOQwiSzJwJ3uPkTgdBZbPVGG2lnUJo39fzsrgyWoMO/IiwfvgRdxS1uUoLCgNsw/4S2SEI/GUgSM79aIXWV9B7tf76MqefEEUcmmjao/yd69zMql84Lzz8B2eg1tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225753; c=relaxed/simple;
	bh=stoeaFvLKGGn0uhn85r/nzgAeuADmULIQT05Vn4VYoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DcmnHmz/9H9QzYbnCG3A0RGLSmMgzVVSG00udHFEE/fRKe5P6u60E5IaidzZ2qiu81Zx0tGIdolxAVutZ/fbtrLM50nad/XFbbtfPIC3ZcD5tVBMg6Xu1ZB80QRqqGNQSqTP72J+0vYl8kIvf+zYRz69PXB69AAqtk8lShoff4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKguUDeO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225753; x=1799761753;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=stoeaFvLKGGn0uhn85r/nzgAeuADmULIQT05Vn4VYoE=;
  b=IKguUDeOmK8pp3c8chlbjgqrQcixkcWDWt0XKUuP4awKqlonv5JLv90M
   vT/CUlotJ83W1gpHWDz2gyo43jyl2NYBMB79zQYtr44IuN7JTm8pqCQ15
   peij4gJiW4LjZZTdEvVoyIA/hni+Y/VH8U9oKnIA8b649RfvO4e84kVIS
   lM80j15UGTGw9Vi/VpUK+sg0lS4sfLzAR8gksP3DYC3BZnGCVCylk1kAC
   L727d1ftoK16+/cll5JaiBJLRpJuAUXV7AhraYNHvJld+Nv9jJPSiowKl
   wo1SpxCt1us3doTGZdn4fifFhGtS9pvzpHk1M0+hwNzUeD2m3bbq9hWRX
   w==;
X-CSE-ConnectionGUID: jl+19WsRR32I3hy643il8g==
X-CSE-MsgGUID: 5rsqfGkpQauxbUEqiI4pvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048279"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048279"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: 3psanrVbTtGgoavkyMUQUw==
X-CSE-MsgGUID: g0E+JuNQRYarjdD7ueGt/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618611"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B08B598; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi@smida.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Date: Mon, 12 Jan 2026 14:46:08 +0100
Message-ID: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few drivers for I²C host controllers use HZ_PER_GHZ in numeric form.
This is less readable and prone to subtle mistakes. Instead, introduce
a well defined constant and use it in the drivers. No functional change
implied except one case where 64-bit division replaced with 32-bit one.

Andy Shevchenko (7):
  units: Add HZ_PER_GHZ
  i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
  i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
  i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
  i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
  i2c: st: Use HZ_PER_GHZ constant instead of plain number
  i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number

 drivers/i2c/busses/i2c-mlxbf.c     |  5 ++---
 drivers/i2c/busses/i2c-mt65xx.c    | 11 ++++++-----
 drivers/i2c/busses/i2c-nomadik.c   |  7 ++++---
 drivers/i2c/busses/i2c-rk3x.c      | 12 ++++++------
 drivers/i2c/busses/i2c-st.c        |  3 ++-
 drivers/i2c/busses/i2c-synquacer.c |  3 ++-
 include/linux/units.h              |  3 +++
 7 files changed, 25 insertions(+), 19 deletions(-)

-- 
2.50.1



Return-Path: <linux-i2c+bounces-9388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029AA32BB3
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406033A7E6D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEAB254B0F;
	Wed, 12 Feb 2025 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RreI3u+A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F53398A;
	Wed, 12 Feb 2025 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378049; cv=none; b=DGuFG/ZJ2mcRACwEsIgSGwFeyb3Bg8HM326csYFoBD3bPDX2EasZQKvCi26mQo0nIBrla/8kAlo5mYmxMfkTBHPtrNz8z8kP9fj8EyM4bwtnxzpbOq8RiCs+Svj9yL9VIARzYQphssKkj01pyjuep16a41PxrZPB9NG624Y6qU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378049; c=relaxed/simple;
	bh=kCFQDLNfPixVyUh7+fi7hXH2lVNVmZoD/srcHAu/zkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuqV+GnOjq5oZTNIAbKUvLWB7Zt7cfBLlgdD85eXsDT4r2oh0+SGBZnpydDHubOKBImEEde+Mj2BmWROkdWTIkTyIBAteQca6O1E4xvnisDf2NrNoVX5PDBKLegBu2ko5PXq4vyZGuwkXnjDJw3iGbNcTufrHPm7ZOlTZr1cpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RreI3u+A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378049; x=1770914049;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kCFQDLNfPixVyUh7+fi7hXH2lVNVmZoD/srcHAu/zkY=;
  b=RreI3u+AbcacJ7/p1ziYDTxcufSXFMnnA8hf9JVrWO0lKhh7n74f8X2D
   kBNOBaxYX4mfrC90xbusLlyBVvu0rfdsHfBT7pGySMfyRte/vNBwRopWT
   2nR+2oplo2GJIKqNzi8PboLBcd0neMZMlglf/h59EWH34vCblWT7NlH0N
   RWDJwczfofdv8gHYyC0dxgc4YRq4iciwSmkeM/6uvTEKebT5ihRpzJo4j
   JUH20B5xapnHI/M0HvoOkPWYKQ6I55J54N5QQ2f43pSlnzydv9z0LYChf
   MEWSDu4MziCFpKMsSiSv8q1qlApXyoMpJFW1v7JCUftcvkW1jfjLEQCQa
   g==;
X-CSE-ConnectionGUID: NHqBuaBjSfqcdLA8fZeUPg==
X-CSE-MsgGUID: qIQKqpmUS7qIstJa0NjtKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032331"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: irz/hdSsQPyHAJdCuCCBCA==
X-CSE-MsgGUID: lO25qOasSlKvhSxXSqtPRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879143"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8E55F11E; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v1 0/8] i2c: busses: Introduce and use i2c_10bit_addr_from_msg()
Date: Wed, 12 Feb 2025 18:32:25 +0200
Message-ID: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For 8-bit addresses we have a helper function, define similar one
for 10-bit addresses and use it in the drivers. It allows to remove
some boilerplate code.

Andy Shevchenko (8):
  i2c: Introduce i2c_10bit_addr_from_msg()
  i2c: axxia: Use i2c_10bit_addr_from_msg() helper
  i2c: bcm-kona: Use i2c_10bit_addr_from_msg() helper
  i2c: eg20t: Use i2c_10bit_addr_from_msg() helper
  i2c: kempld: Use i2c_10bit_addr_from_msg() helper
  i2c: mt7621: Use i2c_10bit_addr_from_msg() helper
  i2c: mv64xxx: Use i2c_*bit_addr_from_msg() helpers
  i2c: rzv2m: Use i2c_10bit_addr_from_msg() helper

 drivers/i2c/busses/i2c-axxia.c    | 19 ++-----------------
 drivers/i2c/busses/i2c-bcm-kona.c |  9 ++++-----
 drivers/i2c/busses/i2c-eg20t.c    | 28 +++++-----------------------
 drivers/i2c/busses/i2c-kempld.c   |  4 +---
 drivers/i2c/busses/i2c-mt7621.c   |  4 +---
 drivers/i2c/busses/i2c-mv64xxx.c  | 10 ++--------
 drivers/i2c/busses/i2c-rzv2m.c    | 10 +++-------
 include/linux/i2c.h               | 10 ++++++++++
 8 files changed, 28 insertions(+), 66 deletions(-)

-- 
2.45.1.3035.g276e886db78b



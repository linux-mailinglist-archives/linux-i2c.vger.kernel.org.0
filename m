Return-Path: <linux-i2c+bounces-11726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D780AEF850
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C2924A7729
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67CD2749FA;
	Tue,  1 Jul 2025 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdC+pYzl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0781C26FA4C;
	Tue,  1 Jul 2025 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372589; cv=none; b=Sv58fHzcQoeFw0SCWoxLjxjxCfBuQfMlTtlf1/xcrWIxlwifFhRyDEY4ewupfhB8qz2Z4F4l4jW9134pBDTYhmaOCDCjTFk2ijH8Mi9xLcVH51ZG9XvCo88KgtfqC4ZVVOw8HKw5u/92KI4OxXXAQgJQZXzwoXp7woJohfBFnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372589; c=relaxed/simple;
	bh=B8nM8TPoVz+h8Y2qRsuyZ3hEtOKHl0HTxWPrOMZ2ExY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPcCzHODcBKEV78c/woYYWxlKuZZXpP95/gkFkFZFEnok/71iWuG/TClJciWkY0LrlnBklBY+F39XeZSfmEu9oSccsxXQzTBs8RoMFMwz9qarfXZaccLQ8rIgUKQC/AJ1u0BnXnzym1hWUvMcwZSyQY+X8aHQIqVjLPDN9y1Gfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdC+pYzl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751372588; x=1782908588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B8nM8TPoVz+h8Y2qRsuyZ3hEtOKHl0HTxWPrOMZ2ExY=;
  b=ZdC+pYzlZIJbub1IASt9MWtj3WyI5+reu64pvbhoaxXruagWhlkzwNA6
   bV1K71nNHzXM/7gi02D6Xgscg3RoJX2M1rL8eVOkVW8NJw9Wn1n4sHgZw
   WdY5psEEbDrR42zdPdGuo8RmkifFWB8eWIFuZus5UJUc4bwa/kSa3+NbX
   oU8XlG+NeXmkTw2ZZ3iOQILnYtYt/Gu3ePmYyKPa2LWLpgzCbCzSr6lqP
   jArWAYpUzmVeYJLeD7DQQ0WSEmCy42iGkPf7q7DDeCLem9G+tt+vylism
   77R4ag2KZ+gduco/M7SxkLkCpXQTqy6iD+b3RyPM3PoKMV5GgO+CvDjfP
   Q==;
X-CSE-ConnectionGUID: 4b7wfKldRYOV4cIfuUu7iA==
X-CSE-MsgGUID: kEtz4XIMSTyMyzFYjBEhmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196720"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71196720"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:23:08 -0700
X-CSE-ConnectionGUID: f/p+ABNrTcaWeepzstRjaQ==
X-CSE-MsgGUID: zT61w1LWTEGjxH55HuIb/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153157435"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:23:03 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/5] i2c: designware: Add quirk for Intel Xe
Date: Tue,  1 Jul 2025 15:22:49 +0300
Message-ID: <20250701122252.2590230-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regmap is coming from the parent also in case of Xe
GPUs. Reusing the Wangxun quirk for that.

Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3104f52e32be..a35e4c64a1d4 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -101,7 +101,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 }
 #endif
 
-static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
+static int dw_i2c_get_parent_regmap(struct dw_i2c_dev *dev)
 {
 	dev->map = dev_get_regmap(dev->dev->parent, NULL);
 	if (!dev->map)
@@ -123,12 +123,15 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	int ret;
 
+	if (device_is_compatible(dev->dev, "intel,xe-i2c"))
+		return dw_i2c_get_parent_regmap(dev);
+
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_BAIKAL_BT1:
 		ret = bt1_i2c_request_regs(dev);
 		break;
 	case MODEL_WANGXUN_SP:
-		ret = txgbe_i2c_request_regs(dev);
+		ret = dw_i2c_get_parent_regmap(dev);
 		break;
 	default:
 		dev->base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.47.2



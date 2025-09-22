Return-Path: <linux-i2c+bounces-13081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E49FBB910C0
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A462116B17F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 12:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6209030649F;
	Mon, 22 Sep 2025 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caa3iYx+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4823E32D;
	Mon, 22 Sep 2025 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542801; cv=none; b=dszvybseCf10BeD+rZJFoJ0+b/UBtooKOglJNL3EpeTR7B1ry+EM2yrp72a6Lzak2zSWCft7htqhANbYWYM65DWhAmEO62CXCbyCCAXVfjb6d/+CjmLtitSPk+CB5UbxhO/++vMZpUOZnGpqBzyC04A85kMRKWPZkFJq9EJB/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542801; c=relaxed/simple;
	bh=Q3oUiXEjXlddWlunbToYrjeVXr+xskvH+ciSB2ZkJtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jR4nljfgZsaZQU9xj4DP/AIVPCEIziN5NzyQdbriS+I7QAACZCpW3vKN+mM/m8vKdvnlV7T2H07YDuHPtwNPON+rcUuU6yCJ3inODkboTstfXf+GCHAL/gRM6SnksfcW1sDoArLm9RzjvYFbh5IiuPj2EIOQNZL14aaj57H5Ki4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caa3iYx+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758542799; x=1790078799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q3oUiXEjXlddWlunbToYrjeVXr+xskvH+ciSB2ZkJtY=;
  b=caa3iYx+q5puRpa1TywEFCRtFTBou8Yx3mBYgLPRU8eecgHVdoGajiWz
   IPYq9ofkNPd7jc9+NcOzzxOOFIfoxBHXJ9nvDoj9Av40Ph9larF/THYoP
   8pY2PIVFIiC0I6JgSmbYqicuIuTGUE/49PmEKNDAWl4hIjFpdJzBw5oRp
   j7bTgEFbfF6fLIeVuUVYbW+BUUZMBQANT2P5L2uUSJLJCnZjwtdvmyJsR
   eTy68nE7Uly1F+05XXXkVP/OCWkO13/IWx2l1b4C0Cj2/NFQxYqrNGCf/
   nR8BXxDCtg9d9hsj/Y72DpaSDFx7W/mTllRUt+0LxV5VUSws7ygaQSPUu
   g==;
X-CSE-ConnectionGUID: KX15+ghVS52OKphDjWDQkA==
X-CSE-MsgGUID: nYwjXjP6S7Cu7gB7gRo41A==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="63431622"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="63431622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:38 -0700
X-CSE-ConnectionGUID: QgomdRsyT5WbvDWWQI053A==
X-CSE-MsgGUID: p+NL8KKBTV+tpYordBi4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176842510"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F3498121EEF;
	Mon, 22 Sep 2025 15:06:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v0fJQ-000000002jE-47AW;
	Mon, 22 Sep 2025 15:06:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 4/5] spi: ljca: Remove Wentong's e-mail address
Date: Mon, 22 Sep 2025 15:06:31 +0300
Message-ID: <20250922120632.10460-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wentong's e-mail address no longer works, remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/spi/spi-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
index 2cab79ad2b98..3f412cf8f1cd 100644
--- a/drivers/spi/spi-ljca.c
+++ b/drivers/spi/spi-ljca.c
@@ -289,7 +289,7 @@ static struct auxiliary_driver ljca_spi_driver = {
 };
 module_auxiliary_driver(ljca_spi_driver);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-SPI driver");
-- 
2.47.3



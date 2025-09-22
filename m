Return-Path: <linux-i2c+bounces-13082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC99B910D3
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE2997B0A41
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 12:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9952307AF5;
	Mon, 22 Sep 2025 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLKf3yi5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F202306482;
	Mon, 22 Sep 2025 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542803; cv=none; b=QGHSQ3FrHfDDVirHrurAEkGcukohcJgb1pakJBmYapwHT55ua9TgoijiGR1a4TnNQpGOajta1EkFubD/pyjRcqJCSOkriGCIVnm0AsH/TbWokVR0A4fiVqdlUBl6QifS0PhT6wx2ER/dAKMRM/f52ks1E85io0KlqQW3bO7RY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542803; c=relaxed/simple;
	bh=9zh0rWyRasPTKX6C/jp7BoJyZWBGuh3aHojR6LfaIt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UN92rgw0enMGn/uXm1YiySFcGzxVr8PPLME/8KmpyEFPnT5OYOYR9DzJG8hFeuqoWsW/CDRINeQm9y2ALSwqZM9+bSXdtvWrITAUUoTW7UwYz8avsooTe1gNdRK85AEbCIY1zLLkGhgvIecJzvaj1zRmTsSWH9CL74CR1jP06hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLKf3yi5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758542801; x=1790078801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9zh0rWyRasPTKX6C/jp7BoJyZWBGuh3aHojR6LfaIt8=;
  b=jLKf3yi5hHcfxeRXLeriQsRK119fwhVEpkR0WpIJ0CdDcqa/TGr86hes
   HVBl9niW/J529PXZkdFU3ZdJtNrg65AmxCNbQM4w3WK8RgLkMsoV0TjYu
   8fZRDQqNl1qmSbcHInbW2ARGY0//Xcvj4seNkB+K8cKg0IgZaXBdiHrMd
   kVM0DIHZ8goZbFMRjD/ObiE/gG6qpHFtBSIuzFDX64bY9vnrNuhmhflte
   f1DV2UmLdqqZAIsxJB5E52w1S5BdCYhkDpEhAzV7GSCAKH2vciR4Wdry1
   UI6DyJZtr1dZyeQaqIxetorX39wHhdXuAYZgboPz3EFU6+x7FhHcKtc4j
   Q==;
X-CSE-ConnectionGUID: AYeNcWlWQm2V/OoC2fkeig==
X-CSE-MsgGUID: 1WvLsTVRSumJZ2PvAP986g==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="63431632"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="63431632"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:38 -0700
X-CSE-ConnectionGUID: WRiWyYRASwGQlvt4sfJpeg==
X-CSE-MsgGUID: jrEZcGlYSeiQEthkhXb/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176842511"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EEE46121EE6;
	Mon, 22 Sep 2025 15:06:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v0fJQ-000000002j9-42K2;
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
Subject: [PATCH 3/5] i2c: ljca: Remove Wentong's e-mail address
Date: Mon, 22 Sep 2025 15:06:30 +0300
Message-ID: <20250922120632.10460-3-sakari.ailus@linux.intel.com>
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
 drivers/i2c/busses/i2c-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
index 93274f0c2d72..f82336cd1ba8 100644
--- a/drivers/i2c/busses/i2c-ljca.c
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -335,7 +335,7 @@ static struct auxiliary_driver ljca_i2c_driver = {
 };
 module_auxiliary_driver(ljca_i2c_driver);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-I2C driver");
-- 
2.47.3



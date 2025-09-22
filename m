Return-Path: <linux-i2c+bounces-13084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCBB910F4
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9875423F8E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 12:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5E13093C3;
	Mon, 22 Sep 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PktqaVbE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3169307AE4;
	Mon, 22 Sep 2025 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542805; cv=none; b=Ydjs2d+iDXJor77Y74rT789DxaKygofcd8UrXxz2BFy4cQHU4npJXjEcQDQd7kSS4FgqVv1D6L4YAbzdx+Kao+Sc/WFu8yHpFds5IRgf4xBC2hFo66OeSv/Rxh3O5IIIxFKWPxu165XQFqIShvVSUyx1dre2NB3BBiIK6IqdRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542805; c=relaxed/simple;
	bh=VuCVBl2LOK3dmjETlcQ69S/BR/HJMff/yaQO6P0b4Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htsuJIPHYWU6w9doAwq97dT+YlOFMtR8iv0BbFV5U7Y6s9ymUBghMobSdzBUXpP3OOeuDywNtVGRVCpHLYsQXlhAdNz+WgfXsDlfzofsyRyK+pXJaL6iISXrt03F2jyhWOUjJSyqztm1Tx+liR5qc8cSYBq0CLpE2G/cP/HOBFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PktqaVbE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758542804; x=1790078804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VuCVBl2LOK3dmjETlcQ69S/BR/HJMff/yaQO6P0b4Hs=;
  b=PktqaVbEdzPZOZsIJx/M+vJOk2IVFN837dd9AiY9GZKfzOiT9VvN9xsM
   S34jz/6GBq1oOXEUcIRzdtS4UJRHDRteTUxi7tl0Rz+TBgJ0wlg/AZ6dk
   EP+j+t+k3sHeNjPM9xIrKR/L0OxvJuAFWCG1NAvMMhKI+sXkvIHB6sCOy
   R8SNsObSt3uMQosWC0oZHp8URQNboUPuZFTZWKPlYtOuZplPpHZRe091p
   lleqHkyGqQX2rrfzsU+qb6UskF1P55/GixVY46M9lPZHtWE3p94tof5a5
   I92s/Xk2TjViI/pRMWWYABoIxaerLBIgy4ZbUh7wWzGq4JGTuFVc98yFx
   A==;
X-CSE-ConnectionGUID: tIklTPb5TpagiOtGcrrtGQ==
X-CSE-MsgGUID: x0sUZJ0sQ+ey0Yd+koexYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="63431649"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="63431649"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:38 -0700
X-CSE-ConnectionGUID: qcsvOJdZQQmzKYZS0r+/KA==
X-CSE-MsgGUID: AThBYUCDQ02F7xbis3RfRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176842514"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EC3E3121EE5;
	Mon, 22 Sep 2025 15:06:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v0fJQ-000000002j5-3ymo;
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
Subject: [PATCH 2/5] gpio: ljca: Remove Wentong's e-mail address
Date: Mon, 22 Sep 2025 15:06:29 +0300
Message-ID: <20250922120632.10460-2-sakari.ailus@linux.intel.com>
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
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 3b4f8830c741..050278362fe3 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -492,7 +492,7 @@ static struct auxiliary_driver ljca_gpio_driver = {
 };
 module_auxiliary_driver(ljca_gpio_driver);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-GPIO driver");
-- 
2.47.3



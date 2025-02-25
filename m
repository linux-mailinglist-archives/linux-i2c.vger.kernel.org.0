Return-Path: <linux-i2c+bounces-9561-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55BA43AF9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2B0189B167
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 10:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576C02676F1;
	Tue, 25 Feb 2025 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKNB8Png"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F562676DD;
	Tue, 25 Feb 2025 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478128; cv=none; b=JYc+LfNoryB7uz5gR9B3AMBivi3fMzA2AAn1HxgR5dpS2QT9DSy/GxS14rsFyrRf7CCz0MjQ2eWxwy8uFFwAlcCFLEuddnEvA98YfDuuFWZIXKDXZwIwpFi4fmJa7cHgLtLqnKAfUU0AO20V3iHA4oJZcYpv94EhMRE6PlWSCm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478128; c=relaxed/simple;
	bh=l9XLwv4osBHZc9D2T06YPb1/+ow7cIVjbbDxLsoZ+sY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqRuNz98Yn5ChFnv8E3I4A7z60da7OMwTy9OgzSj/5DkDFRJ/9aVWIgKoQ9R31aG6wea+DaA3Wlult5y9O6NKHti2wERnkljL7mKhKHsgEOLsaO4M2jwzjfMMEmllzl4qZYF5PsM6y2GjOukvN0xDf1mhbWpRkh3EyfhgX/hYSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKNB8Png; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740478127; x=1772014127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l9XLwv4osBHZc9D2T06YPb1/+ow7cIVjbbDxLsoZ+sY=;
  b=SKNB8PngJ1ONuBj2KkNNRE0SrS8dAKL8H+u3wMx/Ps2GEPDXjsMRscD2
   I7dYwmxyoyCIzUtnsB3n4KjFwXU8kbQCTocn9x3sP+wPR9UPRoEhNWOJX
   dScDlp3sYl2lBopl0p7PtOc6ZstTq0+dPoAUgWPKxFtne6U271r1NSm6e
   4JS2eWvQBM3AIty4HA2NbWemyRDfDVeDgWZBiqGVaO9SLUgKLjSMjpDfJ
   nsTyL2A7D6yMdGSXtXqKmm5iVAEpEVSAIeOhs0ZVI5pe/rwntcHEF7pqd
   Kko/zoGDofPK6vhRj0TbMxLbGi02scLC26HTtf7BQpPaYTyinWc1tQq0l
   A==;
X-CSE-ConnectionGUID: pco1lQbSSE2Ns7ip47PdXw==
X-CSE-MsgGUID: yGZIBpUAQniYABAGu8zx3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45185905"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="45185905"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:08:44 -0800
X-CSE-ConnectionGUID: 1ig2khgGT2K/r/2Sxb+l8Q==
X-CSE-MsgGUID: hsr71SSdSrOHDcxaV6bJLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121590047"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 25 Feb 2025 02:08:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 66B8244D; Tue, 25 Feb 2025 12:08:40 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
Date: Tue, 25 Feb 2025 12:08:38 +0200
Message-ID: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These result in a very small reduction in driver size, but at the cost
of more complex build and slightly harder to read code. In the case of
of_match_ptr() it also prevents use of PRP0001 ACPI based identification.
In this particular case we have a valid ACPI/PNP ID that should be used
in preference to PRP0001 but doesn't mean we should prevent that route.

With this done, drop unneeded of*.h inclusions and __maybe_unused markers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/misc/eeprom/at24.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 0a7c7f29406c..f721825199ce 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -18,8 +18,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -252,7 +250,7 @@ static const struct i2c_device_id at24_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, at24_ids);
 
-static const struct of_device_id __maybe_unused at24_of_match[] = {
+static const struct of_device_id at24_of_match[] = {
 	{ .compatible = "atmel,24c00",		.data = &at24_data_24c00 },
 	{ .compatible = "atmel,24c01",		.data = &at24_data_24c01 },
 	{ .compatible = "atmel,24cs01",		.data = &at24_data_24cs01 },
@@ -286,7 +284,7 @@ static const struct of_device_id __maybe_unused at24_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, at24_of_match);
 
-static const struct acpi_device_id __maybe_unused at24_acpi_ids[] = {
+static const struct acpi_device_id at24_acpi_ids[] = {
 	{ "INT3499",	(kernel_ulong_t)&at24_data_INT3499 },
 	{ "TPF0001",	(kernel_ulong_t)&at24_data_24c1024 },
 	{ /* END OF LIST */ }
@@ -848,8 +846,8 @@ static struct i2c_driver at24_driver = {
 	.driver = {
 		.name = "at24",
 		.pm = &at24_pm_ops,
-		.of_match_table = of_match_ptr(at24_of_match),
-		.acpi_match_table = ACPI_PTR(at24_acpi_ids),
+		.of_match_table = at24_of_match,
+		.acpi_match_table = at24_acpi_ids,
 	},
 	.probe = at24_probe,
 	.remove = at24_remove,
-- 
2.45.1.3035.g276e886db78b



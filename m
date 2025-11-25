Return-Path: <linux-i2c+bounces-14256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C39C8447C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 10:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65B83A3D67
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 09:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C9A2ED175;
	Tue, 25 Nov 2025 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMW/V/Cq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BF52EBDD6;
	Tue, 25 Nov 2025 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063777; cv=none; b=Uq+U+TuM9xlCzaRp9oMxuoXT759hwWS+0Ai4BaJOq/jX04ltqFrStEbtk2PLp2Oy0mWCsV8CKTv5zz5g2XUjdhZmxM0BsCyzUwCicPyFgutjcQlbYLb90I44nMN87bV7idJA1QCdmH59CdNKMQRvz98FKLmJOVZRFSLerb6SnnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063777; c=relaxed/simple;
	bh=Gju/dFnRzvm4iY2t68zkigNFmc+ahpsVmbBv4g2AinY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2edxyoquYgoB7MnmA87wxr/xy7ENo49U7RLqgMNbEvsZb1Ub9jxmBMafueuhReCX7dPGbrAGETsfFzwbs/Q+RASH1TNDcGxCD7/hh1NCAJ4wkEKYCvqtIMCo/Oo9FwC0FtRDhu274lENWZ+l/9c6mXNy19nz+g7YqOWP9bEneY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMW/V/Cq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764063776; x=1795599776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gju/dFnRzvm4iY2t68zkigNFmc+ahpsVmbBv4g2AinY=;
  b=FMW/V/CqDUfRmoREglGvN1GQye4jZqg2Yt+ZJITqKrjrX6mqjPXwrqYA
   MdbA2OYVmM5QTXAscWkYFYdWGJf//B7N6DMWf/oXSlGTt+g19J2byT0HB
   qvwrt1aBlJlg+6mhbA3lfuL77ebQ2+GtKpJhAapj2W2prlmgzmzTtT/Fj
   E54MJxzOc+CctlpYGwqq5YaelUQJhATwBlDGJaOY0KWSgbUja4iufp+P7
   gH4HeyYzI7EJ/TmQxTInzpSO4vYwm4RLdO6dbO7BgIY0zVOcgKWjpGfwT
   8/pSjXQA/gG2khXO2VVX2pWqwHJoeDjwK7auXNcAY0ouPd5K/O3gSnviL
   Q==;
X-CSE-ConnectionGUID: 8wVWHGsXTo+3kBJ8+UM9Jg==
X-CSE-MsgGUID: hWYXHji5SkW++g9PBqG2nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65966499"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65966499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:42:54 -0800
X-CSE-ConnectionGUID: 8qY/gF97RQaFXwC8qMIeQQ==
X-CSE-MsgGUID: ItoS9CfLS2qCRN8vsNG5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="196760046"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2025 01:42:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 46FBFA2; Tue, 25 Nov 2025 10:42:51 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v1 2/2] platform/x86: serial-multi-instantiate: Remove duplicate check
Date: Tue, 25 Nov 2025 10:40:12 +0100
Message-ID: <20251125094249.1627498-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com>
References: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since i2c_acpi_client_count() stopped returning 0 and instead
uses -ENOENT, remove the duplicated check in smi_i2c_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index db030b0f176a..3f6f5d51442c 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -198,9 +198,6 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
 	ret = i2c_acpi_client_count(adev);
 	if (ret < 0)
 		return ret;
-	if (!ret)
-		return -ENOENT;
-
 	count = ret;
 
 	smi->i2c_devs = devm_kcalloc(dev, count, sizeof(*smi->i2c_devs), GFP_KERNEL);
-- 
2.50.1



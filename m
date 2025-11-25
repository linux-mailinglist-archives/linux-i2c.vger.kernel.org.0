Return-Path: <linux-i2c+bounces-14255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508BC84470
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 10:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31DC03A51E9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 09:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDAA2EC0B8;
	Tue, 25 Nov 2025 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bp4Upw6S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B2B2EBB84;
	Tue, 25 Nov 2025 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063776; cv=none; b=l6cpn4hZJaAkhGqTjsXx2WpVjnNg8vrskL6zcjTEOP1O0G3fGG0kRMZOLb9Gv/UDVxKe3pObDP1HOH2AvIlf7HXxGgsKIueMe8BqY/qCGIFAqx7mmkmzZsxKjmh0JIfP+DGlROjnBr9jOYXAjR4V7TAA6/x19Bnw7lCYvkerwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063776; c=relaxed/simple;
	bh=FBwlETeISBdOzMws60gIvJNe7Z99k/ZEdQRsmGC9bgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uu2cEt657HNrZaEKTm5hxhG4Fd9fyCuIxccLyHG/oUUWGNbmYG6lPoVeUZYQa4iCKwiu90JsoOcMsswSLKhvIVq94UqEvpkxfB9A/jpN23WT2B37gVexPHjixTI1loPJzP3NV17ntgHQfS5mOYG09mezYV761tx6Y98GMIekIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bp4Upw6S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764063775; x=1795599775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FBwlETeISBdOzMws60gIvJNe7Z99k/ZEdQRsmGC9bgI=;
  b=Bp4Upw6S39ckN6gzKtQ+jMZJIQQQb5A3ZNJ35M3xxadf3zg6o8i8Uc7U
   6DRtPyQjY6ikyweEXMMRdPNpviByCV9O+e0f6Ytm4F7qvnekPXc0/8b9T
   Krya6zEKfXRhsCeaIXQibQhpM417mPvYk8PihArARihBPnyCFGJ8dViud
   jr9u7yXbrKXLJ5sL8dkTEAEY2FDEte/DtPDwSL8vV1kA92XkCBo8xCuub
   VcJwcd9moFcn7GfiipjUnYFAHJAPQTXdMOku/9AA8bzOPUYUylAsGDJp0
   sDX/LrsmLW3cUw3q7OPpo9Lf8aGFE+W2Zn8RKKBCcHHiHqFSWHkboFyTj
   w==;
X-CSE-ConnectionGUID: sfSkqupBT9mFqONk5xjUBw==
X-CSE-MsgGUID: /ikVBK5wRX+NOUHvJeQX2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76700491"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="76700491"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:42:54 -0800
X-CSE-ConnectionGUID: 25WM80IaT7O/t6XcUUKUPg==
X-CSE-MsgGUID: 2cVSAVKQQ5Wlc8Jj9Y1m4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223562650"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 01:42:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 405E0A0; Tue, 25 Nov 2025 10:42:51 +0100 (CET)
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
Subject: [PATCH v1 0/2] i2c: acpi: Ad-hoc cleanup and kernel-doc fix
Date: Tue, 25 Nov 2025 10:40:10 +0100
Message-ID: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are an ad-hoc cleanup and a kernel-doc fix while I was looking
into serial-multi-instantiate.c for other reasons. Note, the other
users of i2c_acpi_client_count() are not affected by the change as
they are only interested in positive value returned from it.

Assumed to go via I2C core tree, Ilpo, please, Ack the second change.

Andy Shevchenko (2):
  i2c: acpi: Return -ENOENT when no resources found in
    i2c_acpi_client_count()
  platform/x86: serial-multi-instantiate: Remove duplicate check

 drivers/i2c/i2c-core-acpi.c                     | 7 +++++--
 drivers/platform/x86/serial-multi-instantiate.c | 3 ---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.50.1



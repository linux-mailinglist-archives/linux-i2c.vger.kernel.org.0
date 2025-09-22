Return-Path: <linux-i2c+bounces-13085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F143B910FD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B1F18A3A88
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 12:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CF1309EF4;
	Mon, 22 Sep 2025 12:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5JF6wr2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BE23E32D;
	Mon, 22 Sep 2025 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542806; cv=none; b=HVx2ndw6wJYO2/0LrkdZ7EMMQ5Bj3Krw9FdJTIsjiutdo9KYTqhy9gVAJ6uJ0CG17TwuAX5vxQOo1gqphd48xbfz9pmUK5+n4g/FiUqYry3RqscSfwngiE7CNVa/puMuQSK4YJwNZ0Yiht4vUULfJb6Z6AtYX6SbJrRMfYh3lMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542806; c=relaxed/simple;
	bh=ZVbL7JO2hJQOK2/uYdPL9S7vSx83hXZJKNIcrVxi9yE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTmKcfb8agaPJg7yMkVM4NY7NbQxpG4RCDM3flBYGH6oTMvxCq1BR73iWksdw07gccmobZXIlurdNfIxVk1+EIC4PY8zoJi/RLqy8hX72a9wlOL7fecQl9zX3G0jME3ZuMljiBYBlUoLyNQ+XrAmwWo5osTidxJ5RoGZkaF84bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5JF6wr2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758542804; x=1790078804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZVbL7JO2hJQOK2/uYdPL9S7vSx83hXZJKNIcrVxi9yE=;
  b=N5JF6wr2tdpRNdPksJTIbPfQZvY8AYG7whDOgqjRpkNTkP3ExbLLAx8L
   PJhyhjn8CnhdMU6ezzKsKHfVpBX8VkZBiEcqTuDyj160i7gU9ppzewD92
   NtrwJPWq7IS3F4ny1314dtfB2Vy/8SCW5WV+fjfezY5mUJe5TwpnoZaSJ
   rghuyi1OK4sX8vjhfhQbclox527MvFGz/p+UIu1PRAVRVY2iPFxIWqbc/
   HTCyU1hH7EmmJM4iuyuuMPgvAzcvy73/+Cryq8B7YS9roa1lo8ehF0Or7
   VorzI+P/BUITbQztXnzSMGMoHIYWYS2pqCeQDXs30T1ov8KSOGeIt5kjt
   A==;
X-CSE-ConnectionGUID: GAaR2ajtQPiLNnYH9ovSMg==
X-CSE-MsgGUID: Xcn3UVJOTJGcnrAe0YdPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="63431650"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="63431650"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:38 -0700
X-CSE-ConnectionGUID: JVfG1y3gRJGZ/QVedxP/NA==
X-CSE-MsgGUID: DFEjQ1HQTbqhywLxjJ9CvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176842516"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E847711F967;
	Mon, 22 Sep 2025 15:06:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v0fJQ-000000002j2-3r3j;
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
Subject: [PATCH 1/5] usb: misc: ljca: Remove Wentong's e-mail address
Date: Mon, 22 Sep 2025 15:06:28 +0300
Message-ID: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
 drivers/usb/misc/usb-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c562630d862c..1846156c0800 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -891,7 +891,7 @@ static struct usb_driver ljca_driver = {
 };
 module_usb_driver(ljca_driver);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB driver");
-- 
2.47.3



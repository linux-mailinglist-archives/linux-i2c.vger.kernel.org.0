Return-Path: <linux-i2c+bounces-10323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD02DA87CC9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CD007A6172
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08A8266F19;
	Mon, 14 Apr 2025 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cof6gY7T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216225E471;
	Mon, 14 Apr 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625059; cv=none; b=Zb1XbaPlSwDq7WC5TgaENd/Wrz/ZLd9XAJHKIPKSZHphg+PI6u6VDMLnq2KvuX4NcpJWz4XFcrvD5MGQLjOWhcjRzZ1jbK7cMwYol2N1v6ol9ro20XLYBvnkPXDx1OjaPYMbp9bh55DZAv2kZTdsEWP7GvQdi+FSztRSAKou6Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625059; c=relaxed/simple;
	bh=KoziiDMWesEbVilp9hXpIF4PFybA/NZuL5MQjO2mQXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eV3VkhLeaGftVAHCs+Sao6OKsq5u5wTwJ8gC/nJBZJ1CAymqlmRVm9WvIKXQ6ZsLp8kroOcZ4/CwrRXjgoxTGxil/HiRxR8jAsEWzbeMVJ2UeRaEtAqPKc88oPJxq6oYVdHCOJKeGLf5smI7Lnnk6QXs2/FXeKiZd9LZiAnqf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cof6gY7T; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625058; x=1776161058;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KoziiDMWesEbVilp9hXpIF4PFybA/NZuL5MQjO2mQXo=;
  b=cof6gY7Tl06pK3o4VgESGLyNRJfN3+eWSkdfmNzYE5nfCeVsQ2b9tMJQ
   MJZU8FUMqtp93sNRpfoLQYDEDuO6aEaw37+cSvXtAaTpiMPBgWt7N8JWI
   oNFLCMdRBTbOSSfKy617vI/eSJ4udsWdDH7HzDuHojkpYpUXgGf/dyYoB
   gydi3R6IwCwgUIPSRAwqps+75WdAcyTiTj3vNYhgx6+Vmeq/RJrEyN/1S
   q/uDg4zGvVqZELjM6AFjqaynzscOV/wVG9300Aavx+/Bx48Jh4s6/QetM
   bOYGAXBefpP51GdOccMM2Ihr1TN7mu7/WkCuxn5wCIp3nsptp54gn4CH8
   A==;
X-CSE-ConnectionGUID: UiLdlVXhQMOwDChi3Bve4g==
X-CSE-MsgGUID: izJSAi7xQPCIqWLUXQz7Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46177058"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46177058"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:16 -0700
X-CSE-ConnectionGUID: UQPq5Zd8RACKl6xRmRyrFw==
X-CSE-MsgGUID: j3/mlJisSRWIwbf1JEfSnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130100418"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2025 03:04:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C01C78A2; Mon, 14 Apr 2025 13:04:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 0/7] i2c: core: Move client towards fwnode
Date: Mon, 14 Apr 2025 13:01:50 +0300
Message-ID: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The struct i2c_board_info has of_node and fwnode members. This is quite
confusing as they are of the same semantics and it's tend to have an issue
if user assigns both. Luckily there is only a single driver that does this
and fix is provided in the last patch. Nevertheless the series moves
the client handling code to use fwnode and deprecates the of_node member
in the respective documentation.

In v4:
- fixed spelling in the first patch commit message (Sakari)
- wrapped the commit message in the patch before the last (Sakari)
- added tag to the last patch (Tomi)

In v3:
- fixed compile issues with i2c-core-slave.c (LKP)
- fixed compile issues with IRQ APIs, i.e. missing header (LKP)
- added patch for the only user which assigns two fields (Tomi)
- added tags (Tomi)

In v2:
- covered i2c-core-slave.c where it makes sense
- covered i2c-core-of.c where it makes sense
- rebased on top of the latest code base

Andy Shevchenko (7):
  i2c: core: Drop duplicate check before calling OF APIs
  i2c: core: Unify the firmware node type check
  i2c: core: Switch to fwnode APIs to get IRQ
  i2c: core: Reuse fwnode variable where it makes sense
  i2c: core: Do not dereference fwnode in struct device
  i2c: core: Deprecate of_node in struct i2c_board_info
  media: i2c: ds90ub960: Remove of_node assignment

 drivers/i2c/i2c-core-base.c   | 61 +++++++++++++++++------------------
 drivers/i2c/i2c-core-of.c     |  1 -
 drivers/i2c/i2c-core-slave.c  | 12 ++++---
 drivers/media/i2c/ds90ub960.c |  1 -
 include/linux/i2c.h           |  2 +-
 5 files changed, 39 insertions(+), 38 deletions(-)

-- 
2.47.2



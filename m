Return-Path: <linux-i2c+bounces-9418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D5A33E5D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A09E169C67
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 11:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1482D213E63;
	Thu, 13 Feb 2025 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yuhkgkud"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0EF20B1E0;
	Thu, 13 Feb 2025 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739447180; cv=none; b=nr74H17F8vpjHLVUGHOW96PI1oN5ht6BQX9DvWlJFQCZtt1BZbuSG7imYbMCLThiRnRLz6NGKVPl+9+7JQahg3ic+amKTu2eBSLWhWOtLyn23+wkqbsgXP6/AXGTjOFA9Z01v2yjCCEwIdnyUn8qJlm9JmYxyu2m55FwQGBnz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739447180; c=relaxed/simple;
	bh=wzv8efhUs7PSC0KlZG3SQbBPK1ORKbUCwmbh7h6xlDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EyoEPhhwhXMfo/7V+VslciiofJMQDx8XsV6cCrHaGow8wtRGAQU0SP43XOVUBmJUty3ieQEKBr55K91kweOXyzHqcTsb0GO2cRNV9RXEKRYyJWiYs0LmJA4JDPSB6vzEa0ZFgXWp5EWJYSeZnvEZdXw1SrZa2uoiEzrIDaU0V9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yuhkgkud; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739447179; x=1770983179;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wzv8efhUs7PSC0KlZG3SQbBPK1ORKbUCwmbh7h6xlDw=;
  b=YuhkgkudmW/+T5WpDO8G1fdywewYvU92BV3733VWksp0xoZX4AaY7fA0
   qfBg/uaI40KOAkGv2OKrbIl2m+geTNtf40R5zyzREnav1ra2/TqAvaBrh
   VJM6JoIKnEZ2YIVXsmcdvDg+U2ayDcPsR6mAHaw1hTynRCvhOE5tT/CUR
   xycDMvt4ptp/e4K9swKjfAsIxbxovXHi1MJd90J5Cp7rIRGrw4wFi+feH
   cgPEkVsCtgs35kpYEMWHgq5L7xtXdtyU3mSVwQWPfJOah+I5yEDOZ1lTR
   a10z2ee/qljfSwaXX48Sg1O0rk7M46BpeBuXlZnaKy9Y5i10GZao7js4h
   g==;
X-CSE-ConnectionGUID: 3NxAthAMSGCb5rWAVqjdJw==
X-CSE-MsgGUID: SV8JeafsTHqZ1UIw84cYKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40063846"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40063846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 03:46:19 -0800
X-CSE-ConnectionGUID: iQ/Rx8JaQOqg4+8lVTJIzg==
X-CSE-MsgGUID: u/rOaFDwR9iU60bHd/uHsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113786672"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 03:46:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1E5C01FD; Thu, 13 Feb 2025 13:46:15 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 0/2] i2c: Reduce use of i2c_of_match_device()
Date: Thu, 13 Feb 2025 13:45:03 +0200
Message-ID: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The i2c_of_match_device() was developed as internal API and was exported just
in case well before we get an idea of the generic helper for getting driver
data for the matched device. For all the times of i2c_of_match_device() being
exported there were _only_ three users, two of which had been already converted
to better API. For preventing the use of i2c_of_match_device(), make it private
to I²C subsystem.

This is assumed to go via I²C tree, but can be done differently taking into
account the immutable tag or branch for involved subsystems.

In v2:
- collected tags (Sebastian)
- removed one leftover in the first patch

Andy Shevchenko (2):
  power: ip5xxx_power: Make use of i2c_get_match_data()
  i2c: Unexport i2c_of_match_device()

 drivers/i2c/i2c-core-of.c           |  1 -
 drivers/i2c/i2c-core.h              |  9 +++++++++
 drivers/power/supply/ip5xxx_power.c |  7 ++-----
 include/linux/i2c.h                 | 11 -----------
 4 files changed, 11 insertions(+), 17 deletions(-)

-- 
2.45.1.3035.g276e886db78b



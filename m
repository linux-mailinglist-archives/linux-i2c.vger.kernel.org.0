Return-Path: <linux-i2c+bounces-9400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6DFA32C6E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5DEC18878AE
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C800256C7D;
	Wed, 12 Feb 2025 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHQTAAUI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E28520B1E5;
	Wed, 12 Feb 2025 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379028; cv=none; b=SREb+ruxgjs2izYfdPoX3mFpMyUkTvA4hj2D+O07QLYJ/C44Y+2FdWGnCNeEuNxNOWUeE0gIOXzXWjRQM8/IadLH6rfECKVa5nTCY3nx0Az/VkYUmRy7sJUlftCoT2DAicDGVYHFdYW5/344E8U4MXTs4j5NkyjXH5s/SCxwzNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379028; c=relaxed/simple;
	bh=sN0KMmUXHXUMO+a/DP6eUSSoPf12acyibiEzC9XXU4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=STA5k6FaomW0VvEA68F17A5mrgPrYOdkJPIpQy1XzCsbCA+/Vgenw8StG+rGIeK8Or87cUrQ834ZmGVagNf2lXbjs96kSJtsr0fHZZwOQd0zE6b07WrXvyZI9gmoJ9bykzm4urZtHVA+1dM7sxcqrVikRFunvmcP38jmdLATU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHQTAAUI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739379027; x=1770915027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sN0KMmUXHXUMO+a/DP6eUSSoPf12acyibiEzC9XXU4s=;
  b=aHQTAAUIebt515xGgyO8gVq4RzsWKzG7fXgRtLr8uH85QcOBjFZS8pBW
   E3qZbcy2MIoJertH7u+Zd13Ve3xFNI29utbw9QtAww61wuGwYvy6lKxb5
   OD9rJysIulTZIVsiVHSbEnSbg16g1m7Gj85WiTe0bSuaqW7RhEuY2Jyz6
   +x8TppggLdZOkgFMBeU/EoWaWrS6IbxviifZQ4TLqCqELFbHyQOaygzg+
   QhssRSfgM7fKQztcFw2ZbcVIElkdQ4NZDOKg4Q0ZW8Pmu4eXXnV15IdDv
   RuRnyWljQNKK3KBWli1gdBzRTYfaTo0Jg8ojd3HF6A2B4nLApYMbMaCWI
   g==;
X-CSE-ConnectionGUID: 2RueKw5CTZyr47rPKZesIQ==
X-CSE-MsgGUID: UNLa47QRSTe6GmnLfCigNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="42885976"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="42885976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:50:17 -0800
X-CSE-ConnectionGUID: tAKMShbmSHq2v5Mia1WvpA==
X-CSE-MsgGUID: O+qniqbiRyOdY8ptdTBDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118048277"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 12 Feb 2025 08:50:14 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 222DF11E; Wed, 12 Feb 2025 18:50:13 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v1 0/2] i2c: Reduce use of i2c_of_match_device()
Date: Wed, 12 Feb 2025 18:46:22 +0200
Message-ID: <20250212165012.2413079-1-andriy.shevchenko@linux.intel.com>
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

Please, review and ack.

Andy Shevchenko (2):
  power: ip5xxx_power: Make use of i2c_get_match_data()
  i2c: Unexport i2c_of_match_device()

 drivers/i2c/i2c-core-of.c           |  1 -
 drivers/i2c/i2c-core.h              |  9 +++++++++
 drivers/power/supply/ip5xxx_power.c |  6 ++----
 include/linux/i2c.h                 | 11 -----------
 4 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.45.1.3035.g276e886db78b



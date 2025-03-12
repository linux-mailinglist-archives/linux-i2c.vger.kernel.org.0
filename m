Return-Path: <linux-i2c+bounces-9806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF7A5E3E4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE3A3B4F01
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CEB2586FE;
	Wed, 12 Mar 2025 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPfVjCNb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B4256C9B;
	Wed, 12 Mar 2025 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805509; cv=none; b=sZz+mGj85Ehv1scYY0BYmWbDJMcoRpYVGMlCMbhWREVKoRT+cPeVy1s4T9Hx1MmluEh4EPPAGmwfDRWUQ2a6l9+0WRMcUghO9OPwiUt+cEE/AV3OivxI0wJaVilJBSckEVo2J4m/SJR1dUEls+AjEYe+ZYa2FYhsOtMkPm22uWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805509; c=relaxed/simple;
	bh=WdzPq/RV9mriSRh/Aiutf35lousnsrlBeC9tWGcxOks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgoibiPzHjNwR7P783/HWTJY/EK5F3FxScSdb8gOv/vxl0PlRO0yevn9yUJ7aR6uGPhEfmakoWMJVIqkIj1NJfk7hON9Z4G3NOcUzmmHWmxn6TWxwEVFVHajDjK6OliLQsR3F9OHSHbBoWaQ5LslgMyZFKtiqfCEHm8yEOBZxfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPfVjCNb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805507; x=1773341507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WdzPq/RV9mriSRh/Aiutf35lousnsrlBeC9tWGcxOks=;
  b=NPfVjCNbfUESLSKnFwIZIwGIS686GnmmJUgoXVS4fz8de0icnlfB2wgs
   tD4lf99iv0vyhXtkRTzL6wpJuw0fjSKnaYI5mfCJdKPW5UVwApa7Lo1Bn
   7oJQh6wZ9xISYlLR3QeaOYoKeYJ/g0CgaU4WJe7TXjQ7odEaGg8hhGpeQ
   LQCFQbkaXEukUk2HQRTcGTWzD8MoP02CZ6u9eJjgBFyTPYucDDGRFnbEH
   9RF/on+WBGp4UobeimM/vrCpCTBdAdXenSo/D602jjHyRv/8YdNaCSdwt
   02gjKTVbIwuJF3FeA2b25d5mQ8/LTGDxdMwWHzxZbX5YD0+RVhgDOaqC6
   A==;
X-CSE-ConnectionGUID: PKp6fs2CTJeQHO+INHgp7A==
X-CSE-MsgGUID: 5eF9BlWaSpalCFFLtv49RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30487210"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30487210"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:51:44 -0700
X-CSE-ConnectionGUID: tazhwXsMSimOyVuAdZN4Jg==
X-CSE-MsgGUID: ijKPHkn6QWKnsXQ/G3Tzag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157895062"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2025 11:51:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0FF5D1F2; Wed, 12 Mar 2025 20:51:41 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/6] i2c: core: Move client towards fwnode
Date: Wed, 12 Mar 2025 20:48:47 +0200
Message-ID: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct i2c_board_info has of_node and fwnode members. This is
quite confusing as they are of the same semantics and it's tend
to have an issue if user assigns both. Luckily there is only a
single driver that does this and fix was sent today. Nevertheless
the series moves the client handling code to use fwnode and deprecates
the of_node member in the respective documentation.

Andy Shevchenko (6):
  i2c: core: Drop duplicate check before calling OF APIs
  i2c: core: Unify the firmware node type check
  i2c: core: Switch to fwnode APIs to get IRQ
  i2c: core: Reuse fwnode variable where it makes sense
  i2c: core: Do not dereference fwnode in struct device
  i2c: core: Deprecate of_node in struct i2c_board_info

 drivers/i2c/i2c-core-base.c | 58 ++++++++++++++++++-------------------
 include/linux/i2c.h         |  2 +-
 2 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.47.2



Return-Path: <linux-i2c+bounces-10182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D750CA7E56C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0E503A940D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3448A205E3F;
	Mon,  7 Apr 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHwbIIRT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECB205AC4;
	Mon,  7 Apr 2025 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040987; cv=none; b=KU9rro/x6CHgAvRVImoirR5lmgNIRCDsjJO3eSbu73WbJifvbFf75vWYJ7C9+inUi2npQzbZ8myJjc1OKfp2cVTOShhssyEWMR8yOsAI9k+F7AWexxwMcriQfEUTH9Zt4BvcU4zYhHyXeXSR10u6R5wxWYJCfYUlmcVWRHvnBSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040987; c=relaxed/simple;
	bh=Yd7f9ORX0QCWqQ4+PgVV88i4AJ2tzEMlttBRL8DWJp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dh8nVmocGlsQTEulCtPLBWvPZutalVTLn/ZTXbNZQSE2v5vMKm3F2v1IkEXwY0O9O+fp+nuf/RxRoIeB7MO9T8WMq8e/rqdlhv9KUHbzTzF/0DyBZKRaeSTOO6zO+9waOZX8+QdEmyqRCNqwEnwySvRsR2MGDYC7PMmi7fpLr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHwbIIRT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040986; x=1775576986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yd7f9ORX0QCWqQ4+PgVV88i4AJ2tzEMlttBRL8DWJp0=;
  b=cHwbIIRTGExcA3D/v+mycjZoMkFRKk/HVWZepy19MH4jvHiH8vqI+x0q
   EBs2t2VK/PuIXmb4OixbHPm2FElxiNHt/6U0iYhfexSe7AYLO7HR9BcS/
   fc3MAU1Hez4eX6p+JQsSnIZSK128YXt0DzSqu/bHBM+EDzCna5q5wKeMy
   pCWnEyU3vM8CIkKybNPesgx5XsPHMwYUpSFdJPHuo0EXa6O9CATu8ib35
   0jbDdEjf3YzxTLkvjLN7UoHmuLHddxLkopy//Gv1UHgds2nBvfEHJdMO3
   bHTK7+g6Zebji+aJ5hE6xt4ZTOGXIUy5a8NIpDaU6Sus2U9rCkCDRbz13
   A==;
X-CSE-ConnectionGUID: kNKcGTYnRg2flF/92EdHWQ==
X-CSE-MsgGUID: bXEvsjslTPKAz9SybEAhUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45324194"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45324194"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:43 -0700
X-CSE-ConnectionGUID: xMw9CwoCSPC24Wo0iywPJQ==
X-CSE-MsgGUID: yJ7kELKMSG6b5F/Wt5rVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128930032"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2025 08:49:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8498BF0; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
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
Subject: [PATCH v3 0/7] i2c: core: Move client towards fwnode
Date: Mon,  7 Apr 2025 18:44:56 +0300
Message-ID: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
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

Tomi tested the last patch, but since it was separate there is no tag (yet).

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



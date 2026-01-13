Return-Path: <linux-i2c+bounces-15103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D25B2D19461
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E107300EDAB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD30F392B95;
	Tue, 13 Jan 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5NT6Rl/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBEC392B72;
	Tue, 13 Jan 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313075; cv=none; b=Yjhu2xLLymN66CLEBpcYC7qY11stA0c0qlqfrjEMWZepxCCgNacILmTIdBDfTZ+01D/1zo6G715zta33scCzzAcCQMDny0jWA77hf9SgySun7AX6+nRY8iKpLblGGS6vVrVIJzbgAWe9FJlkCctTzzozSWznHm8tNmBwgZXKCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313075; c=relaxed/simple;
	bh=prQyO/ImwEGR4cxiq2tpLLVB7JgyHUBkcdLU7vBkNhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1yEAQDd/9XxzCBFLPKr509hlZ7JLHH07Jh2mOF8auNhQK6a+Z07W0fgMcViU9ooZhPZa96buIVigmtFRSGhmO7zV/EaPvjUvFyGrD110k0tEAXv8PU///VsFivdTydsFqM3M3LbT9h0d/uMHyAn+K9WDpBVJiCnp8gw0+jbwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5NT6Rl/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313074; x=1799849074;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=prQyO/ImwEGR4cxiq2tpLLVB7JgyHUBkcdLU7vBkNhs=;
  b=a5NT6Rl/anSQ8uJSo8lelo6aFm8h301cjFdEqqu1dyT3MRNyUiKq6wRq
   4RVPuZWiokwdAQ2X+tl1D5Sd+s4FlNXkEs7VPoaSVlmj4ltLudWw4dIFq
   XrAuVQjZ/LPP/YnVT2Ns9QwzcxFlaiTXBq6qBZZCktH5qTBi9J2VboKj/
   YCfB9HP+b3CAegGrHXPzDbBh2UM/6kSf5QK67jEBCCTiwAddGAZ2svP5M
   +QUoga4x6BWNrR6y00JwCfngonzy1822H415l5hR6lzXaeBRM63ZTg7GV
   tmHndhQ2Lt99Cxry6R2cVLyWIWgt6BIo38TJWhUuKm5p+WFr6JFu95uw1
   g==;
X-CSE-ConnectionGUID: BFTlgF6bQWaC1YAY25ugpg==
X-CSE-MsgGUID: 2bqAJAi5RXKpNAaCwjTyRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95072068"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95072068"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:04:33 -0800
X-CSE-ConnectionGUID: 4om1fwZiSyKe+sUZ3Z+4Gg==
X-CSE-MsgGUID: /eksk4v/Qoexsbhx6UqR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204667351"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 06:04:31 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] i2c: SMBus ARP support
Date: Tue, 13 Jan 2026 15:04:26 +0100
Message-ID: <20260113140430.207990-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I know there has been a couple of PoCs for ARP over the years, but for
what ever reason none of them were ever made part of the kernel. I
don't know how common ARP-capable devices are, but since they do
exist, we really should enumerate them as intended. I'm guessing that
in Linux ARP-capable devices have so far been left mostly undetected.

The problem I'm trying to tackle with these is to detect SMBus devices
on discrete components like PCIe cards. We obviously won't have any
kind ACPI or DT description for those, so we would always have to
create the device for them in the drivers. Unfortunately in some cases
it's actually very difficult to know what exactly is attached to the
I2C on those cards because the vendors can put what ever they like
there - this is the case at least with some of the GPUs it seems. But
luckily those I2C/SMBus devices are at least in some cases fully
ARP-capable.

I'm including a patch that binds the detected ARP-capable MCTP devices
to the driver. There is also a target mode test driver.

thanks,

Heikki Krogerus (4):
  i2c: SMBus Address Resolution Protocol implementation for host side
  i2c: Sysfs attribute files for the Unique Device Identifier fields
  mctp i2c: Enable SMBus ARP discovery
  i2c: Add SMBus ARP target mode test driver

 Documentation/ABI/testing/sysfs-bus-i2c |  53 ++++
 drivers/i2c/Kconfig                     |   6 +
 drivers/i2c/Makefile                    |   3 +-
 drivers/i2c/i2c-core-arp.c              | 334 ++++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c             | 154 ++++++++++-
 drivers/i2c/i2c-core.h                  |   8 +
 drivers/i2c/i2c-target-arp.c            | 201 ++++++++++++++
 drivers/net/mctp/mctp-i2c.c             |   8 +
 include/linux/i2c-smbus.h               |  67 +++++
 include/linux/i2c.h                     |  10 +
 include/linux/mod_devicetable.h         |  13 +
 scripts/mod/devicetable-offsets.c       |   8 +
 scripts/mod/file2alias.c                |  24 ++
 13 files changed, 878 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c
 create mode 100644 drivers/i2c/i2c-core-arp.c
 create mode 100644 drivers/i2c/i2c-target-arp.c

-- 
2.50.1



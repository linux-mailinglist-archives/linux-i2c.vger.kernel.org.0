Return-Path: <linux-i2c+bounces-1067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2F81FD48
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 07:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77871F21A05
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1855023BB;
	Fri, 29 Dec 2023 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ULcM+bXC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1981746A;
	Fri, 29 Dec 2023 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1703831960; x=1735367960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SR4MkYifRuHdXsTyYORK+g1dgQ/k72RLd2YmwbA7kPc=;
  b=ULcM+bXCHx8Bvxr0sS4dUPnxclw+yJ1EVL7uRo6e7UB2p2d0N786ecuD
   NaWFi17YJ5pU7hMM23BgrH6nzm/qFM1vgIl2393jK0Ydaft4Yd6T45yC8
   8jSDTK7boj6w45xfk+4k6nB08+uyJLAynqu1VduaUnGGW4KwtefBDvboj
   8bcWWdqMCWiku1H9fnEHhigQn1NYGRYQCsxbJtegkbHcHkW7eol7J8daJ
   Dvao7Cib6AExllSfQW0TRqhsznIPIzEEiPsEUd0HkR/H7AT3uAvc90fm4
   dfVfziOSgyHYXCmphnivDOy+qSLY5D2QFoh5PKyrlJGCi+oULyAXiSTJ5
   g==;
X-CSE-ConnectionGUID: /p5Vw6zqT1Cxelc+o0fuVA==
X-CSE-MsgGUID: rb2CWur0QpaDrJZKPOhslw==
X-IronPort-AV: E=Sophos;i="6.04,314,1695657600"; 
   d="scan'208";a="6253586"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 29 Dec 2023 14:39:14 +0800
IronPort-SDR: XGKdP/79cnUjeVieN7o4Pd54wq0L5TSEoWRqDqIBcP4bqd0vri8pcwzvESX4a2sVi/NVdqlArg
 5l4oUIg4opHg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Dec 2023 21:49:47 -0800
IronPort-SDR: htoqEh9NGbUHEK9duSKalM8F78356T2o4ceGs1KFjfSbJjqE7hKQd2NPC9XW9SXTadBki3PLpN
 zUJH6WRW2QqQ==
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 28 Dec 2023 22:39:13 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v5 0/2] platform/x86: p2sb: Fix deadlock at sysfs PCI bus rescan
Date: Fri, 29 Dec 2023 15:39:10 +0900
Message-ID: <20231229063912.2517922-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When PCI devices call p2sb_bar() during probe for sysfs PCI bus rescan, deadlock
happens due to double lock of pci_rescan_remove_lock [1]. The first patch in
this series addresses the deadlock. The second patch is a code improvement which
was pointed out during review for the first patch.

I confirmed the patches fix the problem using a system with i2c_i801 device,
building i2c_i801 module as both built-in and loadable.

[1] https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/

Changes from v4:
* Separated a hunk for pci_resource_n() as the second patch
* Reflected other review comments by Ilpo

Changes from v3:
* Modified p2sb_valid_resource() to return boolean

Changes from v2:
* Improved p2sb_scan_and_cache() and p2sb_scan_and_cache_devfn()
* Reflected other review comments by Andy

Changes from v1:
* Reflected review comments by Andy
* Removed RFC prefix

Changes from RFC v2:
* Reflected review comments on the list

Changes from RFC v1:
* Fixed a build warning poitned out in llvm list by kernel test robot

Shin'ichiro Kawasaki (2):
  platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
  platform/x86: p2sb: Use pci_resource_n() in p2sb_read_bar0()

 drivers/platform/x86/p2sb.c | 174 +++++++++++++++++++++++++++---------
 1 file changed, 132 insertions(+), 42 deletions(-)

-- 
2.43.0



Return-Path: <linux-i2c+bounces-1201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA228267F1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 07:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A645E281CBB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 06:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0C263D5;
	Mon,  8 Jan 2024 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="WY76uHE4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57701BE6B;
	Mon,  8 Jan 2024 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704694932; x=1736230932;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MScuqBO0++OAVopMRx9sYKbuxXydYzh/BbhazA8/gwM=;
  b=WY76uHE44TA6QuPFXpMe9DMc95JXa12x4xXNsQ979yCRwFLERPv6tfcr
   Qa1QG/ev6xUsr1cAAJL2olqRqsaNTmETWvH+yRP6YzFo98aD2Sqb+cmT1
   T6oh0/i7T452UnaeO+PKV012Ap9smwm4vWP5IbsyXXohSBwS3wV3ZrixP
   +HsNuu0Z1Lsoxz5l0W6plVram+qeyVVFokKtxbLbR+D642ocuSoV6hBVE
   lbuagaAtRTnF5ACQkkhKedbCnRy8yPjGkVyFbalZu5wG23kii+Kcjw/jA
   jvu8/9BZPH217cFJumedsqGEyKtLI4J3gzO9zbQBL2dFUCxX97JBFYn7f
   A==;
X-CSE-ConnectionGUID: WzbhtLZgSZyMK9I1x3VoFA==
X-CSE-MsgGUID: nDxwfq8ETuKm2UApnhy2PQ==
X-IronPort-AV: E=Sophos;i="6.04,340,1695657600"; 
   d="scan'208";a="6822647"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2024 14:21:03 +0800
IronPort-SDR: OnMz/hNj7LtqATKip3TM4UCBoNeVordoHwfce89WNhfcqmZIbrME7/qK6HGhZ9Vzzfx4xhUuMn
 Wv1eVTZZ+Rfw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jan 2024 21:31:24 -0800
IronPort-SDR: NU7YKTDAS31nyY09lUsZhxHDCfLB9MIgQr09nAAT39vyVBa7+yHJmlvxao4nWB55TvOGOfWnBg
 Oy1ufhTf+ZUg==
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2024 22:21:01 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Klara Modin <klarasmodin@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v6 0/2] platform/x86: p2sb: Fix deadlock at sysfs PCI bus rescan
Date: Mon,  8 Jan 2024 15:20:57 +0900
Message-ID: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
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

[1] https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/

The first patch of the v5 series was upstreamed to the kernel v6.7-rc8. However,
it caused IDE controller detection failure on an old platform [2] then the patch
was reverted at v6.7. The failure happened because the IDE controller had same
DEVFN as P2SB device. To avoid this failure, I added device class check per
suggestion by Lukas. If the device at P2SB DEVFN does not have the device class
expected for P2SB, avoid touching the device.

[2] https://lore.kernel.org/platform-driver-x86/CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com/

I confirmed the patches fix the problem [1] on the kernel v6.7, using a system
with i2c_i801 device, building i2c_i801 module as both built-in and loadable.
Reviews and comments will be appreciated.

Klara,

I hesitated to add your Tested-by tag to the v6 patch, since I modified the code
slightly from the code you tested (I used pci_bus_read_config_word() instead of
pci_bus_read_config_dword() to avoid a shift operator). I hope you have time to
afford to test this series again.


Changes from v5:
* Added device class check to avoid old IDE controller detection failure

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

 drivers/platform/x86/p2sb.c | 183 +++++++++++++++++++++++++++---------
 1 file changed, 141 insertions(+), 42 deletions(-)

-- 
2.43.0



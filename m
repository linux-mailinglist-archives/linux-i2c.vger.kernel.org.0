Return-Path: <linux-i2c+bounces-6145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAE96BC0A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1FA1C21D5B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750B61D88C4;
	Wed,  4 Sep 2024 12:27:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349661D79B8;
	Wed,  4 Sep 2024 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452856; cv=none; b=UmKdz7stMOHLcFH9OaXJEbcZDNCLONK22+4rlN9OJlEDOjNoBEEXq7p25UdLckYlb388PXUqZxjfDQ0PYElLizIbFDfWYYIk1PTBq287vDffFfy0HmYB0WErMU62CxNlLh9yeS0HwLpo8uVBmGq2PX096oyw4hbBHq32xVAJpxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452856; c=relaxed/simple;
	bh=iozfF049HH7mE0H2603v1v/6e6ujLmINg3iqPrUoAD8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i97/688PpjAGmeKt/tSE4kJ0PiGiSkpMHQyNdm4lpWnYpBJxq2KDkmBIhAcftMV2qUlrfjMN6OnU8OkL5QjcP2/6m2lSQA/qrcGOIyHDGGcKhO0c41/UYJknjuxcgsTo07TuA7QdtB6wHtkwLaLYuROfosfSJNTWAaXUsr471qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WzM7r4cXwz69WD;
	Wed,  4 Sep 2024 20:22:32 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 375AA1800FE;
	Wed,  4 Sep 2024 20:27:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:29 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
	<bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
	<david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <mail@mariuszachmann.de>,
	<wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next 00/19] HID: convert to devm_hid_hw_start_and_open()
Date: Wed, 4 Sep 2024 20:35:48 +0800
Message-ID: <20240904123607.3407364-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Hi, all

This patchset is dedicated to using the life cycle approach to manage
hid resources. By keeping hid resources consistent with the life cycle
of the device, we ensure that resources are available during the life
cycle and the hid resources can be released before device release.

Going one step further, since the module does not need to recycle hid
resources by itself, the goto-release resource release coding can be
avoided. It also reduces the risk of resources not being released.

Li Zetao (19):
  HID: core: Use devm_add_action_or_reset helper to manage hid resources
  HID: cp2112: Use devm_hid_hw_start_and_open in cp2112_probe()
  HID: ft260: Use devm_hid_hw_start_and_open in ft260_probe()
  HID: mcp2200: Use devm_hid_hw_start_and_open in mcp2200_probe()
  HID: mcp2221: Use devm_hid_hw_start_and_open in mcp2221_probe()
  HID: nintendo: Use devm_hid_hw_start_and_open in nintendo_hid_probe()
  HID: shield: Use devm_hid_hw_start_and_open in shield_probe()
  HID: hid-picolcd: Use devm_hid_hw_start_and_open in picolcd_probe()
  HID: playstation: Use devm_hid_hw_start_and_open in ps_probe()
  HID: hid-steam: Use devm_hid_hw_start_and_open in steam_probe()
  HID: wiimote: Use devm_hid_hw_start_and_open in wiimote_hid_probe()
  hwmon: (aquacomputer_d5next) Use devm_hid_hw_start_and_open in
    aqc_probe()
  hwmon: Use devm_hid_hw_start_and_open in rog_ryujin_probe()
  hwmon: (corsair-cpro) Use devm_hid_hw_start_and_open in ccp_probe()
  hwmon: (corsair-psu) Use devm_hid_hw_start_and_open in
    corsairpsu_probe()
  hwmon: (gigabyte_waterforce) Use devm_hid_hw_start_and_open in
    waterforce_probe()
  hwmon: (nzxt-kraken2) Use devm_hid_hw_start_and_open in
    kraken2_probe()
  hwmon: (nzxt-kraken3) Use devm_hid_hw_start_and_open in
    kraken3_probe()
  hwmon: (nzxt-smart2) Use devm_hid_hw_start_and_open in
    nzxt_smart2_hid_probe()

 drivers/hid/hid-core.c              | 40 +++++++++++++++++++++++++++++
 drivers/hid/hid-cp2112.c            | 26 +++----------------
 drivers/hid/hid-ft260.c             | 32 +++++------------------
 drivers/hid/hid-mcp2200.c           | 22 ++--------------
 drivers/hid/hid-mcp2221.c           | 26 ++-----------------
 drivers/hid/hid-nintendo.c          | 23 +++--------------
 drivers/hid/hid-nvidia-shield.c     | 20 +++------------
 drivers/hid/hid-picolcd_core.c      | 22 +++-------------
 drivers/hid/hid-playstation.c       | 27 +++----------------
 drivers/hid/hid-steam.c             | 18 ++-----------
 drivers/hid/hid-wiimote-core.c      | 20 +++------------
 drivers/hwmon/aquacomputer_d5next.c | 39 +++++++---------------------
 drivers/hwmon/asus_rog_ryujin.c     | 29 ++++-----------------
 drivers/hwmon/corsair-cpro.c        | 24 ++++-------------
 drivers/hwmon/corsair-psu.c         | 24 ++++-------------
 drivers/hwmon/gigabyte_waterforce.c | 29 ++++-----------------
 drivers/hwmon/nzxt-kraken2.c        | 23 +++--------------
 drivers/hwmon/nzxt-kraken3.c        | 34 +++++-------------------
 drivers/hwmon/nzxt-smart2.c         | 22 +++-------------
 include/linux/hid.h                 |  2 ++
 20 files changed, 118 insertions(+), 384 deletions(-)

-- 
2.34.1



Return-Path: <linux-i2c+bounces-6360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F533970AF7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16449B213F2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53511173F;
	Mon,  9 Sep 2024 01:14:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B971F9EC;
	Mon,  9 Sep 2024 01:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844466; cv=none; b=JB7Su1LkgR4VVgIgLAhP9TEvJIzrUsaZSdT3+VXd2lqpuovjLltNFUvyAlR6fLnhXDyupBQ43cOmP56UDw1VaALgLXW5IDMHVnE3fL1tq2I18O64EUI5K2oO5thjwX79jG24wWFDJ0s6dCBrOpvnBGSfNjEjRFH0bqfE9QWY2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844466; c=relaxed/simple;
	bh=6bcvZU1rTtHXISVQ5qkXgIcYAt31PhLF45p5DV9bjI0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NvOHNlgeR3MbQ23ArxEnp9n6tOMu2oHO0eEaGl33+hkYLNAhxqFNmO9DIr3exbHKcwPdKhr9FbzxuO6cX814CS4xw5AMOBTihcdbP80x+9fwZLlQfxs9pQoXQQEq25t7xHz4gVydAiZSCqRCvq0pTXiPr8zjADmb/KZpDacKKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X28273BkRzpVCL;
	Mon,  9 Sep 2024 09:12:15 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 13807140360;
	Mon,  9 Sep 2024 09:14:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:14 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 00/15] HID: convert to devm_hid_hw_start_and_open()
Date: Mon, 9 Sep 2024 09:22:58 +0800
Message-ID: <20240909012313.500341-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)

v1 -> v2:
 1) drop some risky patches, such as patch 7, which may have race issues
 2) Some patches can be further optimized. By replacing
hwmon_device_register_with_info with devm_hwmon_device_register_with_info,
the .remove operation can be completely deleted.
 3) Adjust some commit information and use "Use" to replace
"Consider using"

v1:
https://lore.kernel.org/all/20240904123607.3407364-1-lizetao1@huawei.com/

Hi, all

This patchset is dedicated to using the life cycle approach to manage
hid resources. By keeping hid resources consistent with the life cycle
of the device, we ensure that resources are available during the life
cycle and the hid resources can be released before device release.

Going one step further, since the module does not need to recycle hid
resources by itself, the goto-release resource release coding can be
avoided. It also reduces the risk of resources not being released.

Thanks,
Li Zetao.

Li Zetao (15):
  HID: core: Use devm_add_action_or_reset helper to manage hid resources
  HID: cp2112: Use devm_hid_hw_start_and_open in cp2112_probe()
  HID: ft260: Use devm_hid_hw_start_and_open in ft260_probe()
  HID: mcp2200: Use devm_hid_hw_start_and_open in mcp2200_probe()
  HID: mcp2221: Use devm_hid_hw_start_and_open in mcp2221_probe()
  HID: nintendo: Use devm_hid_hw_start_and_open in nintendo_hid_probe()
  HID: playstation: Use devm_hid_hw_start_and_open in ps_probe()
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

 drivers/hid/hid-core.c              | 40 ++++++++++++++++++++++++
 drivers/hid/hid-cp2112.c            | 26 ++--------------
 drivers/hid/hid-ft260.c             | 32 +++++---------------
 drivers/hid/hid-mcp2200.c           | 22 ++------------
 drivers/hid/hid-mcp2221.c           | 26 ++--------------
 drivers/hid/hid-nintendo.c          | 23 +++-----------
 drivers/hid/hid-playstation.c       | 27 +++--------------
 drivers/hwmon/aquacomputer_d5next.c | 39 ++++++------------------
 drivers/hwmon/asus_rog_ryujin.c     | 47 +++++------------------------
 drivers/hwmon/corsair-cpro.c        | 24 +++------------
 drivers/hwmon/corsair-psu.c         | 24 +++------------
 drivers/hwmon/gigabyte_waterforce.c | 29 +++---------------
 drivers/hwmon/nzxt-kraken2.c        | 45 +++++----------------------
 drivers/hwmon/nzxt-kraken3.c        | 34 +++++----------------
 drivers/hwmon/nzxt-smart2.c         | 38 +++--------------------
 include/linux/hid.h                 |  2 ++
 16 files changed, 114 insertions(+), 364 deletions(-)

-- 
2.34.1



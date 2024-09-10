Return-Path: <linux-i2c+bounces-6492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F24E7973C26
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A98BD1F25A0C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEF419D88C;
	Tue, 10 Sep 2024 15:36:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3104A195F22;
	Tue, 10 Sep 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982606; cv=none; b=ETEXVIqCi4c5Sz3Z4tgymkwBjhteF7gS3qHQu8ziqWwwLtmUnmD2TxMgB0eB40IIFZ5Lii+rKrTwKiwbUBNey+H29X1dA/xeq6+nMPzhAeQ7XeB4gBBGDsJI3DU3E+Ai/RkA5qI0EaSHinZRqItzWWgqSgHcIxAYbn3zmY1dZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982606; c=relaxed/simple;
	bh=FrYQeiORVBdg1jMjnjvduQ7SWXDdHLeTtHLYw4oNgVY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mdgRi4woImMeqaxSG8p8X5TvjWXrVWPWeta5trOTvl4ebIp22D+tqcTaIm18TuZs+6iSocp7hyfBdD9fYMpoxEqqfh65c2UpDfs0xONeIIYQH+xSvTLFSAUTGEeQiTpWJ2J1yWdNI7DpEhLIws2zBfMR03wLewW18XYvP0bOT8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X378W2DZtz1j8JK;
	Tue, 10 Sep 2024 23:36:11 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A0D41402DE;
	Tue, 10 Sep 2024 23:36:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 10 Sep
 2024 23:36:38 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
	<bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
	<david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <mail@mariuszachmann.de>,
	<wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v3 00/15] HID: convert to devm_hid_hw_start_and_open()
Date: Tue, 10 Sep 2024 23:45:30 +0800
Message-ID: <20240910154545.736786-1-lizetao1@huawei.com>
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

v2 -> v3:
 1) Patch 9 adds asus_rog_ryujin prefix subject.
 2) Patch 14 fixes some wrong commit messages.

v2:
https://lore.kernel.org/all/20240909012313.500341-1-lizetao1@huawei.com/

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
  hwmon: (asus_rog_ryujin) Use devm_hid_hw_start_and_open in
    rog_ryujin_probe()
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

 drivers/hid/hid-core.c              | 44 +++++++++++++++++++++++++++
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
 16 files changed, 118 insertions(+), 364 deletions(-)

-- 
2.34.1



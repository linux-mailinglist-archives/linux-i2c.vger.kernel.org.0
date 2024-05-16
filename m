Return-Path: <linux-i2c+bounces-3510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E078C7BDB
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC967B22855
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91A5157463;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QjZAp9gN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1308156C7F;
	Thu, 16 May 2024 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883571; cv=none; b=f68xDnN/C3GWh7pUQkkh/+TPdjV/aiTUU5xOliK8L1TUmx+rs5t4A+DI23K9ZFpK9QwQdFIhG5CLEowYugpjT2OdOUlI0i4xDp7itZZpg7s8EFxEKxyASMW5mICvPSNmD3n4U6p8tSDzeYj+LkQL4anu564NvelvLsRjeiBxoBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883571; c=relaxed/simple;
	bh=ExutKnV3UQZbIBtujoabH4xx2CzRGq4fc0a43cX5pfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U7PENah6mdxGhZorkpfje7ZymdEhs01xKBeaKaICUh5JaYdnEPidnL3Zu0nv9MVl3PcSHIXeIkMBc9wla1yc9ci2anT62qqUyUrQkgo5SW/Ww4s7VWYLz/HyQaRryAgjDjE2rQmnZIqbyBQ3wIEa38k6pkzyf2v5YbyxvuhpgDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QjZAp9gN; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAWgt020164;
	Thu, 16 May 2024 18:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+VmPdD1ZCzBwv6fiFfXvgra3YJsljjbDY8PAdvzuhIg=;
 b=QjZAp9gN0WmYnEr+caWtpKR2MYfc18ZW9RUK7zMD660Hq8a2ax500rUKg9RvsyoishXg
 jpMyB6+3n8Vii5Gi6E2qwBO7As5oxL1vQNCkUYLzlDjx0k7t+7E+Jp/rCt953XEFEP4U
 lLVbfKJmCe9wRWVT9X3i9hzSa/xUAlv+RwncbAEiZGxELuaYb3WO4vVaM5GetKKEmLql
 CV03YMupkJAlHDpGG3eibvisuTy4P9eO/RuaRTS3cBRC6dq83d92XJPm0Zi0dZm3JlKZ
 Uxd1/K0e83WzCJ55SIeUj3msUQ3WDIJ5Fz4u/x2SPc31pRKC0CngsAS2ZJpUERuoI8kj nA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5p6gg5mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:13 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHh6bg002288;
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0pkfua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJ9OE41943336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F0825807C;
	Thu, 16 May 2024 18:19:07 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E57358072;
	Thu, 16 May 2024 18:19:07 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:07 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 00/40] fsi: Add interrupt support
Date: Thu, 16 May 2024 13:18:27 -0500
Message-Id: <20240516181907.3468796-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QJkshgFbOWAlRIPiYzVmd7sTJFRCCRnr
X-Proofpoint-ORIG-GUID: QJkshgFbOWAlRIPiYzVmd7sTJFRCCRnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

This series primarily adds interrupt support to the FSI driver subsystem.
There are a number of related changes and fixes. Firstly, the FSI clocking
model is improved to allow FSI engine drivers to obtain real clock rates
and calculate appropriate clock dividers. Secondly, much master code is
made common through the use of a regmap to access master registers. This
will prove more useful as additional FSI master drivers are added. Lastly,
interrupt support is added to the FSI I2C driver.

Changes since v2:
 - Add several patches to fix additional issues found during testing
 - For local bus frequenccy, use cfam clock-frequency property instead of
   hardcoded master local bus divider
 - Change default local bus clock divider from 8 to 2
 - Zero the regmap_config structure in the common FSI initialization
   function
 - Add AST2700 direct AHB access of master registers
 - Remove slave interrupt handler since it's not used yet
 - For I2C driver, change minimum clock div to 3, use DIV_ROUND_UP instead
   of re-implementing it, and use better logic for checking for
   clock-frequency property
 - Add detail to I2C driver formatting change

Eddie James (40):
  fsi: hub: Set master index to link number plus one
  fsi: Move slave definitions to fsi-slave.h
  fsi: Fix slave addressing after break command
  fsi: Use a defined value for default echo delay
  fsi: Calculate local bus clock frequency
  fsi: core: Improve master read/write/error traces
  fsi: core: Add slave error trace
  fsi: core: Reset errors instead of clearing interrupts
  fsi: aspeed: Add AST2700 support
  fsi: core: Add slave spinlock
  fsi: core: Allow cfam device type aliases
  fsi: core: Add common regmap master functions
  fsi: core: Disable relative addressing during scan
  fsi: hub: Use common initialization and link enable
  fsi: aspeed: Use common initialization and link enable
  fsi: aspeed: Remove cfam reset sysfs file in error path and remove
  fsi: aspeed: Refactor trace functions
  fsi: aspeed: Don't clear all IRQs during OPB transfers
  fsi: aspeed: Only read result register for successful read
  fsi: aspeed: Switch to spinlock
  fsi: aspeed: Disable relative addressing and IPOLL for cfam reset
  fsi: aspeed: Use common master error handler
  fsi: core: Add interrupt support
  fsi: aspeed: Add interrupt support
  fsi: hub: Add interrupt support
  i2c: fsi: Calculate clock divider from local bus frequency
  i2c: fsi: Improve formatting
  i2c: fsi: Change fsi_i2c_write_reg to accept data instead of a pointer
  i2c: fsi: Remove list structure of ports
  i2c: fsi: Define a function to check status error bits
  i2c: fsi: Add boolean for skip stop command on abort
  i2c: fsi: Add interrupt support
  fsi: hub master: Reset hub master after errors
  fsi: core: Add master register read-only sysfs
  fsi: core: Add slave register read-only sysfs
  fsi: i2cr: Adjust virtual CFAM ID to match Odyssey chip
  fsi: core: Add different types of CFAM
  spi: fsi: Calculate clock divider from local bus frequency
  ARM: dts: aspeed: P10 and tacoma: Set FSI clock frequency
  ARM: dts: aspeed: P10: Bump SPI max frequencies

 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     |  32 +-
 .../boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   1 +
 .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |  17 +-
 .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi |  16 +-
 drivers/fsi/Kconfig                           |   2 +
 drivers/fsi/fsi-core.c                        | 888 +++++++++++++++---
 drivers/fsi/fsi-master-aspeed.c               | 431 +++++----
 drivers/fsi/fsi-master-hub.c                  | 244 ++---
 drivers/fsi/fsi-master-i2cr.c                 |   2 +-
 drivers/fsi/fsi-master.h                      |  33 +
 drivers/fsi/fsi-slave.h                       | 118 +++
 drivers/i2c/busses/i2c-fsi.c                  | 463 ++++++---
 drivers/spi/spi-fsi.c                         |  33 +-
 include/linux/fsi.h                           |   3 +
 include/trace/events/fsi.h                    | 190 ++--
 include/trace/events/fsi_master_aspeed.h      |  86 +-
 include/trace/events/i2c_fsi.h                |  45 +
 17 files changed, 1917 insertions(+), 687 deletions(-)
 create mode 100644 include/trace/events/i2c_fsi.h

-- 
2.39.3



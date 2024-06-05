Return-Path: <linux-i2c+bounces-3857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4198FD89D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C40E2876E3
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A44E16ABCE;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rBm3Uu5S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5B016190A;
	Wed,  5 Jun 2024 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622622; cv=none; b=Cp+bh/US97KH8BNGohOEQ9ARbEOVL00yZGmRbswXKsfVU39ABnqx/I9v0mjRofc+26UQM4zFl91HTB2TJzMIxLNIHu4DvL+pYd82HTMjzo62WEI2JW/3pCmUZF26l1IrBQVNoNOE5CxFNQcdUb6JPj/Lwz1CvY5pxgAv1pYaYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622622; c=relaxed/simple;
	bh=ikiTlC5DbW+9w/JTL0rl4Vnhj+2+SHMXuhnMGtLP84c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gqop9V5r1wNtwr4y63wP+xp5HMtjPT3bxZwr9jTuw1lA1YQrTTgu9LQNTcSgRF/bo3WTzKoO2C9ws+UZGGbYiov9g/7qoT8uvA5/VlUCOIA08Kiv6tSWfkagHc68a3jiXQyrc7Nz4EbrLBSjNTvq6heX495jgbZpH8KoMXW1deE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rBm3Uu5S; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455K7DWI006841;
	Wed, 5 Jun 2024 21:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : message-id : mime-version :
 subject : to; s=pp1; bh=xCm0+YRnt5KSLJvpEJFGcfGKqyndMMqxkk4ixOrcDpE=;
 b=rBm3Uu5SBxkNYRdlTt/bPol30TmmadBEFx0FAIRAA3pmmRH4lLsM0nNpX9NHwgJsdChs
 lkR2pJV8QJC6wQIlc/DzAJogqs6+qiEQwmAicTzZDe7t8tYWPWKXawDEkK1z3S3cyfbZ
 /Eca8UY02g07GhOPn3u12Ns+VZASw5GOzmZyhPR32m+Vchyy66teeidvYgjUGA/acDyg
 n6YTlrti/etqN2u4ovVkej7q8t2qvyhnIgsonDUk4m6E8qmm1x99BW3RqEG4Es6hN1wB
 fEUyh8ZzSdx27/Ce9NixOInRFV7oVXTBawX4PEUuOXeGg4kOeK9ifYfxS8wDcMfnyuTI yQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxjmr8yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:17 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IRk56008458;
	Wed, 5 Jun 2024 21:23:16 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:16 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LND9q57540998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:15 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21EBF58069;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D450258066;
	Wed,  5 Jun 2024 21:23:12 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 00/40] fsi: Add interrupt support
Date: Wed,  5 Jun 2024 16:22:32 -0500
Message-Id: <20240605212312.349188-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LOhfTrQLpVZ01E9a_1TLojXq6bWSBFUb
X-Proofpoint-ORIG-GUID: LOhfTrQLpVZ01E9a_1TLojXq6bWSBFUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050160

This series primarily adds interrupt support to the FSI driver subsystem.
There are a number of related changes and fixes. Firstly, the FSI clocking
model is improved to allow FSI engine drivers to obtain real clock rates
and calculate appropriate clock dividers. Secondly, much master code is
made common through the use of a regmap to access master registers. This
will prove more useful as additional FSI master drivers are added. Lastly,
interrupt support is added to the FSI I2C driver.

Changes since v3:
 - Fix compile warnings due to non-static local function and incorrect use
   of handle_irq_desc

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
 drivers/fsi/fsi-slave.h                       | 117 +++
 drivers/i2c/busses/i2c-fsi.c                  | 463 ++++++---
 drivers/spi/spi-fsi.c                         |  33 +-
 include/linux/fsi.h                           |   3 +
 include/trace/events/fsi.h                    | 171 ++--
 include/trace/events/fsi_master_aspeed.h      |  86 +-
 include/trace/events/i2c_fsi.h                |  45 +
 17 files changed, 1897 insertions(+), 687 deletions(-)
 create mode 100644 include/trace/events/i2c_fsi.h

-- 
2.39.3



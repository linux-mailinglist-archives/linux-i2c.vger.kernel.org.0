Return-Path: <linux-i2c+bounces-1771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B11856FD5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8A8E1C214EF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB37B145348;
	Thu, 15 Feb 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EmKLQGdy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2871420B8;
	Thu, 15 Feb 2024 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034903; cv=none; b=pqviL8jqoJs/CFs8DvJgwGN4rPVA1pGw7v2x45zG4E8/E85nN6BPAXe9DjOqP3swqC/2sxpHgZfuFXKpqDYWCPbHfzEa343wWp1JHZK+2VzARrDOA3SzUrKVhz1WrEDBlbqpqJ9wzuLIyXnjxiRpv3EblDSs2mAhvHUPruyk1wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034903; c=relaxed/simple;
	bh=jK0WN05HRYLD6LUs0wfM9Y6pDXPMZjoGHEJ0pxKMgzU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=THT5rRSqqkYIM5rUhBc+kbqnbjro2jN/TnM9nSh//Vhua4padkcIjUu1QIgRp6npQVkb88Rw6ET5WpU+vHA57MmQt3FH7EKI/KPTaR9MdoST8kGQgpoRzRzQBPfEfZlqPrV45LaXUDBtuYr8JDoWTWLOS29KNrzBoHLJxOfq8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EmKLQGdy; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLoM7N002178;
	Thu, 15 Feb 2024 22:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ti+vasKVUZQ1CgAe9GPm+P7+NUBFvUgZB+fHIsDLLfs=;
 b=EmKLQGdyhKXnh1KZsy6vgnySrnjBgkDBApiDoBhdfkVGzWzbKPKKADAxf5gTw9yz6gAz
 V4el22B+z/U6PU7T6PspCyDEknaJ+LobvIq1XwHm72t5+5RAMg2iunHtOBcqE/jZNqJU
 bFssyKKWIhsOLHsmju+jswx6xnegv9Ar2cI5A4DiFBF2F799zmjQFE+rNxDVJCsLpN/F
 1/tJ1sSgxYulxJWg8t/06aG6WsCtwglrhlg00ucXBr4ABV2IRf2hu3e9Ve/pzk9OA3oP
 dCZYMwBwU02twvhwoLj7uSeLSgxpDXnPotLyrgULVVaBzyadJFq5gtubB7A9eVF7k32N 7Q== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9s0tjy23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:06 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FKU3Qx010060;
	Thu, 15 Feb 2024 22:08:05 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm780n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM82Ep28377632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:04 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09A6A5805A;
	Thu, 15 Feb 2024 22:08:02 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B24245806A;
	Thu, 15 Feb 2024 22:08:01 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:01 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 00/33] fsi: Interrupt support
Date: Thu, 15 Feb 2024 16:07:26 -0600
Message-Id: <20240215220759.976998-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4CT9BIZ8st8WKKVU5iDpkiYHOssifd2b
X-Proofpoint-ORIG-GUID: 4CT9BIZ8st8WKKVU5iDpkiYHOssifd2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=604 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

This series primarily adds interrupt support to the FSI driver subsystem.
The series first improves the clocking model in the FSI core to provide
real clock rates to the engine drivers. Then there are various quality,
trace, and organizational improvements.
Another substantial part of the series is to make some master code common
through the use of a regmap to access master structures. This will prove
more useful as additional FSI master drivers are added.
Finally, interrupt support is added to the I2C driver as an alternative to
polling.

Eddie James (33):
  dt-bindings: clock: ast2600: Add FSI clock
  clk: ast2600: Add FSI parent clock with correct rate
  fsi: Move slave definitions to fsi-slave.h
  fsi: Improve master indexing
  fsi: Use a defined value for default echo delay
  fsi: Expose master-specific local bus clock divider
  ARM: dts: aspeed: p10 and tacoma: Set FSI clock frequency
  fsi: core: Improve master read/write/error traces
  fsi: core: Add slave error trace
  fsi: aspeed: Add AST2700 support
  fsi: core: Add slave spinlock
  fsi: core: Allow cfam device type aliases
  fsi: core: Add common regmap master functions
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
  ARM: dts: aspeed: FSI interrupt support
  i2c: fsi: Calculate clock divider from local bus frequency
  i2c: fsi: Improve formatting
  i2c: fsi: Change fsi_i2c_write_reg to accept data instead of a pointer
  i2c: fsi: Remove list structure of ports
  i2c: fsi: Define a function to check status error bits
  i2c: fsi: Add boolean for skip stop command on abort
  i2c: fsi: Add interrupt support

 .../boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   1 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   4 +
 .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |   3 +
 drivers/clk/clk-ast2600.c                     |   7 +-
 drivers/fsi/Kconfig                           |   2 +
 drivers/fsi/fsi-core.c                        | 528 ++++++++++++++----
 drivers/fsi/fsi-master-aspeed.c               | 391 +++++++------
 drivers/fsi/fsi-master-hub.c                  | 231 ++++----
 drivers/fsi/fsi-master.h                      |  27 +
 drivers/fsi/fsi-slave.h                       |  89 +++
 drivers/i2c/busses/i2c-fsi.c                  | 464 ++++++++++-----
 include/dt-bindings/clock/ast2600-clock.h     |   1 +
 include/linux/fsi.h                           |   3 +
 include/trace/events/fsi.h                    | 190 ++++---
 include/trace/events/fsi_master_aspeed.h      |  86 ++-
 include/trace/events/i2c_fsi.h                |  45 ++
 16 files changed, 1432 insertions(+), 640 deletions(-)
 create mode 100644 include/trace/events/i2c_fsi.h

-- 
2.39.3



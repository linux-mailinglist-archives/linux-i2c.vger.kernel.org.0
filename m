Return-Path: <linux-i2c+bounces-1980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51297867CF8
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F137B2D22E
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BD512EBE9;
	Mon, 26 Feb 2024 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="j2QOVcYI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0B12CD99;
	Mon, 26 Feb 2024 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966423; cv=none; b=aMkUUqBEo1E+PNveFJvgDnLYaYIzFaDaBLB3YQRnQaBW9WzNf1bigH9IbXCbe0htvm8/zQL4p5g+ihS1BR2G1VgEUSa6mCvB2mMOf0ES0SwIyR719WuzfRYHEto39tJu3pLBhIscwsKL07I/q7K3/eTQm8HW27kc25CtJGVRr+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966423; c=relaxed/simple;
	bh=GPiAowAmMEMhPkJn5Ss0j6j7Qx2fIyPU1UVSLH6JwGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RROggbgrUwHmtV87So4z4/wCn0B9lRrvkbQpddRQMoXiHsRSYknrf4mqP24eeWc44W+A+yCNNBQyC4nX58i30AVcucJhxUF8E+trJ0BFigZy/GLgwLWB+u7APvaXFflG1O8kGmTqDBWZFUapYH7AiPwnGQp5TFvlRxhg9iZLyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=j2QOVcYI; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG8GU3030222;
	Mon, 26 Feb 2024 16:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=abNSU3Tal16ECEcQzrf1EoGd9XJX5pEzlz0oG6bHSts=;
 b=j2QOVcYIe0EDSqfGSyqVBm6gEKmZns6hImMqALgcrM19MCQeNwips6WBeZ9khtpzoWQf
 MeNIU9hdV7VptHuetqdiwZeDlqZvhM4p4E7Cw+umUa6M5tL3p7/JuE5IpBI4yZmc+NlB
 FMVQ9p2ZyE9XjIcB428yq8xeB4qI1BSSZRKMPkDljh/jbqNc/tHyqK4AFlLevYiQ7v1K
 fd3w2Gvv9uKKKtIo00jASZ+4FM1Py8e6gnM6uCFwNgKwnId8bXUSmmYVxHwBRclHcYMD
 FsINR2WwxC06t4Jwwnt2YH4Kz/AtNRD8StoEBhEvL4gtjecOmKnVer9zFDmW4EN0b+ZT Qw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvp6bjs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFoGTv008827;
	Mon, 26 Feb 2024 16:53:25 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftstaran-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:25 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrMnr40370462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:25 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE82C58059;
	Mon, 26 Feb 2024 16:53:22 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F352258043;
	Mon, 26 Feb 2024 16:53:21 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 00/31] fsi: Interrupt support
Date: Mon, 26 Feb 2024 10:52:50 -0600
Message-Id: <20240226165321.91976-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h3Lh_fePyoB59sxR-RP8vfMG7iakkxUi
X-Proofpoint-GUID: h3Lh_fePyoB59sxR-RP8vfMG7iakkxUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 adultscore=0 mlxlogscore=861 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260128

This series primarily adds interrupt support to the FSI driver subsystem.
The series first improves the clocking model in the FSI core to provide
real clock rates to the engine drivers. Then there are various quality,
trace, and organizational improvements.
Another substantial part of the series is to make some master code common
through the use of a regmap to access master structures. This will prove
more useful as additional FSI master drivers are added.
Finally, interrupt support is added to the I2C driver as an alternative to
polling.

Changes since v1:
 - Remove clock patches since those have been merged
 - Add AST2700 binding documentation
 - Fix build warning

Eddie James (31):
  fsi: Move slave definitions to fsi-slave.h
  fsi: Improve master indexing
  fsi: Use a defined value for default echo delay
  fsi: Expose master-specific local bus clock divider
  ARM: dts: aspeed: p10 and tacoma: Set FSI clock frequency
  fsi: core: Improve master read/write/error traces
  fsi: core: Add slave error trace
  dt-bindings: fsi: Add AST2700 compatible
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
  i2c: fsi: Calculate clock divider from local bus frequency
  i2c: fsi: Improve formatting
  i2c: fsi: Change fsi_i2c_write_reg to accept data instead of a pointer
  i2c: fsi: Remove list structure of ports
  i2c: fsi: Define a function to check status error bits
  i2c: fsi: Add boolean for skip stop command on abort
  i2c: fsi: Add interrupt support

 .../bindings/fsi/fsi-master-aspeed.txt        |   2 +-
 .../boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   1 +
 .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |   1 +
 drivers/fsi/Kconfig                           |   2 +
 drivers/fsi/fsi-core.c                        | 528 ++++++++++++++----
 drivers/fsi/fsi-master-aspeed.c               | 391 +++++++------
 drivers/fsi/fsi-master-hub.c                  | 231 ++++----
 drivers/fsi/fsi-master.h                      |  27 +
 drivers/fsi/fsi-slave.h                       |  89 +++
 drivers/i2c/busses/i2c-fsi.c                  | 464 ++++++++++-----
 include/linux/fsi.h                           |   3 +
 include/trace/events/fsi.h                    | 190 ++++---
 include/trace/events/fsi_master_aspeed.h      |  86 ++-
 include/trace/events/i2c_fsi.h                |  45 ++
 14 files changed, 1421 insertions(+), 639 deletions(-)
 create mode 100644 include/trace/events/i2c_fsi.h

-- 
2.39.3



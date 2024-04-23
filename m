Return-Path: <linux-i2c+bounces-3052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A30FB8ADE7D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585B71F233FF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 07:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B6B47A74;
	Tue, 23 Apr 2024 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="FdWqmU2Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55F46522;
	Tue, 23 Apr 2024 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713858388; cv=none; b=BmpF33f5AEtynZmUX23DS8epGstQahQn8GNCm0JXlz58iGAV0VRXpO1W5izkCl+MtvCxVkXUwaPRbRepDFulTBqoRUSZzoAcpo6KKzRba8q5O2BN2LsH9V5v2LRsqdyyvBK/lTEUx0QGlkAuSAD41qm8tIruJf4Tb2lXEiXNkzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713858388; c=relaxed/simple;
	bh=nrbVHp7WcGes1/I17K8jtWjRx8wXtHrsdB3cTtXXucI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Poz7f2ZvS4nj4hjACIfEB1DC8kbE7FdBJ29wCjSdDuE8YiooR+rszjAsjZt8QkH9wzagrDTcQa1bARP2daGBQ9Q+NaQOHiT6TcOQbj6nZoEKIR0bcbirWfCkyK5nXbx0jvh412Rfver6SG1U0UpzI1cmMa5F3UGZm80C5fW0JPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=FdWqmU2Y; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N7WtSn011238;
	Tue, 23 Apr 2024 00:46:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pfpt0220; bh=nZt4sG0p
	WJbADgeZPap+HSfcuHzCsdJ7cj7sRUwKnLU=; b=FdWqmU2Y2bRQmitU5ksCGFPp
	sTTBaF9Qqm/6s2BT6lPGwc51sVT1yvSdDoDt8bODWQ9C4haiX0bQpTAGma8Y/8y1
	zLjh2n2+p+nllpkxNln71J3YcycXjkHYlpy07q4Dp5EEiflQl+UbwSlFU/bKSGg/
	w4NIKceboeG5GKkdO/nY85uZlLuWgpLzf5XzcW1Q77P37gO854fyq/7VYSyRXRHk
	ImeY0TfPt19sDye/M5o4p+7PXMMF7MeOBez+klI6C2+3XMZYdpIcMi0ExVGhQ4wO
	H9USow3iGBv0+/7W2VatczZ4il6d/+f0PmjGCTRYVThLp44aTqG99nk0cMG9gA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3xnngcv9jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 00:46:22 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 23 Apr 2024 00:46:21 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 23 Apr 2024 00:46:21 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 1FECB3F7051;
	Tue, 23 Apr 2024 00:46:21 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v7 0/5] i2c: thunderx: Marvell thunderx i2c changes
Date: Tue, 23 Apr 2024 00:46:03 -0700
Message-ID: <20240423074618.3278609-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: O6Kv7VfuL2sSuS526hLIECib5JsIBtsJ
X-Proofpoint-ORIG-GUID: O6Kv7VfuL2sSuS526hLIECib5JsIBtsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_04,2024-04-22_01,2023-05-22_02

The changes are for Marvell OcteonTX2 SOC family:

- Handling clock divisor logic using subsytem ID
- Support for high speed mode
- Handle watchdog timeout
- Added ioclk support

Changes since V6:
- Split the second patch into two patches by separating
  out the cleanup changes related to renaming of macros.

Changes since V5:
- Added "bitfield.h" header file in first patch to
  resolve implicit declaration issue of FIELD_GET
  reported by kernel test robot

Changes since V4:
- Proper alignment
- Used bitops helpers as required
- Patch description made more clear to understand
- Removed unrelated code

Changes since V3:
- Removed the MAINTAINER file change from this series
- Modified the commit message to include more details
- Minor changes such as adding macros, comments modified
  to have more detail as required

Changes since V2:
- Respinning the series, no functional change
- Added Marvell member in MAINTAINERS file
- Added macro OTX2_REF_FREQ_DEFAULT for 100 MHz

Changes since V1:
- Addressed comments, added defines as required
- Removed unnecessary code
- Added a patch to support ioclk if sclk not present in ACPI table

Piyush Malgujar (2):
  i2c: octeon: Add platform prefix to macros
  i2c: thunderx: Adding ioclk support

Suneel Garapati (3):
  i2c: thunderx: Clock divisor logic changes
  i2c: thunderx: Support for High speed mode
  i2c: octeon: Handle watchdog timeout

 drivers/i2c/busses/i2c-octeon-core.c     | 141 ++++++++++++++++-------
 drivers/i2c/busses/i2c-octeon-core.h     |  53 +++++++--
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  13 ++-
 3 files changed, 152 insertions(+), 55 deletions(-)

-- 
2.43.0



Return-Path: <linux-i2c+bounces-2724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C313D89558D
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 15:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 002401C21346
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 13:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F63884FCC;
	Tue,  2 Apr 2024 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="awtvOC0Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5684A52;
	Tue,  2 Apr 2024 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065240; cv=none; b=PGYA6lCYO1/Nmmcv/IgrlFSrzQY5swyOXCqgeRSiB8ODlrfy7xQVkgLYO2UVyFBg1bQ+0zUatJ6G2wMmd5C7iDehvzp0AepK9vbNBTdFlwBuNku00ED0PFtlw1PE75cmat/Mjb7zWAw04SGUnND/6b+jDJER7hveMPtzPxOZGbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065240; c=relaxed/simple;
	bh=VizWeoyV8fCmRIIUh5AFwhFeslnWkcNQX9cGp4lK4H0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VBcmEROX7VBLrGrpGGIPqDVVGutebcSlQ2ShgnxBLe2DGFIiDeMd530huKMK4pskyyg2x3kpmmMvjLD1+NZLTX+XJlVjITDlO62tltTeHc+vNtKUqrixnedja0K4BhK+yNp8AuuO2J33RXx9Qrj6FKoliOv/xYJYO9Q0kkFeesI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=awtvOC0Y; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432C6uPH015314;
	Tue, 2 Apr 2024 06:40:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pfpt0220; bh=FYRuLBeP
	Xm7LtfNGkqgUCLXwlzLbnGd18nDq4oZ216w=; b=awtvOC0YARYMDiqWBmRsvUsi
	cJd59di9Ef76crgdft5VuIOunAEql4y08OyBy1cSI9l7m0n2CfWyytFxjPVNXlwp
	9fjmLLkmaewYO8VmFUiMKvrCnLbY7UbiFzBYPsWsALiARZ0uLYEJB4fD17ws6UWZ
	hmWtJ9n1/kMl5CDC/GeE5z3xtHFSIqska2IdrZQs/2OgCkRPVecpTNA/eb6tgJwA
	GtNx42CJPpbuKA9MNsZrWIigS0aA2xXnGUIs6AyftrHRURlzpizAOG35CvitCG9P
	3UtMMCp8eFmY1rXjno3/00oeMfzRd1OM+cRDje7/l8Bceb85aZ79KRe9LBGf5A==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3x8hr70c6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:40:24 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 06:40:23 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 2 Apr 2024 06:40:23 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 4E9563F706C;
	Tue,  2 Apr 2024 06:40:23 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v6 0/4] i2c: thunderx: Marvell thunderx i2c changes
Date: Tue, 2 Apr 2024 06:40:10 -0700
Message-ID: <20240402134018.2686919-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Q1mx1mtJXQQBTYmqb45Ssq0N-qhZEHAO
X-Proofpoint-ORIG-GUID: Q1mx1mtJXQQBTYmqb45Ssq0N-qhZEHAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02

The changes are for Marvell OcteonTX2 SOC family:

- Handling clock divisor logic using subsytem ID
- Support for high speed mode
- Handle watchdog timeout
- Added ioclk support

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

Piyush Malgujar (1):
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



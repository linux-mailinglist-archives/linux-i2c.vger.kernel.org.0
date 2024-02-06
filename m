Return-Path: <linux-i2c+bounces-1635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C8384B411
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 12:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55441B20366
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 11:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E145F130AFA;
	Tue,  6 Feb 2024 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="dkhL9U6e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF4D130AF8;
	Tue,  6 Feb 2024 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219862; cv=none; b=WtK803WDHqSm74t68Sawulloh00BNxE43M7s3v9fJzOecGAp2V5FzJTFUS7I0GBEGvtl0pDuX2OGce+gDSKqthqnxfiQ0iBA7Y5mIXBETDO1TK47uxyndDzAW/P667pVDOIxGP7gR+Bd3A4FU/qGomK0dBZQEid18rJ7f2dUkVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219862; c=relaxed/simple;
	bh=JiHUzGCGdNlI0qM30tQUNdwtSxzNYJ6isxFCjHmc1rI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mZX65SWZBX6YtyOgsRtyeuGyXeouIYY2qWFnYl+MTB1RlMOBIOC1Pee391k/P5iQoUWPBPzsIvyLLzh0CgXQlKOVf2uyry2zmEoGaF8jHUAOiM9T1Wg8sNNUzyI1KmxI0zgV8vnSGxI8FSjhAmIkGsHjcI6SvQzhbh/PgM/q4n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=dkhL9U6e; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416BBNGc024712;
	Tue, 6 Feb 2024 03:44:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pfpt0220; bh=kr7xG/2Q
	+F1U3yJoVNY3w7mWY92W324kgpeXAS7zCnE=; b=dkhL9U6eCaSsffSPUr91pW3d
	I490GczqLOkW2NKc/o23cGYEVK9A1tBzBd4Qjl4X9YuuyDP+sMNuleMzqmJUCRt1
	xy18/rhadT3cPCJTVmvOg6AVQ6YHSFiIPuC4TnKZVlwpS3z90PsI0yWt104KQrPk
	9K0kozJLArh30TezRljbcGstFoE/y9zRKIU4pw/9LNV/LDlxuRBsiu9w/4pztAKC
	3+OZYTlrjWZpHHL8wbwVLsPGKNumYj1A/SZ6Q/kzRWaRfCoRco7ePrClh1xZwBpA
	wPgtGAkdluqTIfU9CHMVdeQblHz6366wswVKZySSa4f5HJZ7JvCg5o0IgzrnFA==
Received: from dc5-exch02.marvell.com ([199.233.59.182])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3w38y4hyxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 03:44:18 -0800 (PST)
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 6 Feb
 2024 03:44:16 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Tue, 6 Feb 2024 03:44:16 -0800
Received: from localhost.localdomain (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id B27203F708E;
	Tue,  6 Feb 2024 03:44:16 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v3 0/4] i2c: thunderx: Marvell thunderx i2c changes
Date: Tue, 6 Feb 2024 03:43:45 -0800
Message-ID: <20240206114349.32197-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Pgtj0RQRZnOP07SJzP3LU6DmkOqy5OXZ
X-Proofpoint-GUID: Pgtj0RQRZnOP07SJzP3LU6DmkOqy5OXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_04,2024-01-31_01,2023-05-22_02

The changes are for Marvell OcteonTX2 SOC family:

- Handling clock divisor logic using subsytem ID
- Support for high speed mode
- Handle watchdog timeout
- Added ioclk support

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
  i2c: thunderx: Add support for High speed mode
  i2c: octeon: Handle watchdog timeout

 MAINTAINERS                              |  1 +
 drivers/i2c/busses/i2c-octeon-core.c     | 96 ++++++++++++++++++------
 drivers/i2c/busses/i2c-octeon-core.h     | 27 +++++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 23 ++++--
 4 files changed, 117 insertions(+), 30 deletions(-)

-- 
2.42.0



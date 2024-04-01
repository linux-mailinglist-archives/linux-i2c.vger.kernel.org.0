Return-Path: <linux-i2c+bounces-2697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B40893862
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 08:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7AA2B20EF4
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 06:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA185320C;
	Mon,  1 Apr 2024 06:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="aB+6vyJP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FAD10F1;
	Mon,  1 Apr 2024 06:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711953164; cv=none; b=gLArV/w3cfsY06Ao3OckAPYJHKOHuygOetkTI1P5kwefPgelepQUlM9egJnu3IczDjXqLtc/TgmKZ5I7Vi8BDGprNZ5CTKTpoR3bxCyrlpUPZlY+67PvrIfSMK0iWUPDvhILjbJ/UVnGHYzueIl6ZuRXgKbZBT70xZRlNig00E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711953164; c=relaxed/simple;
	bh=Y0wlRiNfYEnQ/mORbguvM+3hsiBEfgRyx8ZvLJgVA2c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kEJLlCGVQeb/HNlgVSWD0MdrNe8q+XsgCSQ6iWa3orD54uNG9qgmKc3089G22gghgzFVGG/2RKcRI1XD99aefBEFXRLZNZHikQ7464hWaRJc961qhUO68l4gDjoO9jG8AGYvQuzNlmoplG2CINkZKkedrDFqcDyiDKoZKuzRQ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=aB+6vyJP; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4311nMTX017725;
	Sun, 31 Mar 2024 23:32:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pfpt0220; bh=9zgvpRcw
	41YrdWjhBgNmQvxxiQ5A/Um3l5NhKwm12VA=; b=aB+6vyJPbXq3FRpKpSR4GFJM
	/V0ZHIQTtS15yz+lgD/gekOjgfseAhidnKcrR87H1j4aWawAnV/9LMjJ+IyMVqDs
	aaHtM0LgNzJUHpcUJtZ+ufY/v3GnCGVQPAn09LxKqmXLqgLl//FIuNY1RTcvhgEF
	ffU4ZNW9BfJrobTyXUW6/Au8NZqH5+Y1lcvXkim3wgUaqMJyg7k9/YjG8VLvSGpl
	gtlDiKkxVJ8eEdjMAgA84fQ/WCmrB3kHe0PtpkfHt8zs5v6jNUEdg4xikNr3pxGR
	/w18JSPhSWKO5mYMz/Mut8WfkM+Rm3u1EQGA+Wd5nw35sYr3Gs/6nktq5UFMSQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3x7kkcgkdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 23:32:39 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 31 Mar 2024 23:32:38 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 31 Mar 2024 23:32:38 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 9C11D3F705D;
	Sun, 31 Mar 2024 23:32:37 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v5 0/4] i2c: thunderx: Marvell thunderx i2c changes
Date: Sun, 31 Mar 2024 23:32:14 -0700
Message-ID: <20240401063229.2112782-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3-xqs7jLmGwIPU0WYoWK3TcgpqlobYAa
X-Proofpoint-ORIG-GUID: 3-xqs7jLmGwIPU0WYoWK3TcgpqlobYAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_03,2024-03-28_01,2023-05-22_02

The changes are for Marvell OcteonTX2 SOC family:

- Handling clock divisor logic using subsytem ID
- Support for high speed mode
- Handle watchdog timeout
- Added ioclk support

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
 drivers/i2c/busses/i2c-octeon-core.h     |  52 +++++++--
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  13 ++-
 3 files changed, 151 insertions(+), 55 deletions(-)

-- 
2.43.0



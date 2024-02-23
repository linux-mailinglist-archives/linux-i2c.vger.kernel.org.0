Return-Path: <linux-i2c+bounces-1940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C05861207
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 13:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C7021C21194
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 12:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B3A7D418;
	Fri, 23 Feb 2024 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="YzF+JLe6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C77C6D4;
	Fri, 23 Feb 2024 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693054; cv=none; b=TtS9HdZGU1SMpUslUkGRDFQXJTV0etIsVrLckd63SmlosHCpDSzk0DCOV5/6k8So3uvG7acBrCz0qL21HI6+Tm14Ekx6WIqEORHxBfM4tAwzN4VEh4WftKH8KQ4+QM7BkYO4bb6jXL1zcsTDdmFggdLXMkLqEouOGr24uYv6si8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693054; c=relaxed/simple;
	bh=YgVPolS1tTZInc8r8s8OfjIcZtnNNyoBT+sxat5WFhM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dq4mz2rFkYpgFNYJnBqJO11ZDMG2PckbtyLDHUAFe86dWa2Nf6HF3xbyO8oXkTRfyppTyxFVxk+4V8io9kzdoL8wvfLNDMONxF3SErSIu6wOEYzbWq+e9Y2x/1Xfl3Ar1D8f8HWNvHcitXwaIEb6bdDeMF9pa+cmu6GVwHDJCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=YzF+JLe6; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N1rK9j005138;
	Fri, 23 Feb 2024 04:57:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pfpt0220; bh=lmAULftK
	YPhk58xO0vm8WFR29Q2Sb0lXgcVUSkRmH5k=; b=YzF+JLe6Cjm/YRH1FRFJFSac
	dI8uy8LaD+iZSKbtmuwWt4X+6Avq2Y45rtSI+kJFo54c6SIE7oXYnaXsQ2TGRECO
	+i1Wh2o27mB/bsLtFe7zESRdOzAPmn/WUbLNVwWkm52tDAwBoZrU23PGZclPyZCL
	x31DkN4YBXZ9tMjhmQgFyumAybdUb5J63l2Q5HyGA/2DudTPLcayKxFH+9rw3MMb
	Snk6UKuGBoHvNEd1Q810N3Xcj4QsMqImO2mV1wShkgL0E4oBFux4qR1Iyg/lb58s
	3BH9dmiWScOraqngNJ3H6slXNSTJvdx6JOM0dNsFtuvLmjcbqT76PHshOkX/BA==
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3wej3j9rt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 04:57:30 -0800 (PST)
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 23 Feb
 2024 04:57:28 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Fri, 23 Feb 2024 04:57:28 -0800
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id F0AF73F70CA;
	Fri, 23 Feb 2024 04:57:27 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andi.shyti@kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v4 0/4] i2c: thunderx: Marvell thunderx i2c changes
Date: Fri, 23 Feb 2024 04:57:21 -0800
Message-ID: <20240223125725.1709624-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JLK29jR__ArX5I1zJidJOH-6yIPOf2HX
X-Proofpoint-ORIG-GUID: JLK29jR__ArX5I1zJidJOH-6yIPOf2HX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02

The changes are for Marvell OcteonTX2 SOC family:

- Handling clock divisor logic using subsytem ID
- Support for high speed mode
- Handle watchdog timeout
- Added ioclk support

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
  i2c: thunderx: Add support for High speed mode
  i2c: octeon: Handle watchdog timeout

 drivers/i2c/busses/i2c-octeon-core.c     | 105 +++++++++++++++++------
 drivers/i2c/busses/i2c-octeon-core.h     |  25 ++++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  23 +++--
 3 files changed, 123 insertions(+), 30 deletions(-)

-- 
2.43.0



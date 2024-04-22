Return-Path: <linux-i2c+bounces-3032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E28AC2CF
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 04:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8710F1C20A5A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 02:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB8F525E;
	Mon, 22 Apr 2024 02:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="x+REdcI/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277628FC;
	Mon, 22 Apr 2024 02:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713754335; cv=none; b=ZaeabtBenCPCKAR2ZqpIRfnqnHRmdK6cRXych1Mk72SSsP+Y4T4BZ7etNAw8MX9acNZQLuC0SPTL3+4meR9liUoOLryZrbv5QK610F0wk640VZ/CmR3T+pDlOsbfFrKNxSFqf2baTtnr0JB3c7xR8KaXQXcArlcIB9LkJ9Oegms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713754335; c=relaxed/simple;
	bh=kYnipLecmECsJM+EauJ/zTIRkOBOC1+LqCunGvsDMQ4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kvLaaTwiVV3/R3GlSJ0uRjaVvM1gIAOnEdysO5Th9YbZ9E36VLs8BmCZrwogER4e1HeYJnAHRS0BJRhQkO3ddneK1MpdtgnWi7fwM8zk37e2D7zjNrhKL8ZjlYL4TSGxfngOa0bs8dAJkV1CCbYvADauZik0dxGpC+E6cUsxMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=x+REdcI/; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43LJ7C5k031270;
	Sun, 21 Apr 2024 22:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=DKIM; bh=jp+RhqyLEVtf
	pqA1HrRh/9dQjl3Jm1tf02bRUjsuNN4=; b=x+REdcI/O0Upx6flwe9iB7ODpLbc
	J4raDaYXlLp36ijIViql2DRt/eu5DXOufbCYzMx1Gm8nut7UoJ/BcU4WS/lqV9pr
	+XzjCmNFSs0r6+BVKxOIu16AAQ2pV8YdX649snN7MQ8Ujg9YL7K5E72tNSG6IR6n
	YGc5Sx3seg2H9vC48clwD1XO0AJd/UJDQIGs4ShaDD8WV6B46kOKbS4F6CpJa0k+
	NGAE7bv3vqFW6PXs3UBOI979VMB9f+9FASiVCZBZ9UOxfwLUPy3jIFzpMPtrVwh1
	RjcddsOPJYlfABzdFLaDjAAo4A1mSV7fupNCbg9x33WQ9KesW246ojZvew==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3xmam24ff8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 Apr 2024 22:51:47 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 43M2pkfW065361
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 21 Apr 2024 22:51:46 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Sun, 21 Apr
 2024 22:51:45 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 21 Apr 2024 22:51:45 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43M2pS5O027847;
	Sun, 21 Apr 2024 22:51:31 -0400
From: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC
 Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jose Ramon San Buenaventura
	<jose.sanbuenaventura@analog.com>
Subject: [PATCH v2 0/2] Add adm1281 support
Date: Mon, 22 Apr 2024 10:51:21 +0800
Message-ID: <20240422025123.29770-1-jose.sanbuenaventura@analog.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: _tQUQq0MwPe76iKwoZFngp733zacXhWD
X-Proofpoint-ORIG-GUID: _tQUQq0MwPe76iKwoZFngp733zacXhWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-21_22,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220013

This patch removes the extra case added in the adm1275_read_byte_data
for STATUS_CML reads. Upon checking, the reads for the STATUS_CML register
is already handled in the pmbus_core. 

It was also clarified and agreed upon that any other actionable steps
involving the STATUS_CML error flags should be added in the pmbus_core
and not on the specific chip driver.

Jose Ramon San Buenaventura (2):
  dt-bindings: hwmon: adm1275: add adm1281
  hwmon: pmbus: adm1275: add adm1281 support

 .../devicetree/bindings/hwmon/adi,adm1275.yaml     |  4 +++-
 Documentation/hwmon/adm1275.rst                    | 14 +++++++++++---
 drivers/hwmon/pmbus/Kconfig                        |  4 ++--
 drivers/hwmon/pmbus/adm1275.c                      | 11 +++++++++--
 4 files changed, 25 insertions(+), 8 deletions(-)


base-commit: 96fca68c4fbf77a8185eb10f7557e23352732ea2
-- 
2.39.2



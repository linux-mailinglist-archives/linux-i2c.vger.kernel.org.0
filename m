Return-Path: <linux-i2c+bounces-7814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA19BDD6D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 04:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DA4728392F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 03:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95B118FDC9;
	Wed,  6 Nov 2024 03:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="OHssCBSi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2AC18D63A;
	Wed,  6 Nov 2024 03:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730862612; cv=none; b=q9oxaz+TvvupFqkR7ypK0Qz4B5fET6H/qkAKTP9GI4heHEdVxp61l2r+JWMBQXmgUczYcIGaIJTHZXGTIKW/BBvL0yOVm7WzhHChqxLXDSvCT0VL54wZ2bMNmg3TbBAabIi7SYMCEzrY3YlX4cpFCsXlB/a+jKmP6gvwrJ3dH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730862612; c=relaxed/simple;
	bh=6eZ65GPoMgVb9yxX3xjFcyTRt2/rtFyKP28nwsFw4L0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CwKQllidCrBmoWBzPXZm0Lcx/q45EzoZ5yv7XQY/ySCCTR/KTmf+Yrb7YB1IQLUNmnmcn0wFVBUV/2n9pt6EwAfBycz9t2q6V7UGfX4DAO9NJ+UKJf+UErKqEJ2XbQRogRSeb6RLTqIn7q7nrjq2BPTipm3FsFmOWEtPNJRmWlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=OHssCBSi; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6333rh019664;
	Tue, 5 Nov 2024 22:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=MjBSLT7/0Kh3uJWj6Sy8sL6Cwdk
	nLRL7WbWd2y19vIQ=; b=OHssCBSi5YFzhl9IlsU1gj0WXVmx5y8Fa8tWA40/7dF
	f3FRQKcm4pEO07CzBjXEYKJryQEfUXKAT4/EGTInuUtcIBO3pjBsx1DpVilkvIr5
	gjEu4Q6Uni5o22wPRVCq09XfBUrd5P1o+UnYt+aeMDsOHNbP5d8ih3GLWe+exFCk
	XccYbwrw7ERs9HeKISE6wBhTnBjPUdcFuUK7W5J2obTsLJosU8ZBRqfd+9vqgV8i
	KPfySP88tD7EtI9aHfh+G1FitnZKOnEo8gjQ/tNtxTu7boRBMxQBPW7dHtEolWM1
	qkLulffBckLf1JQFNwwwxJpFVCRyv/cZayGw+id2+fQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42qbq359u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 22:09:50 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 4A639n98012172
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 22:09:49 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 5 Nov 2024
 22:09:49 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 5 Nov 2024 22:09:49 -0500
Received: from CENCARNA-L02.ad.analog.com ([10.117.116.147])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4A639R2u010682;
	Tue, 5 Nov 2024 22:09:30 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Yin
	<peteryin.openbmc@gmail.com>,
        Noah Wang <noahwang.wang@outlook.com>, Marek
 Vasut <marex@denx.de>,
        Lukas Wunner <lukas@wunner.de>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
Subject: [PATCH v2 0/2] Add driver for LTP8800-1A, LTP8800-2 and LTP8800-4A
Date: Wed, 6 Nov 2024 11:09:16 +0800
Message-ID: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: fRbfalxhoaMavOyNX3kS6KG08sda516X
X-Proofpoint-GUID: fRbfalxhoaMavOyNX3kS6KG08sda516X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060023

changes in v2:

ltp8800:
  * Added short commit description for LTP8800.
  * Removed scanned addresses.
  * Refactored documentation to unify all chips into a single prefix.
  * Removed unused headers.
  * Removed redundant i2c_check_functionality in probe.
  * Moved regulator configurations directly in ltp8800_info.
  * Used single compatible and device IDs instead of three.

Bindings:
  * Used "adi,ltp8800" instead of three entries.

Cedric Encarnacion (2):
  dt-bindings: trivial-devices: add ltp8800
  hwmon: pmbus: add driver for ltp8800-1a, ltp8800-4a, and ltp8800-2

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/ltp8800.rst               | 91 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 drivers/hwmon/pmbus/Kconfig                   | 18 ++++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/ltp8800.c                 | 63 +++++++++++++
 7 files changed, 183 insertions(+)
 create mode 100644 Documentation/hwmon/ltp8800.rst
 create mode 100644 drivers/hwmon/pmbus/ltp8800.c


base-commit: 30a984c0c9d8c631cc135280f83c441d50096b6d
-- 
2.39.5



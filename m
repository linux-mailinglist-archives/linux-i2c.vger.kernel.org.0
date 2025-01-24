Return-Path: <linux-i2c+bounces-9179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5ADA1B90D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6115B188DBD7
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6A9224B12;
	Fri, 24 Jan 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="cvF5rYjK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E7B2248BD;
	Fri, 24 Jan 2025 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731932; cv=none; b=pAuW1wMpSBUqthRR9zr4+vEOpKske0BgLoMf8w4q46GFl3YWlemXSYcFHV2sUnfdkNJF8TFMC/5UlbhnikxC6YkckVQs3Uo23Y5lu0z5bGsuzQpWi92osjLECB+RPkkU3/kvMa8XbarfGxD5lYTvnyPRJ9lWj9xfuxZMYgvA/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731932; c=relaxed/simple;
	bh=EOStoDTgY/TDnps3ddS9gwSJRPaEkWRLJtPK1KxKU4U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qb3HRV8viafarshDQVxaYiGTS6T/7fSUd2m2m5rsS5e86CELJ0a+SDxPPT1WBnH0af4FO6G6m3pvIPBdO86okwLT3yCwbirM55Om7fbegAyST24QrjSmRGLNoixG+g9xn+zT3+oJAxAHzbX4rlBTq2BvbYSzd6hHV4qXA8c/mNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=cvF5rYjK; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OEn2Dc007140;
	Fri, 24 Jan 2025 10:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=bvh2wuwWygsSWAnp9G5R006O+LV
	vMwrW95fFyf/zGgI=; b=cvF5rYjKFtqLzF/QblFGmPRW+v2cgiNroQtGwn6ojuT
	YWnL8GbYZvu86oglp0cGogFRaCeB6zkEs/tpSIXkdrjwbq3BCiIAv/CxGTKN910z
	XdVdsd7ZY1tScc1OxppNSktY4F449MTcxb97wapNnTUDZJbZaa7oG8nmk+9htDpt
	Tj/QF23s/sLsvb42DM5pkWOQIhhRzRogbQVWnxnhxrN73lJ6AC6bFdpVD5HrXkvo
	qqfKEa1Xmy63L+dQ5qJwmtazerLd5G+ENfgVh//ctiHItYQhEcHk7TYE/PbHRU/Z
	J2zr4SHFJjA/SxvsKwRhceE8PL5h2Q6m6GMWhKypprQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44ccxx04kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:18:19 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 50OFII0F035201
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:18:18 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:18:18 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:18:18 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:18:18 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFHp0M031715;
	Fri, 24 Jan 2025 10:17:54 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Radu
 Sabau" <radu.sabau@analog.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 0/3] Add support for ADP1051/ADP1055 and LTP8800-1A/-2/-4A
Date: Fri, 24 Jan 2025 23:17:43 +0800
Message-ID: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
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
X-Proofpoint-GUID: qPBiYsmxjcdPdQ1N_Kxb3gCYjr7n8WUx
X-Proofpoint-ORIG-GUID: qPBiYsmxjcdPdQ1N_Kxb3gCYjr7n8WUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108

This patch is a continuation of this series:

Link: https://lore.kernel.org/20241120035826.3920-1-cedricjustine.encarnacion@analog.com

which is a combined series from two original patch series for each of the
above family of devices. Both LTP8800 and ADP1051/55 have similar set of
registers. The series was v2 of one and v3 of another. Hence, as suggested,
this patch proceeds to v4 which succeeds the highest.

v4:
  * Removed stray change.
  * Removed wildcards. Used the device names instead.
  * Separate patch for adding regulator support.
  * Removed const keyword from pmbus_driver_info at probe.
  * Added doc entries for LTP8800 in adp1050.rst.

Cedric Encarnacion (3):
  dt-bindings: hwmon: (pmbus/adp1050): Add adp1051, adp1055 and ltp8800
  hwmon: (pmbus/adp1050): Add support for adp1051, adp1055 and ltp8800
  hwmon: (pmbus/adp1050): Add regulator support for ltp8800

 .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 15 +++-
 Documentation/hwmon/adp1050.rst               | 71 ++++++++++++++++--
 drivers/hwmon/pmbus/Kconfig                   |  9 +++
 drivers/hwmon/pmbus/adp1050.c                 | 72 ++++++++++++++++++-
 4 files changed, 156 insertions(+), 11 deletions(-)


base-commit: a76539b293677c5c163b9285b0cd8dd420d33989
-- 
2.39.5



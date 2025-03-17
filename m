Return-Path: <linux-i2c+bounces-9844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81464A63EF9
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 06:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806753AD303
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 05:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3FF21504D;
	Mon, 17 Mar 2025 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="cFCSuqQe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0B01CD2C;
	Mon, 17 Mar 2025 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742187819; cv=none; b=URQgcPIHg5/sLs7kgyYlL/jUF6+RER9laOyH/pZZhiUnj4D0KYqqrISuknOh1XKTR38n/Nq29yONzhtce3u8ROJ6vREg6StIJ1RlgmxAaUzTbG1UT8MJEkHL3jxW9BGeMTfEnDgJeqVek+WM2oPz2tOk6i326UbBD96X4tVsz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742187819; c=relaxed/simple;
	bh=QQOgHAx4bqB/G+0viL5wr8/f/OvbtCr44pgzhVL/Xiw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BCcfI5WWVPqCIcBiqivKEPbs+sOqwTcauEGDIgYnas+uK0HRUHlmXTWi68jvlzWJXVuwsyyHc8CmcuRsn6nCzdQ+5InHUXxc6eKZI3H2PtyUE4A2F+9FOn1hvsCsd+4gYQvuqAdzPQNexgfci52udRd+cTeUQnnfKbjb8vJhIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=cFCSuqQe; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H4jYT0006318;
	Mon, 17 Mar 2025 01:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=9emfpnOu83fm0SBMlmaj/tL4q9H
	x2vMSoYAw+9hGuu4=; b=cFCSuqQeVPL/tmECJ+p+HbF8l1n2fjfN/RDajO6rkRT
	6t3gSvKQ5LRNuOEQXyAB2YfJRqx/TqMBoh8J9cFZfvBY5xfKk+9thXjR4wSFmfjy
	l8+w2UFO6O7ywujPrVHAsLLQ7miuh7Yn89GwjWcxhbgbXlFpYx485lh/QtJY5OPc
	uRZ8b1LTSN4XY0+AEZQ5L86BnhNCcE24nZqC5wGeOsvKgaC8p1wCRmmmHKxpD+ZQ
	+chtcOpaRCejy7Mnj1yiKAtTPl6R3JaLqsywMc0vGD6K4rsKZE/BzesV6F3um6N+
	OnW8LqGrmQySQZ4TAt4ztA8n1B1UqMkc215DzF6I1WQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45ed0ag1v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 01:03:06 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 52H535QG044473
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 01:03:05 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 17 Mar
 2025 01:03:05 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 17 Mar 2025 01:03:05 -0400
Received: from analog.ad.analog.com (KPALLER2-L03.ad.analog.com [10.117.223.28])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52H52jZC026775;
	Mon, 17 Mar 2025 01:02:48 -0400
From: Kim Seer Paller <kimseer.paller@analog.com>
Subject: [PATCH 0/3] Add support for LT7170 and LT7171 Regulator
Date: Mon, 17 Mar 2025 13:02:24 +0800
Message-ID: <20250317-hwmon-next-v1-0-da0218c38197@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCs12cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nz3Yzy3Pw83bzUihJd00STVKPExFQDA9MUJaCGgqLUtMwKsGHRsbW
 1AHbYulBcAAAA
X-Change-ID: 20250317-hwmon-next-5a4e2aae005d
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li
	<Frank.Li@nxp.com>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Kim Seer Paller <kimseer.paller@analog.com>,
        Cherrence Sarip <cherrence.sarip@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742187765; l=1038;
 i=kimseer.paller@analog.com; s=20250213; h=from:subject:message-id;
 bh=QQOgHAx4bqB/G+0viL5wr8/f/OvbtCr44pgzhVL/Xiw=;
 b=0qbZIKmrgUzQ2cV12n+noijRyJO9dLTDV9q5OHIXkJcdW1/2KEswaAbxNEjiZv6nd5i4dzYAG
 waUO9JM8oynAwUDWAz0tFcDaGA2f7ZtuDmR85hTHnz3HnInZYqDi/5w
X-Developer-Key: i=kimseer.paller@analog.com; a=ed25519;
 pk=SPXIwGLg4GFKUNfuAavY+YhSDsx+Q+NwGLceiKwm8Ac=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: cMEaapBLlmLIMDYMKeK_5hLTuv1CAz2_
X-Proofpoint-GUID: cMEaapBLlmLIMDYMKeK_5hLTuv1CAz2_
X-Authority-Analysis: v=2.4 cv=A4NsP7WG c=1 sm=1 tr=0 ts=67d7ad0a cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=YBTbsA-Evqry1RJy-_8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=823 mlxscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170034

The LT7170 and LT7171 are 20 A, 16 V, Single- or Dual-Phase, Silent
Switcher Step-Down Regulators with Digital Power System Management.
The I2C-based PMBus serial interface enables control of device functions
while providing telemetry information for system monitoring.

Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
---
Kim Seer Paller (3):
      hwmon: (pmbus/ltc7841) add support for LT717x - docs
      dt-bindings: hwmon: ltc2978: add support for LT717x
      hwmon: (pmbus/ltc2978) add support for lt717x

 .../devicetree/bindings/hwmon/lltc,ltc2978.yaml    |  3 ++
 Documentation/hwmon/ltc2978.rst                    | 28 ++++++++++++--
 drivers/hwmon/pmbus/Kconfig                        |  6 +--
 drivers/hwmon/pmbus/ltc2978.c                      | 44 ++++++++++++++++++++--
 4 files changed, 72 insertions(+), 9 deletions(-)
---
base-commit: dbcfcb239b3b452ef8782842c36fb17dd1b9092f
change-id: 20250317-hwmon-next-5a4e2aae005d

Best regards,
-- 
Kim Seer Paller <kimseer.paller@analog.com>



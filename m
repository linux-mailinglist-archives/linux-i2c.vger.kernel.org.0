Return-Path: <linux-i2c+bounces-10508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E95A950BA
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 14:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ADD0168DBD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 12:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD910264A9E;
	Mon, 21 Apr 2025 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="TlgD93VJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060BB264A7A;
	Mon, 21 Apr 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745237942; cv=none; b=YoQHBw2t/4Y2T/LEg9XtJlCQXzAAzgzCztpUrBD8qhXdVPSncsoaZYTjtJMDlkmnFpKRtht51Tf2U2tbyFCYbgKF1YgAeavWXRt9OqVkbwhHOKOQNNaDffeIIyC9BIy9p6GlbD+lK5ippaCIdT5PS0+XW/LXJ6hhlehaQMCPdU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745237942; c=relaxed/simple;
	bh=lNXJZ31mKKdrH3rm5j2vahEHI71PEeUKRoEiRzkJTPA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=WTg9oVmTG0UgJKHlEzvUOhxooT1O40o6YD6L+2/S8pYNv8bLoC73iyrp21yrmxclRJCwOx2avOAOToLVCf51Qg68U5c9t2zd2mXCXctkjuEz6XuDKr9MxIDoMp2eQJTy35RU2dhGJiMAlE1bCaZl3AkNJfvVnNcWRTm1p03R4nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=TlgD93VJ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8Imuc028756;
	Mon, 21 Apr 2025 08:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=owl87XtYV1NrpUYxAc9w7Tbs9Dh
	e54+iGFHKXKalFRw=; b=TlgD93VJcT37sOqWCQVz/sSlhBQRMdnyRdgcb8UpkhU
	lTXMC9m7RSOyQ7BCoPIBdI+Uq8Up/wNOlzezez5whj8hP/1jkfsjRIoP/WwonFeg
	613+fgq8mf+fjrZUEv1e0JZeXXzljsLRSZnclE1LKB+eb4VUkZWURy38oRxkmX+K
	xZJ30BmPk/mA0bT7C49nY/tEgvjxxhF1fvfHV6MnqQvoP1Jx0m7QOI+ZvxlLFnT/
	q43T3tO4rwyjZywXQeax/86Td2xJe6Cjn6wD3Iidwf1uDwuQz4NyJNQfEzIEqIlS
	TfHGVEcxGWjr8y9glbEM+cpADA+JQ9pjLyMUs097lBA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 464t5gd6td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 08:18:42 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 53LCIfBi045296
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 08:18:41 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 21 Apr 2025 08:18:41 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 21 Apr 2025 08:18:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Apr 2025 08:18:41 -0400
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.222.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 53LCIO2P013389;
	Mon, 21 Apr 2025 08:18:27 -0400
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: [PATCH v3 0/2] Add support for LT3074 low voltage linear regulator
Date: Mon, 21 Apr 2025 20:18:17 +0800
Message-ID: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIk3BmgC/3XNTQqDMBCG4atI1k1JZuIPXfUepYuoowbUSJKGF
 vHujW5KKV2+H8wzK/PkDHl2yVbmKBpv7JwCTxlrBj33xE2bmoGAXEhQ/LH44EhPfAwoSsUlIFY
 KVEGiZulqcdSZ5yHe7qkH44N1r+NBlPv634qSC14WAjtUhUKkq571aPtzYye2YxE+AED+C0ACZ
 KVbKWqdK/gGtm17A9BHJGvwAAAA
X-Change-ID: 20250124-upstream-lt3074-123384246e0b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC Chiu" <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745237904; l=1845;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=lNXJZ31mKKdrH3rm5j2vahEHI71PEeUKRoEiRzkJTPA=;
 b=19nmfMCWVgOFErGDCjRj0mFhubfocQbq9ME6dzcmA9WxZ9mJIcYVH5BGIqKN2W2SGHctcmH/g
 wVxpkLCwLDiD4W/JRG2BFw2WcKyS76yVwFwWiVB1OQxXpZ/UeCGUHBg
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=RaiQC0tv c=1 sm=1 tr=0 ts=680637a2 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=AJfnRGXR9aJ9-Gz2uG0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Yv_yTgn6-Ywz2Kcd7ulpSelN1wzd2eO7
X-Proofpoint-ORIG-GUID: Yv_yTgn6-Ywz2Kcd7ulpSelN1wzd2eO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210095

Introduce hardware monitoring and regulator support for LT3074. The
component is an ultrafast, ultralow noise 3A, 5.5V dropout linear
regulator with a PMBus serial interface that allows telemetry for
input/output voltage, output current, and die temperature. It has a
single channel and requires a bias voltage which can be monitored via
manufacturer-specific registers.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
Changes in v3:
- 
 * Non-nested dt-binding regulator support.
 * PMBUS_REGULATOR_ONE("vout") -> PMBUS_REGULATOR_ONE("regulator").
   New macro needs node-name to be matched.

- Link to v2: https://lore.kernel.org/r/20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com

Changes in v2:
 * Separated dt-binding for LT3074.
 * Added __maybe_unused attribute to of_device_id. This addresses kernel
   test robot warning.
 * Added entry to MAINTAINERS.

- Link to v1: https://lore.kernel.org/r/20250124-upstream-lt3074-v1-0-7603f346433e@analog.com

---
Cedric Encarnacion (2):
      dt-bindings: hwmon: pmbus: add lt3074
      hwmon: (pmbus/lt3074): add support for lt3074

 .../bindings/hwmon/pmbus/adi,lt3074.yaml           |  50 +++++++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/lt3074.rst                     |  72 ++++++++++++
 MAINTAINERS                                        |   9 ++
 drivers/hwmon/pmbus/Kconfig                        |  18 +++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/lt3074.c                       | 122 +++++++++++++++++++++
 7 files changed, 273 insertions(+)
---
base-commit: 86d264b68309d9f9804db4079642b98104ca15df
change-id: 20250124-upstream-lt3074-123384246e0b

Best regards,
-- 
Cedric Encarnacion <cedricjustine.encarnacion@analog.com>



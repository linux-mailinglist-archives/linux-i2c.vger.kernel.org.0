Return-Path: <linux-i2c+bounces-10086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F2A79B2A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 07:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F0C174517
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 05:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A2A19ABC3;
	Thu,  3 Apr 2025 05:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="wD2/Hg2y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE27158520;
	Thu,  3 Apr 2025 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743657423; cv=none; b=s/Bn0jkhhojSKGMnkHJxQOl+FyoP21OcGCoB7MouOgkhXdKlll4vJMxfWn0W3QG2dRaKYMCBkKiQ2OXY9p2POLFnjy4mGSjCeg7occLBFYtgRMdIaqtAIUiFW4r+Ir2h7ynrx5mzUceZOZsHmwD8EUV5yfnU4z8zvhdr8msDfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743657423; c=relaxed/simple;
	bh=GCg1kF66XI+C9z/bqQ1tqqz2NufD5JefHBWqWpgW0p4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XL4rdA4zarOyNveDeFtHmtQ33NdpgXRsoV1dNpBkk4r9KuwQHddfzaDFzyV/5JAMGIYa4VCQBSqdiUPLU9XctOMAOo6JJvkSIi14dB02IPDSa8Snsl8jTJZn/1FumaYgMNkHYS0Lk8CYITwTAJ8R8CGARQpdqlfUHaYYXYpmx2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=wD2/Hg2y; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5331jVBC018100;
	Thu, 3 Apr 2025 01:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=9eUDDjGXl/ci034w0fw7vNxwPHh
	e/NuPsGgZd5k0AlM=; b=wD2/Hg2yYzz/tOuGCFLXTQqUuFdrCtUczxAYMhmnYRK
	ZeZnjXIh554zwfYCrTkpFh9eWszLMDAx5vBYqnHTUDgsPMxseOHboSrO8m3JktqS
	OhyzFEAlHxH6iZnExNl9XR5VFgOywPsCFX5FDrC3WEl4vXqYNi0mfDZRExSzty04
	hgk9ABKtdW7C9bvOkPjkH7inKavYJdTnTu2ezYXSIO74yF4AttvS6JihSkjJBfMh
	GPIxnAY7Q999onRKCfJvWXlqTOld01XKdUnqigJg07z75qSuUuT5RcDerzXWXj3T
	LohoZI85wrh6Oqi0/XqgTWK2QseUC88pkg3Y/LrUViw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45rcrx3xfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 01:16:47 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5335GkKp003062
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Apr 2025 01:16:46 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 3 Apr 2025 01:16:46 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 3 Apr 2025 01:16:45 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 3 Apr 2025 01:16:45 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.13])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5335GSPS006832;
	Thu, 3 Apr 2025 01:16:31 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v2 0/2] Add support for ADPM12160 a DC/DC Power Module
Date: Thu, 3 Apr 2025 13:16:17 +0800
Message-ID: <20250403-dev_adpm12160-v2-0-bbf40faae988@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKEZ7mcC/3XMQQrDIBCF4auEWdeiFjO1q9yjhGLMJBEaDVqkJ
 Xj32uy7/B+8b4dE0VGCW7NDpOySC76GPDVgF+NnYm6sDZJLxS+Ss5Hyw4zbKqRoOVO65YRoUA8
 E9bNFmtz78O597cWlV4ifg8/it/6TsmCcXSccNCoyFlVnvHmG+WzDCn0p5Quh83mxqwAAAA==
X-Change-ID: 20250320-dev_adpm12160-5960e77a79be
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743657389; l=1839;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=GCg1kF66XI+C9z/bqQ1tqqz2NufD5JefHBWqWpgW0p4=;
 b=r6BTzrupN7uGww9Tb3VIO93HL0rfQ48Jm8jAWaEWBpWCaZP+MBgvV34MAN+c5R2YDIJJo9uiC
 ARXJQkK6QaDAqyEgA558oiFC8Xj+rbinH/T4ZU1MbaGYPSTX97QiEl+
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=KqVN2XWN c=1 sm=1 tr=0 ts=67ee19bf cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=r-qAA2OrMi8oRDqhcIUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZqicfI_ikIDoev-44KVew2hsTD2xDRyc
X-Proofpoint-ORIG-GUID: ZqicfI_ikIDoev-44KVew2hsTD2xDRyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=964 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030026

Before adding the support for ADPM12160, this series includes a commit
to fix the issue with max34451. The family of max344** contains switched
PMBUS addresses 0x46 and 0x4A. For max34451, the version MAX34451ETNA6+
and later fixed this issue and this first commit supports this. The
MFR_REVISION is used to differentiate the different max34451 chips.

The second commit adds the actual driver for adpm12160. ASPM12160 is a
quarter brick DC/DC Power Module. It is a high power non-isolated
converter capable of delivering a fully regulated 12V, with continuous
power level of 1600W with peak power at 2400W for a limited time.
Uses PMBus Configuration.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v2:
- Commit 1: MAX34451 Fix
-   Added a flag to denote if the device has correct pmbus address
-   Stored the pmbus address of concern inside max34440_data
-   Removed separate chip ID for max344451etna6+, detects this version
    via MFR_REVISION
-   Reverted max34440.rst to original. No edit deemed necessary
-   Supported READ_VIN, READ_IIN, and STATUS_INPUT for max34451etna6+
- Commit 2: Add ADPM12160
-   Adjusted code to base it on the new max34440.c
- Link to v1: https://lore.kernel.org/r/20250320-dev_adpm12160-v1-0-8f7b975eac75@analog.com

---
Alexis Czezar Torreno (2):
      hwmon: (pmbus/max34440): Fix support for max34451
      hwmon: (pmbus/max3440): add support adpm12160

 Documentation/hwmon/max34440.rst |  30 ++++++++---
 drivers/hwmon/pmbus/max34440.c   | 109 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 124 insertions(+), 15 deletions(-)
---
base-commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491
change-id: 20250320-dev_adpm12160-5960e77a79be

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>



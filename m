Return-Path: <linux-i2c+bounces-10117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD26A7D299
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 05:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7FAB166194
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84737212B39;
	Mon,  7 Apr 2025 03:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="MY0wNnyv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BAA18027;
	Mon,  7 Apr 2025 03:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997720; cv=none; b=cpU2bXJ/aN0ATnXZDtTSGCjd+Ip/UmSmbtT3vH+SXYSHyuDX+Uvc7C37SDjPRPEO9q8f4Ct6ocyVPUON6SnFTfsfxuvso8LdT74okKw4a2QjU/Dn5ONCcbzEXyTpK6y3TJgW2b109X/PfTRQOuUZwgJXlGKY23UuYXnsEQKALLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997720; c=relaxed/simple;
	bh=fT5jsMlOtt+aFT4BAeR/fMxPw25gtRwQQtuCF00PS2Y=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=aARv7wznlF/ppVVpT+aHgwxxJh2U2EjKgfpQez4Rmax/q/leHlE05tcQ7elLFnuw2zJjI/7JsiD/3DEwO1l+Jmaj7xD2t3RM/ndIGBemxCD0OPQAiP0hVx5ScefHWH87kNsfu6qQIvpBrzeywtwpy/y9MZmGcLTpcQlyT+1pWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=MY0wNnyv; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53711EQR019577;
	Sun, 6 Apr 2025 23:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=ZfLqPPlSya6o18Wvkuk2PIjycTl
	x7WCsKHZydZawLkA=; b=MY0wNnyvfrhoZhcnlAzqPd9p+gPfvKzRMvF3qVklC4f
	7iiagVqXy/cmk3rtWATp6Fcp5k4PiZYcrd6C6vf12n3pLBl1Kdn0Jgk29ErajblH
	P2gqGlC1h5fmgcGswEKkpy8t59En9gPjeoMu6CZvFxV/n8GHYJQs4s9U6btNFOP5
	0IR3HTLiqcpFkyXYUr0z95VC3vwjGebqcX8uBYSLxdKDUFukbHK39U4x3qFL1jPK
	SrUkUfxkt1PzUcvECoGkDD8nlcjfylzfL77ag7B7ShgZ1enQDiwRfGJcOnAbmCJt
	aIghOXrgRkFxoZJgXEi7XILvPQRs6G/726SLtQKE+nw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45txc5qfje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 23:48:18 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5373mHEg042631
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 6 Apr 2025 23:48:17 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Sun, 6 Apr 2025
 23:48:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 6 Apr 2025 23:48:17 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.24])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5373m1a3015369;
	Sun, 6 Apr 2025 23:48:04 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v3 0/2] Add support for ADPM12160 a DC/DC Power Module
Date: Mon, 7 Apr 2025 11:47:23 +0800
Message-ID: <20250407-dev_adpm12160-v3-0-9cd3095445c8@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtK82cC/3XM0QrCIBiG4VsZHmf8ujlnR91HROj2uwltDg0px
 u49t5Mo6PD74HkXEjE4jORULCRgctH5KY/yUJB20FOP1HV5Ew5cQMmBdphuuptHxlkNVKgaUEo
 tlUGSzRzQuufeu1zzHlx8+PDa84lt779SYhRoY6VRUqBupTjrSd99f2z9SLZU4h9eQfnLeebG2
 Aqs1qia5ouv6/oG1B5jXOoAAAA=
X-Change-ID: 20250320-dev_adpm12160-5960e77a79be
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743997681; l=2269;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=fT5jsMlOtt+aFT4BAeR/fMxPw25gtRwQQtuCF00PS2Y=;
 b=HsQl+k4HXQJcAxuboigFZdvSoN4/73S+Rf8pJ6Yqtu/SiPx+AslOaqO23O5+/DUV1/fKFZTfX
 bo6sn0FefJ/BrPRB3pDVdRoA7RxO4flqQlIoEGvHPHO/s2I00uQzEd4
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: mMa30fZoePSr_Ovdi4i0hLOsOd_yW6PE
X-Proofpoint-ORIG-GUID: mMa30fZoePSr_Ovdi4i0hLOsOd_yW6PE
X-Authority-Analysis: v=2.4 cv=KePSsRYD c=1 sm=1 tr=0 ts=67f34b03 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=aBXZGasqtuxsuxeSzLgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=934 adultscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070025

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
Changes in v3:
- Commit 1: MAX34451 Fix
   - Removed bool pmbus_addr_fixed in max34440_data
   - Reduced iout_oc_warn/fault_limit from u32 to u8
   - Used >= during revision check instead of ==
   - Moved the assignment of correct pmbus registers
- Commit 2: Add ADPM12160
   - Adjusted code to base it on the new max34440.c
- Link to v2: https://lore.kernel.org/r/20250403-dev_adpm12160-v2-0-bbf40faae988@analog.com

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
      hwmon: (pmbus/max34440): add support adpm12160

 Documentation/hwmon/max34440.rst |  30 +++++++++---
 drivers/hwmon/pmbus/max34440.c   | 103 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 118 insertions(+), 15 deletions(-)
---
base-commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491
change-id: 20250320-dev_adpm12160-5960e77a79be

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>



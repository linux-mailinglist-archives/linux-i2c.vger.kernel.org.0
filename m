Return-Path: <linux-i2c+bounces-9930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF81A69EE5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 04:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47E464272E0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 03:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A471E32C6;
	Thu, 20 Mar 2025 03:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jWIdNGAB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622E17BA6;
	Thu, 20 Mar 2025 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742442997; cv=none; b=ofr0NLVqaJ/TVU8wjvSvm9huODZk0lhFi71EzVS5RcULOQMBTp8fn8o6z/E91Dag7EHUs39ozl1XROhZc0sv0g4HRz7x4EiIVm6O6eisHfpDQp5L4sgUATIMvIqmFc0gwl/rInBYRR1R+vqtBQB5NJtcLgH8fUd2qMwS9kPeQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742442997; c=relaxed/simple;
	bh=/h3zP33Mov53MvJ5F8oD97YZG7pYUTKqEZRskc9VT44=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BDrlf9woDTsPMqAiBh3SYwm4k0jIbvSicO82rC8ENJGG/0m1QGWQdP6nPxqOVRI8t6JnpZjjMgJf9v6tPc9TQ+6fSSWBMgEoLMlwOnNj2SyHg5ddZBOYWMPLKOV5ou1zBFmx0mWEkG+4mddqj1l+mzLXOD2IZ645aleb8ywvDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jWIdNGAB; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K2oEuT030651;
	Wed, 19 Mar 2025 23:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=aILvfTq/rdHZeO+eIoU0Yi5qGiB
	teuutlXkFQ4NtMOs=; b=jWIdNGABUQotCVg8zsgdbygJg0EWBiQYNIh0mLqyR+2
	e+JjSXz3lxt18ZboyIsxeVjYOVon6R3HQNaTU5p5Z9oh9gTxFlkWx6hEAXYJ0bR7
	0qpu/sOwuZLNasynrm1Ih2KNURk4Es0DJHfeq27GMzIS6MIVfEGvgxffZC5SfN+d
	dPP12gxxdm55MDuralD0HDYMn5x5PjavX21SR5HxB20+MH14Fhtl4yGj1VvsZRNF
	xuEOMSa5WGAM4MF9ZHSRiNBK3hH6Z2kbaG4cbu7XYLUMpNT3aPsyPEl5NiKiMANc
	ZTJd+matJbi4OuZEgcf/2TRUZYQQfoKTISZJDTh6fHw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45fwvmm66e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 23:56:16 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 52K3uF1u012604
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 23:56:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 19 Mar
 2025 23:56:15 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 19 Mar 2025 23:56:15 -0400
Received: from ATORRENO-L02.ad.analog.com (ATORRENO-L02.ad.analog.com [10.117.223.3])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52K3tvid030363;
	Wed, 19 Mar 2025 23:55:59 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH 0/2] Add support for ADPM12160 a DC/DC Power Module
Date: Thu, 20 Mar 2025 11:55:46 +0800
Message-ID: <20250320-dev_adpm12160-v1-0-8f7b975eac75@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOR22cC/x3MQQqAIBBA0avIrBNGQ6WuEhGWU82iEgUJorsnL
 d/i/wcyJaYMvXggUeHM11mhGgHL7s+NJIdq0KgNthploDL5EA+llUVpOovknHfdTFCbmGjl+/8
 N4/t+yCmwy18AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742442957; l=1228;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=/h3zP33Mov53MvJ5F8oD97YZG7pYUTKqEZRskc9VT44=;
 b=YxORlbo5aQfFwruurTsBTx3J9EfMjfb2ZODygrTKqtodas0wmnv3/c7Sa+i8cg7Wkfw6dxTx8
 W0ERn7aymvzDnYwmpqy3XeH21aiUq/zjMBch2H1G7Ar/nl8qJoNo4Mh
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: u1aaZNwEV6JDabxyGvePtO3c9ZAIBysk
X-Authority-Analysis: v=2.4 cv=J5+q7BnS c=1 sm=1 tr=0 ts=67db91e0 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=pX8K7AMcFWmkIJv9s54A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: u1aaZNwEV6JDabxyGvePtO3c9ZAIBysk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=794 mlxscore=0
 clxscore=1011 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200023

Before adding the support for ADPM12160, this series includes a commit
to fix the issue with max34451. The family of max344** contains switched
PMBUS addresses 0x46 and 0x4A. For max34451, the version MAX34451ETNA6+
and later fixed this issue and this first commit supports this.

The second commit adds the actual driver for adpm12160. ASPM12160 is a
quarter brick DC/DC Power Module. It is a high power non-isolated
converter capable of delivering a fully regulated 12V, with continuous
power level of 1600W with peak power at 2400W for a limited time.
Uses PMBus Configuration.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Alexis Czezar Torreno (2):
      hwmon: (pmbus/max34440): Fix support for max34451
      hwmon: (pmbus/max3440): add support adpm12160

 Documentation/hwmon/max34440.rst |  37 ++++++++---
 drivers/hwmon/pmbus/Kconfig      |   1 +
 drivers/hwmon/pmbus/max34440.c   | 139 +++++++++++++++++++++++++++++----------
 3 files changed, 133 insertions(+), 44 deletions(-)
---
base-commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491
change-id: 20250320-dev_adpm12160-5960e77a79be

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>



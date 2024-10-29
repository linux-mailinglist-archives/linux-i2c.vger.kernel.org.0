Return-Path: <linux-i2c+bounces-7637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B49B3FDB
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 02:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A747B21BEE
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 01:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001C680038;
	Tue, 29 Oct 2024 01:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="y/uSos0b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7078F507;
	Tue, 29 Oct 2024 01:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165898; cv=none; b=Op+QyKtOd/osDtkcJpsZtTKFvyB00ZVrOogwvShmzFsi5S9D5vCab6rPeMFsJaTKlnX/k2/Axw5M8dweCPabHovST8cjgyYeyr2hWJrqDUPi9JV8eo/AyBLzbcfmIUwv266JCcDUIAQKaw+5FD4Bs3YjKixZ9d7qc4EzxXDAxwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165898; c=relaxed/simple;
	bh=ZfgDtqjTJM7obDP0PVtyUkoytuC1DCtPqoiOxJo3YAU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U3eEHQt3wF0sEtSmMf/U7Ur4/L3Cy77bkkfiR3qVBSipjob4/r1niGDbuKVhC0Szmo/PQQDx2jxX46mV/k4mj2WbSbiq5R55t+W4bhHBn9Q72ZmPGvNkoyhiwc98fcWrFj2tamoKY6YhD2rpRsoj7drCGw+YwGIgTOiVVWhDYu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=y/uSos0b; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SMhOl8027753;
	Mon, 28 Oct 2024 21:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=z0VtlkEwdCs5fd8WORv1aiQ5gs1
	jtMK386ByPpjQQTo=; b=y/uSos0b3+aGS9W/hTmr85jdydIdgPHuutqCHoHVqfu
	CtJW0nuKtvWjv072DTAsOY/HWa++HVb/DcHSdAm22ktKCjGxbLKjgdQmOftt6h9H
	cpEDuL31MqRWfGMio8PS8dz0Dvx3UtV2cMonaWnmXnBxw0zG0p9UutgwDks4uMba
	LDTrxytvjMTz6RODOnbg3KSt1SoaJXPQV2kE9dFiEpriQs8i2DAQOA9YCtQQ0PlR
	aiXftUreKTXBMIDWEOnrfhdfwgTZYHT/SC+lMKVogHYPftdPOBhKzf2J+UbDT21b
	XHW3gpBXH43FF1eFUELOWgTrrR+wx3pvtEX3OtGvOaQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42gt92ukhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 21:37:58 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49T1bvD7018872
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 21:37:57 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 28 Oct
 2024 21:37:57 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 28 Oct 2024 21:37:57 -0400
Received: from MTINACO-L03.ad.analog.com (MTINACO-L03.ad.analog.com [10.117.223.14])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49T1bgJO031384;
	Mon, 28 Oct 2024 21:37:44 -0400
From: Mariel Tinaco <Mariel.Tinaco@analog.com>
To: <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare
	<jdelvare@suse.com>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jonathan
 Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>
Subject: [PATCH 0/3] add support for LTC7841 boost controller
Date: Tue, 29 Oct 2024 09:37:31 +0800
Message-ID: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: CCroGj3O9P6jWmPLOzpIRCQsNn_YmwLo
X-Proofpoint-ORIG-GUID: CCroGj3O9P6jWmPLOzpIRCQsNn_YmwLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290011

This series introduces support for LTC7841 boost controller. 
The LTC7841 is similar to LTC7880, which is already supported
under LTC2978. It has reduced PMBUS registers as that of the LTC7880,
similar voltage range, and has only one channel. 

Mariel Tinaco (3):
  dt-bindings: hwmon: ltc2978: add support for ltc7841
  hwmon: (pmbus/ltc7841) add support for LTC7841 - docs
  hwmon: (pmbus/ltc2978) add support for ltc7841

 .../bindings/hwmon/lltc,ltc2978.yaml          |  2 ++
 Documentation/hwmon/ltc2978.rst               | 12 +++++++++++
 drivers/hwmon/pmbus/Kconfig                   |  6 +++---
 drivers/hwmon/pmbus/ltc2978.c                 | 20 +++++++++++++++++--
 4 files changed, 35 insertions(+), 5 deletions(-)


base-commit: eabb03810194b75417b09cff8a526d26939736ac
-- 
2.34.1



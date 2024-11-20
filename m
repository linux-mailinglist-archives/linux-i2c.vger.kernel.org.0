Return-Path: <linux-i2c+bounces-8071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019E9D32D1
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 04:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 120352840D2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 03:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93232156C70;
	Wed, 20 Nov 2024 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Th7M5qZZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B942AAB;
	Wed, 20 Nov 2024 03:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732075177; cv=none; b=T6fiyBxwE1gghIGHkfAxVTG7x301+VnSob9917Z0GvSi2as1UkkcBl+rL4duobTpLUsLzg5I6xvio+Cu8OHdHlpmtAa5FsLgsM8CUUdShg4MgvlEeQ4z+vqo2Cr3FuAPhJ+dF41V8W4fbiG9cVYKa3goMPA98Fdhxtr+rgVfbOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732075177; c=relaxed/simple;
	bh=XLOVrN1qJxo6DUMf7JPO4aITf0YVxst6aLGLLt9UP18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H+66mQpkPpv1FqKKHvFSd4+MkZggBPRiZbQRGI2nnMuCiYhB/ABjPO7raMBLwbc+WDFCD5xjSrgLY+av3J7ZrXLZJ6aUz06f3pdqYlcwi5UwfTqe3dvIN2eBdAo3bncVEvhbUuLecjvWtiE1a8omcqSMBjxMeht7FUDTW00maBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Th7M5qZZ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK2DVM9025391;
	Tue, 19 Nov 2024 22:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=aKJL4nPUC4KZ2rDyGagX9coT2kr
	zzn7okWAhD9vBxQU=; b=Th7M5qZZLnKjXNThA3WNZAOjoGOYc+bp4nmyOI2AGnU
	UxD95YfHoKI5UY62Y7A43IX3k+vpe1ADnbCUG/fPuEsyiyIINaJqMC2ebHJeaZFA
	Ako5auRjXXCo3sNe53FIlUh4JRR6MBiGAwOHg+0dOfSMcVhw6YQfTtO/2YFOJfBG
	iQ9kFJJLUqErFb1S04zOcuMzMxe6Wxrmvg0jUSpuqhTUr8p3oB8Is9vxF91fkAzR
	DdvqiQv4UsYOIZc+cN7fukHNyiH+9U/f3x5NTgFBlYDFNZkamOw/p9qZO9bnJ7L0
	bVyl9GUyyGt9sZeR/ZYWDz1lkfLr5LcKYFUbX3gxeVg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4316sygcxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 22:59:02 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 4AK3x1IM039301
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Nov 2024 22:59:01 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Nov 2024 22:59:01 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Nov 2024 22:59:01 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 19 Nov 2024 22:59:01 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.116.39.203])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4AK3wWZj027365;
	Tue, 19 Nov 2024 22:58:35 -0500
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
Subject: [PATCH 0/2] Add support for ADP1051/ADP1055 and LTP8800-1A/-2/-4A
Date: Wed, 20 Nov 2024 11:58:24 +0800
Message-ID: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
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
X-Proofpoint-GUID: E98D-voB-nUU_wcpDuOAu_A8ABZOZr_r
X-Proofpoint-ORIG-GUID: E98D-voB-nUU_wcpDuOAu_A8ABZOZr_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=910
 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200028

The ADP1051, and ADP1055 have 6 PWM for individual monitoring. ADP1051
can monitor input/output voltages, input/output currents, and temperature.
ADP1055 is similar and can also monitor power.

The LTP8800-1A/-2/-4A is a 150A/135A/200A step-down μModule regulator that
provides microprocessor core voltage from 54V power distribution
architecture. It features remote configurability and telemetry monitoring
of power management parameters over PMBus.

This patch combines existing patch series adding support for adp1051/
adp1055 and ltp8800-XX. Below are references to the original patch series.

ADP1051/ADP1055:
Link: https://lore.kernel.org/20241106090311.17536-1-alexisczezar.torreno@analog.com
Link: https://lore.kernel.org/20241106090311.17536-2-alexisczezar.torreno@analog.com
Link: https://lore.kernel.org/20241106090311.17536-3-alexisczezar.torreno@analog.com

LTP8800-1A/-2/-4A:
Link: https://lore.kernel.org/20241106030918.24849-1-cedricjustine.encarnacion@analog.com
Link: https://lore.kernel.org/20241106030918.24849-2-cedricjustine.encarnacion@analog.com
Link: https://lore.kernel.org/20241106030918.24849-3-cedricjustine.encarnacion@analog.com

changes from v1 of original ADP1051/ADP1055 patch series:

adp1050:
  * Removed stray change in "includes" and stray blank line
  * The requested datasheet link to be added is in the documentation
  * Patterned format of pmbus_driver_info of new devices to the existing
    one

Bindings:
  * Removed abnormal newline

changes from v2 of original LTP8800 patch series:

adp1050:
  * Extended adp1050 to support ltp8800-xx devices instead of separate
    client driver
  * Used PMBUS_REGULATOR_ONE

Cedric Encarnacion (2):
  dt-bindings: hwmon: (pmbus/adp1050): Add bindings for adp1051, adp1055
    and ltp8800
  hwmon: (pmbus/adp1050): add support for adp1051, adp1055 and ltp8800

 .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 15 +++-
 Documentation/hwmon/adp1050.rst               | 63 ++++++++++++++--
 drivers/hwmon/pmbus/Kconfig                   |  9 +++
 drivers/hwmon/pmbus/adp1050.c                 | 72 ++++++++++++++++++-
 4 files changed, 150 insertions(+), 9 deletions(-)


base-commit: 3996187f80a0e24bff1959609065d49041cf648d
-- 
2.39.5



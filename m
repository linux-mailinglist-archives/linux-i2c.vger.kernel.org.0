Return-Path: <linux-i2c+bounces-9187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F3A1B978
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80418164155
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E9B15666A;
	Fri, 24 Jan 2025 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="eho4Z2j2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6923A0;
	Fri, 24 Jan 2025 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737733192; cv=none; b=gi9ByG4ug9MyiWrIyel9475DYA7TlWnHinThPVU7IFZ3Vx+B+5w7V4FnMQRE8YnYwIYEmuCGNvvxTIVu0gALLKmKZbQKKKo4JFcEAPXdv8xYGDsqFVm61nlBbsBeLj7GstqbferuUgrKUXrdtw1gPizQXesatjOanxf9MF2DE/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737733192; c=relaxed/simple;
	bh=Vs8+PPwO+IZu4btLhd3LMGzuXwM8R1ARNGOEZ5kLMNM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=eBHzvlYB/JJTHpZaRovzj79CNYBR7ug7Cn9ohBJc1Q9edCeTUGVZulgUqfyqB9ej3/xmkz2Xr8RqMp8EMMw0B2lRCtpMO7oNjjSwecFYJuhfB5/2vmbEbxRzu7/CJP6htgdS9TIT2RpU7QtbmoeiaKCqgFP5W7J8CrF383xZsbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=eho4Z2j2; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OEn2HL007140;
	Fri, 24 Jan 2025 10:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=KuirWxd6zQbs52bVKOtYaHeUTv6
	VjLO6uy0QRSLCZXY=; b=eho4Z2j2/bpA2Wchh69T66VMNYZJq4QPOx3j81uYbtf
	QZRE89MUjcQ1hdK33Y7BDz+qPZI5g+kqZfsBL6TrPgpgIXdLJq0tOpldbo3PxPzc
	yZsRImhI66Vd9wG+UryuEdyR1YbvctIKL7MV6Fu1nZjvQxBS8GNYRSfz7ThfmzsN
	ULRD+E5iUUL/L5iZYIhrF4vLiAPsjUcYsQgu7dz+94Lk2Hzt1EmldWZztarFL2M2
	D/2RIb+MEp7js+jPR0r+VvAWlrwhxdqIom57IHCF7PPwH97LYAzFjn44AsPmybvv
	WX0s5RklUr3FW3EE2fo/MEE+R9EGVxqiGzNBA1acDbw==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44ccxx076k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:39:36 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 50OFdYlZ064588
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:39:34 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:39:34 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:39:34 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:39:34 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFdFBA032412;
	Fri, 24 Jan 2025 10:39:22 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: [PATCH 0/2] Add support for LT3074 low voltage linear regulator
Date: Fri, 24 Jan 2025 23:39:05 +0800
Message-ID: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABm0k2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMT3dKC4pKi1MRc3ZwSYwNzE11DI2NjCxMjE7NUgyQloK6CotS0zAq
 widGxtbUAeqMc8WEAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC Chiu" <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737733156; l=1213;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=Vs8+PPwO+IZu4btLhd3LMGzuXwM8R1ARNGOEZ5kLMNM=;
 b=rePvu3igITi0Dblt1YhsK6REg55itEHw/9uWuVbOoznYSJG0jP4YAR4Q/IeGrzmqK5C/pM6Qt
 2hI2G3AvC+2AKhxhefweeHBTF9uZ/onzby7owyO5b6D225WsdVxySBv
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: GpHw-eh259UVUk8DmmeUQkksw2lnjegQ
X-Proofpoint-ORIG-GUID: GpHw-eh259UVUk8DmmeUQkksw2lnjegQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240110

Introduce hardware monitoring and regulator support for LT3074. The
component is an ultrafast, ultralow noise 3A, 5.5V dropout linear
regulator with a PMBus serial interface that allows telemetry for
input/output voltage, output current, and die temperature. It has a
single channel and requires a bias voltage which can be monitored via
manufacturer-specific registers.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
Cedric Encarnacion (2):
      dt-bindings: trivial-devices: add lt3074
      hwmon: (pmbus/lt3074): add support for lt3074

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/lt3074.rst                     |  72 ++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  18 +++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/lt3074.c                       | 122 +++++++++++++++++++++
 6 files changed, 216 insertions(+)
---
base-commit: a76539b293677c5c163b9285b0cd8dd420d33989
change-id: 20250124-upstream-lt3074-123384246e0b

Best regards,
-- 
Cedric Encarnacion <cedricjustine.encarnacion@analog.com>



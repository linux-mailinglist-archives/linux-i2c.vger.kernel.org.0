Return-Path: <linux-i2c+bounces-8558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695299F4095
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 03:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B16B1645FC
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 02:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF391420DD;
	Tue, 17 Dec 2024 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="A3ATYpEt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943B38DF9;
	Tue, 17 Dec 2024 02:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734402094; cv=none; b=s7r4fqWaF9805g4WbrOrlxc5z/wtBVPOK9/zZwrWS2yWC+FufIl9rblzvWHyE9mpXGjOhdVqpZFFS1RRMGh5eg0FbEQpKlkV0M159rKt8xh8he1aeg9KIsLUMeLsFPzPUryb5nfB63ry19Gxe8o+xgH6seQMP6SKl1SMJbtKa+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734402094; c=relaxed/simple;
	bh=gkcCx5TM3kaE0m0YoJvLogEFiJ7mAVB8TOlBwgfmlgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N8yg2gPWGMpSqVylrrVjyVXLP0F4DyXCKddYByqLimgEh+A68GqtXBKqPJL9hQXZwZd5I+om5PdBN3eVuFY0QxJpblvTEVwvAN2WnoakZ/JL77hoy69QK+DaPfE+l1KkkuiPQnJctkMG0iiimN9fSNz4EP/plsjN/jNvjOAFq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=A3ATYpEt; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNaimY023824;
	Tue, 17 Dec 2024 02:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=N0/cbyYKYjyzhB5W5ZNjuGKefPyvhjoM75QqsEME/
	yg=; b=A3ATYpEtBSm8Gly5Bq8HpAmyecOZ8t3z5OtnWI2jEi/nnhOV2jL89O4xD
	6nW2sY53iAHJBwb4gBKRMJDet+HSkjtTV0gfiOfko2Awey5TofHolkbyt6Cb6nXs
	gDJm8LmLtjFJVbINe7XXxVcvZ6doQADDDNRtDFRpa4Ll6v3y4zhbT9E3fxZ0yDZ3
	wm/VJV0vIPsT8KH/8PNoYnXEmoWR+ve1fl3gbPM/uUCJlf6F9ZaQM0QLYe4A5AeO
	qz5Ia04Bh8aZavKrpIkUw5HrsZcn7WZeleswWrW3ZpivZ+hWYS4evFjHRmAmFhPJ
	FWzodCrjVtC/lwl21PaWqyLD7cYqw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jx1a8g4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:20:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH2Krp2015281;
	Tue, 17 Dec 2024 02:20:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jx1a8g4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:20:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNZEMY014451;
	Tue, 17 Dec 2024 02:20:52 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21gees-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:20:52 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH2KpKV30147290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 02:20:51 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 452CD58054;
	Tue, 17 Dec 2024 02:20:51 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDB275803F;
	Tue, 17 Dec 2024 02:20:48 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 02:20:48 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v3 0/4] Add support for Intel CRPS PSU
Date: Mon, 16 Dec 2024 20:20:38 -0600
Message-ID: <20241217022046.113830-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hiondQNnoeXo-ecR__tA0eP-gWSS9wXQ
X-Proofpoint-ORIG-GUID: cD3hqKkyNGW6xB0jbKQxY6q_lrMa3KhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170015

Hello,

Please review the version 3 of patchset.

V3:
---
  - Improved documentation as per suggestion.
  - Fixed issues in the probe function.
  - Add ACKed string in the commit message
V2:
---
  - Fixed documentation issues.
  - Added pmbus revision debugfs file in the core
  - Remove debugfs and read word from crps185
  - Improved commit messages

Ninad Palsule (4):
  hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
  hwmon: (pmbus/crps) Add Intel CRPS185 power supply
  dt-bindings: hwmon: intel,crps185: Add to trivial
  ARM: dts: aspeed: system1: Use crps PSU driver

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/crps.rst                  | 97 +++++++++++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 MAINTAINERS                                   |  7 ++
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     |  8 +-
 drivers/hwmon/pmbus/Kconfig                   |  9 ++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/crps.c                    | 74 ++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c              | 13 ++-
 9 files changed, 206 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

-- 
2.43.0



Return-Path: <linux-i2c+bounces-8481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDDC9EFEC0
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 22:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F0E287638
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 21:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3925A1DE2A7;
	Thu, 12 Dec 2024 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Eun+Ov/e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26B1B0F39;
	Thu, 12 Dec 2024 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734040216; cv=none; b=JGyuGoCa3XeZfRY5f/wrIN2kxI8WYYyoGLs6ykmRTeSzG5gOAWao19R/1egA0cRXxqqvIkC/Dp5NwEaPR4NaZZC8mG8JtMJY+ADIDA573ImRQ4j9u5zcpvvrb8LJ3AVxHUA8o1c8QBTQsyhVkrz0jVCNKkHT5csIqbjMHdEJJVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734040216; c=relaxed/simple;
	bh=jzXsbxnn1E7qnYIlZaX191I5JrUszgjrMO4VoCxJcG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G7/Hq8hsmnK6aRTYwXzRLiZI3Z1/GDG/kIUeEoJ6VvhsALtO1x+TPNITbm8JyTiIO3adcx5tcBeqoqUctqKKLViv30tK6R9lu86dkPsBjp7HDoBA47gXueSI3REhwMbpRayjJyeXePcIsb7mYbwFLXvZXRDNr3F4mfQnGGNlXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Eun+Ov/e; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHHNP1029647;
	Thu, 12 Dec 2024 21:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=sQSRIpbMZMTvSt/ONP7qcZFmo/OmYcaw7A/YcvOiJ
	xU=; b=Eun+Ov/ejazf5dJAtHZffyPyka2SPRWHNX95vIR0ulqUblko6XdBRitqV
	PoQt054qhSB+cDeNn58SBtCMtQULwGCc0TWWvkDhhn8MGBINlMav2GZnCgBdhyPe
	ecLis80cr0+hIiwQ+1XDeJHrfw2fcY6f52UpVToh4xUOK3FKmh3/7fGEkclxSfar
	PV693d9CAXMY7TlFEivhVV6g9yjaEiMFRssfhmvWXqQKt2h9PMzqpd38GGKMpOPe
	an1Y1vJYUIr1lMDFfNAaaOcj6vEnu9dCB/NyCsZbNixiecqSZEf4pFtCMl1EgsHX
	jIl0f3zTSfV4gHlP9kG/lupG+ZszA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsjwnbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:35 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BCLmpVu014905;
	Thu, 12 Dec 2024 21:49:34 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsjwnbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:34 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCJWAhG032760;
	Thu, 12 Dec 2024 21:49:33 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0pstx59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:33 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BCLnW8131392502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:49:32 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49F5558056;
	Thu, 12 Dec 2024 21:49:32 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A148958054;
	Thu, 12 Dec 2024 21:49:30 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Dec 2024 21:49:30 +0000 (GMT)
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
Subject: [PATCH v1 0/4] Add support for Intel CRPS PSU
Date: Thu, 12 Dec 2024 15:48:59 -0600
Message-ID: <20241212214927.3586509-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: icj0bAT7zzgFYlr1nDRjw_RxSGMuUP5q
X-Proofpoint-ORIG-GUID: lvlUArhSuLBsHdj0aE27zUlAmBm5SjQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=979
 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120156

Hello,

Please review the changes for Intel CRPS power supply driver.
I need to add label in the pmbus core as new application like PSUSensor
requires it.

Ninad Palsule (4):
  hwmon: pmbus-core: Add label for fan and temp
  hwmon: (pmbus/crps) Add Intel CRPS185 power supply
  dt-bindings: hwmon: intel,crps185: Add to trivial
  ARM: dts: aspeed: system1: Use crps PSU driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/crps.rst                  |  95 ++++++
 MAINTAINERS                                   |   7 +
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     |   8 +-
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/crps.c                    | 299 ++++++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c              |  14 +
 8 files changed, 431 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

-- 
2.43.0



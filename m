Return-Path: <linux-i2c+bounces-8534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D09F37EC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71FBF7A5218
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A28520767A;
	Mon, 16 Dec 2024 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IW2X7Qih"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAF206F0A;
	Mon, 16 Dec 2024 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371489; cv=none; b=s3XVV8rFapUQ5vV93qM6BKZ0w2sWHGTc0lunZAXWe8WRfk7al/3rbOwJ/K/32dJXC/h8XDprmISxLFNHMEBGq2GPC4xJQGGcOOq7nl8WK0c6ZT8eH57oH5bEvhTGU3fny+e2+AZ3wOqlr0vRPaRLWD/6s3UEAp2fqBjOs8ARjMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371489; c=relaxed/simple;
	bh=aPDJpKppg/TOsKM8+c3Xq9otEds3XPt9t0Tvx8IubsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FUxY+b5jmarA7C4e3hkRK4v4pNmK0c72/h9g+LZA5CIuafcmDJzj0dhGyaEE7v0hQoImIrfQzatdEbrERvrPxYEJZbTQcOLEEf11RoU140/FIYwUb5dDW2LJzb10Ean+n4ybTCrxB16OH1NwqRZNGshnMeU/52bwMtVIO5EvrAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IW2X7Qih; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEd0eY011550;
	Mon, 16 Dec 2024 17:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SoHHWYCgMlJtpvwBGw5VKuQDGx9iSnHvH5n5hxC5d
	jQ=; b=IW2X7QihwgP5HFI96O1SNX38WIYQAxDJ57UzY1Hn/tXMPj6Iqts8d/k8d
	XaY+xKOXRRVolo5ey8yncaNr0UnAfQqpjDSGJco/uIXB4bul36PcvX/IJGGQQrW3
	P4uH2XtcZiA767vcdf0PBSYFWEzuIrgsOXVw4mrB49iqCCAyj7Le9/OEoR/TC/ro
	KgSQtmbHre2YaU3tkcOt+GzFD4MjSxy9hs2cYKUvXdFNFan2TwAa2FZj9f+zq/VW
	RBPwQHUCI/TwifklCzpBrjTNVfWACtJjxgx4PMKhUEnLvB1vaj+uNf9PH9ffrLWm
	xbzKKuNkt6J7bYKMw9M4RKb+JZysQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb3wac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:50 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGHoniD029763;
	Mon, 16 Dec 2024 17:50:49 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb3wa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:49 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEf9d1011256;
	Mon, 16 Dec 2024 17:50:48 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjjxtbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:48 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGHolpf13697636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 17:50:47 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9A4F58056;
	Mon, 16 Dec 2024 17:50:46 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D6285803F;
	Mon, 16 Dec 2024 17:50:46 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 17:50:46 +0000 (GMT)
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
Subject: [PATCH v2 0/4] Add support for Intel CRPS PSU
Date: Mon, 16 Dec 2024 11:50:38 -0600
Message-ID: <20241216175044.4144442-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8pTZR6lA8KXlS59d5t7BhAEXPTGEs6Pu
X-Proofpoint-GUID: CxfNOI2bf93ySdZJnPI3RJJk3E96nwrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 mlxlogscore=997 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160146

Hello,

Please review the patchset for Intel CRPS185 driver.
V2:
---
  - Incorporated review comments by Guenter Roeck
  - Incorporated review comments by Krzysztof Kozlowski

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
 drivers/hwmon/pmbus/crps.c                    | 79 +++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c              | 13 ++-
 9 files changed, 211 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

-- 
2.43.0



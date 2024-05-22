Return-Path: <linux-i2c+bounces-3627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF268CC6E5
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB6051F22525
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C845146D5C;
	Wed, 22 May 2024 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UxiuWUin"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1481422B7;
	Wed, 22 May 2024 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406003; cv=none; b=Py+wsuuS/8YjV52M2o7kLG7TX7MVtE+PMCd56YCpzI/52eVwC0uURxgwZ2zT9rFpwVIzl8uarCpbLH1v6DxPFzmzoopgyPgSkoB52auUBD9JfJ6HTTvKDpFtXCW/PhHbItq2pMktCMphEE3H8fltqdM6GGlBVR0fmJH/ryWG2F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406003; c=relaxed/simple;
	bh=oWDFI0RXimk6otfOSqN1/9oiRv9l2P751WDJKGl7xos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rEela+ejf49i9g91dqov7To6+8zPxDrkMQsumzE5tE8mFNWdCKkSc8Qm5F9lNNuAtLYz5DjPEU9Ax4x8WknI9nOTh2OKfa8H7zudmgPPSUJEph8E0iN2p0G9jv5clWq89LEKHmMQhEemr2ZQCwo6wsjncQoGC2Be5Mt28cePlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UxiuWUin; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHpcen031804;
	Wed, 22 May 2024 19:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4O0KXmVxqQ/nEbQcg75MKrY7DSmGSfEqH5ngODiVShM=;
 b=UxiuWUinbnsL7i5xtcyckpcta43Qd/jrVxnlAEwDjJvhrQkRYVepoNoJySLeQqKLkhru
 oPQCN/5NzQHgQMFGcfkLZV/Eu+sQulH4VAJamLetWWlq8k4l7ttlke1dci3sp7KGGz4g
 AahsKuqX4FA6v/Axaxow9UOayebk0j9r7ZWb49xndN1G4D6f7y0hveCveotHm4gTmGxS
 87NJzqD0sRomm5pEJIi/4rQX01yggPZdXJO5JZ2TGYsMfdDqiWOA23hJ4PeFdK78Bjq8
 KtBZhsSuuRzocI5vPoXNnmITw4N/8xKgHqIUUxCy+jweeUM1Tir0E8lDHaLBH4wbaRDZ Mw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9n4888qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:29 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHxr02023459;
	Wed, 22 May 2024 19:25:28 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77npdqqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:28 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPPmj48628022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:27 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1226B58062;
	Wed, 22 May 2024 19:25:25 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7A1158058;
	Wed, 22 May 2024 19:25:24 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 00/20] ARM: dts: aspeed: Add IBM P11 BMC systems
Date: Wed, 22 May 2024 14:25:04 -0500
Message-Id: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KMrRXu8D_-doA88aFy8atl110pbX3gvW
X-Proofpoint-ORIG-GUID: KMrRXu8D_-doA88aFy8atl110pbX3gvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=642 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

Add the Blueridge and Fuji BMC systems. Document many missing FSI related
properties, and fix existing warnings. Make some minor fixes in OCC and
SCOM drivers for the updated bindings.

Changes since v5:
 - Switch from clock-frequency to bus-frequency for common FSI controller
   properties
 - Add reg properties for AST2700 FSI controller
 - Fix patternProperties for i2c bus nodes under FSI-based I2C controller
 - Add bus-frequency for P11 FSI device tree node
 - Change model name from Blueridge to Blueridge 2U
 - Add missing reset gpio to led controller on Fuji
 - Add Huygens (Rainier with modified FSI wiring)

Eddie James (20):
  spi: dt-bindings: Document the IBM FSI-attached SPI controller
  dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
  dt-bindings: fsi: Document the IBM SCOM engine
  dt-bindings: fsi: p9-occ: Convert to json-schema
  dt-bindings: fsi: Document the IBM SBEFIFO engine
  dt-bindings: fsi: Document the FSI controller common properties
  dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controller
  dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
  dt-bindings: fsi: Document the AST2700 FSI controller
  dt-bindings: fsi: Document the FSI Hub Controller
  dt-bindings: i2c: i2c-fsi: Convert to json-schema
  dt-bindings: arm: aspeed: add IBM P11 BMC boards
  ARM: dts: aspeed: Add IBM P11 FSI devices
  ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
  ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
  ARM: dts: aspeed: Add IBM P11 Fuji BMC system
  ARM: dts: aspeed: Add IBM Huygens BMC system
  fsi: occ: Get device number from FSI minor number API
  fsi: occ: Find next available child rather than node name match
  fsi: scom: Update compatible string to match documentation

 .../bindings/arm/aspeed/aspeed.yaml           |    2 +
 .../fsi/aspeed,ast2600-fsi-master.yaml        |  121 +
 .../bindings/fsi/fsi-controller.yaml          |   66 +
 .../bindings/fsi/fsi-master-aspeed.txt        |   36 -
 .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |   36 +-
 .../bindings/fsi/ibm,i2cr-fsi-master.yaml     |    5 +-
 .../bindings/fsi/ibm,p9-fsi-controller.yaml   |   45 +
 .../devicetree/bindings/fsi/ibm,p9-occ.txt    |   16 -
 .../devicetree/bindings/fsi/ibm,p9-occ.yaml   |   40 +
 .../bindings/fsi/ibm,p9-sbefifo.yaml          |   46 +
 .../devicetree/bindings/fsi/ibm,p9-scom.yaml  |   37 +
 .../devicetree/bindings/i2c/i2c-fsi.txt       |   40 -
 .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  |   76 +
 .../devicetree/bindings/spi/ibm,spi-fsi.yaml  |   55 +
 MAINTAINERS                                   |    2 +-
 arch/arm/boot/dts/aspeed/Makefile             |    3 +
 .../aspeed/aspeed-bmc-ibm-blueridge-4u.dts    |   21 +
 .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1691 +++++++
 .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3881 +++++++++++++++++
 .../dts/aspeed/aspeed-bmc-ibm-huygens.dts     |   23 +
 .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1539 +++++++
 drivers/fsi/fsi-occ.c                         |   49 +-
 drivers/fsi/fsi-scom.c                        |    1 +
 23 files changed, 7694 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-fsi-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-scom.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi

-- 
2.39.3



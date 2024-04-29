Return-Path: <linux-i2c+bounces-3307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BE8B63F8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A871C21B10
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CFE17920A;
	Mon, 29 Apr 2024 21:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iIeBy+k9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D6178CC1;
	Mon, 29 Apr 2024 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424513; cv=none; b=WjCgclE94NrL6zZ6Zh9XtzOhX0JbpMqqQMR1IS+vBzJYlVUKGgquBAdgbXqvrTbqMMKEUSNS2DIephClPpPjS+T6XVpookr6uF61xjBLTkSlFxiplV4en0hK2gsmnqFQ0oodLtqR6vm4Xv7t+BQQzj3d+x39PjzYYRsSj228Ggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424513; c=relaxed/simple;
	bh=+O2L9G/0QBwEbq9DlY6yLWzONMRiWRRLBrZA2i2zDRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kCUobigvt5SsbkhNHYCnr5iMRJYO/58Ojd6Lx2tJxpsKnoUyWxILR5ftB9I6sz2XynEQa+MCNPYCUTI9EgUk0XR148haum85kEMTYs8M5YsjmDIH2Oks/BOi9oBUcKiEpQh/bc2DJ23WRc3lTkW8kjIC9ulGt4Vl4c62V7h0rY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iIeBy+k9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TL0k5l007584;
	Mon, 29 Apr 2024 21:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wNGJ28Vtk6wJXeGRiVnvKvCMM3rl98GwLlQuChM+pkk=;
 b=iIeBy+k9Gj3AgalOG+jzQf51K1059VkutNDOYiwQQUuKD2jEG9O9JlGP6l6q+41Phl2t
 3rWAq8hpuMZ6N1E11Y4XJAOk1YSCo48pBeC2dFag0qMEAJ+26H5hN4RHk7Tr2ujoYehJ
 CenYjkxWOwGSmjujxtfxVNYjptCzSAIsIDXnte0Mu0Jb+UvNteOVM1DWvSMMEbWsUI/A
 v5D4OB4NKLHN22n40ahL6kZqnWRs1uO+vMrhrzOVJVFF5f7C/Uo1WdgtGubdpq8a9vCQ
 iScY60xlVmrGLfwDA4WhCN4zWwOUVLoTq9WBkbY+7ql+owdhWP9Kh4M1g7zK6Jv6tQP1 bQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjy9g0fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:37 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TIKB3r003184;
	Mon, 29 Apr 2024 21:01:36 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscpp9gax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:36 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1Xdd61342186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:35 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1655C5806C;
	Mon, 29 Apr 2024 21:01:33 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50A1658065;
	Mon, 29 Apr 2024 21:01:32 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 00/17] ARM: dts: aspeed: Add IBM P11 BMC Boards
Date: Mon, 29 Apr 2024 16:01:14 -0500
Message-Id: <20240429210131.373487-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KqqBrw2o1RWh4eEop0T0nY9adF_kMSwe
X-Proofpoint-GUID: KqqBrw2o1RWh4eEop0T0nY9adF_kMSwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=717 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

Add the Blueridge and Fuji BMC systems. Document many missing FSI related
properties, and fix existing warnings. Make some minor fixes in OCC and
SCOM drivers for the updated bindings.

Changes since v2:
 - Split up the DTS patches
 - Add documentation patches

Changes since v3:
 - Remove references to fsi.txt
 - Change ibm,p10-spi to ibm,spi-fsi
 - Change ibm,fsi2pib to ibm,p9-scom
 - Change ibm,hub-fsi-controller to ibm,p9-fsi-controller
 - Fix warnings
 - Fix formatting
 - Add device driver fixes

Eddie James (17):
  dt-bindings: spi: Document the IBM FSI-attached SPI controller
  dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
  dt-bindings: fsi: Document the IBM SCOM engine
  dt-bindings: fsi: p9-occ: Convert to json-schema
  dt-bindings: fsi: Document the IBM SBEFIFO engine
  dt-bindings: fsi: Document the FSI controller common properties
  dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controller
  dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
  dt-bindings: fsi: Document the FSI Hub Controller
  dt-bindings: i2c: i2c-fsi: Convert to json-schema
  dt-bindings: arm: aspeed: add IBM P11 BMC boards
  ARM: dts: aspeed: Add IBM P11 FSI devices
  ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
  ARM: dts: aspeed: Add IBM P11 Fuji BMC system
  fsi: occ: Get device number from FSI minor number API
  fsi: occ: Find next available child rather than node name match
  fsi: scom: Update compatible string to match documentation

 .../bindings/arm/aspeed/aspeed.yaml           |    2 +
 .../fsi/aspeed,ast2600-fsi-master.yaml        |   81 +
 .../bindings/fsi/fsi-controller.yaml          |   66 +
 .../bindings/fsi/fsi-master-aspeed.txt        |   36 -
 .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |   36 +-
 .../bindings/fsi/ibm,i2cr-fsi-master.yaml     |    5 +-
 .../bindings/fsi/ibm,p9-fsi-controller.yaml   |   45 +
 .../devicetree/bindings/fsi/ibm,p9-occ.txt    |   16 -
 .../devicetree/bindings/fsi/ibm,p9-occ.yaml   |   41 +
 .../bindings/fsi/ibm,p9-sbefifo.yaml          |   51 +
 .../devicetree/bindings/fsi/ibm,p9-scom.yaml  |   37 +
 .../devicetree/bindings/i2c/i2c-fsi.txt       |   40 -
 .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  |   58 +
 .../devicetree/bindings/spi/ibm,spi-fsi.yaml  |   55 +
 MAINTAINERS                                   |    2 +-
 arch/arm/boot/dts/aspeed/Makefile             |    2 +
 .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1689 +++++++
 .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3877 +++++++++++++++++
 .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1538 +++++++
 drivers/fsi/fsi-occ.c                         |   49 +-
 drivers/fsi/fsi-scom.c                        |    2 +-
 21 files changed, 7590 insertions(+), 138 deletions(-)
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
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi

-- 
2.39.3



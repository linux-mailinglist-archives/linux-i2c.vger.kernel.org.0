Return-Path: <linux-i2c+bounces-3160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E92AF8B2AD7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2197282487
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1037D155A55;
	Thu, 25 Apr 2024 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sOQ7fJ4y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13799153812;
	Thu, 25 Apr 2024 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081043; cv=none; b=TQDkvduebbNc1EZYgjq2DDJ0yNx+vFhhXSlTz6M/U3ru0rK6humNklBpxAm89vbbKlE71+RgRy9M7ovKafakFQcHoZABC9kzOocqupI13bLKvmf12CT3tOoexLsRn+KgCbbb+Xrz3+vX3xLnNETZwBtN9h9J9A4iOhSQg1cgT1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081043; c=relaxed/simple;
	bh=zWNzu3vC/L6cywh5f2sm/RFQYgF4qxudHzlb0ZpsGRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fXccR1QJBIJeV3gT0/SoCrXP8SZBmMwSP7JR7UypRI7v3SinGzXVSM6lDbKhA5bsGaUS27ATLs3qb4B3EtZaiRtOTX516sqsrgoObWsr6c/mZX2GvqUsZl95w1XyE+1QJ2wNykETvdnxq2sofcJcdXfI1a/M1aHeRudMg5nCJ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sOQ7fJ4y; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLXAcP009121;
	Thu, 25 Apr 2024 21:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bCX+HklUSQAeEPRI2uM06FpOeqoNmDjqmZeTZLpAINg=;
 b=sOQ7fJ4yMQHC1thOQovP88AF6IOR+nsbc4kWD1asM4x7h9l6uDnyVOJ9C+7C5E8U1QN4
 xFWIs7ozJ+BeDE/u8U/6i1DVJR2nfDTmeFjfv3LcVvaa8KRxK3MmR7cZTEKaVxmxJIrF
 L94+QTt6BueGFzODpVjSix63DnpyXOnLI2+LpRvQi4gKpjMuH8QHDNj+w4BrXARUJ9yp
 DJGsi8uAdcz3Va1PhGdRYZEGK5v9uI+DAn/3FJ7QiI83eWiBRogrw49HxPciXs5CGyQb
 MksIyrZzz3eUOn+FZl4w37arSSuA5f+cko4MIvdSnfSuELyIseUh56G5c++aPCRthA9R xQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy66r06p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:07 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PKtDqF020886;
	Thu, 25 Apr 2024 21:37:06 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmre0c9ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:06 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLb3bA43188650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:05 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6CE058056;
	Thu, 25 Apr 2024 21:37:02 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DF3658050;
	Thu, 25 Apr 2024 21:37:02 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: [PATCH v3 00/14] ARM: dts: aspeed: Add IBM P11 BMC Boards
Date: Thu, 25 Apr 2024 16:36:47 -0500
Message-Id: <20240425213701.655540-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iBqmoEe0BOw1ccHXKf33Ao58oqNwxgPw
X-Proofpoint-ORIG-GUID: iBqmoEe0BOw1ccHXKf33Ao58oqNwxgPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 mlxlogscore=693 phishscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250157

Add the Blueridge and Fuji BMC systems. Document many missing FSI related
properties, and fix existing warnings.

Changes since v2:
 - Split up the DTS patches
 - Add documentation patches

Eddie James (14):
  dt-bindings: spi: Document the IBM Power SPI controller
  dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
  dt-bindings: fsi: Document the FSI2PIB engine
  dt-bindings: fsi: p9-occ: Switch to yaml format
  dt-bindings: fsi: Document the IBM SBEFIFO engine
  dt-bindings: fsi: Document the FSI controller common properties
  dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controller
  dt-bindings: fsi: ast2600-fsi-master: Switch to yaml format
  dt-bindings: fsi: Document the FSI Hub Controller
  dt-bindings: i2c: i2c-fsi: Switch to yaml format
  dt-bindings: arm: aspeed: add IBM P11 BMC boards
  ARM: dts: aspeed: Add IBM P11 FSI devices
  ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
  ARM: dts: aspeed: Add IBM P11 Fuji BMC system

 .../bindings/arm/aspeed/aspeed.yaml           |    2 +
 .../fsi/aspeed,ast2600-fsi-master.yaml        |   72 +
 .../bindings/fsi/fsi-controller.yaml          |   65 +
 .../bindings/fsi/fsi-master-aspeed.txt        |   36 -
 .../devicetree/bindings/fsi/ibm,fsi2pib.yaml  |   38 +
 .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |   11 +
 .../bindings/fsi/ibm,hub-fsi-controller.yaml  |   44 +
 .../bindings/fsi/ibm,i2cr-fsi-master.yaml     |    5 +-
 .../devicetree/bindings/fsi/ibm,p9-occ.txt    |   16 -
 .../devicetree/bindings/fsi/ibm,p9-occ.yaml   |   41 +
 .../bindings/fsi/ibm,p9-sbefifo.yaml          |   50 +
 .../devicetree/bindings/i2c/i2c-fsi.txt       |   40 -
 .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  |   59 +
 .../devicetree/bindings/spi/ibm,p10-spi.yaml  |   56 +
 arch/arm/boot/dts/aspeed/Makefile             |    2 +
 .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1711 +++++++
 .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3984 +++++++++++++++++
 .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1696 +++++++
 18 files changed, 7835 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/ibm,p10-spi.yaml
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi

-- 
2.39.3



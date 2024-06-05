Return-Path: <linux-i2c+bounces-3815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 649298FD203
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 17:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C628A285275
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 15:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91BE376F1;
	Wed,  5 Jun 2024 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="soKB6x2i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE370BA2E;
	Wed,  5 Jun 2024 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717602455; cv=none; b=dxhQWw0PkFFCN1j1sHueFCOtXtC/yK7vZu1P/3B8H9AzGPgzACP09S8eyf35pTKKQ48fzK42iJ40bUmfYG30IIL7sfNdyz/Nba78DhSaOv3WuWhttSvcaPfGhwVv1FR5KCJUu7B/f6XMSPe5edrH59nenmNBZ039sw0/k94Ii6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717602455; c=relaxed/simple;
	bh=iPZmINkWuPVpBs6EO6GPMOT0wR4l7Cv0f7gV5nWVIuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXyx+hS+V2QjomxKGW3IvUiu0jQqD54Pvh1IoM6c/xC6X4XXB7iAjGG+vqKZAPtYHw2J1f+qfQUXNUwmO/tRrCOFCC/QjxQBSKlVXnBMAUXDr5rgKkJ6xCH7Gvdvvcg6Y60lB9E1qS6m9MXAYzeHnmGWxOcCqrMcYGcAREQ3INg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=soKB6x2i; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455FlKLX002551;
	Wed, 5 Jun 2024 15:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=4gv5PMq9+JRTPv/J+O9ju3Syd3C4Lij/iT1Nkb6JJV8=;
 b=soKB6x2im4c4+3I+9RsAcfBRYMts/PKnTlKH7/wDDlqd9FExa5T4xYfUdg9NCOJFE6N4
 Oc1UpdVC/A61E/pG8koYM84RTKGAeuugamCE3tvchB6D6YObAEs/WLpVfPw/hhdRJLWL
 48aVd/3QmRXXtzsChJHrHwgwSpRXEfdZIRU2ES5ShfK0atcXE91ry6fzdykqHxXaDrba
 0sr8DUrxvt/PIJ2+TgZC0cR/tARH190sVR/zjjI1AXe0zZXaL/aSPgUFsSUNKqEzovkk
 3p+CWmdzwlGToWxAvX0lVE6L3tv0AaLMJo/sEWWaqPGh2VcryDWPZgaAyTw16T5disdq lg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjtyd800b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 15:47:19 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455DssTD026694;
	Wed, 5 Jun 2024 15:47:18 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffn4ud1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 15:47:18 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455FlEsv63635782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 15:47:17 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF9D958052;
	Wed,  5 Jun 2024 15:47:14 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1E6F58050;
	Wed,  5 Jun 2024 15:47:13 +0000 (GMT)
Received: from [9.61.121.242] (unknown [9.61.121.242])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 15:47:13 +0000 (GMT)
Message-ID: <f2f70d62-3edb-4273-b40e-430d789f19dc@linux.ibm.com>
Date: Wed, 5 Jun 2024 10:47:13 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/20] ARM: dts: aspeed: Add IBM P11 BMC systems
To: linux-fsi@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ninad@linux.ibm.com, lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        andrew@codeconstruct.com.au, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, krzk+dt@kernel.org, andi.shyti@kernel.org,
        broonie@kernel.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4kspnDFwQMw0M2A4UVLGjkS7ewv-6qeA
X-Proofpoint-GUID: 4kspnDFwQMw0M2A4UVLGjkS7ewv-6qeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=810
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050120


On 5/22/24 14:25, Eddie James wrote:
> Add the Blueridge and Fuji BMC systems. Document many missing FSI related
> properties, and fix existing warnings. Make some minor fixes in OCC and
> SCOM drivers for the updated bindings.


Hi Joel/Andrew, what else needs to be fixed before this can be merged 
(minus Huygens patch which I will resend)? I believe all the patches 
have been reviewed.


Thanks,

Eddie


>
> Changes since v5:
>   - Switch from clock-frequency to bus-frequency for common FSI controller
>     properties
>   - Add reg properties for AST2700 FSI controller
>   - Fix patternProperties for i2c bus nodes under FSI-based I2C controller
>   - Add bus-frequency for P11 FSI device tree node
>   - Change model name from Blueridge to Blueridge 2U
>   - Add missing reset gpio to led controller on Fuji
>   - Add Huygens (Rainier with modified FSI wiring)
>
> Eddie James (20):
>    spi: dt-bindings: Document the IBM FSI-attached SPI controller
>    dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
>    dt-bindings: fsi: Document the IBM SCOM engine
>    dt-bindings: fsi: p9-occ: Convert to json-schema
>    dt-bindings: fsi: Document the IBM SBEFIFO engine
>    dt-bindings: fsi: Document the FSI controller common properties
>    dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controller
>    dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
>    dt-bindings: fsi: Document the AST2700 FSI controller
>    dt-bindings: fsi: Document the FSI Hub Controller
>    dt-bindings: i2c: i2c-fsi: Convert to json-schema
>    dt-bindings: arm: aspeed: add IBM P11 BMC boards
>    ARM: dts: aspeed: Add IBM P11 FSI devices
>    ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
>    ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
>    ARM: dts: aspeed: Add IBM P11 Fuji BMC system
>    ARM: dts: aspeed: Add IBM Huygens BMC system
>    fsi: occ: Get device number from FSI minor number API
>    fsi: occ: Find next available child rather than node name match
>    fsi: scom: Update compatible string to match documentation
>
>   .../bindings/arm/aspeed/aspeed.yaml           |    2 +
>   .../fsi/aspeed,ast2600-fsi-master.yaml        |  121 +
>   .../bindings/fsi/fsi-controller.yaml          |   66 +
>   .../bindings/fsi/fsi-master-aspeed.txt        |   36 -
>   .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |   36 +-
>   .../bindings/fsi/ibm,i2cr-fsi-master.yaml     |    5 +-
>   .../bindings/fsi/ibm,p9-fsi-controller.yaml   |   45 +
>   .../devicetree/bindings/fsi/ibm,p9-occ.txt    |   16 -
>   .../devicetree/bindings/fsi/ibm,p9-occ.yaml   |   40 +
>   .../bindings/fsi/ibm,p9-sbefifo.yaml          |   46 +
>   .../devicetree/bindings/fsi/ibm,p9-scom.yaml  |   37 +
>   .../devicetree/bindings/i2c/i2c-fsi.txt       |   40 -
>   .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  |   76 +
>   .../devicetree/bindings/spi/ibm,spi-fsi.yaml  |   55 +
>   MAINTAINERS                                   |    2 +-
>   arch/arm/boot/dts/aspeed/Makefile             |    3 +
>   .../aspeed/aspeed-bmc-ibm-blueridge-4u.dts    |   21 +
>   .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1691 +++++++
>   .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3881 +++++++++++++++++
>   .../dts/aspeed/aspeed-bmc-ibm-huygens.dts     |   23 +
>   .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1539 +++++++
>   drivers/fsi/fsi-occ.c                         |   49 +-
>   drivers/fsi/fsi-scom.c                        |    1 +
>   23 files changed, 7694 insertions(+), 137 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>   create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml
>   delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-fsi-controller.yaml
>   delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-scom.yaml
>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
>   create mode 100644 Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts
>   create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
>


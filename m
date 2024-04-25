Return-Path: <linux-i2c+bounces-3122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231A8B1B9A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B916C286304
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 07:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBD374425;
	Thu, 25 Apr 2024 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="HwPhI3xo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF26F069;
	Thu, 25 Apr 2024 07:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029043; cv=none; b=rvBgOXRku/XWVRVWB0b6llJMCLKavZzniK6gTWhZz3XETEUkWVDl0Kp2UkDu0/3PWUU+jF5G7kHTYAqWFeAY5jxcASw8OUce0vnQpV19RlXfNMnKFbHN5ULMkLvYjmsJ0szdoHuzncM5TGa+dOZf8IkTGE4XRmitEhrFliw9rcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029043; c=relaxed/simple;
	bh=OicsjI5hve5UOp2RU+b4OIl85M9vxjPjINQgH+1vvfs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VCT6fVxD557HEYGtoy7F5j8/JVrTf7kA/eJ44HD/ZG3g6MZkF0i35USs1xUJKTee4Thel0Ziw3fRphTK7V70GBMELyu0Au/9c36dpHsjLn4XcN8zZKcDBL37rHRm4xtsjrlP6NE8Y1DeHPUJ2YDdRQixbWZSDB4rU6q7c1lRocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=HwPhI3xo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P57Uvg000945;
	Thu, 25 Apr 2024 03:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=DKIM; bh=8v8v9Or7KoY1
	qlT2j9aqexZMdaKJjYew5gQOnI4G+6o=; b=HwPhI3xoRGn4tYqydhKx/VoNcvEH
	hc55Ka9f8DL/T3rAJc202NuJCI1Of52XI6mciKPU0PJ7RYIxKA90cTJ9tyXmblPo
	ZEhomudUgM+WHHc+YbrRZj3ZEEXw7Ccvd4suV2Gkjr9ZI9zvdlBlPIiVoosxCB9p
	8Vrp7ABJiD9zqzxQCelslg+KhS2ftwpPyJw1nnJITmG19N0H03oWbLMXSvFR1vfg
	WqVfw4XSTiM61IEijA7zoO/Lk7xBhpD5v553ZIk0XRHw4MOzo6srSaaHthNrkx0N
	mRsx+PqAoBU9DZj1yn4ttrVX5EoSFuC0aM/ZXKFNyLg9dwxtTptrts8Pew==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3xq3qmbchq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 03:10:14 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 43P7AD42023009
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 03:10:13 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 25 Apr 2024 03:10:12 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 25 Apr 2024 03:10:12 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 25 Apr 2024 03:10:12 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43P79tHj006908;
	Thu, 25 Apr 2024 03:09:58 -0400
From: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC
 Chiu" <Delphine_CC_Chiu@Wiwynn.com>
Subject: [PATCH v3 0/2] Add adm1281 support
Date: Thu, 25 Apr 2024 15:09:46 +0800
Message-ID: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: uxnUrTglTl1R9yfRuAprsipuzKoOy6DJ
X-Proofpoint-ORIG-GUID: uxnUrTglTl1R9yfRuAprsipuzKoOy6DJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250050

CHANGELOG:

v2 -> v3:
        - removed extra boolean member in adm1275_data structure
        - refactored commit message        

v1 -> v2:
        - removed STATUS_CML case in read_byte_data function 

Jose Ramon San Buenaventura (2):
  dt-bindings: hwmon: adm1275: add adm1281
  hwmon: pmbus: adm1275: add adm1281 support

 .../devicetree/bindings/hwmon/adi,adm1275.yaml     |  4 +++-
 Documentation/hwmon/adm1275.rst                    | 14 +++++++++++---
 drivers/hwmon/pmbus/Kconfig                        |  4 ++--
 drivers/hwmon/pmbus/adm1275.c                      |  7 +++++--
 4 files changed, 21 insertions(+), 8 deletions(-)


base-commit: 96fca68c4fbf77a8185eb10f7557e23352732ea2
-- 
2.39.2



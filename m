Return-Path: <linux-i2c+bounces-7649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2429B4A81
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 14:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6DD61F23757
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 13:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE4020606D;
	Tue, 29 Oct 2024 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AX3S0T9Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67739FC12;
	Tue, 29 Oct 2024 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206967; cv=none; b=nUwQ8CM2eOqnCY5dH6Xfyd6dYSJ4xIFuBg8ScS+EnABkOpvq/jYG7hbj/fcYfwa+/lhD4UXdMXMNVH+xdc3b7b1GdR0JcDW2QuPRDBufWvWiX0aEZaltfJbQZKyWAqQLw7PdVHIYF+BR878+uPpJXroq1fslwAJUS6xCo+HTGBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206967; c=relaxed/simple;
	bh=8pDHi+NsqYc6KyPWl4xaLmk0V33mAptPDTKThL2UBBk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Of+YRD2A6KXo9WnavNau0L5U9Zw5QdNkGCpAu/VMZQiCyMc6CijXb0UYvi5haWd2yNm0XkAvO0FGoLJVzrI3i1wfsSsvL7AkInMkpeyfIMNHkHpbnWBxerb3AP+1HkxA3pwwSDSi64b8tzLoOuu5dD8mCzh0DVapeElSve5nNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AX3S0T9Y; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TBUK9H007174;
	Tue, 29 Oct 2024 09:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RbDbm
	f2JVggkRmtqRWsBUAPI2xaXwAIUL6vHMxI6F2A=; b=AX3S0T9YDaDvlW2av3Mf4
	v6aiajWK6Py7nitpzbbDKxrlacwTPfbnG/vzDnPkP4EtAl/Fr662qagm4oRq7TQB
	0S6GsS30kHQtl0mzRP0cPWtgXg0ZaexG38LQLAS4MaR1UAlKIZ+xSe3laF2/iVMY
	4DfkXgMgkP31meLNeidBriXQOfZdoKI2fwKTCAy3kEk1+Py5SRS63TNi70Xf9KES
	n3N9pJ2SbAI4mu+h5c3ekNbct22iWnDF7YDhxK1llBbpLtcY5O/nbuqiGkuCGW3a
	Ma/E/10w58dWcZMzlyqaB168fQMHYk4z/xJbPzxsl2/WSFVQeIAcdootRAhD5H6R
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42gwb2nun0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:02:09 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49TD28LO016548
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 09:02:08 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 29 Oct
 2024 09:02:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 29 Oct 2024 09:02:08 -0400
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.108])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49TD1hWY019740;
	Tue, 29 Oct 2024 09:02:01 -0400
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Yin
	<peteryin.openbmc@gmail.com>,
        Noah Wang <noahwang.wang@outlook.com>, Marek
 Vasut <marex@denx.de>,
        Lukas Wunner <lukas@wunner.de>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: add ltp8800
Date: Tue, 29 Oct 2024 21:01:36 +0800
Message-ID: <20241029130137.31284-2-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029130137.31284-1-cedricjustine.encarnacion@analog.com>
References: <20241029130137.31284-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: RzcsAtFpLtjY2GgGDddp4hRV7FL73ZmI
X-Proofpoint-GUID: RzcsAtFpLtjY2GgGDddp4hRV7FL73ZmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290099

Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
regulator.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 6 ++++++
 MAINTAINERS                                            | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index bd784f6bb38b..efd959708c75 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -43,6 +43,12 @@ properties:
           - adi,adp5589
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
+            # Analog Devices LTP8800-1A 150A, 54V DC/DC μModule regulator
+          - adi,ltp8800-1a
+            # Analog Devices LTP8800-2 135A, 54V DC/DC μModule regulator
+          - adi,ltp8800-2
+            # Analog Devices LTP8800-4A 200A, 54V DC/DC μModule regulator
+          - adi,ltp8800-4a
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
             # Temperature monitoring of Astera Labs PT5161L PCIe retimer
diff --git a/MAINTAINERS b/MAINTAINERS
index ca7e827da33e..a6abf7243b94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13555,6 +13555,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
 F:	drivers/iio/light/ltr390.c
 
+LTP8800 HARDWARE MONITOR DRIVER
+M:	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org
-- 
2.39.2



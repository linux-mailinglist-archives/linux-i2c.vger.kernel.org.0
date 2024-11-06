Return-Path: <linux-i2c+bounces-7815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6D29BDD71
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 04:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A5491C23234
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 03:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931A519049A;
	Wed,  6 Nov 2024 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="OODp7TBN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08C4190470;
	Wed,  6 Nov 2024 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730862616; cv=none; b=qpzFit2HxMsuipjTD2+xmMoqiEt1vQPciuT2Xe22RCLEKiVAIXsW1EgvxqxRsg0MNNKpZ2PMYRkOZYRaJJjoC1cipp7+0EUOVPZk9D8CYks272dQnvxCJ0FANoSyELBd1GPQ+PjI6pt7XW2fWx4Ev4OAxUtYK+kV/lpFF/wgOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730862616; c=relaxed/simple;
	bh=QNTppQj/d1L5aa6ZZulY5xSwmFar9G2WiXHhj5AHQb4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ts7SKzUicVnCrlUaKWzxDc0xlrYpLy8yrocHTvxgcS+68FhwyWtA6oxdE8N2n52MAj5juNjIDJVYVt9oYxHY4rmEg1kxhqrf4XSrZ0poCyKqlrL57q+A0xqy6BVvZCajQYp+Zh0PR5KXT7UIEZiGO2Nt9UvLP2jSkJH327KIOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=OODp7TBN; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A60LtLD032760;
	Tue, 5 Nov 2024 22:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=xz4bZ
	/4rc90JKFlpyEO8UIwXNjeqjSxD+2qYdRDicbA=; b=OODp7TBNm3tQWsJTcNx8s
	qZVBbt8/MVAFcdcja0ggb+S9eyt96m2bwePnee4i19GG7ppitMU5sE6SwM2ALCAw
	+HW2UBG4N/S3qp2VQhxaWjc8/G+yZDYtjq2UyBsBRRzgQkZEYVAkzSnvl9MAeYYM
	xrq8YYna15JRHrjgSv98SrvVq6ayqx5BLWY0LrzxJKaBhjmz/W3s3lI/bmHxdIN8
	7TWnRsvsF2Y2AhBdzcDMyDijvAgiDJ1+d8m1NV1q7ShHH47VnpukYxfnYzjw2N+I
	AwWmsNwZ1aSZtaOmU+6+/xnkYGeVE8OdIyAsbjUF10zxeJ2l2whABIPvqV8NJxpW
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42qf1dcefk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 22:09:53 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 4A639qFR047033
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 22:09:52 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 5 Nov 2024 22:09:52 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 5 Nov 2024 22:09:52 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 5 Nov 2024 22:09:52 -0500
Received: from CENCARNA-L02.ad.analog.com ([10.117.116.147])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4A639R2v010682;
	Tue, 5 Nov 2024 22:09:45 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter
 Yin <peteryin.openbmc@gmail.com>,
        Noah Wang <noahwang.wang@outlook.com>, "Marek Vasut" <marex@denx.de>,
        Lukas Wunner <lukas@wunner.de>,
        Cedric
 Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
Date: Wed, 6 Nov 2024 11:09:17 +0800
Message-ID: <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 9yXEMtOLuRDZ_aNd2fDP1x-KH9uq6rGK
X-Proofpoint-GUID: 9yXEMtOLuRDZ_aNd2fDP1x-KH9uq6rGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060023

Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
regulator.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 MAINTAINERS                                            | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 90a7c0a3dc48..72877d00b8dd 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -43,6 +43,8 @@ properties:
           - adi,adp5589
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
+            # Analog Devices LTP8800-1A/-2/-4A 150A/135A/200A, 54V DC/DC μModule regulator
+          - adi,ltp8800
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
             # Temperature monitoring of Astera Labs PT5161L PCIe retimer
diff --git a/MAINTAINERS b/MAINTAINERS
index 7c357800519a..6ca691500fb7 100644
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
2.39.5



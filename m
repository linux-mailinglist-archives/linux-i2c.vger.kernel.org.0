Return-Path: <linux-i2c+bounces-8930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34EA0280A
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 15:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A253A2041
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 14:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BA91DED5B;
	Mon,  6 Jan 2025 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="TeXyAI28"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3379A1DE8BD;
	Mon,  6 Jan 2025 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173904; cv=none; b=Lz8jzJeuZleHNBVH8oSa4XmQh+vlVCg9ckgAWa+Ikq59hD4q7nt4O8QWpQUb3i8mwkmgxgH75yhVAvVeE+htMrrSdwH6aPIlIZ/NCML2ynQO3lRFe1b+YP+oE/mx4ApOBs0ZdaLjz/4ngQsQBnHBSsbw81T8Ymnrw7izLTvKnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173904; c=relaxed/simple;
	bh=cGopoQ3gUhrwm/x+IJqHHj7+VFcZg0+zW57GRnMnK+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BU4wpr97MutQSiBlYqastV5qTkgALJwIeiJ+UH/G+gJjKZJA+V4iqE5U6RTx4rKigmT0VUz61NfDB8FJA6DcJKmjnD5pA6RfphEmKe1QwRdW1ah9oLBSpmmLMevfHjXfA/gHJ84GzWWUeTi8Q9ZrVfQjKnpyVvCrMAMysaHkkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=TeXyAI28; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5068Y8bD005948;
	Mon, 6 Jan 2025 08:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=kt7Iz
	I7J20UqIdknLawLtG52wUhrMclt9jb9IooJjBM=; b=TeXyAI28fjeJwfyXt6HZC
	gtPYlnZwJ/6MDnwhXCT3k3ha0R/GxndITcouQrSufcAeMhf6KmWCDx4jZPj0roqS
	W2/GD4tu4GNZZ9lkK+4gZMV9A3/SfshXVhyjv/ooOl8N9/emc6JO52Lv7+B3QTBQ
	a33h3j7OyU/njneKDtR7DsftLAsgdD+6zpiVZHGI/DG7tcO/6R+82NEW1r7E0TQe
	lIT23mFNFMM4oKmRd7zx5E6keUd1RyNjFfgtiBA27wmgKf/d/nXTcauY5S7Sujct
	kfrufqK/gen5zIcWTrli1LwDXZrCAS0qsnDKXx0QGvsiXf1p82CHthpVPiggwQNG
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 440bsf8vvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 08:18:10 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 506DI8kr036669
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 08:18:08 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 6 Jan 2025 08:18:08 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 6 Jan 2025 08:18:08 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 6 Jan 2025 08:18:08 -0500
Received: from JGERONI2-L01.ad.analog.com (JGERONI2-L01.ad.analog.com [10.117.223.41])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 506DHlGR001854;
	Mon, 6 Jan 2025 08:18:00 -0500
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
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
 Chiu" <Delphine_CC_Chiu@Wiwynn.com>,
        Wolfram Sang
	<wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: adm1275: add adm1273
Date: Mon, 6 Jan 2025 21:17:39 +0800
Message-ID: <20250106131740.305988-2-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
References: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: rBmado6AC_qDo0hmpaGeCJ66qc6FrUiQ
X-Proofpoint-GUID: rBmado6AC_qDo0hmpaGeCJ66qc6FrUiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=989 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501060118

Add support for the adm1273 Hot-Swap Controller and Digital Power
and Energy Monitor

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index 5b076d677..fd79bf2e0 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -24,6 +24,7 @@ properties:
     enum:
       - adi,adm1075
       - adi,adm1272
+      - adi,adm1273
       - adi,adm1275
       - adi,adm1276
       - adi,adm1278
@@ -79,6 +80,7 @@ allOf:
           contains:
             enum:
               - adi,adm1272
+              - adi,adm1273
     then:
       properties:
         adi,volt-curr-sample-average:
-- 
2.34.1



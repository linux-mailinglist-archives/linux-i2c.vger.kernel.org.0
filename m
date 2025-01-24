Return-Path: <linux-i2c+bounces-9188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74EA1B979
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13A47188EB91
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C0215DBAB;
	Fri, 24 Jan 2025 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ogQHHRyj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244FE15B551;
	Fri, 24 Jan 2025 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737733198; cv=none; b=ao9/mmFoIbXHqkL4QGjcxNmMBMUyLwq1JthkYNoKj6ZEl9wJtv0NAWXX84KsZMT6oVbl+Q9DUNBbx04JjGt7291c+GQi7tXf5/QLxS66j+KIHfhKm53JXO90+Q15F27I3Khu+4nBk2JqX0UAvfGbnh98tzW5Do0Mb8teROoIOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737733198; c=relaxed/simple;
	bh=MIpa/E793H6Sacao9IIJdzMN6/0jXKLSvW0b9R3uP14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dYUh+x1REaJZfs/9Sg/frVT9R5LPQWg0x5Wi+wZgp1kO8eqEhTkWpVrJBJ7GdhRSMjV3PoQIm5l2K4bHw7ovE/hcS8fev5HgpIrXWEewKtKrNbF/XVJRJSpsz5o4wCdjE3klpf1wWgzjnS2vBQfFRH8Fswa8q007elhEWtLoVM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ogQHHRyj; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OFYkGf025495;
	Fri, 24 Jan 2025 10:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=8h7pG
	/rLM7aWxqQN/wmL+IR2V2wz5jEfIXw0gJgojuI=; b=ogQHHRyjiaWqQtd3TEdLn
	jYP5y0uHlRMzajmSNvfFqgokgT29LBHdpt4JdTbG6Rft8CZWJk//Iq1FNodz6Px4
	9ltqb0gxnv3M5a87RXaMSncFjr0vhM0gs10WitlIHuS7lPquH7RBIP37vG84WbL4
	N5McLAQUOX2XMZOh8kJp7bzgxxl5b2ZxPda4hTCMVYOW4swZbXAyNj8H5LvSwVyw
	0iyQyQVwXSUHbeI6eWGCSoQrwWoZ4LBUm43ENaXy40Aq9cQwghCTRsevs0zJd5bT
	idO8MTFBo8HQSRk7wUr5Pbw162AwGbtZObt/EvaYwnRXSUuRlKci4qb+Qsu8C/zE
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44c8qcs9a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:39:40 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 50OFddva035846
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:39:39 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:39:39 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:39:38 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:39:38 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFdFBB032412;
	Fri, 24 Jan 2025 10:39:32 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Fri, 24 Jan 2025 23:39:06 +0800
Subject: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-upstream-lt3074-v1-1-7603f346433e@analog.com>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
In-Reply-To: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC Chiu" <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737733156; l=984;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=MIpa/E793H6Sacao9IIJdzMN6/0jXKLSvW0b9R3uP14=;
 b=SGNyPQRNdeJZ7D88WTEHxXwTFedBStH6AgIpn6E0RCcwD0NYTFWenkipAaQWNntbifKBVBQ88
 KSHGoI9AykiATjlzW8rBuBTEHoGk9yGNfMdt6fT1VNvOcNWwy3vPwB/
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: gEXRf0FhMWErxDeJALQRQEd_6tIUl4LS
X-Proofpoint-ORIG-GUID: gEXRf0FhMWErxDeJALQRQEd_6tIUl4LS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240110

Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
Regulator.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6bdcd055e763..8f7a8e28fb97 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -41,6 +41,8 @@ properties:
           - adi,ad5110
             # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
           - adi,adp5589
+            # Analog Devices LT3074 3A, 5.5V Low Voltage Linear Regulator
+          - adi,lt3074
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor

-- 
2.39.5



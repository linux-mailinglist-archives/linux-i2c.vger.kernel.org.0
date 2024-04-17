Return-Path: <linux-i2c+bounces-2988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5268F8A799C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 02:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC6BDB22639
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 00:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6670B380;
	Wed, 17 Apr 2024 00:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="lKtLeQ0M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BF510E9;
	Wed, 17 Apr 2024 00:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713312488; cv=none; b=qKLK5tXQEqnEAuXvrqIhXq9g3vsmbn3nBGdG+KMpHM1ezqItct9MIPgvAAMpIbWqwm0dLShB1vIet8QVL4FKjwaILK48V3AUlqJkVN9ncqlj4MzvSi9Ef4MBWYQYdKQnas68ni9+Y2/V9jFFqRj0kEcFKkxNB9ps3/UNdA2H8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713312488; c=relaxed/simple;
	bh=QEbKUHPN28xQg3hvNSYLsfLMm928kGAUtV175U5I5Bg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K4mOGMyaZ6oqud44EGpW62zn8sR234w5Cn1CVU8yI6vishgiDew75XIUu0spZp9j68yRazWGADSMhF0c/h28AZA0KMs4IVsOQUkcwC8UGbl3g+62w8Lvqlwspit/Bv4LLWHBCW+GZOoCo394Jw+YwCukT2u5sQ9H8EMSLWE1ma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=lKtLeQ0M; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GMA8LX000873;
	Tue, 16 Apr 2024 20:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=DKIM; bh=tdJYlHJm0iil
	Nkuzycg5ruKr1mm1sq6tC0qj4zXy3U8=; b=lKtLeQ0Mjok9i8mPNM9XLS274hjL
	qo4Jf+NzeDFP66zCGlzDOUhb+vaS4tR8CC9FwIyIgl3Y2Gfr7Ku9GQ/PPGZb6dlL
	IJWfe2ZYmtFBnzVT0/DlJtams+XoR8zqm3tW1EXPWKJuD97sTB2iiqj/+jSsA367
	9R1fN3/yeRrVNSqLaBLh30ndFr6gJTLnGmf62hLcwzJ2I0W1N96XNtt0Lj+5yfYf
	anNJJ14tx4iLm0ZWsDH5m4Rc0pRR6a7lNdx2GLmotfqcMWD452k5nH4BeYf2UNRc
	gIDWNUVZ6tRJylmCXOxjQAWMCWTiaLO97+dsA6NGDNy9eFobf+OOC64KgQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3xhvv99fqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 20:07:50 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 43H07nkM061332
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 20:07:49 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 16 Apr 2024 20:07:48 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 16 Apr 2024 20:07:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 16 Apr 2024 20:07:48 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43H07T2t022696;
	Tue, 16 Apr 2024 20:07:32 -0400
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
 Chiu" <Delphine_CC_Chiu@Wiwynn.com>,
        Jose Ramon San Buenaventura
	<jose.sanbuenaventura@analog.com>
Subject: [PATCH 0/2] Add adm1281 support
Date: Wed, 17 Apr 2024 08:07:20 +0800
Message-ID: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
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
X-Proofpoint-GUID: 7sk41kH7McFLjaVSan5K9mfnfvPsDT-S
X-Proofpoint-ORIG-GUID: 7sk41kH7McFLjaVSan5K9mfnfvPsDT-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_19,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 mlxlogscore=950 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160158

The ADM1281 is also a Hot-swap controller designed to be a drop-in
replacement to the ADM1278. The currently available adm1275 driver supports
the adm1278 and this patch adds support for the adm1281, specifically
adding support for STATUS_CML register reads.
 
An existing patch was found that adds support for the adm1281 but has not 
been followed up since November 22, 2023. This patch aims to serve as a
follow up or an improvement of the previously submitted patch especially
since the code was tested on the actual adm1281 evaluation board.

Jose Ramon San Buenaventura (2):
  dt-bindings: hwmon: adm1275: add adm1281
  hwmon: pmbus: adm1275: add adm1281 support

 .../bindings/hwmon/adi,adm1275.yaml           |  4 ++-
 Documentation/hwmon/adm1275.rst               | 14 +++++++---
 drivers/hwmon/pmbus/Kconfig                   |  4 +--
 drivers/hwmon/pmbus/adm1275.c                 | 27 +++++++++++++++++--
 4 files changed, 41 insertions(+), 8 deletions(-)


base-commit: 96fca68c4fbf77a8185eb10f7557e23352732ea2
-- 
2.39.2



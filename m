Return-Path: <linux-i2c+bounces-9183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A99A1B94D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA28B1636CE
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFCE1A4AA1;
	Fri, 24 Jan 2025 15:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="IEYRcmDy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8B0157472;
	Fri, 24 Jan 2025 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737732249; cv=none; b=GT/El9ceF6UaXqawNhE2ogBPZoKlRvohdmj9LztYqrMO3w7kktZzqkFYwrWhOxWYOchfNk0wPBd81kbbRtKvuqTvVITCPKgTyw+Tb6G8IYc5xuxaGbimq074gBWNzbjeW9r17437wpW58oomxz3GZ1+s0ogesabolHiYKGDUEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737732249; c=relaxed/simple;
	bh=OGAkPTCYgPJqkVWRoGk6zV3T7zlcouYdj+7gp2lKgSA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uPIhGYBOL9VniM30fzoM90XfPSuA0LwKIUGzDoN+gm1RvefWq2WjnGTPJHQbzDNBi9SO+N63oIsv6MDrnGNbSXpPY3fJ33BYofTM3ZNr+kPJEoQPlq3QE7XEJ/6jPOP7LQ5z5uxmMxKWVUvB2+Tmp+In9Yz6aEEmTblaRgTKRwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=IEYRcmDy; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OEmj1e006476;
	Fri, 24 Jan 2025 10:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=Q4IHX8JV+R1uY7LajjQJlxKGJds
	vpF2xmZLtgfck4mw=; b=IEYRcmDyrAn+oqEr0xCT3/g4HiWOTfBnh8t8cVg9PRi
	T9+Amr/IlGmMoA7EqUrjXiGN/oZY8wAT/j8CSDub64xQkvXMAJ/cOT4He9zw/v50
	RpiNWzbDILo+O5RN3k8NDbK0wcTwCdyqGlzP/GpTd974IW47+0711iEUUlG7+MGP
	kpLUl7tFuvWZ9XOjXTKmk2JlP9dRVRaJSmGkffkJvJzzf/VKRXiMIY1yHTOko/bC
	NguRBN1usQPv3XBRY0uI3RaCYTOtVrqqj0my/jiCahAmnyFBiB9du7xKSh95i2cv
	TmyXLSyaHP0SIuhbKUKhIaqrHB/PwJut2oYLhiQHIbQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44ccxx05b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:23:49 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 50OFNlRr035441
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:23:47 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 24 Jan
 2025 10:23:47 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:23:47 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFNS7R031971;
	Fri, 24 Jan 2025 10:23:31 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: =?utf-8?q?=5BPATCH_0/2=5D_Add_support_for_LTM4673_=CE=BCModule_r?=
 =?utf-8?q?egulator?=
Date: Fri, 24 Jan 2025 23:23:04 +0800
Message-ID: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFiwk2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMT3ZySXBMzc2NdS+OU1FTjtGRDS+MkJaDqgqLUtMwKsEnRsbW1APq
 kwH1ZAAAA
X-Change-ID: 20250124-ltm4673-93dee3fc193b
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737732208; l=1108;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=OGAkPTCYgPJqkVWRoGk6zV3T7zlcouYdj+7gp2lKgSA=;
 b=311aN/magwRUfk5l5l+mT2bTYLEOr+N7eEAhviW9IH52pHMwYaaRHMEDE/bJOF5LJLrLW5wAz
 nNCbUkErE0iCerJ2haL0bfHlkR8bHlxpTJBJ2Z9OtLdrNc/2v+KoDBw
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: QRB1hN3FjqqsBiTmcSGLl32BJV8LfJ7n
X-Proofpoint-ORIG-GUID: QRB1hN3FjqqsBiTmcSGLl32BJV8LfJ7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 mlxlogscore=797 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108

Introduce support for LTM4673, a quad output, dual 12A and dual 5A,
switching mode DC/DC step-down μModule regulator integrated with
4-channel power system manager used to sequence, trim, margin,
supervise, manage faults, provide telemetry, and create fault logs, all
via the PMBus interface. Unlike other LTM46xx μModule regulators, the
LTM4673 has four output channels.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
Cedric Encarnacion (2):
      dt-bindings: hwmon: ltc2978: add support for ltm4673
      hwmon: (pmbus/ltc2978) add support for ltm4673

 .../devicetree/bindings/hwmon/lltc,ltc2978.yaml    |  2 ++
 Documentation/hwmon/ltc2978.rst                    |  8 +++++++
 drivers/hwmon/pmbus/Kconfig                        |  4 ++--
 drivers/hwmon/pmbus/ltc2978.c                      | 25 ++++++++++++++++++++--
 4 files changed, 35 insertions(+), 4 deletions(-)
---
base-commit: a76539b293677c5c163b9285b0cd8dd420d33989
change-id: 20250124-ltm4673-93dee3fc193b

Best regards,
-- 
Cedric Encarnacion <cedricjustine.encarnacion@analog.com>



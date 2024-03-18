Return-Path: <linux-i2c+bounces-2385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2887E8BB
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 12:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF9A1F23401
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 11:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE8F37143;
	Mon, 18 Mar 2024 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AWvY+op5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC252EAE0;
	Mon, 18 Mar 2024 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710761778; cv=none; b=a7ZYVJz5PhFfxOVymglJcfkxtUxoqyyS9xvhBQChMDVttXpyqq/TcPHVFrmhQ8rCNm/oF0AY2QoQcXHkrIoH6UTpW3BVeZOLT/0HfIxrTrqSkIO/ueDR2JFfwhEgMA83nU1g7UC28PrcSPT94u+yoDNxGPIrKp/qH+LfjLBEy3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710761778; c=relaxed/simple;
	bh=E37YPtRMQLajq0y7J+0i5Qyxqy8cnmFB2WeJKMX7wOA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EUoREGcXXuO9F1NsJBgPMLq82hs0g1kR4JnC1Dt0cv31joDSGRTrWbzJZYDkC003azo185IkNy3ImVKK18CicLW5tbnSEK9Z0m/xD0lmPo9NltFdRMDkGw+jajo/+d0z/asTHCjrUpJhfNqwmpMJKVGbIkpCDNvq/fR110dBEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AWvY+op5; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42IAjrru010689;
	Mon, 18 Mar 2024 07:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=DKIM; bh=dwNsCIszrSUBJV4E/OUlM450N
	4H1ANqdvohbTLT71w0=; b=AWvY+op5ZUqSaHXwI8yVQKY6dwnv5VZZc2x81OF88
	55K3BPZnYe2KAF8DMO3kA6EKGeSo4hqHCq/5iUCgeWO0JFm6cPD8GRhBYtPbwzKj
	QcQpml/mIFwxUIjYdUXmG8IFuQ0CsQU0Aw0BBtMnjWovzNhcww5U8FNNeUXZhoMs
	0j/fg46TAIns6CSPkOt//TyApo4+OetHL3rHcbht8FY5QXIaJHhwuXs9mK3QqUb1
	bMxOxdsUxDXnudw+yug7wvlSJi4MvEg7Tzo8mk1FimjIIZYys9VK7KHAa/krdTjG
	GxAg/3n+DFpydArKczY3roTz603Tt6+O7nfMwAaiQ1bnw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3wxecys6uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 07:23:06 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 42IBN50P024981
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Mar 2024 07:23:05 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Mar 2024 07:23:04 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Mar 2024 07:23:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 18 Mar 2024 07:23:04 -0400
Received: from radu.ad.analog.com ([10.48.65.243])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 42IBMkMc030326;
	Mon, 18 Mar 2024 07:22:48 -0400
From: Radu Sabau <radu.sabau@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Radu Sabau <radu.sabau@analog.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH 0/2] Add ADP1050 support
Date: Mon, 18 Mar 2024 13:21:33 +0200
Message-ID: <20240318112140.385244-1-radu.sabau@analog.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: sGQqd6QPndlgI_Ih23rwr4VEPoTV4TVR
X-Proofpoint-GUID: sGQqd6QPndlgI_Ih23rwr4VEPoTV4TVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_02,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=876 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180085

The ADP1050 is an advanced digital controller with a PMBus™
interface targeting high density, high efficiency dc-to-dc power 
conversion which can measure input/output voltages, input currents
and temperature.

Radu Sabau (2):
  dt-bindings: hwmon: pmbus: adp1050 : add bindings
  hwmon: pmbus: adp1050 : Add driver support

 .../bindings/hwmon/pmbus/adi,adp1050.yaml     |  65 ++++++++++
 Documentation/hwmon/adp1050.rst               |  69 +++++++++++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   8 ++
 drivers/hwmon/pmbus/Kconfig                   |  10 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/adp1050.c                 | 111 ++++++++++++++++++
 7 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
 create mode 100644 Documentation/hwmon/adp1050.rst
 create mode 100644 drivers/hwmon/pmbus/adp1050.c

-- 
2.34.1



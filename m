Return-Path: <linux-i2c+bounces-9579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D767A43FF8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 14:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A703A572D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 13:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EF0268FEE;
	Tue, 25 Feb 2025 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="YprGR3q4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274072686B1;
	Tue, 25 Feb 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488527; cv=none; b=tDUvChzzzTDA6zfesB9K4p7QxT2xaebnPxT82o53V5BeAA+LdK88u94hAdyQ0byXoIxYToEGgtf8uPSEree6EpZXHa9jFfx59ClOe3vcVz0NdFUGfkv/H7tRib/8IlguU9dMHCva2Tm7H8+x1IMopCpOkoYaZEUdszLfS4WQync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488527; c=relaxed/simple;
	bh=eaO/axIomN57wbu9Q86ufLGH5usOhqRBBhwtKqX6/5M=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=W8bIp98IUkmMceykfoqyFf6lqW/s/iXJdaSpH/vAv8+a/zob8SJHGvdHWQy4Ds0hEu0UVtDykgI8evYyjbMKkzli/SkmRmNVfdDPiJrQhZt9Sihx9djcZEFhISbMLDHN7LTvpCn6auMfKXhQWeRXINnNjPjMPHjFB1BRD23vNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=YprGR3q4; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PANJwf032103;
	Tue, 25 Feb 2025 08:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=jfvPMnHZRQjpKAtCzy7mGoWTnI0
	VS3BVSEay4BZVuik=; b=YprGR3q4q+ldsQwP4ywGVcQfTcji4DjWQK45J08oe6j
	4/5mGnXnMq8FtaSqakdJUNwA/ZCUtnPN8SI3J74Oy4Mq+5KqstQm6zWe+w2DIdE8
	Go81/aMTQrgVms1QQ5gNwIPmC/h6IlWvmufeHeKJfvmzmagxcqU2hYe5Wqy6wi8D
	KGJsO90dtLV9h2Ll7ZOfFlvOcmbDh7iBOf7mnxg87yNgBTXyC7OTApQwxCHGLnR4
	eD12NgtiEzuRuj68SPQ9DL74gshjoL14xp6rpVSaMqA90KKwzA6kpD8vQBYYFSXv
	UO2NnXqbJnJq30HD0wD6odfTsApnU5ZruYWScQiGlag==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44yccapsvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 08:01:50 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 51PD1m2W015492
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 08:01:48 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 25 Feb
 2025 08:01:48 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 25 Feb 2025 08:01:48 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.88])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51PD1VXT020999;
	Tue, 25 Feb 2025 08:01:34 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: [PATCH v2 0/2] Add support for LT3074 low voltage linear regulator
Date: Tue, 25 Feb 2025 21:01:12 +0800
Message-ID: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABm/vWcC/3WNwQ7CIBAFf6XZsxhgkRpP/Q/TA9ZtS9JCA0g0D
 f8u9u5xJnnzdogULEW4NTsEyjZa7yrIUwPDbNxEzD4rg+TywoVU7LXFFMisbEnIW8WERLwqqTT
 xB9TVFmi076N47yvPNiYfPsdBFj/7v5UF46zVHEdUWiFSZ5xZ/HQe/Ap9KeUL8rJvVa8AAAA=
X-Change-ID: 20250124-upstream-lt3074-123384246e0b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC
 Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740488492; l=1569;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=eaO/axIomN57wbu9Q86ufLGH5usOhqRBBhwtKqX6/5M=;
 b=TFl578K45wZF5TKnxi8LIHWO+aj5kWahZKTRooxyAjFT7g4uuPHhAFalHHYfcNU6XZAQOFyaD
 xOh5SLFfDBrDMfgxvi7fiyVTrJcjIb9nKLG5+z/RySGD+s7IUmo6619
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: U2jK9sHfAJCRRVqBrxBkdWD9CcXeZMaX
X-Authority-Analysis: v=2.4 cv=SPa4VPvH c=1 sm=1 tr=0 ts=67bdbf3e cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=HTG6LfV_5ri_l7Ai_WkA:9 a=QEXdDO2ut3YA:10
 a=oVHKYsEdi7-vN-J5QA_j:22
X-Proofpoint-ORIG-GUID: U2jK9sHfAJCRRVqBrxBkdWD9CcXeZMaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250090

Introduce hardware monitoring and regulator support for LT3074. The
component is an ultrafast, ultralow noise 3A, 5.5V dropout linear
regulator with a PMBus serial interface that allows telemetry for
input/output voltage, output current, and die temperature. It has a
single channel and requires a bias voltage which can be monitored via
manufacturer-specific registers.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
Changes in v2:
 * Separated dt-binding for LT3074.
 * Added __maybe_unused attribute to of_device_id. This addresses kernel
   test robot warning.
 * Added entry to MAINTAINERS.

- Link to v1: https://lore.kernel.org/r/20250124-upstream-lt3074-v1-0-7603f346433e@analog.com

---
Cedric Encarnacion (2):
      dt-bindings: hwmon: pmbus: add lt3074
      hwmon: (pmbus/lt3074): add support for lt3074

 .../bindings/hwmon/pmbus/adi,lt3074.yaml           |  64 +++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/lt3074.rst                     |  72 ++++++++++++
 MAINTAINERS                                        |   9 ++
 drivers/hwmon/pmbus/Kconfig                        |  18 +++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/lt3074.c                       | 122 +++++++++++++++++++++
 7 files changed, 287 insertions(+)
---
base-commit: 8df0f002827e18632dcd986f7546c1abf1953a6f
change-id: 20250124-upstream-lt3074-123384246e0b

Best regards,
-- 
Cedric Encarnacion <cedricjustine.encarnacion@analog.com>



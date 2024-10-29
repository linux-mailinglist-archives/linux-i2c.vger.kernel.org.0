Return-Path: <linux-i2c+bounces-7648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B79B4A7E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 14:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7004B2404F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 13:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93174205132;
	Tue, 29 Oct 2024 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xq2XKue2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67701C2ED;
	Tue, 29 Oct 2024 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206966; cv=none; b=H/CpLTD5YthhISyoT/EDxh7RzBcr0Eqm6Xg0s7/8CEwAhwgoeSbVOM8smc6h45gIaFYxolh+qAsv5lnJV0dh+BprbvpG2exttFvucBbHuLNX3hpCcTb8XfgE66JyLPgocQ//is13y+iu4gvtQGSkWtz6xtXKPwVFJUDZvlQ4GpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206966; c=relaxed/simple;
	bh=6zlYd9Sh85VMhYNMWlJ/18aBsnWAUD7V/elpV+0eEzU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LmxAxGevDAP6y6IT3se1jQYzyP7I6kmDVqAjeKrz9aWarZPi5eeytBmM29Bh1SYtxqCqlmdlKqnveNcrefEQ2slmj+wV1oyyw/gNCF+Gc+oZb1PqCz7d569/cfErJH4qYWAL4WLsj6ep0YyIzCeAU3VsQEkDyTNaJvuV6zarjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xq2XKue2; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9B2Bi026333;
	Tue, 29 Oct 2024 09:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=bx79OakHKqtLIjSc4XDf4/sUlI+
	y0vKG14CYdzRXTng=; b=xq2XKue2LQPSiQXgNR2x7nHKoFOwwGMPeyPhNMiar9V
	YcV9HHj1qQZR2kxxkeEiR1U7I63VGECziPNd7IN4IRNTj5j4q1ZPAK8jKoP2Ooh2
	u7AZM9pn4dARjtGRJccLwRVxVwV7T4QK7GJqo5t145DIOxcR+07Y6073mx7uAccA
	vZsgZ2t5NpaOcmzVTFQU9StnuHBuo7aOP6e9sFhoa4y/w33kAQYN7tWNKOfhLe9V
	829156AGKnLARZSXviP3EcGXuF/GgZDaGno/KEG8Za1VaQEYMt/VhH7G3Muhx62s
	N/F9YvYsMRU7ff4UsxmA6cMtb0EYl9fgIi5nhur55cQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42gwb2numn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:02:07 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49TD25Ti016534
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 09:02:05 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 29 Oct 2024 09:02:05 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 29 Oct 2024 09:02:05 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 29 Oct 2024 09:02:05 -0400
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.108])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49TD1hWX019740;
	Tue, 29 Oct 2024 09:01:46 -0400
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
Subject: [PATCH 0/2] Add driver for LTP8800-1A, LTP8800-2 and LTP8800-4A
Date: Tue, 29 Oct 2024 21:01:35 +0800
Message-ID: <20241029130137.31284-1-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 4E73l1UoolAgn6w22Qz-IpePKHS3Uxo2
X-Proofpoint-GUID: 4E73l1UoolAgn6w22Qz-IpePKHS3Uxo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=972 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290099

The LTP8800-1A/-2/-4A is a 150A/135A/200A step-down μModule regulator that
provides microprocessor core voltage from 54V power distribution
architecture. It features remote configurability and telemetry monitoring
of power management parameters over PMBus. This patch series adds driver
and bindings for these devices.

Cedric Encarnacion (2):
  dt-bindings: trivial-devices: add ltp8800
  hwmon: pmbus: add driver for ltp8800-1a, ltp8800-4a, and ltp8800-2

 .../devicetree/bindings/trivial-devices.yaml  |   6 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/ltp8800.rst               | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 drivers/hwmon/pmbus/Kconfig                   |  18 +++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltp8800.c                 |  74 +++++++++++++
 7 files changed, 210 insertions(+)
 create mode 100644 Documentation/hwmon/ltp8800.rst
 create mode 100644 drivers/hwmon/pmbus/ltp8800.c


base-commit: 893acae4cdaf34fdde0e7285d5922af70775e5f7
-- 
2.39.2



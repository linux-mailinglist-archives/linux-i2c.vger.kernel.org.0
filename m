Return-Path: <linux-i2c+bounces-8931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E24A02B81
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 16:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B8273A53EA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 15:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A181DA631;
	Mon,  6 Jan 2025 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="P/UzwYEI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C0155352;
	Mon,  6 Jan 2025 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178181; cv=none; b=L8J1GO4wi6H69bIddftTKsUeoz75mLM0vsrzX0H4W8UJ5heauo3TenvtPaoqPeWyykYu1de8JJ+ISbn939y73ZOE2Evg4cwOJMBDX0rMNGfApN9doLjKMANrK/y401n/w/EIHU5OCqhXBvu/MoxSHZIvdNz3bw0PLqa5RMDeOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178181; c=relaxed/simple;
	bh=kELh5DgnXjYVFv62duahwOSS5AzvIwpBgHw7y9JBmtA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DTGzm8lxDF78MY0LXQKizU2JwJ8HWZ3+T8L9+pyGEjKhIHvcOagzWsdyyxL1Spe5zrVNOisG7NNpcfeyxZrJlp8JXGVMbp7KYHYbBm5HAQeUTNISX8sy9QWqhgTMprxKafg1OUAtbpuAnKM+qzVx6L8aygNjvpQHhQpgqg9RrKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=P/UzwYEI; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Chae4027018;
	Mon, 6 Jan 2025 08:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=l/pg1PsKr2Ek6BpQ1jwRtG7W/lC
	tM29uwW/0AeYa1AY=; b=P/UzwYEIVMl6ZuFJgU2NfMw1fJZMtFucFqDsWj44dWv
	1wFvAlDpm5q14ARADnt6p95CKBTn28n856LkeDBcIYX/aJJhmJ9dtl42iV28VTw1
	KgbALtxLevV27WdHl0jDURMTy2nflB2N6zDxpMk8DKHlKkOixptQ8pQtohNp8+8K
	Fy1EPPKqEqXP6hC6fXUd1x7+YPvoDKFRqFmQ45lvCjJLeC+QUT3f2hSFDTePaUNO
	lE5lnjZgSpE+NVEXMwyP+WBfDCACnf/bn1k2KmldRZKACmWqiWrlaqXHSnfOBuWJ
	SAyydlPaHzxUM+L/SVVBBr1uPJKONggI/xDA607J+fA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 440fear3ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 08:18:04 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 506DI3Ew036666
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 08:18:03 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 6 Jan 2025 08:18:02 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 6 Jan 2025 08:18:02 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 6 Jan 2025 08:18:02 -0500
Received: from JGERONI2-L01.ad.analog.com (JGERONI2-L01.ad.analog.com [10.117.223.41])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 506DHlGQ001854;
	Mon, 6 Jan 2025 08:17:50 -0500
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
Subject: [PATCH 0/2] Add adm1273 support
Date: Mon, 6 Jan 2025 21:17:38 +0800
Message-ID: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 6Gqu7syNZtA8kwqAcCw88DNXZznX6XVM
X-Proofpoint-GUID: 6Gqu7syNZtA8kwqAcCw88DNXZznX6XVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=919 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060118

The ADM1273 is also a Hot-swap controller similar to the ADM1272, with the
following differences:
        * The MFR_MODEL register value is different.
        * The ADM1273 includes the STATUS_CML register, which the ADM1272
          does not have.

The currently available adm1275 driver supports the adm1272 and this patch
adds support for the adm1273. The ADM1273 is currently unreleased and the
datasheet is not yet publicly available.

John Erasmus Mari Geronimo (2):
  dt-bindings: hwmon: adm1275: add adm1273
  hwmon: (pmbus/adm1275) add adm1273 support

 .../bindings/hwmon/adi,adm1275.yaml           |  2 ++
 Documentation/hwmon/adm1275.rst               | 28 ++++++++++++-------
 drivers/hwmon/pmbus/Kconfig                   |  2 +-
 drivers/hwmon/pmbus/adm1275.c                 | 10 ++++---
 4 files changed, 27 insertions(+), 15 deletions(-)


base-commit: 6071d10413ff8489c3e842b19b1e0d539700068d
-- 
2.34.1



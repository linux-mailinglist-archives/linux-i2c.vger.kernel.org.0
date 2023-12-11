Return-Path: <linux-i2c+bounces-720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440280C8D6
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 13:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 535011C209DA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 12:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EECB38FA6;
	Mon, 11 Dec 2023 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="awCT9xfC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81080137;
	Mon, 11 Dec 2023 04:01:40 -0800 (PST)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB9IEYK009898;
	Mon, 11 Dec 2023 04:01:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pfpt0220; bh=h0QNwsIs
	xCVCFnb61YiC0y8uyBswFifMu55wtofMhKA=; b=awCT9xfCMKHJgzaWicpcLmAs
	jqpxb/mwQpK+R3grVz1y1fz19XU3JY9JzCLkzWVWWg3nU5VTUuTPEhAPjGHL8HwV
	gAi37qrDqv2ka9m2TSpRZ9yp/gsm8wYgJCQ0R9ns797zPHkx6kYybjLOe745Ebkd
	CGYNWxwBLFqeMsOWtVh185ka3CFgUDaL/20qrVngQbGdsqIzyDCyutopq1i9vCS8
	Jt0s2VpWbkdSV0tSBjkIqZVvKf0qTaavWBwb6JY/PVam6BTY+Hp7qERcZzud1EDm
	v/nYAiYeM5KpqbqheIhZHhtJxVMYOX9kh4iY9jHoDmdaOqvJACDm82sbea9qpQ==
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3uwyp4gfjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 04:01:36 -0800 (PST)
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 11 Dec
 2023 04:01:35 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Mon, 11 Dec 2023 04:01:34 -0800
Received: from dc3lp-swdev041.marvell.com (dc3lp-swdev041.marvell.com [10.6.60.191])
	by maili.marvell.com (Postfix) with ESMTP id 530E63F7045;
	Mon, 11 Dec 2023 04:01:33 -0800 (PST)
From: Elad Nachman <enachman@marvell.com>
To: <gregory.clement@bootlin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>, <cyuval@marvell.com>
Subject: [PATCH v3 0/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Date: Mon, 11 Dec 2023 14:01:28 +0200
Message-ID: <20231211120129.3719469-1-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _89VZfFsXvVH5A_7vJDI7Kvq921FjJ-J
X-Proofpoint-GUID: _89VZfFsXvVH5A_7vJDI7Kvq921FjJ-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02

From: Elad Nachman <enachman@marvell.com>

i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock

Some i2c slaves, mainly SFPs, might cause the bus to lose arbitration
while slave is in the middle of responding.
This means that the i2c slave has not finished the transmission, but
the master has already finished toggling the clock, probably due to
the slave missing some of the master's clocks.
This was seen with Ubiquity SFP module.
This is typically caused by slaves which do not adhere completely
to the i2c standard.

The solution is to change the I2C mode from mpps to gpios, and toggle
the i2c_scl gpio to emulate bus clock toggling, so slave will finish
its transmission, driven by the manual clock toggling, and will release
the i2c bus.

v3:
   1) Remove unused / un-initialized variable

   2) Replace devm_pinctrl_get() with pinctrl_get() and pinctrl_put() pair
      in probe and device removal.

   3) Replace atomic sleeps with usleep_range()

   4) Rework comment to start with a capital letter

v2:
   1) Explain more about cause of issue in commit message

   2) Change variable name to something clearer

   3) Leave space between comments

   4) Remove redundant blank line

   5) Add error message if pinctrl get failed

   6) Move gpio request to probe function

   7) Fix commenting style

   8) Explain in comments why 10 togglings are required

   9) Move from mdelay to udelay, reducing delay time

   10) Explain in comments what is the value written
       to the reset register.

   11) Explain why fallthrough is required (generate stop condition)

   12) Explain why in case of missing i2c arbitration loss details,
       driver probe will not fail, in order to be backward compatible
       with older dts files

Elad Nachman (1):
  i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock

 drivers/i2c/busses/i2c-mv64xxx.c | 118 ++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

-- 
2.25.1



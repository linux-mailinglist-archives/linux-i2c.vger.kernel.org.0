Return-Path: <linux-i2c+bounces-674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1F808DF8
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 17:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 166BF281633
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 16:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EAA481AA;
	Thu,  7 Dec 2023 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="T3kR0wVa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F4B10D1;
	Thu,  7 Dec 2023 08:50:37 -0800 (PST)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B7GaW9K017013;
	Thu, 7 Dec 2023 08:50:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0220; bh=3eom/CEVJfqf9PXnBTndbKR1eTIsvJGA5a21Gg4EphA=;
 b=T3kR0wVaignp+14pi0xtWiqdMLSkzs3k/deEJ79t2DS3Q0HU2q+GlIKIa9xDtep7yrD+
 3BvKj3AcDjI+zy9zG9CR2ap7EBz0+tf5mX5nrBxKTi3vtnFS5G3lZl8o8mlHeY5UGTkS
 eTSL/HyNSrJ/bw8RYi326UrU526uB+oGYShIqMWQ6q94OC/1LzskWlJQ5EmNNYrDykPZ
 KULi4dRYJejc6fpBh7dhXYk2VktQGWV41vdPaZb+FO0umTi93kwnqBFsMpjpdq3QEPMB
 /610lYhlcdQp2zAJns0kmT6Akzx2hUmBp4mDCAHMjyiHhT7RPIJHO79MnksfRYNWQ9VV kw== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3uu8qea436-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 08:50:33 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 7 Dec
 2023 08:50:32 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 7 Dec 2023 08:50:31 -0800
Received: from dc3lp-swdev041.marvell.com (dc3lp-swdev041.marvell.com [10.6.60.191])
	by maili.marvell.com (Postfix) with ESMTP id 696623F709B;
	Thu,  7 Dec 2023 08:50:30 -0800 (PST)
From: Elad Nachman <enachman@marvell.com>
To: <gregory.clement@bootlin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>, <cyuval@marvell.com>
Subject: [PATCH v2 0/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Date: Thu, 7 Dec 2023 18:50:26 +0200
Message-ID: <20231207165027.2628302-1-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qLmyGKCtlt3WJ1-qoH0ibpbqy_rVOdZw
X-Proofpoint-ORIG-GUID: qLmyGKCtlt3WJ1-qoH0ibpbqy_rVOdZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_14,2023-12-07_01,2023-05-22_02

From: Elad Nachman <enachman@marvell.com>

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

 drivers/i2c/busses/i2c-mv64xxx.c | 113 +++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

-- 
2.25.1



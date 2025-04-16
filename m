Return-Path: <linux-i2c+bounces-10440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F197EA90EF8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 00:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 714DE5A16EC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FA02417DD;
	Wed, 16 Apr 2025 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="np0Ezbwa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8E221F25
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 22:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844059; cv=none; b=m3xLLeQ/71TjE3Wt4WJIThEcQXJKmub+QNRoDmCoNPnX7kA8kVBQAtZiUJxRoylgVaD6Cn5y6ZuWi/knkh5db9ibnqR2zBjk0QukoQ6pKaYXtiKFmenHNciNHuzu+6CVqOGzV4ZiSImu+ww9p8p6qpOhM17yez/IVYiORXi5Hcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844059; c=relaxed/simple;
	bh=xH3lhJi1xTJv/A92jkdgVUHaGo0cZIKK/YnO663brp4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ohcZZOHVChy+WJbV0LvgZ70B3VojDkYgIjFO8v1gC/SwHhl0UtXgtslWwMm8VuNiEGet0qERjtjTADqbNg7LsoeQgJI7+59rS0yXG/f1/iUbV+ffb8viY1dU9RpYYnTsApNB9vn9+RWMCxUsTd7X6KGQTbsZg0GQZKBvS7dGXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=np0Ezbwa; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 44D4E2C03DC;
	Thu, 17 Apr 2025 10:54:14 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1744844054;
	bh=xH3lhJi1xTJv/A92jkdgVUHaGo0cZIKK/YnO663brp4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=np0Ezbwak1pNA1zl4FcdjeQaiTfB0VEzmABPOL8AV6qPp3mWArsVeKWwfvKWBFPLB
	 zH/cVM4sMeDiTgxc7jczGyYX7x1R+oDGY/TgieLlSlHrMCC5Sic0AbHrJghhq4Ey7t
	 JXmvBH6tWxmSsTwQSyML+UOFG0/DI2wTNx2lvMg1BkVPyT15xyNTjCfC0QzybyjLVy
	 SJtTFqGuJZeSLjAC5QCifNxnUUbIm8tPMlpIi+cwDMbfywCZe9KH9dJh6pBQemZB65
	 KbIr6igzJB3a8stK3V45NrFaWuZXj6a541JX6A6yPscznBb5wbXax3Uko2yJaASk3Q
	 gWbx36Rzx3TnQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B680035160001>; Thu, 17 Apr 2025 10:54:14 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 10:54:13 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Thu, 17 Apr 2025 10:54:13 +1200
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"Markus.Elfring@web.de" <Markus.Elfring@web.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rric@kernel.org" <rric@kernel.org>
Subject: Re: [PATCH v14 1/1] i2c: octeon: add block-mode i2c operations
Thread-Topic: [PATCH v14 1/1] i2c: octeon: add block-mode i2c operations
Thread-Index: AQHbnPMbfNxK7MTC8UuzggnLBpR1ibOmQeGA
Date: Wed, 16 Apr 2025 22:54:13 +0000
Message-ID: <3a02a3711cfb105921c2cf672a32ef96864ff0fb.camel@alliedtelesis.co.nz>
References: <20250324192946.3078712-1-aryan.srivastava@alliedtelesis.co.nz>
	 <20250324192946.3078712-2-aryan.srivastava@alliedtelesis.co.nz>
In-Reply-To: <20250324192946.3078712-2-aryan.srivastava@alliedtelesis.co.nz>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF9BAC5E1277B6468ED06A9E78FA1AE2@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=W+WbVgWk c=1 sm=1 tr=0 ts=68003516 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=lBS4choEUxMPvCBz5qMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgQW5kaSwNCg0KRGlkIHlvdSBoYXZlIGFueSBtb3JlIGNvbW1lbnRzIG9uIHRoaXMgcGF0Y2g/
DQoNClRoYW5rcywNCkFyeWFuLg0K


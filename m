Return-Path: <linux-i2c+bounces-7914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621B89C362C
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 02:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 278EB280E9C
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 01:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AF01F94A;
	Mon, 11 Nov 2024 01:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MyAM8ivJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD81B960
	for <linux-i2c@vger.kernel.org>; Mon, 11 Nov 2024 01:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731288986; cv=none; b=JzayN0piAhbx1RGhZ98fa75D0BCIpVK9/tsvgKQlxFXeO8Mlzfr4JGg+KSSOnwDeu0hz93H7iJHpf5cLbzuw76nj5qiuBucFwA8nlAkFWq5ekFAoypCYk1yMCf3tjxKae2sExu3f2l/G6qxMYDvFyvSoa9ttgCw6WWv5NnuGU/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731288986; c=relaxed/simple;
	bh=Kros6mW/0XKzeR7gms8yRD9dF6FA2lfPlJjgKH7/phg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CwUN9h9CUZeb48gjahbFFymJWH74yFz7r46nxaijPn1dLsIR7O8X7bNkohvnFy3+T8nD+434zFM5wvDSnhC8KaQSGzGlZDg5nQGYjLw7nBsVySSozxe3pnOSEF+6tazO8fbsacwsW2sI39DVpcZV0NfFH6QwHSr/XAnlJVVx3wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MyAM8ivJ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7B0592C05C6;
	Mon, 11 Nov 2024 14:36:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1731288982;
	bh=Kros6mW/0XKzeR7gms8yRD9dF6FA2lfPlJjgKH7/phg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:Reply-To:From;
	b=MyAM8ivJNPtN9eABJmjzPvnQ7IYQQx43ZJJlRSy6VywL5RWR3ZIKdyXgfcQ6Giw0V
	 Io5QJE0IFYUbAXFJ26CjQ/MvCkkCGvUa7ZdNTcXKcnDcwOu/j1tzj1Pq/k4dNshBVb
	 OxP++cs5XULSOFqUi1TXlsLWSaa328VzVSaTy1NqsDw5GS+yQPpmPJlKP/6wEe052+
	 01DCH6EJXJUJ36K4g05VU8wgesosLK0JNcrhVkN1MYFq6JYqTZJIL/UAGO4BtC+uA7
	 4gzP0cCb7+yGF+YBXrrKbBa+bauV03t4LbH5l1h2cmi2HDJoqp9NQ81AVw6BxSZ6Oq
	 QVKVdS/Ljyvsw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67315f960001>; Mon, 11 Nov 2024 14:36:22 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 Nov 2024 14:36:22 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 11 Nov 2024 14:36:22 +1300
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "Markus.Elfring@web.de" <Markus.Elfring@web.de>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 0/2] i2c: octeon: Add block-mode r/w
Thread-Topic: [PATCH v10 0/2] i2c: octeon: Add block-mode r/w
Thread-Index: AQHbGr+ko8X+fGGa20OHvcJKEYTUELKwpMuA
Date: Mon, 11 Nov 2024 01:36:22 +0000
Message-ID: <77e95bcdbb1cb986686487d777f8966dca0cf435.camel@alliedtelesis.co.nz>
References: <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
In-Reply-To: <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
Reply-To: "20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz"
	<20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCD4C577D7F7C94992087BBAD38E310C@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67315f96 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=UKpnUFwHtDN5F1jNoLQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgQW5kaSwgZGlkIHlvdSBoYXZlIGFueW1vcmUgY29tbWVudHMgZm9yIHRoaXMgcGF0Y2ggc2Vy
aWVzPw0KDQpUaGFua3MsDQpBcnlhbi4NCg==


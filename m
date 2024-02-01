Return-Path: <linux-i2c+bounces-1579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA4384523B
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 08:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C6F11F2A2BE
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FC11586FA;
	Thu,  1 Feb 2024 07:48:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E4157E9E
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706773710; cv=none; b=GDQ/EMiAkZT2aNW5sDHMcMQkJ8mc2cnzsIt+MMIv6Tg/WD54AastTfDY6i54nLRk83Hz2N0LZtWHGlpXC3abD4HU0eZNlUKCUOSl2lpV0qnITx6GTch7ZZcziP8N3ktRB/VHF3kGb0ZTpmBMwkqwD6M68Mvsk3tZ1A5jpoRuWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706773710; c=relaxed/simple;
	bh=dyhPUjZoBLSEhjqO361AFrfwwcwrNhrWNWfkkodW9x0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jBQGIHAgGC9msuXT8Tqnghw1R5GtIce/Vj4MNjdSZX0eq6oqI07aCFrtbB38OKYZjkfRRyUDZUG/TiCsKrrYCeuzPzHEAEy0eM7+iZSflBGCpbrpjHil+2fTmzfG0Bl+1OsuTWIxZx1iZGnevwF91zkrkqViLvhANki6GChRr1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TQWGl4yqYz1vssp;
	Thu,  1 Feb 2024 15:47:59 +0800 (CST)
Received: from kwepemd500006.china.huawei.com (unknown [7.221.188.103])
	by mail.maildlp.com (Postfix) with ESMTPS id 2880C1A016B;
	Thu,  1 Feb 2024 15:48:25 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 kwepemd500006.china.huawei.com (7.221.188.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Thu, 1 Feb 2024 15:48:24 +0800
Received: from kwepemm600002.china.huawei.com ([7.193.23.29]) by
 kwepemm600002.china.huawei.com ([7.193.23.29]) with mapi id 15.01.2507.035;
 Thu, 1 Feb 2024 15:48:24 +0800
From: liudingyuan <liudingyuan@huawei.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: yangyicong <yangyicong@huawei.com>, "Fangjian (Jay)"
	<f.fangjian@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHYyIDAvMl0gaTJjOiBoaXNpOiBDbGVhciB0aGUgaW50?=
 =?gb2312?Q?errupt_status_and_optimize_writing_limitation?=
Thread-Topic: [PATCH v2 0/2] i2c: hisi: Clear the interrupt status and
 optimize writing limitation
Thread-Index: AQHaVNZhufji/kXdjkWTUc5QBuZJYrD0hdgAgACIb3A=
Date: Thu, 1 Feb 2024 07:48:24 +0000
Message-ID: <40cce35e91044e5889ee140deef8daff@huawei.com>
References: <20240201061345.3111600-1-liudingyuan@huawei.com>
 <mjkxuorj3ldxa2yi3axeuy375cida3n4lubfjudw5jcbjfi3x4@htnwzbjw2tl3>
In-Reply-To: <mjkxuorj3ldxa2yi3axeuy375cida3n4lubfjudw5jcbjfi3x4@htnwzbjw2tl3>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQW5kaQ0KDQpUaGFua3MgZm9yIHJlcGx5aW5nLiBJIHdpbGwgcmVtZW1iZXIgdG8gcmVmZXIg
dG8gdGhlIHBhdGNoZXMgc3VibWl0dGVkIGJ5IG90aGVycyB0byB3cml0ZSB0aGUgbW9kaWZpY2F0
aW9ucyBpbiBkaWZmZXJlbnQgdmVyc2lvbnMgb2YgcGF0Y2hlcy4gQWxzbyB3aWxsIGFkZCByZXZp
ZXctYnkgaW5mby4gDQoNClRoYW5rcywNCkRldnluDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7I
yzogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBrZXJuZWwub3JnPiANCreiy83KsbzkOiAyMDI0xOoy
1MIxyNUgMTQ6NTANCsrVvP7IyzogbGl1ZGluZ3l1YW4gPGxpdWRpbmd5dWFuQGh1YXdlaS5jb20+
DQqzrcvNOiB5YW5neWljb25nIDx5YW5neWljb25nQGh1YXdlaS5jb20+OyBGYW5namlhbiAoSmF5
KSA8Zi5mYW5namlhbkBodWF3ZWkuY29tPjsgSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4uY2Ft
ZXJvbkBodWF3ZWkuY29tPjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0K1vfM4jogUmU6IFtQ
QVRDSCB2MiAwLzJdIGkyYzogaGlzaTogQ2xlYXIgdGhlIGludGVycnVwdCBzdGF0dXMgYW5kIG9w
dGltaXplIHdyaXRpbmcgbGltaXRhdGlvbg0KDQpIaSBEZXZ5biwNCg0KT24gVGh1LCBGZWIgMDEs
IDIwMjQgYXQgMDI6MTM6NDNQTSArMDgwMCwgRGV2eW4gTGl1IHdyb3RlOg0KPiBEZXZ5biBMaXUg
KDIpOg0KPiAgIGkyYzogaGlzaTogT3B0aW1pemVkIHRoZSB2YWx1ZSBzZXR0aW5nIG9mIG1heHdy
aXRlIGxpbWl0IHRvIGZpZm8gZGVwdGgNCj4gICAgIC0gMQ0KPiAgIGkyYzogaGlzaTogQWRkIGNs
ZWFyaW5nIHR4IGFlbXB0eSBpbnRlcnJ1cHQgb3BlcmF0aW9uDQoNCnBsZWFzZSwgbmV4dCB0aW1l
IGFkZCB0aGUgY2hhbmdlbG9nLiBXaGF0IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdjEgYW5k
IHYyPw0KDQpCZXNpZGVzIHRoYXQsIHlvdSBmb3Jnb3QgdG8gYWRkIFlpY29uZydzIHItYi4NCg0K
RG9uJ3QgbmVlZCB0byByZXNlbmQsIHdpbGwgdGFrZSBjYXJlIG9mIGl0Lg0KDQpBbmRpDQo=


Return-Path: <linux-i2c+bounces-1578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C71845239
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 08:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61C128FBF3
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451A2158D66;
	Thu,  1 Feb 2024 07:48:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291AD85C7D
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706773682; cv=none; b=Zd7BR2y2fhT+7JACBday2NPXBd8EvS46/e5VkgwS2/FCp0oSqsoVRT2lOYcYF14w/ZqV9XKqI5uFP1wN1dbkZpHJ/LsDc7oSHzttBphT8IngIBsnZb4gjd5gYzLO8lZCcr1HYRf+m/+TW8PrMnbVua2YbZb8cuJqEmHmZT627EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706773682; c=relaxed/simple;
	bh=mwXq2wLIy6+Aif2HHnEb3AKvbq5nSipa9mj12WCv8mk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p6Fi8cthAPg5oLoeaVvrDi3OwI91XGO2dgXZDtBQd6Z2JuL58Wfn8hpBwrJom2uWKLq+eUfTcL8WOKr67x8WFrBtP/UCEg8KoyBh6KSQ32V1tA4lB/KB1Gn/n79bM7do5RAOy8xkrDbA3YtXHuKRKQwK5+nGO1go4V/iNaQX5ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TQWF95SxSzsSQs;
	Thu,  1 Feb 2024 15:46:37 +0800 (CST)
Received: from canpemm100009.china.huawei.com (unknown [7.192.105.213])
	by mail.maildlp.com (Postfix) with ESMTPS id EAF6D18001D;
	Thu,  1 Feb 2024 15:47:50 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 canpemm100009.china.huawei.com (7.192.105.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 15:47:50 +0800
Received: from kwepemm600002.china.huawei.com ([7.193.23.29]) by
 kwepemm600002.china.huawei.com ([7.193.23.29]) with mapi id 15.01.2507.035;
 Thu, 1 Feb 2024 15:47:50 +0800
From: liudingyuan <liudingyuan@huawei.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: yangyicong <yangyicong@huawei.com>, "Fangjian (Jay)"
	<f.fangjian@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHYyIDEvMl0gaTJjOiBoaXNpOiBPcHRpbWl6ZWQgdGhl?=
 =?gb2312?B?IHZhbHVlIHNldHRpbmcgb2YgbWF4d3JpdGUgbGltaXQgdG8gZmlmbyBkZXB0?=
 =?gb2312?Q?h_-_1?=
Thread-Topic: [PATCH v2 1/2] i2c: hisi: Optimized the value setting of
 maxwrite limit to fifo depth - 1
Thread-Index: AQHaVNZhjcR/oZLnl0aA+rpzeOyMz7D0hnwAgACSiUA=
Date: Thu, 1 Feb 2024 07:47:50 +0000
Message-ID: <cfa3d4012c0a4f8fa31e320829b76cb5@huawei.com>
References: <20240201061345.3111600-1-liudingyuan@huawei.com>
 <20240201061345.3111600-2-liudingyuan@huawei.com>
 <wcodkjjrkd5ujfr3gdpqik2ioibnafatmkltrxezpdcr3twtcc@t7wxlnudcsge>
In-Reply-To: <wcodkjjrkd5ujfr3gdpqik2ioibnafatmkltrxezpdcr3twtcc@t7wxlnudcsge>
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

SGkgQW5kaQ0KDQpZZXMsIHRoaXMgaXMgdGhlIG9ubHkgY29kZSBjaGFuZ2UgaW4gdmVyc2lvbiAy
IGNvbXBhcmVkIHRvIHZlcnNpb24gMS4gSW4gYWRkaXRpb24sDQppbiB0aGUgY29tbWl0IGRlc2Ny
aXB0aW9uIG9mIFBBVENIIHYyIDEvMiA6DQp2MS0+djINCnRoZSB0aHJlc2hvbGQgZm9yIEZJRk8g
ZW1wdHkgaW50ZXJydXB0IA0KLT4NCnRoZSB0aHJlc2hvbGQgZm9yIEZJRk8gYWxtb3N0IGVtcHR5
IGludGVycnVwdC4gDQoNCkluIHYyIDIvMiwgdGhlcmUgaXMgbm8gY2hhbmdlLg0KDQpUaGFua3Ms
DQpEZXZ5bg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IEFuZGkgU2h5dGkgPGFuZGkuc2h5
dGlAa2VybmVsLm9yZz4gDQq3osvNyrG85DogMjAyNMTqMtTCMcjVIDE0OjUyDQrK1bz+yMs6IGxp
dWRpbmd5dWFuIDxsaXVkaW5neXVhbkBodWF3ZWkuY29tPg0Ks63LzTogeWFuZ3lpY29uZyA8eWFu
Z3lpY29uZ0BodWF3ZWkuY29tPjsgRmFuZ2ppYW4gKEpheSkgPGYuZmFuZ2ppYW5AaHVhd2VpLmNv
bT47IEpvbmF0aGFuIENhbWVyb24gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47IGxpbnV4
LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCtb3zOI6IFJlOiBbUEFUQ0ggdjIgMS8yXSBpMmM6IGhpc2k6
IE9wdGltaXplZCB0aGUgdmFsdWUgc2V0dGluZyBvZiBtYXh3cml0ZSBsaW1pdCB0byBmaWZvIGRl
cHRoIC0gMQ0KDQpIaSBEZXZ5biwNCg0KLi4uDQoNCj4gIHN0YXRpYyB2b2lkIGhpc2lfaTJjX3hm
ZXJfbXNnKHN0cnVjdCBoaXNpX2kyY19jb250cm9sbGVyICpjdGxyKSAgew0KPiAtCWludCBtYXhf
d3JpdGUgPSBISVNJX0kyQ19UWF9GSUZPX0RFUFRIOw0KPiArCWludCBtYXhfd3JpdGUgPSBISVNJ
X0kyQ19UWF9GSUZPX0RFUFRIIC0gSElTSV9JMkNfVFhfRl9BRV9USFJFU0g7DQoNCnRoaXMgaXMg
b25lIG9mIHRoZSBkaWZmZXJlbmNlcy4NCg0KUmV2aWV3ZWQtYnk6IFlpY29uZyBZYW5nIDx5YW5n
eWljb25nQGhpc2lsaWNvbi5jb20+DQpSZXZpZXdlZC1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0
aUBrZXJuZWwub3JnPiANCg0KVGhhbmtzLA0KQW5kaQ0K


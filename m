Return-Path: <linux-i2c+bounces-11251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B86ACE880
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 05:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B36E83AA307
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 03:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECA92AF0E;
	Thu,  5 Jun 2025 03:03:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cstnet.cn (smtp20.cstnet.cn [159.226.251.20])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CBA1F5617;
	Thu,  5 Jun 2025 03:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749092611; cv=none; b=dd3vh96gCuGRUNL07dRHCwjLmLreKheZewSwJtR1aB9xG3GK9NAYZ8EnxXl4r+pslDjbOe+HMz7eusfr+DdUicOxlXzM6lsgTkyHz3zQB4XiabB237XofXaksd7hI5JESquL0pmL2eadJcLjW7qLs5vr1oUddhMMOBJ9pozSA4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749092611; c=relaxed/simple;
	bh=jg24Yo+Bw83kcQE5Zz+uHIe9HXkorbFQAvED/E/Ahmc=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=kF3X4mCiCyO36zzxW0HBtVJKQTI1wP7a2iJJQ0tTrdWEr/DU8tqDKdTopT1y1f+GUU0knkvdGcVHjv1l9rBSO0qAoXQx62tJ15BW1rmeccICuSl6d3sf7HpStRdMv+rRTfIrU9yBE9Dgr3byiWW9stTGvOceshpHUBlcPbQVJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn; spf=pass smtp.mailfrom=ict.ac.cn; arc=none smtp.client-ip=159.226.251.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ict.ac.cn
Received: from chenglingfei22s$ict.ac.cn ( [115.42.62.11] ) by
 ajax-webmail-APP-10 (Coremail) ; Thu, 5 Jun 2025 11:02:51 +0800 (GMT+08:00)
Date: Thu, 5 Jun 2025 11:02:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?56iL5YeM6aOe?= <chenglingfei22s@ict.ac.cn>
To: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev
Cc: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, 
	chenglingfei22s@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	andi.shyti@kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:tACowABnWYXcCEForT8GAA--.62932W
X-CM-SenderInfo: xfkh0wpolqwwthlsj2g6lf3hldfou0/1tbiBgoEDmhA0QvjOgAAst
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGksIGFsbCEKCldl4oCZdmUgZW5jb3VudGVyZWQgYSBrZXJuZWwgY3Jhc2ggd2hlbiBydW5uaW5n
IHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gb24gYSBNYWMgTWluaSBNMSAoVDgxMDMpIHJ1bm5p
bmcgQXNhaGkgQXJjaCBMaW51eC4gCgpUaGUgYnVnIHdhcyBmaXJzdCBmb3VuZCBvbiB0aGUgTGlu
dXggdjYuNiwgd2hpY2ggaXMgYnVpbHQgbWFudWFsbHkgd2l0aCB0aGUgQXNhaGkgZ2l2ZW4gY29u
ZmlnIHRvIHJ1biBvdXIgc2VydmljZXMuIApBdCB0aGF0IHRpbWUsIHRoZSBpMmMtcGFzZW1pLXBs
YXRmb3JtIHdhcyBpMmMtYXBwbGUuCgpXZSBub3RpY2VkIGluIHRoZSBMaW51eCB2Ni43LCB0aGUg
cGFzZW1pIGlzIHNwbGl0dGVkIGludG8gdHdvIHNlcGFyYXRlIG1vZHVsZXMsIG9uZSBvZiB3aGlj
aCBpcyBpMmMtcGFzZW1pLXBsYXRmb3JtLgpUaGVyZWZvcmUsIHdlIGJ1aWx0IExpbnV4IHY2LjE0
LjYgYW5kIHRyaWVkIHRvIHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gYWdhaW4sIHRoZSBjcmFz
aCBzdGlsbCBleGlzdHMuIE1vcmVvdmVyLCB3ZSBmZXRjaGVkIAp0aGUgbGF0ZXN0IGkyYy1wYXNl
bWktcGxhdGZvcm0gb24gbGludXgtbmV4dCg5MTE0ODNiMjU2MTJjOGJjMzJhNzA2YmE5NDA3Mzhj
YzQzMjk5NDk2KSBhbmQgYXNhaGksIGJ1aWx0IHRoZW0gYW5kIAp0ZXN0ZWQgYWdhaW4gd2l0aCBM
aW51eCB2Ni4xNC42LCBidXQgdGhlIGNyYXNoIHJlbWFpbnMuCgpCZWNhdXNlIGtleGVjIGlzIG5v
dCBzdXBwb3J0ZWQgYW5kIHdpbGwgbmV2ZXIgYmUgZnVsbHkgc3VwcG9ydGVkIG9uIEFwcGxlIFNp
bGljb24gcGxhdGZvcm1zIGR1ZSB0byBoYXJkd2FyZSBhbmQgZmlybXdhcmUgCmRlc2lnbiBjb25z
dHJhaW50cywgd2UgY2FuIG5vdCByZWNvcmQgdGhlIHBhbmljIGxvZ3MgdGhyb3VnaCBrZHVtcC4K
ClRodXMgd2UgdHJpZWQgdG8gZmluZCB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUgbWFudWFs
bHkuIFdoZW4gd2UgcGVyZm9ybSBybW1vZCwgdGhlIGtlcm5lbCBwZXJmb3JtcyBkZXZpY2UgcmVs
ZWFzaW5nIG9uIAp0aGUgaTJjIGJ1cywgdGhlbiBjYWxscyB0aGUgcmVtb3ZlIGZ1bmN0aW9uIGlu
IHNuZC1zb2MtY3M0Mmw4My1pMmMsIHdoaWNoIGNhbGxzIHRoZSBjczQybDQyX2NvbW1vbl9yZW1v
dmUgaW4gY3M0Mmw0MiwgCmJlY2F1c2UgY3M0Mmw0Mi0mZ3Q7aW5pdF9kb25lIGlzIHRydWUsIGl0
IHBlcmZvcm1zIHJlZ21hcF93cml0ZSwgYW5kIGZpbmFsbHkgY2FsbHMgaW50byBwYXNlbWlfc21i
X3dhaXRyZWFkeSBpbiBpMmMtcGFzZW1pCi1jb3JlLmMuIFdlIG5vdGljZWQgdGhhdCBzbWJ1cy0m
Z3Q7dXNlX2lycSBpcyB0cnVlLCBhbmQgYWZ0ZXIgaXQgY2FsbHMgaW50byB3YWl0X2Zvcl9jb21w
bGV0aW9uX3RpbWVvdXQsIHRoZSBzeXN0ZW0gY3Jhc2hzIQoKV2UgZm91bmQgdGhhdCB3YWl0X2Zv
cl9jb21wbGV0aW9uX3RpbWVvdXQgaXMgb25lIG9mIHRoZSBjb3JlIHNjaGVkdWxlciBBUElzIHVz
ZWQgYnkgdGVucyBvZiB0aG91c2FuZHMgb2Ygb3RoZXIgZHJpdmVycywKaXQgaXMgdW5saWtlbHkg
Y2F1c2luZyB0aGUgY3Jhc2guIFNvIHdlIHRyaWVkIHRvIHJlbW92ZSB0aGUgY2FsbCB0byB3YWl0
X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQsIHRoZW4gdGhlIHN5c3RlbSBzZWVtcyB0bwpydW4gd2Vs
bC4KCkhvd2V2ZXIsIGJlY2F1c2Ugd2UgaGF2ZSBsaXR0bGUga25vd2xlZGdlIGFib3V0IGkyYyBk
ZXZpY2VzIGFuZCBzcGVjaWZpY2F0aW9ucywgd2UgYXJlIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBj
aGFuZ2Ugd2lsbCAKY2F1c2Ugb3RoZXIgcG90ZW50aWFsIGhhcm1zIGZvciB0aGUgc3lzdGVtIGFu
ZCBkZXZpY2UuIElzIHRoaXMgY2FsbCB0byB3YWl0IG5lY2VzYXJ5IGhlcmU/IE9yIGNhbiB5b3Ug
Z2l2ZSBhIG1vcmUgCnNvcGhpc3RpY2F0ZWQgZml4PwoKV2XigJlyZSBoYXBweSB0byBwcm92aWRl
IGFkZGl0aW9uYWwgbG9ncywgY29uZmlncywgb3IgdGVzdGluZyBhc3Npc3RhbmNlLiBBbnkgZ3Vp
ZGFuY2Ugd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKCgo=


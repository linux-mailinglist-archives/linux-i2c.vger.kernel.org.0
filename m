Return-Path: <linux-i2c+bounces-2959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B38A61EE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 06:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02EC2B23544
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 04:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D691CD06;
	Tue, 16 Apr 2024 04:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="W1eJND6P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64FD1BDD0
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 04:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240006; cv=none; b=oroAxYdyEhWha2zDEYLUI5iiR+T3crMJgF0cZT/ja63AlRQqjd31TR5XjQgzayMptASY4LIjMcbxZ5mcMIR7iPYwbpt/zZC29ViSadC2A7a3L3RxZ/53oDj6juovUTfIV2njtN2EPEe6TAmjUo/LLP5/J5gCJA7J9rtQ+GqOyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240006; c=relaxed/simple;
	bh=M71H6X5zt6I2PPvZyL9wihAZDyoIkvoQELS1aDcik+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mxo/0RW4wFU7O4Xh8oOoDjaAx7npj3PwzzkWDgOENPsUP8BUVRsRn5DQ+wyQxGsnkcWRbdnhHd39aY0QwraRydSwv3A1yBy5PnqhYVcs8XzPIgIHnwRncNN8V5IblylAaelM6SGzi6Juw8njFYBX1/EMj3ZBderH0PCRJIltWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=W1eJND6P; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0EE412C05CC;
	Tue, 16 Apr 2024 16:00:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1713240003;
	bh=M71H6X5zt6I2PPvZyL9wihAZDyoIkvoQELS1aDcik+U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W1eJND6Pz++mwEeXBV2WfzVwvi/L9pLJODMmtNq2LX58H8kzSwkM4sQxBD3B8zPXe
	 R2ESey7uehNRS75trq60yR3FG/YzvVVfm2P1uyCgc4VCljXVhP4beubMqE3tVzxlnV
	 tfvUcNxSGk0KxuOdmdpT/AhAulnf7suTRuWyJp8mo1cU3B/I86CrFRhjoV5oecsAXp
	 3pD0sSynWoSxBEQt87MWMDGDPTBB2dcVFd2GN5xKW8XYFdSa++ju06Z5/pGi0S8V4J
	 QjeEf0FJQzvrTCM3nlP31aAc+6ufwSUPm0X0DzvWpG5s2uL2FmGZzlS96RX6+kbUxy
	 zn/STGFvfZTzw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B661df7c20001>; Tue, 16 Apr 2024 16:00:02 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Tue, 16 Apr 2024 16:00:02 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Tue, 16 Apr 2024 16:00:02 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.009; Tue, 16 Apr 2024 16:00:02 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Abhinav Jain <jain.abhinav177@gmail.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, "Julia
 Lawall" <julia.lawall@inria.fr>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Thread-Topic: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Thread-Index: AQHaj0/GzDJ4DPHHek+eKx0F5hnQY7FpfVMA
Date: Tue, 16 Apr 2024 04:00:02 +0000
Message-ID: <8d745069-3647-408b-b34c-b29053b121f8@alliedtelesis.co.nz>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
In-Reply-To: <20240415161220.8347-1-jain.abhinav177@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0B37EE7D034754284B08F9681F082E8@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dY4j3mXe c=1 sm=1 tr=0 ts=661df7c2 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=SQiHmE0Aj67H6G5b:21 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=pGLkceISAAAA:8 a=SFYO0tGWFC1vQ0iUQ38A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAxNi8wNC8yNCAwNDoxMiwgQWJoaW5hdiBKYWluIHdyb3RlOg0KPiBSZW1vdmUgb2Zfbm9k
ZV9wdXQgZnJvbSBub2RlX2N0cmwgYW5kIG5vZGUgc3RydWN0IGRldmljZV9ub2Rlcy4NCj4gTW92
ZSB0aGUgZGVjbGFyYXRpb24gdG8gaW5pdGlhbGl6YXRpb24gZm9yIGVuc3VyaW5nIHNjb3BlIHNh
bml0eS4NCj4NCj4gU3VnZ2VzdGVkLWJ5OiBKdWxpYSBMYXdhbGwgPGp1bGlhLmxhd2FsbEBpbnJp
YS5mcj4NCj4gU2lnbmVkLW9mZi1ieTogQWJoaW5hdiBKYWluIDxqYWluLmFiaGluYXYxNzdAZ21h
aWwuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxp
ZWR0ZWxlc2lzLmNvLm56Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBj
LmMgfCAxMSArKysrLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW1wYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiBpbmRleCA4ZDczYzBmNDA1
ZWQuLmM0MjIzNTU2YjNiOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
cGMuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+IEBAIC0zMDQsMTMg
KzMwNCwxMiBAQCBzdGF0aWMgdm9pZCBtcGNfaTJjX3NldHVwXzUxMngoc3RydWN0IGRldmljZV9u
b2RlICpub2RlLA0KPiAgIAkJCQkJIHN0cnVjdCBtcGNfaTJjICppMmMsDQo+ICAgCQkJCQkgdTMy
IGNsb2NrKQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGVfY3RybDsNCj4gICAJ
dm9pZCBfX2lvbWVtICpjdHJsOw0KPiAgIAl1MzIgaWR4Ow0KPiAgIA0KPiAgIAkvKiBFbmFibGUg
STJDIGludGVycnVwdHMgZm9yIG1wYzUxMjEgKi8NCj4gLQlub2RlX2N0cmwgPSBvZl9maW5kX2Nv
bXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLA0KPiAtCQkJCQkgICAgImZzbCxtcGM1MTIxLWkyYy1j
dHJsIik7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlX2N0cmwgX19mcmVlKGRldmljZV9u
b2RlKSA9DQo+ICsJCW9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJmc2wsbXBj
NTEyMS1pMmMtY3RybCIpOw0KPiAgIAlpZiAobm9kZV9jdHJsKSB7DQo+ICAgCQljdHJsID0gb2Zf
aW9tYXAobm9kZV9jdHJsLCAwKTsNCj4gICAJCWlmIChjdHJsKSB7DQo+IEBAIC0zMjEsNyArMzIw
LDYgQEAgc3RhdGljIHZvaWQgbXBjX2kyY19zZXR1cF81MTJ4KHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSwNCj4gICAJCQlzZXRiaXRzMzIoY3RybCwgMSA8PCAoMjQgKyBpZHggKiAyKSk7DQo+ICAg
CQkJaW91bm1hcChjdHJsKTsNCj4gICAJCX0NCj4gLQkJb2Zfbm9kZV9wdXQobm9kZV9jdHJsKTsN
Cj4gICAJfQ0KPiAgIA0KPiAgIAkvKiBUaGUgY2xvY2sgc2V0dXAgZm9yIHRoZSA1Mnh4IHdvcmtz
IGFsc28gZmluZSBmb3IgdGhlIDUxMnggKi8NCj4gQEAgLTM1OCwxMSArMzU2LDExIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXBjX2kyY19kaXZpZGVyIG1wY19pMmNfZGl2aWRlcnNfOHh4eFtdID0g
ew0KPiAgIA0KPiAgIHN0YXRpYyB1MzIgbXBjX2kyY19nZXRfc2VjX2NmZ184eHh4KHZvaWQpDQo+
ICAgew0KPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsNCj4gICAJdTMyIF9faW9tZW0gKnJl
ZzsNCj4gICAJdTMyIHZhbCA9IDA7DQo+ICAgDQo+IC0Jbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9u
YW1lKE5VTEwsICJnbG9iYWwtdXRpbGl0aWVzIik7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpu
b2RlIF9fZnJlZShkZXZpY2Vfbm9kZSkgPQ0KPiArCQlvZl9maW5kX25vZGVfYnlfbmFtZShOVUxM
LCAiZ2xvYmFsLXV0aWxpdGllcyIpOw0KPiAgIAlpZiAobm9kZSkgew0KPiAgIAkJY29uc3QgdTMy
ICpwcm9wID0gb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJyZWciLCBOVUxMKTsNCj4gICAJCWlmIChw
cm9wKSB7DQo+IEBAIC0zODMsNyArMzgxLDYgQEAgc3RhdGljIHUzMiBtcGNfaTJjX2dldF9zZWNf
Y2ZnXzh4eHgodm9pZCkNCj4gICAJCQlpb3VubWFwKHJlZyk7DQo+ICAgCQl9DQo+ICAgCX0NCj4g
LQlvZl9ub2RlX3B1dChub2RlKTsNCj4gICANCj4gICAJcmV0dXJuIHZhbDsNCj4gICB9


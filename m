Return-Path: <linux-i2c+bounces-4950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D792F400
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 04:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EA4F1C21E8F
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 02:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382448821;
	Fri, 12 Jul 2024 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Xp5X9jWa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4228F40
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720751124; cv=none; b=rN+lt819pMYmTAbXasbILIaTGvLroe/bwycXyDjMQiIxy5OswYYewFZZxpXv4M9tJYJl4PfkC2kKtQhw4Dt4BsKjZCKI4k0lHRNCgez3GedBoTOzS5SpFYqXBJ/xBo/V4eVu2xpIAbnv2XduhzTZZoxLkNFjJz82HFoNl9yJN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720751124; c=relaxed/simple;
	bh=aGd1sizhcooFMgmr3C2yds60hHkkCWf39YYSay86y8E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pBmZpeRRB6M71T952OgWnaWPqNQvs/S5nfIDKvZ4dqgKkCamc8Yqxm7qWBio6I+z7a41jP2GVTW14CpaZzZyfk4XncJSjRBfGpC03Rd7QDBAHfHe0rGo68luSdEa6yOFApuivjxGZ05jwgVgkhnKSvePOSdBe4hpn0NS+KbkB58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Xp5X9jWa; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 863FA2C04A8
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 14:25:17 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720751117;
	bh=+m9eddoablMJb5kAuCTNXGFBZi9G2XML0AsbSpml5d0=;
	h=From:To:CC:Subject:Date:From;
	b=Xp5X9jWaZ3jpYV0VoienNoe3f+5GmesuDQU7VyEiIN8bP7tfuMXH73vGjtmd9hXiE
	 p6UeEVsEFCWRLdwTtstKP4nJSY/2+cDYICCLfcnREguAs2B3+z2faEr3OiR/xOHaoL
	 Qt9VPK/Av5doPGT8jYEL9NBB3+QgdMSP3HEGpJ3Y77yl70nf7n0Zj1oDJK7pr5769V
	 X36zH9EJVBizrX7garMUUVmvtxjsrV7JUigtibzhf9SN86FbzsRha5fewzpnYv/DYz
	 urfV8u6h5DK5rV2QWEEbqTSPELXghhH17aPm/2WhkXCKF77CW5WvrdvEgzMokKRLcH
	 h0DehJg7zJNmA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6690940d0000>; Fri, 12 Jul 2024 14:25:17 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Jul 2024 14:25:17 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Fri, 12 Jul 2024 14:25:17 +1200
From: Bruce Li <Bruce.Li@alliedtelesis.co.nz>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: John Thompson <John.Thompson@alliedtelesis.co.nz>, Joshua Scott
	<Joshua.Scott@alliedtelesis.co.nz>
Subject: [PATCH] i2c: designware: Adjust LOW period of the SCL clock
Thread-Topic: [PATCH] i2c: designware: Adjust LOW period of the SCL clock
Thread-Index: AQHa1AJ+qtQNOJ23kkKxXnIe8dOh8w==
Date: Fri, 12 Jul 2024 02:25:17 +0000
Message-ID: <7bb85fcde1dc477bb897d89dd0ddeb3b@alliedtelesis.co.nz>
Accept-Language: en-GB, en-NZ, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Content-Type: multipart/mixed;
	boundary="_004_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=PIKs+uqC c=1 sm=1 tr=0 ts=6690940d a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=4kmOji7k6h8A:10 a=kU-gcKmB2DDcT0F4TUAA:9 a=wPNLvfGTeEIA:10 a=A7ShnFVUAiA_a_dl:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=v_9zwqxW9pQmHRz0AkQA:9 a=B2y7HmGcmWMA:10 a=rVnDm9A_-c-k2ki-JAcA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0

--_004_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_
Content-Type: multipart/alternative;
	boundary="_000_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_"

--_000_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi i2c list maintainers,



This patch adjusted the LOW period of the SCL clock for a more accurate
i2c bus speed frequency. The given LOW period of the SCL clock 4.7us
would result an i2c bus speed of 105kHz (observed by oscilloscope).
Using 5.2us will have i2c bus speed frequency of 100kHz that match the
setting of I2C_MAX_STANDARD_MODE_FREQ 100 kHz.


Thanks

BruceL

--_000_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p>Hi i2c list <span style=3D"font-family:Calibri,Helvetica,sans-serif,seri=
f,EmojiFont; font-size:16px">
maintainers,&nbsp;</span></p>
<p><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont;=
 font-size:16px"><br>
</span></p>
<p><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont;=
 font-size:16px"><br>
</span></p>
<p><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont;=
 font-size:16px"></p>
<div>This patch adjusted the LOW period of the SCL clock for a more accurat=
e</div>
<div>i2c bus speed frequency. The given LOW period of the SCL clock 4.7us</=
div>
<div>would result an i2c bus speed of 105kHz (observed by oscilloscope).</d=
iv>
<div>Using 5.2us will have i2c bus speed frequency of 100kHz that match the=
</div>
<div>setting of I2C_MAX_STANDARD_MODE_FREQ 100 kHz.</div>
<div><br>
</div>
<div><br>
</div>
Thanks&nbsp;</span>
<p></p>
<p><span style=3D"font-family:Calibri,Helvetica,sans-serif,serif,EmojiFont;=
 font-size:16px">BruceL</span></p>
</div>
</body>
</html>

--_000_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_--

--_004_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_
Content-Type: text/x-patch;
	name="0001-i2c-designware-Adjust-LOW-period-of-the-SCL-clock.patch"
Content-Description: 0001-i2c-designware-Adjust-LOW-period-of-the-SCL-clock.patch
Content-Disposition: attachment;
	filename="0001-i2c-designware-Adjust-LOW-period-of-the-SCL-clock.patch";
	size=1230; creation-date="Fri, 12 Jul 2024 02:23:57 GMT";
	modification-date="Fri, 12 Jul 2024 02:23:57 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhODNlZDczZjBhMTdlZWZlYTZhMzlkNDcyM2I2MjQ3NjEyNTUwYWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBMaSA8QnJ1Y2UuTGlAYWxsaWVkdGVsZXNpcy5jby5u
ej4KRGF0ZTogRnJpLCAxMiBKdWwgMjAyNCAxNDoxMjoxNCArMTIwMApTdWJqZWN0OiBbUEFUQ0hd
IGkyYzogZGVzaWdud2FyZTogQWRqdXN0IExPVyBwZXJpb2Qgb2YgdGhlIFNDTCBjbG9jawoKVGhp
cyBwYXRjaCBhZGp1c3RlZCB0aGUgTE9XIHBlcmlvZCBvZiB0aGUgU0NMIGNsb2NrIGZvciBhIG1v
cmUgYWNjdXJhdGUKaTJjIGJ1cyBzcGVlZCBmcmVxdWVuY3kuIFRoZSBnaXZlbiBMT1cgcGVyaW9k
IG9mIHRoZSBTQ0wgY2xvY2sgNC43dXMKd291bGQgcmVzdWx0IGFuIGkyYyBidXMgc3BlZWQgb2Yg
MTA1a0h6IChvYnNlcnZlZCBieSBvc2NpbGxvc2NvcGUpLgpVc2luZyA1LjJ1cyB3aWxsIGhhdmUg
aTJjIGJ1cyBzcGVlZCBmcmVxdWVuY3kgb2YgMTAwa0h6IHRoYXQgbWF0Y2ggdGhlCnNldHRpbmcg
b2YgSTJDX01BWF9TVEFOREFSRF9NT0RFX0ZSRVEgMTAwIGtIei4KClNpZ25lZC1vZmYtYnk6IEJy
dWNlIExpIDxCcnVjZS5MaUBhbGxpZWR0ZWxlc2lzLmNvLm56PgotLS0KIGRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtZGVzaWdud2FyZS1tYXN0ZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtZGVzaWdud2FyZS1tYXN0ZXIuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdu
d2FyZS1tYXN0ZXIuYwppbmRleCBjN2U1NjAwMjgwOWEuLmVjNzMxMzkwOTQ3YyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLW1hc3Rlci5jCisrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1tYXN0ZXIuYwpAQCAtNzEsNyArNzEsNyBAQCBz
dGF0aWMgaW50IGkyY19kd19zZXRfdGltaW5nc19tYXN0ZXIoc3RydWN0IGR3X2kyY19kZXYgKmRl
dikKIAkJCQkJMCk7CS8qIE5vIG9mZnNldCAqLwogCQlkZXYtPnNzX2xjbnQgPQogCQkJaTJjX2R3
X3NjbF9sY250KGljX2NsaywKLQkJCQkJNDcwMCwJLyogdExPVyA9IDQuNyB1cyAqLworCQkJCQk1
MjAwLAkvKiB0TE9XID0gNS4yIHVzICovCiAJCQkJCXNjbF9mYWxsaW5nX3RpbWUsCiAJCQkJCTAp
OwkvKiBObyBvZmZzZXQgKi8KIAl9Ci0tIAoyLjQ1LjIK

--_004_7bb85fcde1dc477bb897d89dd0ddeb3balliedtelesisconz_--


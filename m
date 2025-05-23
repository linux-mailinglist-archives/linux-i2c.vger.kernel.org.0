Return-Path: <linux-i2c+bounces-11121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13330AC1E98
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 10:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF3CB16B403
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 08:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676CC1A00FA;
	Fri, 23 May 2025 08:23:44 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B2289345;
	Fri, 23 May 2025 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988624; cv=none; b=EfAgmwaEn+xX9IMh0C/KTMO7/izznWQ3uwweByOQhRgM9+gDrZtH2IBpZ6r6KgTG326yKx1Oyc41/fY8GjFkT5L9beAINq7KS0+I8z0AwOnIuZF8ANNK+jFWLXwNFmdLiKK/xz9dAXX324GHYLAfGeOQV54g9TPTooON8AFdQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988624; c=relaxed/simple;
	bh=5Z9NEFXu2T4KMGF8HBlUVqMT2AQLnlNjrsKMBuK8ZcI=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=X3PXNZJ3B00DEuGZp4WxzL/1lzH5QHRQuJZDjizTb52QUF3LV73RHyDTH6/kVhBJUwpc2WMoRTnQSALDGwfwXUg7F8DZ8AgWML37pmxqu4nNMW6ByBt1TEdW4DS3TE85GBXesV9EzG5ECQdjgxQAISqdLTVU/FNwzoq9s9PyMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b3dTY2KvBz51SZV;
	Fri, 23 May 2025 16:23:29 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl2.zte.com.cn with SMTP id 54N8MnL9069546;
	Fri, 23 May 2025 16:23:18 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app06[null])
	by mapi (Zmail) with MAPI id mid201;
	Fri, 23 May 2025 16:23:20 +0800 (CST)
Date: Fri, 23 May 2025 16:23:20 +0800 (CST)
X-Zmail-TransId: 2afe68303078ffffffffb8d-6b78f
X-Mailer: Zmail v1.0
Message-ID: <20250523162320417fu6Jda0DFRUEsjim_ELx8@zte.com.cn>
In-Reply-To: <aDAa9OqEak_s3lU8@ninjato>
References: 20250523141647052h8sceSvH_KRJYFgqd6iuJ@zte.com.cn,aDAa9OqEak_s3lU8@ninjato
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <wsa+renesas@sang-engineering.com>
Cc: <codrin.ciubotariu@microchip.com>, <andi.shyti@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@tuxon.dev>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>, <fang.yumeng@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gaTJjOiBhdDkxOiBVc2Ugc3RyX3JlYWRfd3JpdGUoKSBoZWxwZXI=?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl2.zte.com.cn 54N8MnL9069546
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68303081.001/4b3dTY2KvBz51SZV



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pj4gUmVtb3ZlIGhhcmQtY29kZWQgc3RyaW5ncyBieSB1c2luZyB0aGUgc3RyX3JlYWRfd3JpdGUo
KSBoZWxwZXIuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFl1bWVuZyBGYW5nIDxmYW5nLnl1bWVu
Z0B6dGUuY29tLmNuPg0KPj4gU2lnbmVkLW9mZi1ieTogWXVuamlhbiBMb25nIDxsb25nLnl1bmpp
YW5AenRlLmNvbS5jbj4NCj4NCj5UaGFuayB5b3UsIGJ1dCBwbGVhc2UgZml4IHRoaXMgZm9yIHRo
ZSB3aG9sZSBzdWJzeXN0ZW0gaW4gYSBzaW5nbGUNCj5wYXRjaC4NCg0KVGhhbmsgeW91LCBJIGhh
dmUgZml4ZWQgdGhpcyBpc3N1ZSBpbiB0aGUgd2hvbGUgaTJjIHN1YnN5c3RlbS4NCkkgd2lsbCBz
ZW5kIHRoZSBQQVRDSCBWMiBhbmQgbG9vayBmb3J3YXJkIHRvIHlvdXIgZnVydGhlciByZXZpZXcu
DQoNCkJlc3QgcmVnYXJkcywNCkZhbmcgWXVtZW5nDQoNCk9yaWdpbmFsDQoNCg0KRnJvbTogd3Nh
K3JlbmVzYXMgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPg0KVG86IExvbmcgWXVu
amlhbjEwMTcxNjk5Ow0KQ2M6IGNvZHJpbi5jaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBt
aWNyb2NoaXAuY29tPjthbmRpLnNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+O25pY29sYXMu
ZmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT47YWxleGFuZHJlLmJlbGxvbmkgPGFs
ZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjtjbGF1ZGl1LmJlem5lYSA8Y2xhdWRpdS5iZXpu
ZWFAdHV4b24uZGV2PjtsaW51eC1pMmMgPGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc+O2xpbnV4
LWFybS1rZXJuZWwgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47bGludXgt
a2VybmVsIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjtNb3UgWWkxMDIwNTUwODtYdSBM
aWZlbmcxMDAxMzQ2NTtGYW5nIFl1bWVuZzAwMzM2NDM4O091eWFuZyBNYW9jaHVuMTAwOTA1MDQ7
DQpEYXRlOiAyMDI1LzA1LzIzIDE0OjUxDQpTdWJqZWN0OiBSZTogW1BBVENIXSBpMmM6IGF0OTE6
IFVzZSBzdHJfcmVhZF93cml0ZSgpIGhlbHBlcg0KDQpPbiBGcmksIE1heSAyMywgMjAyNSBhdCAw
MjoxNjo0N1BNICswODAwLCBsb25nLnl1bmppYW5AenRlLmNvbS5jbiB3cm90ZToNCj4gRnJvbTog
WXVtZW5nIEZhbmcgPGZhbmcueXVtZW5nQHp0ZS5jb20uY24+IA0KPiAgDQo+IFJlbW92ZSBoYXJk
LWNvZGVkIHN0cmluZ3MgYnkgdXNpbmcgdGhlIHN0cl9yZWFkX3dyaXRlKCkgaGVscGVyLg0KPiAg
DQo+IFNpZ25lZC1vZmYtYnk6IFl1bWVuZyBGYW5nIDxmYW5nLnl1bWVuZ0B6dGUuY29tLmNuPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWXVuamlhbiBMb25nIDxsb25nLnl1bmppYW5AenRlLmNvbS5jbj4g
DQogDQpUaGFuayB5b3UsIGJ1dCBwbGVhc2UgZml4IHRoaXMgZm9yIHRoZSB3aG9sZSBzdWJzeXN0
ZW0gaW4gYSBzaW5nbGUNCnBhdGNoLg==


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwPiZndDsmZ3Q7IFJlbW92ZSBoYXJkLWNvZGVkIHN0
cmluZ3MgYnkgdXNpbmcgdGhlIHN0cl9yZWFkX3dyaXRlKCkgaGVscGVyLjwvcD48cD4mZ3Q7Jmd0
OyZuYnNwOzwvcD48cD4mZ3Q7Jmd0OyBTaWduZWQtb2ZmLWJ5OiBZdW1lbmcgRmFuZyAmbHQ7ZmFu
Zy55dW1lbmdAenRlLmNvbS5jbiZndDs8L3A+PHA+Jmd0OyZndDsgU2lnbmVkLW9mZi1ieTogWXVu
amlhbiBMb25nICZsdDtsb25nLnl1bmppYW5AenRlLmNvbS5jbiZndDs8L3A+PHA+Jmd0OzwvcD48
cD4mZ3Q7VGhhbmsgeW91LCBidXQgcGxlYXNlIGZpeCB0aGlzIGZvciB0aGUgd2hvbGUgc3Vic3lz
dGVtIGluIGEgc2luZ2xlPC9wPjxwPiZndDtwYXRjaC48L3A+PHA+PGJyPjwvcD48cD5UaGFuayB5
b3UsIEkgaGF2ZSBmaXhlZCB0aGlzIGlzc3VlIGluIHRoZSB3aG9sZSBpMmMgc3Vic3lzdGVtLjwv
cD48cD5JIHdpbGwgc2VuZCB0aGUgUEFUQ0ggVjIgYW5kIGxvb2sgZm9yd2FyZCB0byB5b3VyIGZ1
cnRoZXIgcmV2aWV3LjwvcD48cD48YnI+PC9wPjxwPkJlc3QgcmVnYXJkcyw8L3A+PHA+RmFuZyBZ
dW1lbmc8L3A+PGRpdiBjbGFzcz0iemhpc3RvcnlSb3ciIHN0eWxlPSJkaXNwbGF5OmJsb2NrIj48
ZGl2IGNsYXNzPSJ6aGlzdG9yeURlcyIgc3R5bGU9IndpZHRoOiAxMDAlOyBoZWlnaHQ6IDI4cHg7
IGxpbmUtaGVpZ2h0OiAyOHB4OyBiYWNrZ3JvdW5kLWNvbG9yOiAjRTBFNUU5OyBjb2xvcjogIzEz
ODhGRjsgdGV4dC1hbGlnbjogY2VudGVyOyI+T3JpZ2luYWw8L2Rpdj48ZGl2IGlkPSJ6d3JpdGVI
aXN0b3J5Q29udGFpbmVyIj48ZGl2IGNsYXNzPSJjb250cm9sLWdyb3VwIHpoaXN0b3J5UGFuZWwi
PjxkaXYgY2xhc3M9InpoaXN0b3J5SGVhZGVyIiBzdHlsZT0icGFkZGluZzogOHB4OyBiYWNrZ3Jv
dW5kLWNvbG9yOiAjRjVGNkY4OyI+PGRpdj48c3Ryb25nPkZyb206Jm5ic3A7PC9zdHJvbmc+PHNw
YW4gY2xhc3M9InpyZWFkVXNlck5hbWUiPndzYStyZW5lc2FzICZsdDt3c2ErcmVuZXNhc0BzYW5n
LWVuZ2luZWVyaW5nLmNvbSZndDs8L3NwYW4+PC9kaXY+PGRpdj48c3Ryb25nPlRvOiZuYnNwOzwv
c3Ryb25nPjxzcGFuIGNsYXNzPSJ6cmVhZFVzZXJOYW1lIiBzdHlsZT0iZGlzcGxheTogaW5saW5l
OyI+TG9uZyBZdW5qaWFuMTAxNzE2OTk7PC9zcGFuPjwvZGl2PjxkaXY+PHN0cm9uZz5DYzombmJz
cDs8L3N0cm9uZz48c3BhbiBjbGFzcz0ienJlYWRVc2VyTmFtZSIgc3R5bGU9ImRpc3BsYXk6IGlu
bGluZTsiPmNvZHJpbi5jaXVib3Rhcml1ICZsdDtjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAu
Y29tJmd0Ozs8L3NwYW4+PHNwYW4gY2xhc3M9InpyZWFkVXNlck5hbWUiIHN0eWxlPSJkaXNwbGF5
OiBpbmxpbmU7Ij5hbmRpLnNoeXRpICZsdDthbmRpLnNoeXRpQGtlcm5lbC5vcmcmZ3Q7Ozwvc3Bh
bj48c3BhbiBjbGFzcz0ienJlYWRVc2VyTmFtZSIgc3R5bGU9ImRpc3BsYXk6IGlubGluZTsiPm5p
Y29sYXMuZmVycmUgJmx0O25pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbSZndDs7PC9zcGFuPjxz
cGFuIGNsYXNzPSJ6cmVhZFVzZXJOYW1lIiBzdHlsZT0iZGlzcGxheTogaW5saW5lOyI+YWxleGFu
ZHJlLmJlbGxvbmkgJmx0O2FsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tJmd0Ozs8L3NwYW4+
PHNwYW4gY2xhc3M9InpyZWFkVXNlck5hbWUiIHN0eWxlPSJkaXNwbGF5OiBpbmxpbmU7Ij5jbGF1
ZGl1LmJlem5lYSAmbHQ7Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Jmd0Ozs8L3NwYW4+PHNwYW4g
Y2xhc3M9InpyZWFkVXNlck5hbWUiIHN0eWxlPSJkaXNwbGF5OiBpbmxpbmU7Ij5saW51eC1pMmMg
Jmx0O2xpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcmZ3Q7Ozwvc3Bhbj48c3BhbiBjbGFzcz0ienJl
YWRVc2VyTmFtZSIgc3R5bGU9ImRpc3BsYXk6IGlubGluZTsiPmxpbnV4LWFybS1rZXJuZWwgJmx0
O2xpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyZndDs7PC9zcGFuPjxzcGFuIGNs
YXNzPSJ6cmVhZFVzZXJOYW1lIiBzdHlsZT0iZGlzcGxheTogaW5saW5lOyI+bGludXgta2VybmVs
ICZsdDtsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnJmd0Ozs8L3NwYW4+PHNwYW4gY2xhc3M9
InpyZWFkVXNlck5hbWUiIHN0eWxlPSJkaXNwbGF5OiBpbmxpbmU7Ij5Nb3UgWWkxMDIwNTUwODs8
L3NwYW4+PHNwYW4gY2xhc3M9InpyZWFkVXNlck5hbWUiIHN0eWxlPSJkaXNwbGF5OiBpbmxpbmU7
Ij5YdSBMaWZlbmcxMDAxMzQ2NTs8L3NwYW4+PHNwYW4gY2xhc3M9InpyZWFkVXNlck5hbWUiIHN0
eWxlPSJkaXNwbGF5OiBpbmxpbmU7Ij5GYW5nIFl1bWVuZzAwMzM2NDM4Ozwvc3Bhbj48c3BhbiBj
bGFzcz0ienJlYWRVc2VyTmFtZSIgc3R5bGU9ImRpc3BsYXk6IGlubGluZTsiPk91eWFuZyBNYW9j
aHVuMTAwOTA1MDQ7PC9zcGFuPjwvZGl2PjxkaXY+PHN0cm9uZz5EYXRlOiZuYnNwOzwvc3Ryb25n
PjxzcGFuIGNsYXNzPSIiPjIwMjUvMDUvMjMgMTQ6NTE8L3NwYW4+PC9kaXY+PGRpdj48c3Ryb25n
PlN1YmplY3Q6Jm5ic3A7PC9zdHJvbmc+PHNwYW4gY2xhc3M9InpyZWFkVGl0bGUiPjxzdHJvbmc+
UmU6IFtQQVRDSF0gaTJjOiBhdDkxOiBVc2Ugc3RyX3JlYWRfd3JpdGUoKSBoZWxwZXI8L3N0cm9u
Zz48L3NwYW4+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iemhpc3RvcnlDb250ZW50Ij5PbiZuYnNw
O0ZyaSwmbmJzcDtNYXkmbmJzcDsyMywmbmJzcDsyMDI1Jm5ic3A7YXQmbmJzcDswMjoxNjo0N1BN
Jm5ic3A7KzA4MDAsJm5ic3A7bG9uZy55dW5qaWFuQHp0ZS5jb20uY24mbmJzcDt3cm90ZTo8YnI+
Jmd0OyZuYnNwO0Zyb206Jm5ic3A7WXVtZW5nJm5ic3A7RmFuZyZuYnNwOyZsdDtmYW5nLnl1bWVu
Z0B6dGUuY29tLmNuJmd0OyA8YnI+Jmd0OyZuYnNwOyA8YnI+Jmd0OyZuYnNwO1JlbW92ZSZuYnNw
O2hhcmQtY29kZWQmbmJzcDtzdHJpbmdzJm5ic3A7YnkmbmJzcDt1c2luZyZuYnNwO3RoZSZuYnNw
O3N0cl9yZWFkX3dyaXRlKCkmbmJzcDtoZWxwZXIuPGJyPiZndDsmbmJzcDsgPGJyPiZndDsmbmJz
cDtTaWduZWQtb2ZmLWJ5OiZuYnNwO1l1bWVuZyZuYnNwO0ZhbmcmbmJzcDsmbHQ7ZmFuZy55dW1l
bmdAenRlLmNvbS5jbiZndDsgPGJyPiZndDsmbmJzcDtTaWduZWQtb2ZmLWJ5OiZuYnNwO1l1bmpp
YW4mbmJzcDtMb25nJm5ic3A7Jmx0O2xvbmcueXVuamlhbkB6dGUuY29tLmNuJmd0OyA8YnI+IDxi
cj5UaGFuayZuYnNwO3lvdSwmbmJzcDtidXQmbmJzcDtwbGVhc2UmbmJzcDtmaXgmbmJzcDt0aGlz
Jm5ic3A7Zm9yJm5ic3A7dGhlJm5ic3A7d2hvbGUmbmJzcDtzdWJzeXN0ZW0mbmJzcDtpbiZuYnNw
O2EmbmJzcDtzaW5nbGU8YnI+cGF0Y2guPGJyPiA8YnI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
PHA+PGJyPjwvcD48L2Rpdj4=


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--



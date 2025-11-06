Return-Path: <linux-i2c+bounces-13998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B705BC3BE56
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 15:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6C218875BD
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 14:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564FF34575F;
	Thu,  6 Nov 2025 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="VL44ynMT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net [87.98.184.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C53396FA
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.184.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440607; cv=none; b=c5MQ0KK2Tp5c3QzktqNEi/SFaZZx1vQM/SeppHoL9qsS90lV3NTrTny8lkpTnlgdMrT3lB+7mZIFJj+fduaAi6gQ0BY+0IukALx2UIXX5adSIAtCMlRNd/Mg1hMIpDEG9d30VA6UU61EOXHb8vNDjud1mfgGIKLgrU4p7pkSH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440607; c=relaxed/simple;
	bh=8dvVZ7OnhuyvlFAdBgBcpLp1l0DKJ9tS35F3SJsm3ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppLj+dQUVvcP4u6fu8W8MYraVre7JcqVEqZhQEDlMip0Sou5scvN2KOu8STRXgx4po6pCdSISvDAPCPMM1/i7/LEJu5UZQadKf+zDRhaC4VpZVATlmIJHNYJsqULwJIRZF60PdX7Ht7sJOcMF4rYfmFbCvzctcQTtcMxD7MyDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=VL44ynMT; arc=none smtp.client-ip=87.98.184.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.231.67])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4d2Nx737BJz5xxs
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 13:55:07 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-7tgnz (unknown [10.110.168.82])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B0D20C0F78;
	Thu,  6 Nov 2025 13:55:06 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
	by ghost-submission-7d8d68f679-7tgnz with ESMTPSA
	id rt/DHbqoDGmLXAUA8dks+g
	(envelope-from <kamil.aronowski@3mdeb.com>); Thu, 06 Nov 2025 13:55:06 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S0082ed6e51c-50ee-4c2b-9ba7-f3669b1e3c00,
                    E8BDD57628EDB53623C37C0AD72638C3C36D617A) smtp.auth=kamil.aronowski@3mdeb.com
X-OVh-ClientIp:213.192.77.249
Message-ID: <ee8098ab-8d85-48e4-8aa9-19eaf1e0e4ae@3mdeb.com>
Date: Thu, 6 Nov 2025 14:55:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] decode-dimms: Implement DDR5 decoding
To: Stephen Horvath <s.horvath@outlook.com.au>, linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, Guenter Roeck <linux@roeck-us.net>
References: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
 <cdb56a48-8754-4d9d-9309-8a694c6f148d@3mdeb.com>
 <SYBPR01MB45864E0B85A6AB0B157E0FAFC5C2A@SYBPR01MB4586.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Kamil Aronowski <kamil.aronowski@3mdeb.com>
In-Reply-To: <SYBPR01MB45864E0B85A6AB0B157E0FAFC5C2A@SYBPR01MB4586.ausprd01.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XTCaDCQjN27dnLnyP8Efeq0x"
X-Ovh-Tracer-Id: 12158311622601306384
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFPxLmXTosq1fPBPEn2k5JBphLLG+Er0jVd5fErNf3piumFA+dyVtzo8AG6l+8HiLLecCJyuT8u92/5/p6bhEMe+0GfHftSCNKTkgBbmb8URos4h02MKaFVo2dgW07arAl0eYx7BUAuRLyKf+PJpaC3fRy3+wTOHvRocRsZcXeHXZqllB0IL70K75fW+9wSFqBCwUtuiiXOVqaZNpTlpmdaLiZn3YrBvbzACPOBX0+PhTegCR8+ReEBiU4yJasz+HCKYd3gvCIH8S6VArTHgkCf+mjxVl1LRYSpAnyDZNEBcA+yFVFgDaeBAfFKr7bZnTehRJH4ofGYVQnAzF3NB6KMHNnvkpwW8cdvA/0fk+fjPOzrrxYtHXhVR2k9h0RnmQzcvXnfgMkj5Cpa0B4IKLXOMleDqtJF2SU8GBXXk1Jrdd5hGovEqKyGhXLFtNOAad45+73slxOjFoXF6r/HsI5wOtG2jAISaAD9RfobPn9P2qTtR+5DLt4AjEuvAiy3iNjJInOj0/I6/MfjT0yHuTpkpU4U4tBhep4HCMAExFlZSKR+OqeOwdjI2cLa1hCkQyGhr7+eloDifg1xt595BycP5BzWu97QvTtlE5nWWS9PRA/U0uD0DuOYkssqA2oMTcXuezk4EVdXHWr9MY1hMyy/VmLZuOSr8urr1BUT8rzLxw
DKIM-Signature: a=rsa-sha256; bh=8dvVZ7OnhuyvlFAdBgBcpLp1l0DKJ9tS35F3SJsm3ZE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1762437307; v=1;
 b=VL44ynMTD5hbghOk7Q9aN4rcWWxHF2V5XCRxbOkvZLhijp8fuqIeoEcDha90Fm8dymBP1jW0
 wD3IdMNCSGIgigVU1WemjzeW2PVQwYCIWr68oTv4CN66uSoPkO/Oda4Xx9mx0vPNlN6Bpm7Eyoa
 4LGEVFgdaQvRNhM7nsXbQBH+79a4Zk5CRYyCAaZyz/K5m/QybP/TpaZh7sdY8Ly215D07lxVthp
 taeojPGhUVe5rVgYsNzHuRq/poagEfHUToHGCqsR+7AFl5EyaEkpchtLbDZ7TDVymBhAF85VAcD
 LDqRKDS5LxutNaItKvXoIcVEB0AnKxkmJUtEUHeDWeP8g==

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XTCaDCQjN27dnLnyP8Efeq0x
Content-Type: multipart/mixed; boundary="------------WkMyO9V3fhEQJ0cmlTe60bs8";
 protected-headers="v1"
From: Kamil Aronowski <kamil.aronowski@3mdeb.com>
To: Stephen Horvath <s.horvath@outlook.com.au>, linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, Guenter Roeck <linux@roeck-us.net>
Message-ID: <ee8098ab-8d85-48e4-8aa9-19eaf1e0e4ae@3mdeb.com>
Subject: Re: [PATCH 0/6] decode-dimms: Implement DDR5 decoding
References: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
 <cdb56a48-8754-4d9d-9309-8a694c6f148d@3mdeb.com>
 <SYBPR01MB45864E0B85A6AB0B157E0FAFC5C2A@SYBPR01MB4586.ausprd01.prod.outlook.com>
In-Reply-To: <SYBPR01MB45864E0B85A6AB0B157E0FAFC5C2A@SYBPR01MB4586.ausprd01.prod.outlook.com>

--------------WkMyO9V3fhEQJ0cmlTe60bs8
Content-Type: multipart/mixed; boundary="------------b2rsRc92a4yt2oQxX8oqtrrR"

--------------b2rsRc92a4yt2oQxX8oqtrrR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sIFN0ZXBoZW4sDQoNCk9uIDExLzYvMjUgMDI6MjYsIFN0ZXBoZW4gSG9ydmF0aCB3
cm90ZToNCj4gSGkgS2FtaWwsDQo+DQo+IE9uIDUvMTEvMjUgMjM6MzEsIEthbWlsIEFyb25v
d3NraSB3cm90ZToNCj4+IE9uIDExLzE0LzI0IDA3OjM3LCBTdGVwaGVuIEhvcnZhdGggdmlh
IEI0IFJlbGF5IHdyb3RlOg0KPj4+IEhpLCB0aGlzIHNlcmllcyBvZiBwYXRjaGVzIGFkZHMg
RERSNSBzdXBwb3J0IHRvIGRlY29kZS1kaW1tcy4NCj4+Pg0KPj4+IEknbSBub3QgdG9vIGV4
cGVyaWVuY2VkIHdpdGggcGVybCBvciB0aGUgSkVERUMgc3BlY3MsIHNvIHRoZXJlJ3MgcHJv
YmFibHkNCj4+PiBnb2luZyB0byBiZSBzb21lIHF1ZXN0aW9uYWJsZSBjaG9pY2VzIGhlcmUs
IGJ1dCBJJ2QgbG92ZSB0byBoZWFyDQo+Pj4gZmVlZGJhY2suDQo+Pg0KPj4gVGhlIHBhdGNo
c2V0IGRvZXNuJ3Qgc2VlbSB0byB3b3JrIG91dC1vZi10aGUtYm94LiBXaGVuIHJ1bm5pbmcg
dGhlIHBhdGNoZWQNCj4+IGBkZWNvZGUtZGltbXNgLCBhbiBlcnJvciBpcyB0aHJvd246DQo+
Pg0KPj4gYGBgDQo+PiAkIHN1ZG8gLi9lZXByb20vZGVjb2RlLWRpbW1zDQo+PiBDYW5ub3Qg
cmVhZCAvc3lzL2J1cy9pMmMvZHJpdmVycy9zcGQ1MTE4LzE2LTAwNTAvZWVwcm9tIGF0IC4v
ZWVwcm9tLw0KPj4gZGVjb2RlLWRpbW1zIGxpbmUgMjk0MC4NCj4+IGBgYA0KPg0KPiBUaGF0
IHNvdW5kcyBsaWtlIGl0J3MgaGF2aW5nIHRyb3VibGUgcmVhZGluZyB0aGUgZWVwcm9tLCBu
b3QgZXZlbg0KPiBkZWNvZGluZyBpdC4gSSBoYXZlIGEgZmVlbGluZyB0aGlzIG1pZ2h0IGJl
IHJlbGF0ZWQgdG8gJ1NQRCBXcml0ZQ0KPiBQcm90ZWN0aW9uJywgZG9lcyB5b3VyIG1vdGhl
cmJvYXJkIGxldCB5b3UgZGlzYWJsZSBpdD8gSXQncyBvZnRlbg0KPiBlbmFibGVkIGJ5IGRl
ZmF1bHQgb24gSW50ZWwsIGFuZCBJIGRvbid0IHRoaW5rIGl0IGV4aXN0cyBvbiBBTUQuDQo+
DQo+IHNwZDUxMTggbmVlZHMgdG8gYmUgYWJsZSB0byB3cml0ZSB0byB0aGUgU1BEIGluIG9y
ZGVyIHRvIHNlbGVjdCB3aGljaA0KPiBwYWdlIHRvIHJlYWQuDQo+DQo+IE90aGVyd2lzZSwg
YXJlIHlvdSBhYmxlIHRvIGR1bXAgeW91ciBlZXByb20gYW5kIHNlbmQgaXQ/DQo+IGUuZy4g
YGNhdCAvc3lzL2J1cy9pMmMvZHJpdmVycy9zcGQ1MTE4LzE2LTAwNTAvZWVwcm9tID4gZWVw
cm9tLnJvbWANCg0KVGhlIFNQRCBXcml0ZSBQcm90ZWN0aW9uIGlzIGxpa2VseSB0byBoYXZl
IGJlZW4gdGhlIGNhdXNlLCBzaW5jZSByZXBlYXRpbmcgdGhlDQpleHBlcmltZW50IG9uIGEg
bWFjaGluZSB3aXRob3V0IGl0IHdvcmtlZCBvdXQtb2YtdGhlLWJveC4NCg0KQW55IGF0dGVt
cHRzIG9mIGR1bXBpbmcgdGhlIGVlcHJvbSBvbiB0aGUgaW5jb21wYXRpYmxlIGNvbmZpZ3Vy
YXRpb25zIHdlcmUNCnVuc3VjY2Vzc2Z1bCwgZXhjZXB0IHJlYWRpbmcgMSBieXRlIGluIGEg
bG9vcCwgMTI4IHRpbWVzLg0KDQo+Pj4gVGhlIGZpcnN0IDQgcGF0Y2hlcyAoMSwgMiwgMywg
NCkgYWRkIHRoZSBlc3NlbnRpYWwgaW5mb3JtYXRpb24gdG8NCj4+PiBkZWNvZGUtZGltbXMu
DQo+Pj4NCj4+PiBUaGUgbmV4dCAyIHBhdGNoZXMgKDUsIDYpIGhhdmVuJ3QgcmVhbGx5IGJl
ZW4gdGVzdGVkIG9uIGhhcmR3YXJlDQo+Pj4gaW1wbGVtZW50YXRpb25zIHNvIEknbSBoYXBw
eSBmb3IgdGhlbSB0byBiZSBkcm9wcGVkIGlmIHRoZXkncmUgbm90DQo+Pj4gdXNlZnVsLg0K
Pj4NCj4+IFdhcyB0aGUgcGF0Y2hzZXQgdGVzdGVkIG9uIGFueSBoYXJkd2FyZSBvciBzb21l
IG90aGVyIGludGVuZGVkIGVudmlyb25tZW50DQo+PiBvdXRzaWRlIG9mIG15IHVzZSBjYXNl
PyBUaGUgbGF0dGVyIGlzIGFib3V0IHRoZSBtb3N0IHJlY2VudCByZXZpc2lvbiBvZg0KPj4g
RmVkb3JhDQo+PiBSYXdoaWRlIHdpdGggdGhlIHNwZDUxMTggbW9kdWxlIG9uIHZhcmlvdXMg
RERSNS1lcXVpcHBlZCBsYXB0b3BzLg0KPg0KPiBUaGUgZmlyc3QgNCBwYXRjaGVzIHdlcmUg
dGVzdGVkIG9uIG15IGRlc2t0b3Agd2l0aCBLaW5nc3RvbiBESU1NcyBhbmQNCj4gbGFwdG9w
IHdpdGggQ3J1Y2lhbCBESU1NcywgYm90aCBBTUQuIEkgZG9uJ3QgaGF2ZSBhbnkgc29ydCBv
ZiBmYW5jeQ0KPiBlbnZpcm9ubWVudCwganVzdCBjb25zdW1lciBncmFkZSBzdHVmZi4NCj4N
Cj4gSSd2ZSBtYWRlIHNvbWUgbWlub3IgY2hhbmdlcyBzaW5jZSBvcmlnaW5hbGx5IHN1Ym1p
dHRpbmcgaXQsIHNvIEknbGwNCj4gc3VibWl0IGEgdjIgc2hvcnRseSB0b28uDQo+DQo+IFRo
YW5rcywNCj4gU3RldmUNCg0KTG9va2luZyBmb3J3YXJkIHRvIHRoZSB2MiBzdWJtaXNzaW9u
LiBUaGFuayB5b3UgZm9yIHRoZSBoZWxwIGFuZCB0aGUgZ3JlYXQNCndvcmsuDQoNCi0tIA0K
S2FtaWwgQXJvbm93c2tpDQpKdW5pb3IgRW1iZWRkZWQgRmlybXdhcmUgRW5naW5lZXINCkdQ
RzogMzUxMDE0OEE1Q0Q2NzkwOA0KaHR0cHM6Ly8zbWRlYi5jb20gfCBAM21kZWJfY29tDQoN
Cg==
--------------b2rsRc92a4yt2oQxX8oqtrrR
Content-Type: application/pgp-keys; name="OpenPGP_0x3510148A5CD67908.asc"
Content-Disposition: attachment; filename="OpenPGP_0x3510148A5CD67908.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
b3ikfoPzj01UD8qg65aMJyOX/NBfuw=3D=3D
=3D+WKZ
-----END PGP PUBLIC KEY BLOCK-----

--------------b2rsRc92a4yt2oQxX8oqtrrR--

--------------WkMyO9V3fhEQJ0cmlTe60bs8--

--------------XTCaDCQjN27dnLnyP8Efeq0x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE17Er8MHTMiECVfFxOAwyg6B5WrYFAmkMqLoFAwAAAAAACgkQOAwyg6B5WrZ2
RBAAzMJFb2NVfzAyeDGk4HEvwVnTGR1P3qz4j5B3qKY1LBsImySl5lRX5TgVoTHzE8y447XHBkLf
q773z5gcMW7iPFPS9uzfXQmLnr4TAGWkz5pdliLWOktU4sumijxKpqPIa4Aus1dhTnu5OYka4WNf
htuy1iuWA8xRYRtkhbWL40rwpCJRjoPeJVK3JBP5YqHHZoSNbeS6jOCii/G+zNrh219hOUrr7SUl
kdurNEuaWEG/V08Ppk/W0gPy01fEH3HbYjwIV7tqN2tpPBnUkL0gGMPYgGoo+wfJC6HfnzDBKfJ+
bNjyhNga19kugKDRMMooH38axy1pQaKz7BJRn6zncXvBmICk5ED/64wyRxKP1dlLatlyppkMlOmw
AWs8l6dB+NVRw0e91L92QuJ74q8IMyZh2GaUeV5v7YRE7peTf+8D2qHBGC6W7X+pyShfeJgQzXsE
I1umoX0GnyXKd4Z1Wfg9iDP7+/I9CGkNN8QOpJ/JlqekTUj/MMWmxssOQFxnPWseu6/BCc5BShaZ
knueNpLQX4vnaH1AUd4QYt22poPZlAR6Ah/CKQhdnzJLQvXvVWzA/fQuDEqmcLOiyQE8lGVnTjFo
5JJNrdi7skLINnoghYGO8V0O9px5VXjb+yGZJKXCnlH9Brjh6AFd63V+a+YykA1d5HZOYvG6wDXO
Cmw=
=CD2X
-----END PGP SIGNATURE-----

--------------XTCaDCQjN27dnLnyP8Efeq0x--


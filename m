Return-Path: <linux-i2c+bounces-400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BD7F5A8B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E25F2817AD
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 08:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8CF1C2BE;
	Thu, 23 Nov 2023 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F1gWvthT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LBtwgcVZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A903BA3;
	Thu, 23 Nov 2023 00:52:12 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 057A01FD5E;
	Thu, 23 Nov 2023 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700729531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d5YMKMD40jtSSJ78D5kTBdXezbO7I818lBfKoIVA/HQ=;
	b=F1gWvthTlLTRQiIKtG36MsPjpknKAJusmxO78AJ64PHljUIqjSykwzxdkIxIN441yhewpK
	l0IKaPLKEUv01cfVb/0rxDMBR9iOfL76D1ViF/Mjdtx63ZZ3VerCFtmyCpSSbcpwUwOzkj
	zAMch70wNOuC/kEs2PLrvzGFbXjiEso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700729531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d5YMKMD40jtSSJ78D5kTBdXezbO7I818lBfKoIVA/HQ=;
	b=LBtwgcVZtouiwB/8pQ5ox+G2EhnCA3AyUhB+iZtPcgSvyiIOKaX8as8gESBlcSysaA43j/
	J5M5J4AXOSAH+3DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EE5D133B6;
	Thu, 23 Nov 2023 08:52:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4YPUIboSX2UxCwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Nov 2023 08:52:10 +0000
Message-ID: <88ef9966-a701-445e-912b-8261600ed55f@suse.de>
Date: Thu, 23 Nov 2023 09:52:09 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/20] remove I2C_CLASS_DDC support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: Yongqin Liu <yongqin.liu@linaro.org>, freedreno@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
References: <20231120214624.9378-1-hkallweit1@gmail.com>
 <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
 <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>
 <c4c0a79d-4e0a-41c1-89b9-8df71ae6335c@suse.de>
 <266d2141-4615-4fd8-b603-aabb0e6e6860@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <266d2141-4615-4fd8-b603-aabb0e6e6860@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y3dBXyNOFtXF6PTBN3ER5sK4"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.12
X-Spamd-Result: default: False [-1.12 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 REPLY(-4.00)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.freedesktop.org];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_SPAM_SHORT(2.97)[0.989];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 RCPT_COUNT_TWELVE(0.00)[24];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[linaro.org,lists.freedesktop.org,vger.kernel.org,gmail.com,redhat.com,kwiboo.se,google.com,lists.infradead.org,hisilicon.com,ideasonboard.com,somainline.org,poorly.run,lists.linux.dev]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y3dBXyNOFtXF6PTBN3ER5sK4
Content-Type: multipart/mixed; boundary="------------PMsl1dGZ5FMqrLXxAS8J0V9j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: Yongqin Liu <yongqin.liu@linaro.org>, freedreno@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Message-ID: <88ef9966-a701-445e-912b-8261600ed55f@suse.de>
Subject: Re: [PATCH v4 00/20] remove I2C_CLASS_DDC support
References: <20231120214624.9378-1-hkallweit1@gmail.com>
 <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
 <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>
 <c4c0a79d-4e0a-41c1-89b9-8df71ae6335c@suse.de>
 <266d2141-4615-4fd8-b603-aabb0e6e6860@gmail.com>
In-Reply-To: <266d2141-4615-4fd8-b603-aabb0e6e6860@gmail.com>

--------------PMsl1dGZ5FMqrLXxAS8J0V9j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMTEuMjMgdW0gMDk6MzQgc2NocmllYiBIZWluZXIgS2FsbHdlaXQ6DQo+
IE9uIDIzLjExLjIwMjMgMDk6MTksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkN
Cj4+DQo+PiBBbSAyMy4xMS4yMyB1bSAwODoxNiBzY2hyaWViIEhlaW5lciBLYWxsd2VpdDoN
Cj4+PiBPbiAyMy4xMS4yMDIzIDA3OjU2LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+
Pj4gSGkNCj4+Pj4NCj4+Pj4gQW0gMjAuMTEuMjMgdW0gMjI6NDYgc2NocmllYiBIZWluZXIg
S2FsbHdlaXQ6DQo+Pj4+PiBBZnRlciByZW1vdmFsIG9mIHRoZSBsZWdhY3kgRUVQUk9NIGRy
aXZlciBhbmQgSTJDX0NMQVNTX0REQyBzdXBwb3J0IGluDQo+Pj4+PiBvbHBjX2Rjb24gdGhl
cmUncyBubyBpMmMgY2xpZW50IGRyaXZlciBsZWZ0IHN1cHBvcnRpbmcgSTJDX0NMQVNTX0RE
Qy4NCj4+Pj4+IENsYXNzLWJhc2VkIGRldmljZSBhdXRvLWRldGVjdGlvbiBpcyBhIGxlZ2Fj
eSBtZWNoYW5pc20gYW5kIHNob3VsZG4ndA0KPj4+Pj4gYmUgdXNlZCBpbiBuZXcgY29kZS4g
U28gd2UgY2FuIHJlbW92ZSB0aGlzIGNsYXNzIGNvbXBsZXRlbHkgbm93Lg0KPj4+Pj4NCj4+
Pj4+IFByZWZlcmFibHkgdGhpcyBzZXJpZXMgc2hvdWxkIGJlIGFwcGxpZWQgdmlhIHRoZSBp
MmMgdHJlZS4NCj4+Pj4+DQo+Pj4+PiB2MjoNCj4+Pj4+IC0gY2hhbmdlIHRhZyBpbiBjb21t
aXQgc3ViamVjdCBvZiBwYXRjaCAwMw0KPj4+Pj4gLSBhZGQgYWNrIHRhZ3MNCj4+Pj4+IHYz
Og0KPj4+Pj4gLSBmaXggYSBjb21waWxlIGVycm9yIGluIHBhdGNoIDUNCj4+Pj4+IHY0Og0K
Pj4+Pj4gLSBtb3JlIGFjayBhbmQgcmV2aWV3IHRhZ3MNCj4+Pj4+DQo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPg0KPj4+Pg0K
Pj4+PiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+Pj4+DQo+Pj4+IGZvciB0aGUgcGF0Y2hlcyB0aGF0IGRvbid0IGFscmVhZHkgaGF2ZSBt
eSByLWIuDQo+Pj4+DQo+Pj4gVGhpcyByZWZlcnMgdG8gd2hpY2ggcGF0Y2hlcyBvZiB0aGUg
c2VyaWVzPw0KPj4+IFBhdGNoZXMgOCwgMTYsIDE4IGFyZSB0aGUgcmVtYWluaW5nIG9uZXMg
dy9vIEEtYiBvciBSLWIuDQo+Pg0KPj4gSSd2ZSBsb29rZWQgdGhyb3VnaCB0aGUgcGF0Y2hz
ZXQuIEZlZWwgZnJlZSB0byBhZGQgbXkgYS1iIHRvIHBhdGNoZXMgMSB0byAxOTsgZXhjZXB0
IGZvciAyIGFuZCAxNywgd2hpY2ggYWxyZWFkeSBoYXZlIG15IHItYi4NCj4+DQo+PiBCVFcg
SSBvbmx5IHJlY2VpdmVkIDE5IHBhdGNoZXMuIGlzIHRoZXJlIGEgcGF0Y2ggMjAvMjA/DQo+
Pg0KPiBZZXMsIHNlZSBoZXJlOg0KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXgtaTJjL3BhdGNoLzIwMjMxMTIwMjE0NjI0LjkzNzgtMjEtaGthbGx3ZWl0
MUBnbWFpbC5jb20vDQo+IElmIHlvdSdyZSBzdWJzY3JpYmVkIHRvIGxpbnV4LWkyYyBvciBs
aW51eC1rZXJuZWwgbGlzdCB5b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgaXQuDQoNCkkgc2Vl
LCBJJ20gbm90IG9uIHRoZXNlIGxpc3RzLiBJIGRvbid0IGhhdmUgdGhlIGF1dGhvcml0eSB0
byBhY2sgdGhhdCANCmZpbmFsIHBhdGNoLCBidXQgbGV0IG1lIGtub3cgaWYgeW91IHdhbnQg
dG8gbWVyZ2UgYW55dGhpbmcgdGhyb3VnaCB0aGUgDQpEUk0gdHJlZXMuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+
Pg0KPj4+PiBCZXN0IHJlZ2FyZHMNCj4+Pj4gVGhvbWFzDQo+Pj4+DQo+Pj4gVGhhbmtzLCBI
ZWluZXINCj4+Pg0KPj4+Pj4NCj4+Pj4+IC0tLQ0KPj4+Pj4NCj4+Pj4+ICDCoMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pMmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHzCoMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9pMmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+
Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2Ry
bS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuY8KgwqDCoMKgIHzCoMKgwqAgMSAtDQo+
Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kcC5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2ludGVsX2dtYnVzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgIDEgLQ0KPj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFp
bF9oZG1pX2kyYy5jwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+Pj4+ICDCoMKgIGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX3Nkdm8uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9pMmMuY8KgwqAgfMKgwqDCoCAxIC0NCj4+Pj4+ICDCoMKgIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZ21idXMuY8KgwqDCoMKgwqDCoMKg
IHzCoMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Nkdm8uY8KgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+Pj4+ICDCoMKg
IGRyaXZlcnMvZ3B1L2RybS9sb29uZ3Nvbi9sc2RjX2kyYy5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pX2RkYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0N
Cj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfaTJjLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+Pj4+ICDCoMKgIGRyaXZlcnMv
Z3B1L2RybS9tc20vaGRtaS9oZG1pX2kyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoMKgIDEgLQ0KPj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25faTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4+
PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
wqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9p
MmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+Pj4+ICDCoMKgIGRy
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2N5YmVyMjAwMGZiLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKg
IDEgLQ0KPj4+Pj4gIMKgwqAgZHJpdmVycy92aWRlby9mYmRldi9pNzQwZmIuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+Pj4g
IMKgwqAgZHJpdmVycy92aWRlby9mYmRldi9pbnRlbGZiL2ludGVsZmJfaTJjLmPCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgIDE1ICsrKysrLS0tLS0tLS0tLQ0KPj4+Pj4gIMKgwqAgZHJpdmVy
cy92aWRlby9mYmRldi9tYXRyb3gvaTJjLW1hdHJveGZiLmPCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDEyICsrKystLS0tLS0tLQ0KPj4+Pj4gIMKgwqAgZHJpdmVycy92aWRlby9mYmRldi9z
M2ZiLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3RkZnhmYi5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+
Pj4+PiAgwqDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3RyaWRlbnRmYi5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4+PiAgwqDCoCBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWFfaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+Pj4gIMKgwqAgaW5jbHVkZS9saW51eC9pMmMuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoMKgIDEgLQ0KPj4+Pj4gIMKgwqAgMzEgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pg0KPj4NCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------PMsl1dGZ5FMqrLXxAS8J0V9j--

--------------y3dBXyNOFtXF6PTBN3ER5sK4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVfEroFAwAAAAAACgkQlh/E3EQov+BV
YhAAjMyw+2rMuQ+6YRt0LqhV5f2BiOdC/WZzCHiwxiEl/n0sk/D965Z59yGkel8wgvLpm3lU4rvt
Gnn/Q3yraj3cpk1vIHmpmOtPoeVV6wyzv43L393QgmJF8vfNwX/nUIMkiKLmPUBoxRoL7WlPWU7v
8nhE/2dROpNYa0EPGyEEVZI1okf1lAJIeQfcmLyfYcwZYFSftyaGENlM3pvW+8kPEuDx7P0Q7osX
bbCOI95w+DJUFbD3LSqfyD2xEg6WHRHu4kzL+8OMX7Ckfv2p6Agn4EdB6tFcrpPGyrCWP7Ia4y/U
VkBhnPaNhuQYP3sMZ5qYHNDLdQx2JI3Sj267p3m3y6hiXjCXHUsUGDCjhGSljiLqCdr0veqETJaU
OTrsoNcIo1fafAR0pZygOxGQTvb3ODYSGIPd1q0isgZMula3Q6SCNGu2j8j9g0BFLxa/IP5M8PXb
WmXW/rH4fmAO2lplUOGF7jkc1xQxg8ayic0AN0g9ZpMPZNxYpkzTqHqBMKA1I48WILX5AIWN/moX
D7/4JHSuAHhd+aZeHyOnJaWA6nnaQBsMPaZ2SNHJ0gFNEdCLFwiPbFODDOQCnakyBfNSrNFwb7Mf
BQrQAZLtIU2cXn5r4U2nCJwMWeIz0VnbdT/dhL2Ts3SBvl4NONqYMfSLreh2Rr6KUMKlx+6Ji5kP
Qlk=
=JaKc
-----END PGP SIGNATURE-----

--------------y3dBXyNOFtXF6PTBN3ER5sK4--


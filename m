Return-Path: <linux-i2c+bounces-398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1F17F59E6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE4728162E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 08:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D450A19465;
	Thu, 23 Nov 2023 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xCx90a5f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dm6GOsow"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EE5B9;
	Thu, 23 Nov 2023 00:19:29 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04E9921993;
	Thu, 23 Nov 2023 08:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700727567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yfz53qGJaqCRkEOpNiJ2l1yOpIIkdL4CZoX2rwV2wPs=;
	b=xCx90a5f1XFaUqaPC6b+edDwGQRXAPeE09UgwABW8LBqLtTB5LA4ePe2i1Fcgdbe8+RWGG
	30+w/kth/5fm08rMlWkd4EBsSy2NQ5Z1Z0XWgAY5G7wzdgam9KRd3mxp0LpDjJNYU0N7fI
	G6eFg+0sPfjSmbaEHX45CQ60bB9WNMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700727567;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yfz53qGJaqCRkEOpNiJ2l1yOpIIkdL4CZoX2rwV2wPs=;
	b=dm6GOsowuMlP8UEOjllgilHakkhm5V3fEv/UeqGKp6h7NDU8Qapm+xKuk7N8P9C98vX9DJ
	/r2CcA9kwswKbADQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75F9A132B3;
	Thu, 23 Nov 2023 08:19:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9f3IGw4LX2W+egAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Nov 2023 08:19:26 +0000
Message-ID: <c4c0a79d-4e0a-41c1-89b9-8df71ae6335c@suse.de>
Date: Thu, 23 Nov 2023 09:19:25 +0100
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
Cc: linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
 <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
 <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>
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
In-Reply-To: <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7IsfKphfXMllv4Z00UQTooWJ"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.09
X-Spamd-Result: default: False [-1.09 / 50.00];
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
	 NEURAL_SPAM_SHORT(3.00)[0.999];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 RCPT_COUNT_TWELVE(0.00)[24];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kwiboo.se,ideasonboard.com,lists.freedesktop.org,lists.infradead.org,redhat.com,lists.linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7IsfKphfXMllv4Z00UQTooWJ
Content-Type: multipart/mixed; boundary="------------H17xtdcpgvAxovD0KStgqcoW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Message-ID: <c4c0a79d-4e0a-41c1-89b9-8df71ae6335c@suse.de>
Subject: Re: [PATCH v4 00/20] remove I2C_CLASS_DDC support
References: <20231120214624.9378-1-hkallweit1@gmail.com>
 <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
 <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>
In-Reply-To: <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>

--------------H17xtdcpgvAxovD0KStgqcoW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMTEuMjMgdW0gMDg6MTYgc2NocmllYiBIZWluZXIgS2FsbHdlaXQ6DQo+
IE9uIDIzLjExLjIwMjMgMDc6NTYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkN
Cj4+DQo+PiBBbSAyMC4xMS4yMyB1bSAyMjo0NiBzY2hyaWViIEhlaW5lciBLYWxsd2VpdDoN
Cj4+PiBBZnRlciByZW1vdmFsIG9mIHRoZSBsZWdhY3kgRUVQUk9NIGRyaXZlciBhbmQgSTJD
X0NMQVNTX0REQyBzdXBwb3J0IGluDQo+Pj4gb2xwY19kY29uIHRoZXJlJ3Mgbm8gaTJjIGNs
aWVudCBkcml2ZXIgbGVmdCBzdXBwb3J0aW5nIEkyQ19DTEFTU19EREMuDQo+Pj4gQ2xhc3Mt
YmFzZWQgZGV2aWNlIGF1dG8tZGV0ZWN0aW9uIGlzIGEgbGVnYWN5IG1lY2hhbmlzbSBhbmQg
c2hvdWxkbid0DQo+Pj4gYmUgdXNlZCBpbiBuZXcgY29kZS4gU28gd2UgY2FuIHJlbW92ZSB0
aGlzIGNsYXNzIGNvbXBsZXRlbHkgbm93Lg0KPj4+DQo+Pj4gUHJlZmVyYWJseSB0aGlzIHNl
cmllcyBzaG91bGQgYmUgYXBwbGllZCB2aWEgdGhlIGkyYyB0cmVlLg0KPj4+DQo+Pj4gdjI6
DQo+Pj4gLSBjaGFuZ2UgdGFnIGluIGNvbW1pdCBzdWJqZWN0IG9mIHBhdGNoIDAzDQo+Pj4g
LSBhZGQgYWNrIHRhZ3MNCj4+PiB2MzoNCj4+PiAtIGZpeCBhIGNvbXBpbGUgZXJyb3IgaW4g
cGF0Y2ggNQ0KPj4+IHY0Og0KPj4+IC0gbW9yZSBhY2sgYW5kIHJldmlldyB0YWdzDQo+Pj4N
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwu
Y29tPg0KPj4NCj4+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4+DQo+PiBmb3IgdGhlIHBhdGNoZXMgdGhhdCBkb24ndCBhbHJlYWR5IGhh
dmUgbXkgci1iLg0KPj4NCj4gVGhpcyByZWZlcnMgdG8gd2hpY2ggcGF0Y2hlcyBvZiB0aGUg
c2VyaWVzPw0KPiBQYXRjaGVzIDgsIDE2LCAxOCBhcmUgdGhlIHJlbWFpbmluZyBvbmVzIHcv
byBBLWIgb3IgUi1iLg0KDQpJJ3ZlIGxvb2tlZCB0aHJvdWdoIHRoZSBwYXRjaHNldC4gRmVl
bCBmcmVlIHRvIGFkZCBteSBhLWIgdG8gcGF0Y2hlcyAxIA0KdG8gMTk7IGV4Y2VwdCBmb3Ig
MiBhbmQgMTcsIHdoaWNoIGFscmVhZHkgaGF2ZSBteSByLWIuDQoNCkJUVyBJIG9ubHkgcmVj
ZWl2ZWQgMTkgcGF0Y2hlcy4gaXMgdGhlcmUgYSBwYXRjaCAyMC8yMD8NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPiBU
aGFua3MsIEhlaW5lcg0KPiANCj4+Pg0KPj4+IC0tLQ0KPj4+DQo+Pj4gIMKgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pMmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqAgMSAtDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMgfMKgwqDCoCAxIC0NCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqAgMSAtDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+ICDCoCBkcml2ZXJzL2dw
dS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oMKgIDEgLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmPCoMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL2Nkdl9pbnRlbF9kcC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAg
MSAtDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvaW50ZWxfZ21idXMuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaV9pMmMuY8KgwqDCoMKgwqDCoMKgIHzCoMKgwqAg
MSAtDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX3Nkdm8uY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2kyYy5jwqDCoCB8wqDCoMKgIDEgLQ0KPj4+
ICDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2dtYnVzLmPCoMKgwqDC
oMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Nkdm8uY8KgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+PiAgwqAg
ZHJpdmVycy9ncHUvZHJtL2xvb25nc29uL2xzZGNfaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaV9kZGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4g
IMKgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfaTJjLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL21zbS9o
ZG1pL2hkbWlfaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAt
DQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2kyYy5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEgLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvaW5ub19oZG1pLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oMKgIDEgLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcmszMDY2X2hkbWku
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+PiAgwqAgZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqAgMSAtDQo+Pj4gIMKgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZGMuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4gIMKgIGRy
aXZlcnMvdmlkZW8vZmJkZXYvY3liZXIyMDAwZmIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4gIMKgIGRyaXZlcnMvdmlkZW8vZmJkZXYvaTc0
MGZiLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDC
oCAxIC0NCj4+PiAgwqAgZHJpdmVycy92aWRlby9mYmRldi9pbnRlbGZiL2ludGVsZmJfaTJj
LmPCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDE1ICsrKysrLS0tLS0tLS0tLQ0KPj4+ICDCoCBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9pMmMtbWF0cm94ZmIuY8KgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMTIgKysrKy0tLS0tLS0tDQo+Pj4gIMKgIGRyaXZlcnMvdmlkZW8vZmJkZXYv
czNmYi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgIDEgLQ0KPj4+ICDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3RkZnhmYi5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSAtDQo+Pj4g
IMKgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdHJpZGVudGZiLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxIC0NCj4+PiAgwqAgZHJpdmVycy92aWRlby9m
YmRldi92aWEvdmlhX2kyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqDCoCAxIC0NCj4+PiAgwqAgaW5jbHVkZS9saW51eC9pMmMuaMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDEg
LQ0KPj4+ICDCoCAzMSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0
aW9ucygtKQ0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------H17xtdcpgvAxovD0KStgqcoW--

--------------7IsfKphfXMllv4Z00UQTooWJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVfCw4FAwAAAAAACgkQlh/E3EQov+Bi
IhAAhzWXGvuDBE1N+DL5raLhWDzomWtFH3PkcLQMMCih4OAi5odZg6bzTu2ObZAHnLX8lTQLJr2W
FbBYFZCY4X5aXJOxTdTY65Ru5UV9V4MIdfAzHVdVyLNbtQeB+aZ0ISiRKIgxcWegIt+7hcG0IDHx
XhHa7hvnx+MveUoupW1XZbA50KUw+7OP9HHG4J3O+vketeukPj3SO4HgwuDlTT4CBtNSZrjdFdGT
GrgtSoSXWzw4KygGPRMLC88W1y0140oU5GGen2t0dQtLkLsVasuW8leWB3LlLCwO08WXVohGMU7L
7R0BcKqoIBhQHp8UPgjT5n3Q57HZ7p0brWMnX/SGwByVeCPdlvG42cuHdWRiJt8XQif6IWgmEfZ/
kgaW/HUDtyBxQnRjoAae1C65ZvFkVM5qgxsWkWH1hBjXtY22B8nTQRP9hc3bK9KgSfKjRQQwOPpj
AjGuNfCDlZidEu0VGSeXdJzmT8qDkS+KvqPrKth2X66aKRF2K9SfVpo3oRo85m4wZDeZ67Qf2m+M
T27NhvHdeF+HYqp32D5tlZRFhHoqS/T/WZIDv3ZE/WxkV43hoBvCU42L/IFNdyzR92cTfrtTzNDH
7iD/VtgrH/7nJ+ynCrfqKOb6BFxe7zktIxutk1Zqfmj0RDnz+8sJFuM8bH3AkFIaYWSKbpvuQuP5
Zcw=
=oRgS
-----END PGP SIGNATURE-----

--------------7IsfKphfXMllv4Z00UQTooWJ--


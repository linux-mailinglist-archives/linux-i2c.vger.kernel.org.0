Return-Path: <linux-i2c+bounces-396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11E7F58B1
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 07:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 501CBB2102E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 06:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C089713AF4;
	Thu, 23 Nov 2023 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="khMJDMZ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwktbC3z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4587518E;
	Wed, 22 Nov 2023 22:57:01 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A972F2192D;
	Thu, 23 Nov 2023 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700722619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+cyotAqL8AduDM5+Y4Kh5EBMjuBXnBF9LgA0c07VSx8=;
	b=khMJDMZ73wZbWfp00ra0Z6efVYxQD/34+y1If9SLEjb3SE0lLgmaj3MW3iqWu2sGQxM852
	9iv7tId0W9hYPwGBcuhP9HOPS5W6oNg5GBvq7XNg5qIdp1rt3Om8nShqpS9BMYcf7A1iPs
	I4RyuUmt8fZ7ehsjoJnaXePercV9OFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700722619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+cyotAqL8AduDM5+Y4Kh5EBMjuBXnBF9LgA0c07VSx8=;
	b=IwktbC3zvGYGDcAPkvoq16OUkmjP98Yln46qE2evYjUeKg8wA3oZMCnNsBCDGUjBO6TWbi
	9gkNZHdNNFTUurBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32A74133B6;
	Thu, 23 Nov 2023 06:56:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /aJ2C7v3XmX5XAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 23 Nov 2023 06:56:59 +0000
Message-ID: <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
Date: Thu, 23 Nov 2023 07:56:58 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/20] remove I2C_CLASS_DDC support
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
Content-Language: en-US
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
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vifXtZ8GAwM1Zi9nNGG8Dq4u"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.79
X-Spamd-Result: default: False [-3.79 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[24];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kwiboo.se,ideasonboard.com,lists.freedesktop.org,lists.infradead.org,redhat.com,lists.linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vifXtZ8GAwM1Zi9nNGG8Dq4u
Content-Type: multipart/mixed; boundary="------------IiZwcTSMBVj1VO2fSGDyCS5o";
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
Message-ID: <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
Subject: Re: [PATCH v4 00/20] remove I2C_CLASS_DDC support
References: <20231120214624.9378-1-hkallweit1@gmail.com>
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>

--------------IiZwcTSMBVj1VO2fSGDyCS5o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTEuMjMgdW0gMjI6NDYgc2NocmllYiBIZWluZXIgS2FsbHdlaXQ6DQo+
IEFmdGVyIHJlbW92YWwgb2YgdGhlIGxlZ2FjeSBFRVBST00gZHJpdmVyIGFuZCBJMkNfQ0xB
U1NfRERDIHN1cHBvcnQgaW4NCj4gb2xwY19kY29uIHRoZXJlJ3Mgbm8gaTJjIGNsaWVudCBk
cml2ZXIgbGVmdCBzdXBwb3J0aW5nIEkyQ19DTEFTU19EREMuDQo+IENsYXNzLWJhc2VkIGRl
dmljZSBhdXRvLWRldGVjdGlvbiBpcyBhIGxlZ2FjeSBtZWNoYW5pc20gYW5kIHNob3VsZG4n
dA0KPiBiZSB1c2VkIGluIG5ldyBjb2RlLiBTbyB3ZSBjYW4gcmVtb3ZlIHRoaXMgY2xhc3Mg
Y29tcGxldGVseSBub3cuDQo+IA0KPiBQcmVmZXJhYmx5IHRoaXMgc2VyaWVzIHNob3VsZCBi
ZSBhcHBsaWVkIHZpYSB0aGUgaTJjIHRyZWUuDQo+IA0KPiB2MjoNCj4gLSBjaGFuZ2UgdGFn
IGluIGNvbW1pdCBzdWJqZWN0IG9mIHBhdGNoIDAzDQo+IC0gYWRkIGFjayB0YWdzDQo+IHYz
Og0KPiAtIGZpeCBhIGNvbXBpbGUgZXJyb3IgaW4gcGF0Y2ggNQ0KPiB2NDoNCj4gLSBtb3Jl
IGFjayBhbmQgcmV2aWV3IHRhZ3MNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KZm9yIHRoZSBwYXRjaGVzIHRoYXQgZG9u
J3QgYWxyZWFkeSBoYXZlIG15IHItYi4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gLS0tDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pMmMu
YyAgICAgICAgICAgfCAgICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgICAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfaTJjLmMgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jICAgICAgICAgfCAgICAxIC0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAgIHwg
ICAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3BvbG9n
eS5jICAgICB8ICAgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVs
X2RwLmMgICAgICAgICAgICAgfCAgICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L2ludGVsX2dtYnVzLmMgICAgICAgICAgICAgIHwgICAgMSAtDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pX2kyYy5jICAgICAgICB8ICAgIDEgLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX3Nkdm8uYyAgICAgICAgICAgfCAgICAx
IC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9pMmMu
YyAgIHwgICAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9n
bWJ1cy5jICAgICAgICB8ICAgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfc2R2by5jICAgICAgICAgfCAgICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
bG9vbmdzb24vbHNkY19pMmMuYyAgICAgICAgICAgICAgIHwgICAgMSAtDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2RkYy5jICAgICAgICAgICB8ICAgIDEgLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfaTJjLmMgICAgICAgICAgICAg
fCAgICAxIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9pMmMuYyAgICAg
ICAgICAgICAgIHwgICAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
aTJjLmMgICAgICAgICAgICAgICB8ICAgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9pbm5vX2hkbWkuYyAgICAgICAgICAgICAgfCAgICAxIC0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcmszMDY2X2hkbWkuYyAgICAgICAgICAgIHwgICAgMSAtDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfaTJjLmMgICAgICAgICAgICB8ICAg
IDEgLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZGMuYyAgICAgICAgICAg
ICAgICAgfCAgICAxIC0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMg
ICAgICAgICAgICAgICAgIHwgICAgMSAtDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9pNzQw
ZmIuYyAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQ0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvaW50ZWxmYi9pbnRlbGZiX2kyYy5jICAgICAgICAgfCAgIDE1ICsrKysrLS0tLS0t
LS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L2kyYy1tYXRyb3hmYi5jICAg
ICAgICAgfCAgIDEyICsrKystLS0tLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvczNm
Yi5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxIC0NCj4gICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L3RkZnhmYi5jICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAtDQo+ICAgZHJp
dmVycy92aWRlby9mYmRldi90cmlkZW50ZmIuYyAgICAgICAgICAgICAgICAgICB8ICAgIDEg
LQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYV9pMmMuYyAgICAgICAgICAgICAg
ICAgfCAgICAxIC0NCj4gICBpbmNsdWRlL2xpbnV4L2kyYy5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgMSAtDQo+ICAgMzEgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA0NyBkZWxldGlvbnMoLSkNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------IiZwcTSMBVj1VO2fSGDyCS5o--

--------------vifXtZ8GAwM1Zi9nNGG8Dq4u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVe97oFAwAAAAAACgkQlh/E3EQov+BL
pRAAofCcHzKlz7RbTPrrcEcKn9btAb4NPmvFo3wpV8ZrJ3GDqaCOYx1jnoYJqfjk6iFqXqHFEOr3
lmzuzL/jCzE6gA1fAlP0Uc0Fm9AwJoCYYQ9x81EGKKuQUMXkwnYYVMk1VtTdW3t2OcEQqFT1Mr1f
GNZIVtD5iwXyEWdFDtWHqEPIR3Mgqk2u5twaqkxYkQrp5W594ZJxRJqdSj3AQf6stCxwd8cqHyH+
m39bh2zMwVNC8LUQZNe+7UUB3uJUypHhtrexw07YRzHgvCo57c4i6YT69MzMarbREhxElAf5mPON
Rb46KLVyJaTH8KVgGISA8pCVXadJwdf5h9hmUXgwp9Z8mHn/z0oXOK2WtAelRdQvMx1nHnCG/MUd
bTpRzPI9SNEkTL6Q2r+ieDugUOWy5V3b+1RTd5lkzwvSbZZFfbYuIFpfY+h0UQdOQ8EvuKfibCMX
0/Tp/o5qF5AP6bR9JZmB4mrfom85fqTFZoJjaN6uOaXkdLr+KK4ZhxiUmIhhsYJwB1rd5+STruaO
6TbfOCLe+q69FMzuNn+95fb/iur0BMuV5ZKgpnOAaffivnGuztF9pGpKZLbT+so3OAy7LaoxiunE
9/GJEStgnV43QE84GnfkMDEsRKMGwFXfCJNWcVJG9pBrYiN8nA5SAb0rWJNCKLMPi4aZwc7bj9Mu
KaA=
=qc7l
-----END PGP SIGNATURE-----

--------------vifXtZ8GAwM1Zi9nNGG8Dq4u--


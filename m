Return-Path: <linux-i2c+bounces-304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E077F1224
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 12:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 792FE28264E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 11:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC0014F83;
	Mon, 20 Nov 2023 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mk7K+tOD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xiLzaE1B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D2F172B;
	Mon, 20 Nov 2023 03:34:48 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 425FE1F891;
	Mon, 20 Nov 2023 11:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700480087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5u2hf9u/fheIlD5C/+wh7AE8PQs/IetZ0l59tBeclCc=;
	b=mk7K+tOD0nb83iN5+UVXmnvokLdtXteuEvw759Kfi9mNHc9EnsVx5djlwEeiAd5booM2fx
	E5RL6R6yktdL9B8x2/ditCM3+SL7dF0ewwm1oTVMqqokTd9VIVkHQO0rPcFC9132PPGsrv
	YnCT3ZwXNHjNb+0Ga0/qNljREodVmPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700480087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5u2hf9u/fheIlD5C/+wh7AE8PQs/IetZ0l59tBeclCc=;
	b=xiLzaE1BH00oCndoTthUe23SROLoKDrl550aI8ZkxHgWjpKCPOcd/ZzlApUooQo1MCWf2H
	Dcljr507B0vgEtBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 122E813499;
	Mon, 20 Nov 2023 11:34:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dmaRA1dEW2WBOwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 20 Nov 2023 11:34:47 +0000
Message-ID: <505590b9-9458-4af1-b8c7-11980aa4e288@suse.de>
Date: Mon, 20 Nov 2023 12:34:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Dave Airlie <airlied@redhat.com>
Cc: linux-i2c@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231119101445.4737-1-hkallweit1@gmail.com>
 <20231119101445.4737-3-hkallweit1@gmail.com>
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
In-Reply-To: <20231119101445.4737-3-hkallweit1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s7IF5EGqdKBQA0bVZEBQB4E5"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.29
X-Spamd-Result: default: False [-5.29 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[gmail.com,kernel.org,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s7IF5EGqdKBQA0bVZEBQB4E5
Content-Type: multipart/mixed; boundary="------------x1Kjt2D34EBRTI9q2aYQ30it";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Dave Airlie <airlied@redhat.com>
Cc: linux-i2c@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <505590b9-9458-4af1-b8c7-11980aa4e288@suse.de>
Subject: Re: [PATCH v3 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
References: <20231119101445.4737-1-hkallweit1@gmail.com>
 <20231119101445.4737-3-hkallweit1@gmail.com>
In-Reply-To: <20231119101445.4737-3-hkallweit1@gmail.com>

--------------x1Kjt2D34EBRTI9q2aYQ30it
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjExLjIzIHVtIDExOjE0IHNjaHJpZWIgSGVpbmVyIEthbGx3ZWl0Og0KPiBB
ZnRlciByZW1vdmFsIG9mIHRoZSBsZWdhY3kgRUVQUk9NIGRyaXZlciBhbmQgSTJDX0NMQVNT
X0REQyBzdXBwb3J0IGluDQo+IG9scGNfZGNvbiB0aGVyZSdzIG5vIGkyYyBjbGllbnQgZHJp
dmVyIGxlZnQgc3VwcG9ydGluZyBJMkNfQ0xBU1NfRERDLg0KPiBDbGFzcy1iYXNlZCBkZXZp
Y2UgYXV0by1kZXRlY3Rpb24gaXMgYSBsZWdhY3kgbWVjaGFuaXNtIGFuZCBzaG91bGRuJ3QN
Cj4gYmUgdXNlZCBpbiBuZXcgY29kZS4gU28gd2UgY2FuIHJlbW92ZSB0aGlzIGNsYXNzIGNv
bXBsZXRlbHkgbm93Lg0KPiANCj4gUHJlZmVyYWJseSB0aGlzIHNlcmllcyBzaG91bGQgYmUg
YXBwbGllZCB2aWEgdGhlIGkyYyB0cmVlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGVpbmVy
IEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IA0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2kyYy5jIHwgICAgMSAtDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2kyYy5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9pMmMuYw0KPiBpbmRleCAwYzQ4YmRmM2UuLjQyM2ViMzAyYiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9pMmMuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2kyYy5jDQo+IEBAIC0xMDYsNyAr
MTA2LDYgQEAgaW50IG1nYWcyMDBfaTJjX2luaXQoc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYs
IHN0cnVjdCBtZ2FfaTJjX2NoYW4gKmkyYykNCj4gICAJaTJjLT5kYXRhID0gQklUKGluZm8t
PmkyYy5kYXRhX2JpdCk7DQo+ICAgCWkyYy0+Y2xvY2sgPSBCSVQoaW5mby0+aTJjLmNsb2Nr
X2JpdCk7DQo+ICAgCWkyYy0+YWRhcHRlci5vd25lciA9IFRISVNfTU9EVUxFOw0KPiAtCWky
Yy0+YWRhcHRlci5jbGFzcyA9IEkyQ19DTEFTU19EREM7DQo+ICAgCWkyYy0+YWRhcHRlci5k
ZXYucGFyZW50ID0gZGV2LT5kZXY7DQo+ICAgCWkyYy0+ZGV2ID0gZGV2Ow0KPiAgIAlpMmNf
c2V0X2FkYXBkYXRhKCZpMmMtPmFkYXB0ZXIsIGkyYyk7DQo+IA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5i
ZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0Rv
bmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------x1Kjt2D34EBRTI9q2aYQ30it--

--------------s7IF5EGqdKBQA0bVZEBQB4E5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVbRFYFAwAAAAAACgkQlh/E3EQov+Do
lxAAmL2PYuMwAQ/352gCCOCddccNm/vHMCkXUv9WJ7mGQmzDlBL7c7Qr5gPA87f1E/nDuDZATRtZ
XNeO4FIFXtSnSCRoNRzyq2QtE+f7EYNPB3JkMyUKwbBMF5vyDm7qWNXcr+7jeBKPqf5FvJaEYcEc
sETHnMUBvNulxBwbvyClW/DrJ0a2qBVDm9m844mwIxcpJv/Qf+CKl+nOLuBLUUetcVLwxoghdgkE
jR/k96ZMfbR4eTe6vp3S8y41JhPUH+Jc+ixHfQG1nAI4yHIlISZI4ejBrW8i1+ys2y/IHxtcs9YP
AJ6KB/QOeYibaY9GZ7Y7fVxbKU2OzVeidbtaS91hK0zNmPqZfDmJdA55B0pcuWNfYBY2L1fSsku9
4n/RePNyN39wYfyo5jtCH3epzdW4/EXBNxm1YRxQ6Vn/YKAF0Tthd6fpaXJu2SjTGoAPZRFF8A5Q
4j4UAgelmgvlJekY04/sG0FY08iZNnzyGt6V7/SD6JYvAIuM+aud1GtJeZ1R187W2YNh0tuVx9Ow
2HRCbvP2VlRoEV0r51j3GlsYbpVVNxlKJVv08wk6Zj6k05zdGSsj2q+2krK8vT2x9gdNBq4nsjGO
tvQASuitCkyT48yz31k4wz+66Gww1j8jnDgZNiKyxfYAGP/d/crJm7E4YTUzsx0XmmugRMxH/Gzs
53A=
=ai4n
-----END PGP SIGNATURE-----

--------------s7IF5EGqdKBQA0bVZEBQB4E5--


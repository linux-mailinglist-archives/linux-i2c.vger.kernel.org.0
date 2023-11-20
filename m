Return-Path: <linux-i2c+bounces-305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B387F122D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 12:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC17281723
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 11:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE7614AB0;
	Mon, 20 Nov 2023 11:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q5Pudbcp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SBqRNCeH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB7FD78;
	Mon, 20 Nov 2023 03:35:47 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E131A2190C;
	Mon, 20 Nov 2023 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700480145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q+c9KCNCk4phwSWIGOwpqJ0qmONW0iqFNOW1khLxYWo=;
	b=Q5PudbcpHQnR0Ab89sx0fg4bnjxusH+EGdvIFrTdsyIUfJxwtlxvN7NqD/S8/eiSUOrYO/
	xLK7Uuj+COiLTLHXEieSoBKvA7KqsawICQ+rCfEoiu2yjwIs266/u5P3H+LUnFaaRfFVfA
	W1/XgJ2rCq6KSKWPwP/UB5pzsRynBl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700480145;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q+c9KCNCk4phwSWIGOwpqJ0qmONW0iqFNOW1khLxYWo=;
	b=SBqRNCeH2FLdjUc4Pu04z7Bl6gHvZrz8VEd98mv5TpRNymFVQ2hDnom2OeYPr1+NtBMMMw
	ZX0Xw7uvj9GEM8Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA95913499;
	Mon, 20 Nov 2023 11:35:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4Hm/J5FEW2WBOwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 20 Nov 2023 11:35:45 +0000
Message-ID: <950888cc-9d7e-4253-8821-e843ef32b6ec@suse.de>
Date: Mon, 20 Nov 2023 12:35:45 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove
 I2C_CLASS_DDC support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org
References: <20231119101445.4737-1-hkallweit1@gmail.com>
 <20231119101445.4737-18-hkallweit1@gmail.com>
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
In-Reply-To: <20231119101445.4737-18-hkallweit1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Dal7yWifu1tGxRxXL2MVTv81"
Authentication-Results: smtp-out1.suse.de;
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
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[gmail.com,kernel.org,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Dal7yWifu1tGxRxXL2MVTv81
Content-Type: multipart/mixed; boundary="------------n2jKO0zPuEt2E7ncKRUIRjS0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org
Message-ID: <950888cc-9d7e-4253-8821-e843ef32b6ec@suse.de>
Subject: Re: [PATCH v3 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove
 I2C_CLASS_DDC support
References: <20231119101445.4737-1-hkallweit1@gmail.com>
 <20231119101445.4737-18-hkallweit1@gmail.com>
In-Reply-To: <20231119101445.4737-18-hkallweit1@gmail.com>

--------------n2jKO0zPuEt2E7ncKRUIRjS0
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
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9pMmMuYyB8ICAgIDEgLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9pMmMuYw0KPiBpbmRl
eCAwZTg0NWU3YWMuLmU1ZDNmNzEyMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfaTJjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfaTJjLmMN
Cj4gQEAgLTEyMCw3ICsxMjAsNiBAQCBzdHJ1Y3QgYXN0X2kyY19jaGFuICphc3RfaTJjX2Ny
ZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAkJcmV0dXJuIE5VTEw7DQo+ICAg
DQo+ICAgCWkyYy0+YWRhcHRlci5vd25lciA9IFRISVNfTU9EVUxFOw0KPiAtCWkyYy0+YWRh
cHRlci5jbGFzcyA9IEkyQ19DTEFTU19EREM7DQo+ICAgCWkyYy0+YWRhcHRlci5kZXYucGFy
ZW50ID0gZGV2LT5kZXY7DQo+ICAgCWkyYy0+ZGV2ID0gZGV2Ow0KPiAgIAlpMmNfc2V0X2Fk
YXBkYXRhKCZpMmMtPmFkYXB0ZXIsIGkyYyk7DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------n2jKO0zPuEt2E7ncKRUIRjS0--

--------------Dal7yWifu1tGxRxXL2MVTv81
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVbRJEFAwAAAAAACgkQlh/E3EQov+C/
hQ//VOrLXUUM9ZeD3F9PjPkmpsTVaJhhcUOTYPEP8ayHEpGBRDNYDr38R7U3X7TZtJDCp4bWxHFl
EHJmbD/35LyujEwhUQWTR+Zg/BfhWa+GMf4ymI60kgxM505JGDUcllXuu7Zo3qPY2+BvXFm6wdHm
EJz8+jCCxVKsLhN09Mn678OaNfJiRPc/LtA3NKBuELJDjyNJCVypUI2i0YgUAs5Fxm6eozjfaqCi
sJszxsPDtUuApMwJ1BE7AjapowSjFTfaGqzFo2WOoq8VqsXaU5oMI9ZEn2VBgRI2MEgyOqyyiwWq
pj/fxOfqSRnwC1NvWDA2AsSzGR6hrqnDchDo2WCPSbqREpk2kUDthVzBoivLe6RZ2XKU7cpYPtwH
v6BRQBVlMi87IR1JpRDolBwC6mtUQWJfB5phOkqVnY4y2P4lfG9pLNQyAkFIZwioSqYs2RTvIKHL
z1+WhFH3hJB+1SQXyK46ApxH15aBNrAiHZfSj55krYzfQaYmSheAJLpH5u21bX1+58AzUQLBeGno
Ok5esc/Bu/CBPECr5I4yI8DvUs0ZCT0kTQzl38f7rXDwJOx5XemqcjRRB5pyD8Z3bryZdEZg5Z53
bT4IKm6+zA/JCAnHq3l/9+2eO4VeDc0lNKaHNYhKMFlBdfTzQ9P1IgyQFuOhBaRna7wk6/tQWrVo
zfo=
=zJQi
-----END PGP SIGNATURE-----

--------------Dal7yWifu1tGxRxXL2MVTv81--


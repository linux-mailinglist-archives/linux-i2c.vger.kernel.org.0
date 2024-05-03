Return-Path: <linux-i2c+bounces-3385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C04A8BA7F4
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 09:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 414B128234F
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 07:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B4D147C60;
	Fri,  3 May 2024 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l1WAHkFt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WugzJKS8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z+pKQcos";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b1FkdEyV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14331474AB;
	Fri,  3 May 2024 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714721979; cv=none; b=pQz1hGCQXS2f6LsijHEq74e4k02q4D9Z5RwdqvjtRvA/mBliP7ldZZDLRBDt12+nWXI/HHS32cS9Uaz+Rq2xyvSIc2Bv+r/iIMTwxRRjrn/ORODnsuo9Z3aXkC/Y9lnawFDnwBFdBeELHX+g48j2242pkjqrNTgk7AFQmzkfHt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714721979; c=relaxed/simple;
	bh=GQBew1/qJlvNTkgxM4kDUOeCxcM8UIukTDBqToT6Fbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIpQWAVJaHF/SqI6fWkeF0HJ5wl38VVZ6O9v2iZwagtpMuU4pp2gr4YCGqXP5EJn1p00XkuJZz7CEYYH3t9GlZ7+lHvAY2G4VDabAwSwvy/5Y9D/vovMzz4l+OOnmpxK3RCzvAtxO8Yd49WIaMj4PKK2qEBn5tlJaekGpzYAgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l1WAHkFt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WugzJKS8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z+pKQcos; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b1FkdEyV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC3D122B72;
	Fri,  3 May 2024 07:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714721976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zC4n5/KOp6vqeKDwDsLw1bD+2gPkRxe5hP009QMQGPI=;
	b=l1WAHkFtzff0Oi1c7MksftylSip13XAhH4VQNnKW4CvonoMIP/x3yN6AtWOvWRj5kToJVL
	QMjyx8ywHcelra0n4bmMrNXUh+wDpOKCFr+Ef9bZocseOaXQxd+3Fh6zsUr6vXZ/rYzA/a
	6sgt2qWdKSYnSLm/hptwGXKwJwoFzzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714721976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zC4n5/KOp6vqeKDwDsLw1bD+2gPkRxe5hP009QMQGPI=;
	b=WugzJKS82ovy1MgZm3UqVt3p4qhDofDMmmRaTt8k18I0ecI+Ths+TIRQQxqjgstOSgaqTn
	G0FlmF4AuVIiXoDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z+pKQcos;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b1FkdEyV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714721975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zC4n5/KOp6vqeKDwDsLw1bD+2gPkRxe5hP009QMQGPI=;
	b=z+pKQcos0Tld6Da6Fm8P+48qV7IvUHlNuLUJRwhN8nZSApr7JXhJeCaf1XKIUTONmvrfHy
	LV3bse4K9zcE0VA7gI3S8rv6BRsqTNXkeDb3T7Y9JtQxjb+8ww7Vlb6fBMYzAjsLibPWFI
	6fv0TZzYKGmB7yJbLjEa7mH0yYNa1EE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714721975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zC4n5/KOp6vqeKDwDsLw1bD+2gPkRxe5hP009QMQGPI=;
	b=b1FkdEyVIqEA9KzBsgkLfnGrLxatk7E0y0n/8TwK/h1copLY7D18TuZkj2fEpOD0aRpinu
	SRPPz36nEQT8fwDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 977A3139CB;
	Fri,  3 May 2024 07:39:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U2nQI7eUNGbqCwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 03 May 2024 07:39:35 +0000
Message-ID: <f1eccd9d-885f-4508-9325-3454ecc35eae@suse.de>
Date: Fri, 3 May 2024 09:39:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/12] fbdev/viafb: Make I2C terminology more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>,
 "open list:VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER"
 <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-13-eahariha@linux.microsoft.com>
 <271ad513-0ea1-45df-ba0f-51582474ff34@suse.de>
 <076e0a0d-ad26-490e-9784-300ed52637ca@linux.microsoft.com>
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
In-Reply-To: <076e0a0d-ad26-490e-9784-300ed52637ca@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -5.00
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EC3D122B72
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[linux.microsoft.com,gmx.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]

Hi

Am 03.05.24 um 00:26 schrieb Easwar Hariharan:
> On 5/2/2024 3:46 AM, Thomas Zimmermann wrote:
>>
>> Am 30.04.24 um 19:38 schrieb Easwar Hariharan:
>>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>> in the specification.
>>>
>>> Compile tested, no functionality changes intended
>>>
>>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
> Thanks for the ack! I had been addressing feedback as I got it on the v0 series, and it seems
> I missed out on updating viafb and smscufx to spec-compliant controller/target terminology like
> the v0->v1 changelog calls out before posting v1.
>
> For smscufx, I feel phrasing the following line (as an example)
>
>> -/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, host,
>> +/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, *controller*,
> would actually impact readability negatively, so I propose to leave smscufx as is.

Why? I don't see much of a difference.

>
> For viafb, I propose making it compliant with the spec using the controller/target terminology and
> posting a v2 respin (which I can send out as soon as you say) and ask you to review again.
>
> What do you think?

I think we should adopt the spec's language everywhere. That makes it 
possible to grep the spec for terms used in the source code. Using 
'host' in smscufx appears to introduce yet another term. If you are 
worried about using 'I2C controller' and 'controller' in the same 
sentence, you can replace 'I2C controller' with 'DDC channel'. That's 
even more precise about the purpose of this code.

Best regards
Thomas

>
> Thanks,
> Easwar
>
>>> ---
>>>    drivers/video/fbdev/via/chip.h    |  8 ++++----
>>>    drivers/video/fbdev/via/dvi.c     | 24 ++++++++++++------------
>>>    drivers/video/fbdev/via/lcd.c     |  6 +++---
>>>    drivers/video/fbdev/via/via_aux.h |  2 +-
>>>    drivers/video/fbdev/via/via_i2c.c | 12 ++++++------
>>>    drivers/video/fbdev/via/vt1636.c  |  6 +++---
>>>    6 files changed, 29 insertions(+), 29 deletions(-)
>>>
> <snip>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)



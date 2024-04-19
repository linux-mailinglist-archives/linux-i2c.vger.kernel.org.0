Return-Path: <linux-i2c+bounces-3018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0848AA8AA
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 08:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 722C4B211C8
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 06:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768B13A1CF;
	Fri, 19 Apr 2024 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fYvXcuot";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7MnY3JeX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xBh5XTI9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="skic3Cdu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38579F9;
	Fri, 19 Apr 2024 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713509539; cv=none; b=a9ZjzDx0/4qI+cQC+juHf8zQuU3Jepb2V3eN8hdHgnmItbbO9Dm6JQjKmwQE3AWABhcF3gRun75n+/s5c79EoW0oD3LBRmOaQXrufzpC4vPwkcp5ZWNkEqsi4+iVMFVVxvdjotB7HPGBHupC+7Y8Yy+qCvDBoIWmLWYj+4J2uE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713509539; c=relaxed/simple;
	bh=J79LhEZDbBpISMnNXeIMSVBZGpOCsMzs1aqtNkX+JMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNf7k5O6k6SIiJ8O9YNiw5UrrDy0un5qAirH9Qqb+n+b0Loa7IBDwrApA3HYQFE1EvQSWKqRe8fluATRissihlU1GdrX1dHbEzvos3277EvIKNJKfQwuposC0ZH44yDKRVPKPFIDhDrY7LAyxkBUnNHF9vSgTPHH8jYsfMxm8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fYvXcuot; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7MnY3JeX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xBh5XTI9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=skic3Cdu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B84CD5D3A8;
	Fri, 19 Apr 2024 06:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713509535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z3AxDDuKx8qAq8AZ3IZYHMj6ePlNdOTSKwYN3eDVzj4=;
	b=fYvXcuotMlcmVslGqNyObuUIrc3o8X+dOL//rmCJw3FU6dvs1Da+uUqvb5S/I1xn0mk1aV
	BQtBX4+14NVt9iFdQFirk7oAZ4ie84i5laSnBUK1yaJ8y2Y4H3MZpUuHt7s5gXfMHRonWq
	deimmtxCueWaZCwaJ+JaEhcpQ2ZNMYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713509535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z3AxDDuKx8qAq8AZ3IZYHMj6ePlNdOTSKwYN3eDVzj4=;
	b=7MnY3JeXyc5DtmhIh3e/1dK36vsPM1LFkH6lgXN/wtg41/By+/aud66zjrPnCk3c3W0d6Y
	uALGuM7fi/U1YxBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xBh5XTI9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=skic3Cdu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713509534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z3AxDDuKx8qAq8AZ3IZYHMj6ePlNdOTSKwYN3eDVzj4=;
	b=xBh5XTI9DV0iuJExENNdWZojZwqPCgAYyEXfjuo4xe6pitVGBbsSyQzgYdC4O6BPosleLu
	S60TwsSaWvroQHg7nsd5ECKSA3+x6TmbM783RRUNn/Rgo/OsWfym+aYGnvSB4tyWYYn+0D
	IcK3y1hiDGIVEVVhuwD/il3jW9lEIsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713509534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z3AxDDuKx8qAq8AZ3IZYHMj6ePlNdOTSKwYN3eDVzj4=;
	b=skic3CduWO2ZuG6Jc+A9KG1lTbTcN4UIo88I0Cz2kC+Sa0v2ZFj54d12zXCVO3pS1hpg5+
	Yw6RF7fCOMndWrAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E30E213687;
	Fri, 19 Apr 2024 06:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1vS3NZ0UImZtSAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 06:52:13 +0000
Message-ID: <e116852f-01f1-4ff9-b29e-7a85a6e0fa17@suse.de>
Date: Fri, 19 Apr 2024 08:52:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mux: Remove class argument from
 i2c_mux_add_adapter()
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>,
 Peter Rosin <peda@axentia.se>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Vadim Pasternak <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij
 <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
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
In-Reply-To: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B84CD5D3A8
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,linux.intel.com,ffwll.ch,axentia.se,barco.com,analog.com,nvidia.com,roeck-us.net,metafoo.de,jmondi.org,ragnatech.se,google.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLexbg5ggu13b35eszbfyrtkqf)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]

Hi

Am 18.04.24 um 22:55 schrieb Heiner Kallweit:
> 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
> instantiation") removed the last call to i2c_mux_add_adapter() with a
> non-null class argument. Therefore the class argument can be removed.
>
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/gpu/drm/bridge/sii902x.c           |  2 +-

For the DRM file:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>   drivers/i2c/i2c-mux.c                      | 24 +---------------------
>   drivers/i2c/muxes/i2c-arb-gpio-challenge.c |  2 +-
>   drivers/i2c/muxes/i2c-mux-gpio.c           |  2 +-
>   drivers/i2c/muxes/i2c-mux-gpmux.c          |  2 +-
>   drivers/i2c/muxes/i2c-mux-ltc4306.c        |  2 +-
>   drivers/i2c/muxes/i2c-mux-mlxcpld.c        |  2 +-
>   drivers/i2c/muxes/i2c-mux-pca9541.c        |  2 +-
>   drivers/i2c/muxes/i2c-mux-pca954x.c        |  2 +-
>   drivers/i2c/muxes/i2c-mux-pinctrl.c        |  2 +-
>   drivers/i2c/muxes/i2c-mux-reg.c            |  2 +-
>   drivers/iio/gyro/mpu3050-i2c.c             |  2 +-
>   drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c  |  2 +-
>   drivers/media/dvb-frontends/af9013.c       |  2 +-
>   drivers/media/dvb-frontends/lgdt3306a.c    |  2 +-
>   drivers/media/dvb-frontends/m88ds3103.c    |  2 +-
>   drivers/media/dvb-frontends/rtl2830.c      |  2 +-
>   drivers/media/dvb-frontends/rtl2832.c      |  2 +-
>   drivers/media/dvb-frontends/si2168.c       |  2 +-
>   drivers/media/i2c/max9286.c                |  2 +-
>   drivers/media/usb/cx231xx/cx231xx-i2c.c    |  5 +----
>   drivers/of/unittest.c                      |  2 +-
>   include/linux/i2c-mux.h                    |  3 +--
>   23 files changed, 23 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 8f84e9824..2fbeda902 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1092,7 +1092,7 @@ static int sii902x_init(struct sii902x *sii902x)
>   	}
>   
>   	sii902x->i2cmux->priv = sii902x;
> -	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(sii902x->i2cmux, 0, 0);
>   	if (ret)
>   		goto err_unreg_audio;
>   
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 57ff09f18..fda72e8be 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -127,19 +127,6 @@ static u32 i2c_mux_functionality(struct i2c_adapter *adap)
>   	return parent->algo->functionality(parent);
>   }
>   
> -/* Return all parent classes, merged */
> -static unsigned int i2c_mux_parent_classes(struct i2c_adapter *parent)
> -{
> -	unsigned int class = 0;
> -
> -	do {
> -		class |= parent->class;
> -		parent = i2c_parent_is_i2c_adapter(parent);
> -	} while (parent);
> -
> -	return class;
> -}
> -
>   static void i2c_mux_lock_bus(struct i2c_adapter *adapter, unsigned int flags)
>   {
>   	struct i2c_mux_priv *priv = adapter->algo_data;
> @@ -281,8 +268,7 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
>   };
>   
>   int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
> -			u32 force_nr, u32 chan_id,
> -			unsigned int class)
> +			u32 force_nr, u32 chan_id)
>   {
>   	struct i2c_adapter *parent = muxc->parent;
>   	struct i2c_mux_priv *priv;
> @@ -340,14 +326,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>   	else
>   		priv->adap.lock_ops = &i2c_parent_lock_ops;
>   
> -	/* Sanity check on class */
> -	if (i2c_mux_parent_classes(parent) & class & ~I2C_CLASS_DEPRECATED)
> -		dev_err(&parent->dev,
> -			"Segment %d behind mux can't share classes with ancestors\n",
> -			chan_id);
> -	else
> -		priv->adap.class = class;
> -
>   	/*
>   	 * Try to populate the mux adapter's of_node, expands to
>   	 * nothing if !CONFIG_OF.
> diff --git a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> index 24168e9f7..7aa6e795d 100644
> --- a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> +++ b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
> @@ -167,7 +167,7 @@ static int i2c_arbitrator_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Actually add the mux adapter */
> -	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(muxc, 0, 0);
>   	if (ret)
>   		i2c_put_adapter(muxc->parent);
>   
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 0fbb33a3d..d6bbb8b68 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -207,7 +207,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>   	for (i = 0; i < mux->data.n_values; i++) {
>   		u32 nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
>   
> -		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
> +		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i]);
>   		if (ret)
>   			goto add_adapter_failed;
>   	}
> diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
> index 8305661e1..10d63307b 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpmux.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
> @@ -124,7 +124,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
>   			goto err_children;
>   		}
>   
> -		ret = i2c_mux_add_adapter(muxc, 0, chan, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, chan);
>   		if (ret)
>   			goto err_children;
>   	}
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> index 23766d853..19a7c3709 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -279,7 +279,7 @@ static int ltc4306_probe(struct i2c_client *client)
>   
>   	/* Now create an adapter for each channel */
>   	for (num = 0; num < chip->nchans; num++) {
> -		ret = i2c_mux_add_adapter(muxc, 0, num, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, num);
>   		if (ret) {
>   			i2c_mux_del_adapters(muxc);
>   			return ret;
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index 4c6ed1d58..3f06aa333 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -154,7 +154,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>   
>   	/* Create an adapter for each channel. */
>   	for (num = 0; num < pdata->num_adaps; num++) {
> -		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
> +		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num]);
>   		if (err)
>   			goto virt_reg_failed;
>   	}
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index ce0fb6924..e28694d99 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -314,7 +314,7 @@ static int pca9541_probe(struct i2c_client *client)
>   
>   	i2c_set_clientdata(client, muxc);
>   
> -	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(muxc, 0, 0);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index c3f4ff08a..6f8401825 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -644,7 +644,7 @@ static int pca954x_probe(struct i2c_client *client)
>   
>   	/* Now create an adapter for each channel */
>   	for (num = 0; num < data->chip->nchans; num++) {
> -		ret = i2c_mux_add_adapter(muxc, 0, num, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, num);
>   		if (ret)
>   			goto fail_cleanup;
>   	}
> diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> index 6ebca7bfd..02aaf0781 100644
> --- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> @@ -151,7 +151,7 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
>   
>   	/* Do not add any adapter for the idle state (if it's there at all). */
>   	for (i = 0; i < num_names - !!muxc->deselect; i++) {
> -		ret = i2c_mux_add_adapter(muxc, 0, i, 0);
> +		ret = i2c_mux_add_adapter(muxc, 0, i);
>   		if (ret)
>   			goto err_del_adapter;
>   	}
> diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
> index 8489971ba..ef765fcd3 100644
> --- a/drivers/i2c/muxes/i2c-mux-reg.c
> +++ b/drivers/i2c/muxes/i2c-mux-reg.c
> @@ -213,7 +213,7 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
>   	for (i = 0; i < mux->data.n_values; i++) {
>   		nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
>   
> -		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
> +		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i]);
>   		if (ret)
>   			goto err_del_mux_adapters;
>   	}
> diff --git a/drivers/iio/gyro/mpu3050-i2c.c b/drivers/iio/gyro/mpu3050-i2c.c
> index 52b6feed2..29ecfa6fd 100644
> --- a/drivers/iio/gyro/mpu3050-i2c.c
> +++ b/drivers/iio/gyro/mpu3050-i2c.c
> @@ -72,7 +72,7 @@ static int mpu3050_i2c_probe(struct i2c_client *client)
>   	else {
>   		mpu3050->i2cmux->priv = mpu3050;
>   		/* Ignore failure, not critical */
> -		i2c_mux_add_adapter(mpu3050->i2cmux, 0, 0, 0);
> +		i2c_mux_add_adapter(mpu3050->i2cmux, 0, 0);
>   	}
>   
>   	return 0;
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> index 410ea39fd..0e03137fb 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> @@ -142,7 +142,7 @@ static int inv_mpu_probe(struct i2c_client *client)
>   		if (!st->muxc)
>   			return -ENOMEM;
>   		st->muxc->priv = dev_get_drvdata(&client->dev);
> -		result = i2c_mux_add_adapter(st->muxc, 0, 0, 0);
> +		result = i2c_mux_add_adapter(st->muxc, 0, 0);
>   		if (result)
>   			return result;
>   		result = inv_mpu_acpi_create_mux_client(client);
> diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-frontends/af9013.c
> index a829c8979..5afdbe244 100644
> --- a/drivers/media/dvb-frontends/af9013.c
> +++ b/drivers/media/dvb-frontends/af9013.c
> @@ -1480,7 +1480,7 @@ static int af9013_probe(struct i2c_client *client)
>   		goto err_regmap_exit;
>   	}
>   	state->muxc->priv = state;
> -	ret = i2c_mux_add_adapter(state->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(state->muxc, 0, 0);
>   	if (ret)
>   		goto err_regmap_exit;
>   
> diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
> index 263887592..91c71b24c 100644
> --- a/drivers/media/dvb-frontends/lgdt3306a.c
> +++ b/drivers/media/dvb-frontends/lgdt3306a.c
> @@ -2203,7 +2203,7 @@ static int lgdt3306a_probe(struct i2c_client *client)
>   		goto err_kfree;
>   	}
>   	state->muxc->priv = client;
> -	ret = i2c_mux_add_adapter(state->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(state->muxc, 0, 0);
>   	if (ret)
>   		goto err_kfree;
>   
> diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
> index e0272054f..6c69bcc7a 100644
> --- a/drivers/media/dvb-frontends/m88ds3103.c
> +++ b/drivers/media/dvb-frontends/m88ds3103.c
> @@ -1866,7 +1866,7 @@ static int m88ds3103_probe(struct i2c_client *client)
>   		goto err_kfree;
>   	}
>   	dev->muxc->priv = dev;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>   	if (ret)
>   		goto err_kfree;
>   
> diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
> index 35c969fd2..30d10fe4b 100644
> --- a/drivers/media/dvb-frontends/rtl2830.c
> +++ b/drivers/media/dvb-frontends/rtl2830.c
> @@ -838,7 +838,7 @@ static int rtl2830_probe(struct i2c_client *client)
>   		goto err_regmap_exit;
>   	}
>   	dev->muxc->priv = client;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>   	if (ret)
>   		goto err_regmap_exit;
>   
> diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
> index 601cf45c3..5142820b1 100644
> --- a/drivers/media/dvb-frontends/rtl2832.c
> +++ b/drivers/media/dvb-frontends/rtl2832.c
> @@ -1082,7 +1082,7 @@ static int rtl2832_probe(struct i2c_client *client)
>   		goto err_regmap_exit;
>   	}
>   	dev->muxc->priv = dev;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>   	if (ret)
>   		goto err_regmap_exit;
>   
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
> index dae1f2153..26828fd41 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -744,7 +744,7 @@ static int si2168_probe(struct i2c_client *client)
>   		goto err_kfree;
>   	}
>   	dev->muxc->priv = client;
> -	ret = i2c_mux_add_adapter(dev->muxc, 0, 0, 0);
> +	ret = i2c_mux_add_adapter(dev->muxc, 0, 0);
>   	if (ret)
>   		goto err_kfree;
>   
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index d685d445c..dfcb3fc03 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -383,7 +383,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
>   	for_each_source(priv, source) {
>   		unsigned int index = to_index(priv, source);
>   
> -		ret = i2c_mux_add_adapter(priv->mux, 0, index, 0);
> +		ret = i2c_mux_add_adapter(priv->mux, 0, index);
>   		if (ret < 0)
>   			goto error;
>   	}
> diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
> index c6659253c..6da8e7943 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
> @@ -567,10 +567,7 @@ int cx231xx_i2c_mux_create(struct cx231xx *dev)
>   
>   int cx231xx_i2c_mux_register(struct cx231xx *dev, int mux_no)
>   {
> -	return i2c_mux_add_adapter(dev->muxc,
> -				   0,
> -				   mux_no /* chan_id */,
> -				   0 /* class */);
> +	return i2c_mux_add_adapter(dev->muxc, 0, mux_no);
>   }
>   
>   void cx231xx_i2c_mux_unregister(struct cx231xx *dev)
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 6b5c36b6a..c8ee866d7 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2815,7 +2815,7 @@ static int unittest_i2c_mux_probe(struct i2c_client *client)
>   	if (!muxc)
>   		return -ENOMEM;
>   	for (i = 0; i < nchans; i++) {
> -		if (i2c_mux_add_adapter(muxc, 0, i, 0)) {
> +		if (i2c_mux_add_adapter(muxc, 0, i)) {
>   			dev_err(dev, "Failed to register mux #%d\n", i);
>   			i2c_mux_del_adapters(muxc);
>   			return -ENODEV;
> diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
> index 98ef73b7c..1784ac7af 100644
> --- a/include/linux/i2c-mux.h
> +++ b/include/linux/i2c-mux.h
> @@ -56,8 +56,7 @@ struct i2c_adapter *i2c_root_adapter(struct device *dev);
>    * callback functions to perform hardware-specific mux control.
>    */
>   int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
> -			u32 force_nr, u32 chan_id,
> -			unsigned int class);
> +			u32 force_nr, u32 chan_id);
>   
>   void i2c_mux_del_adapters(struct i2c_mux_core *muxc);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)



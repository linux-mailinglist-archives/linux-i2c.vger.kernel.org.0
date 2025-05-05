Return-Path: <linux-i2c+bounces-10772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F17AA97A7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 17:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4EC176024
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 15:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7795425DAF7;
	Mon,  5 May 2025 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LwTT6o7X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717925F795;
	Mon,  5 May 2025 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459632; cv=none; b=W5NLxkOf9sTjjg0xNW6bs48187jgapCjNm3ibRDxa1TQVn27m7fOJRJFpSrjWymuG/mumPEszfJWwh9TxKbX+UQEkym0MqaX+ldhqGLSvJWyM5u2nx+SLdzBuVThs0+dHo9VUPbBIkgeHD5qaMYAN+9fxzXrpxeHGwqapPd3PMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459632; c=relaxed/simple;
	bh=TwSwHwpLzDr6CZ2+I8uOStWllEqJgD7WBY8PoxSQIaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFZKCDgmnGdbDtmf3LfsP1b9leH8bZzw0WHvR8EFZgeccTrQGNFBEdc/qFH04rUvpAHt3cFkQcLd7rVJpz5V3tKCFaL6mG38jrc6Ebtn9elvBP5aspiDVEwGyQccEkflAVlzHrY7iwaqO5yYZ9DTPKtKSNJormQ2XNQka5mBq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LwTT6o7X; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91A721FCEC;
	Mon,  5 May 2025 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746459628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UBYsbaMUgCU3xrNUXqOQUS26EA2NwGQGGtFkJLTd4hk=;
	b=LwTT6o7XmsdFToiMiC5FFHejRDC+mV87A28SYyqhlPIrw2/w0aTiXvdfK0F72Hsbfs2qsc
	KE4jMMP6Jvan54G02vyArPLM5Gxg0/RhFWttuoGlV9raCmw+fnqvaixqcw1YXyzIxSo3zN
	nov+Nk6X2J7vv5P8tf9yIzGo8+8JfjhuguJs6AIbuwISvPVLi95APUxJA+ThxweN5oNO0R
	PYep9R85h9NsrCkWpJYd3RQ6+CQZk0Vs5sC0jXpU9LxoYZUlHOXjcLtJHrl+5c+jU8UfUY
	cxk2/DHNpQAAHjWG2w03fTeCeM9KYf58hUvmrHOo93TvNJU3u/g9Cax1ZFSI2Q==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v4 5/9] i2c: atr: deduplicate logic in attach_addr()
Date: Mon, 05 May 2025 17:40:21 +0200
Message-ID: <2825982.mvXUDI8C0e@fw-rgant>
In-Reply-To: <20250428102516.933571-6-demonsingur@gmail.com>
References:
 <20250428102516.933571-1-demonsingur@gmail.com>
 <20250428102516.933571-6-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12704921.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedugeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeipdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart12704921.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Date: Mon, 05 May 2025 17:40:21 +0200
Message-ID: <2825982.mvXUDI8C0e@fw-rgant>
In-Reply-To: <20250428102516.933571-6-demonsingur@gmail.com>
MIME-Version: 1.0

On Monday, 28 April 2025 12:25:10 CEST Cosmin Tanislav wrote:
> This is the same logic as in i2c_atr_create_mapping_by_addr().
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 42f433846f63..bf7b2ac5e9cf 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -538,38 +538,20 @@ static int i2c_atr_attach_addr(struct i2c_adapter
> *adapter, struct i2c_atr_chan *chan = adapter->algo_data;
>  	struct i2c_atr *atr = chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
> -	u16 alias;
> -	int ret;
> -
> -	ret = i2c_atr_reserve_alias(chan->alias_pool);
> -	if (ret < 0) {
> -		dev_err(atr->dev, "failed to find a free alias\n");
> -		return ret;
> -	}
> -
> -	alias = ret;
> +	int ret = 0;
> 
>  	mutex_lock(&chan->alias_pairs_lock);
> 
> -	c2a = i2c_atr_create_c2a(chan, alias, addr);
> +	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
>  	if (!c2a) {
> -		ret = -ENOMEM;
> -		goto err_release_alias;
> +		dev_err(atr->dev, "failed to find a free alias\n");
> +		ret = -EBUSY;
> +		goto out_unlock;
>  	}
> 
> -	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
> -	if (ret)
> -		goto err_del_c2a;
> -
>  	dev_dbg(atr->dev, "chan%u: using alias 0x%02x for addr 0x%02x\n",
> -		chan->chan_id, alias, addr);
> +		chan->chan_id, c2a->alias, addr);
> 
> -	goto out_unlock;
> -
> -err_del_c2a:
> -	i2c_atr_destroy_c2a(&c2a);
> -err_release_alias:
> -	i2c_atr_release_alias(chan->alias_pool, alias);
>  out_unlock:
>  	mutex_unlock(&chan->alias_pairs_lock);
>  	return ret;

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPart12704921.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgY2+UACgkQ3R9U/FLj
28563Q/7BO3/o5U31GG5Go9gk5wd9w+Ceupx4i6VKlWc3w+4pQR+Ha49MDcEaPnG
w7sZvOvg1YIZctxMZEAV0sFtczaAgyFr+quxCjkpPzysBAJ6opXRpKzc4FlZ4YYv
98AT83C33CIUQg7iyR6REutk9uwWE7ywTzsw+F/I2rt5vgAXZMV7IzwdnyKVWmpH
qQYBkLEYHWw67IWQU6tQagKkXAE4A9xWLAWqKT3lGMDYESWyQPbaDMmN3qusFUkc
qCjcClWCNG4LMQdgP0mjQLQYKZ/tFz91vwSUIk3tU9PPojvHQcSrE5QyZL/oNW8P
fBxlI72aLBLVcbOWNhr170VzfKhUo6uRs6m7zjGUXEeJLTLXBNH8d7zM7a1Vs69d
4Sy0DyeUl0Lm9qxxHc7WzBKautCZ4Jx7ZhWzRwAlN4lIfLzFNSv4dJngjV5SMZXa
FsV/LeeDawpZ5wM5HL2VY/FbKC0GDZg5KWuuqE3q+0toIpnURkfxq5jaKRKsCYXX
Bo0Q8qRzrb8A85YuQ9Gl+Appok/G8PfKi8KoJZtLxqJubRL2qH9spkogAg7HLZtm
aLpwlhrOtvNx4SFOls0YFXBz7Jaltwjx9TY3cP3uL7UxOIuZXO/q7WGw2osHMHqQ
3wUxiJh5iUy1vEgNEEJv03MYsEsMPgfuWY/p0OQmCUIICyA+1Mc=
=98Dg
-----END PGP SIGNATURE-----

--nextPart12704921.O9o76ZdvQC--





Return-Path: <linux-i2c+bounces-10774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36534AA981B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 17:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE863B0998
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F8826560B;
	Mon,  5 May 2025 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M7a/U7ZX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1809F25B66A;
	Mon,  5 May 2025 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460689; cv=none; b=MCzqteBbBa0CtTFlj7HfPYc5FXutwFpqpOgRnqLhQAfTj+c6+kah4pFdg6+IFN4EHV5rQiTlJeZ2M6n2vorwfCBfdFBmhIctA+CDWJ+q05uAijdhyhccUpaDtuNvCjEHNHBxdlS4jFPN38Nk3FDgERunkoPf1k/yJw6J/osms1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460689; c=relaxed/simple;
	bh=5Nf1ONawn/3pq8fypVYQWovaSHr8Yas3zfQL2/N3jqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhfOzPYZiS7HW8iInTcJQj+PZzmDcNnswONjZz0lnHoWvDgDHlI8SIJRb2JYvGScey8rD42U4iXjZa9xy2xE/4cOTUcsMk9hhj6elfsiIjPahbMY9k1mywQRNT/A61/c0mdJkxpeQFeG6zLPRX44hlhXWDLZ0eegkbkX7G6JG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M7a/U7ZX; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C0CD439B8;
	Mon,  5 May 2025 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746460685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JFmuo7F9CLf+vvIaxCtxGrFjdiEXZfxCn0ypaUjKkz0=;
	b=M7a/U7ZXmMbeiugP3oETnY/b9DO3wQH2AfU9CzthyDOPlgYC1JIYpc7xXgy5mhs2fjAwbU
	z4yg8KtmBgFzxdbjcE8MzO8ZnrWrssRxKnK/gKfb9y7bZyPhMughSo4HZOzq7i6d2h2CBZ
	4nqocZwHDxin7Ti3Iks+++5eF/y/TLEpmH+v78Brffy7C++My2GKahduJOh5/v1iXAtJP2
	wBlElJn9/aDgBZfnGfpyO4VWjZ8Ky48mVTr/icbOU+NAtDnP/X6mkAxK1r8yw1+l5V4m08
	upP+JQzC7NUmDu9FD/9Mjc/avCG5U/uXD9CMKq+Wu030s6RrDsmuOygRt+TmJg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: atr: add static flag
Date: Mon, 05 May 2025 17:58:03 +0200
Message-ID: <1966497.tdWV9SEqCh@fw-rgant>
In-Reply-To: <20250428102516.933571-9-demonsingur@gmail.com>
References:
 <20250428102516.933571-1-demonsingur@gmail.com>
 <20250428102516.933571-9-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2268553.irdbgypaU6";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeduhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeipdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrt
 ghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart2268553.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: atr: add static flag
Date: Mon, 05 May 2025 17:58:03 +0200
Message-ID: <1966497.tdWV9SEqCh@fw-rgant>
In-Reply-To: <20250428102516.933571-9-demonsingur@gmail.com>
MIME-Version: 1.0

Hi Cosmin,

On Monday, 28 April 2025 12:25:13 CEST Cosmin Tanislav wrote:
> Some I2C ATRs do not support dynamic remapping, only static mapping
> of direct children.
> 
> Add a new flag that prevents old mappings to be replaced or new mappings
> to be created in the alias finding code paths.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c   | 6 +++++-
>  include/linux/i2c-atr.h | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index e2350fcf3d68..721dd680f2ac 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -341,12 +341,16 @@ i2c_atr_create_mapping_by_addr(struct i2c_atr_chan
> *chan, u16 addr) static struct i2c_atr_alias_pair *
>  i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  {
> +	struct i2c_atr *atr = chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
> 
>  	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
>  	if (c2a)
>  		return c2a;
> 
> +	if (atr->flags & I2C_ATR_F_STATIC)
> +		return NULL;
> +
...
>  		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
> 
>  	if (!c2a) {
> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
> index 5082f4dd0e23..7c6a9627191d 100644
> --- a/include/linux/i2c-atr.h
> +++ b/include/linux/i2c-atr.h
> @@ -20,8 +20,11 @@ struct i2c_atr;
> 
>  /**
>   * enum i2c_atr_flags - Flags for an I2C ATR driver
> + *
> + * @I2C_ATR_F_STATIC: ATR does not support dynamic mapping, use static
> mapping */

I would suggest clarifying a bit more what "dynamic mapping" means in this 
doc. Maybe something like "ATR does not support on-the-fly modifications of its 
translation table, use static mappings". IMO this will make it easier for 
people who don't have the full technical context of this series and want to 
understand what the flag is for.

Everything else looks good to me.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart2268553.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgY4AsACgkQ3R9U/FLj
284oZw/+I26o99MZp5adYZRz6Bwn3LAyupi4YGSpY+PJxqDEvQNByCZdvHgzugp6
5vZUgfGk0NHEROz1f2gaMKlQvJqPWjlOlvDns6RL9AfWVg9LabYY1lMilAdT8loB
bFmUA/C0aeiIssZ76fXey5cvefYPO+/1X27e5QscyxcAYkDk2aKFlCBh1F1vvlcb
nHhHqd+RnB0QYL+bEi8xLDQa5MLrZa8mfXoHgybuLgwrlCEDLK8OYPEMNy1U1vW5
jDLeWQhe9RAX/nBhL8wgSt40XNcQY+Rh5IPI1F/3aEDlPN2UBFBJNZtUHOYpPTOJ
6eqXL9/ikLV88BPp28eIJn0Gaja1UfpGFzoMHvmiokxgHI8xpkhprenQhcFBMD50
8lroGNbAT2ghmXMiWr2lIji9OzizWZXe3e0fOdIVgkfjsOE0aqLR1FLPOumlirEk
jFR2Bovgdr4q43AGmuDRI6HwvdkRqu/cTqLOwqPmfNbRc7KpIC8s9xIcAiFZyXRU
st6vcL0XkiE0Q8Vk4HinX+Db7GlXAO36fzQpEgNQJcpdsid/YNwRT92AePfglrda
5qBK+JD2636mJ8CD2VIdFsVUssJZbd8UfMF8mZBA9XJl0NlYb2HgEyPgTzbUJxkp
aeKb1JBYzeALsmMheK75zbHnf4My/RNiZtsC0OimWOxhfcAia7c=
=aAV1
-----END PGP SIGNATURE-----

--nextPart2268553.irdbgypaU6--





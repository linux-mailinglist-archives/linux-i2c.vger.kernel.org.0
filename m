Return-Path: <linux-i2c+bounces-10775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32AAA9865
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 18:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6770189EE3A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 16:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8FC268C6B;
	Mon,  5 May 2025 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HR/jDw76"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A2204096;
	Mon,  5 May 2025 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461651; cv=none; b=PDQWDoikvYiPGAJIT4iHPNa2ibfmQrWXQWhLUcD8Pq8CwoFoKDhfcLjDYDW3OnzpN/0A5IKRfDllRZJENPQNaz95IT8CUvpQ43OUz/ZiOYjt21kDYeuS+LXoVu/AXOBkD7v5fZ7hcBatNooliB3PoW1g8wwHD6CE+4k1+RFLubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461651; c=relaxed/simple;
	bh=l0x7QpnKNM65NzV/IFWEVen7rZ6tmS8Ul5cZGDUB1Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZEKYteL7PV+V2z3eq9ILFRwDcaNlVLtqexixQuQkfd80RbGnUCjfz6lzjUhiMiqSUB+qs4BJLO4lJqXeSeLTrr0LDVjRXKPiA5IjTZYeNHUyaSSqcKlm9nNXmrPhGQ8Huq6PU/P4N4UNlsozm0nM56MKEsYQF6cDnyGNFyrZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HR/jDw76; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27A6F438BD;
	Mon,  5 May 2025 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746461641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qm4w28GJG8W0gRihHu9MypRoYQ1YCK2AOK3Kul43uzI=;
	b=HR/jDw76UgCXjwX7tG/FATDO9we+vkIPBzHSNZS3tm2WqP60Fm3rA0f2r8nfMPCgg4HWjr
	K3rPNEufvi53Magy+ckxzsP9nSKc43qq0Obh4i6D//K7wAzM82CEc+oYKX3GQESr2D4wwq
	B6oMkOjabXcY69q74IiWrNbaKouHb0gBHdMKqJBEimXEmpIGbWO1nPvoHcrEz5KDUYC6eh
	h0TA0LPGXKvlYL8uhsNTEYxWUsmZww0rbukzIgGFoppN8MfIJStJZZFmmu+PaEDi0FXO0M
	6RMXwHXKMbBFATqaVceopgrHymexsIYqfYC/FEJU+Y4kBHZwivEaorJYr5L03g==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v4 9/9] i2c: atr: add passthrough flag
Date: Mon, 05 May 2025 18:13:56 +0200
Message-ID: <3034821.e9J7NaK4W3@fw-rgant>
In-Reply-To: <20250428102516.933571-10-demonsingur@gmail.com>
References:
 <20250428102516.933571-1-demonsingur@gmail.com>
 <20250428102516.933571-10-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3395128.aeNJFYEL58";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeduheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvgeemkedtkedvmeehrgdtudemrgdtgegvmehfjeeiheemleehrgemughfkeeipdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart3395128.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v4 9/9] i2c: atr: add passthrough flag
Date: Mon, 05 May 2025 18:13:56 +0200
Message-ID: <3034821.e9J7NaK4W3@fw-rgant>
In-Reply-To: <20250428102516.933571-10-demonsingur@gmail.com>
MIME-Version: 1.0

On Monday, 28 April 2025 12:25:14 CEST Cosmin Tanislav wrote:
> Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
> the child ATRs need to be forwarded as-is if the parent I2C ATR can
> only do static mapping.
> 
> In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
> address remapping hardware capabilities, but it is able to select which
> GMSL link to talk to, allowing it to change the address of the
> serializer.
> 
> The child ATRs need to have their alias pools defined in such a way to
> prevent overlapping addresses between them, but there's no way around
> this without orchestration between multiple ATR instances.
> 
> To allow for this use-case, add a flag that allows unmapped addresses
> to be passed through, since they are already remapped by the child ATRs.
> 
> There's no case where an address that has not been remapped by the child
> ATR will hit the parent ATR.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c   | 7 +++++--
>  include/linux/i2c-atr.h | 2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 721dd680f2ac..eccb85c34609 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -394,6 +394,9 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan,
> struct i2c_msg *msgs, c2a = i2c_atr_get_mapping_by_addr(chan,
> msgs[i].addr);
> 
>  		if (!c2a) {
> +			if (atr->flags & I2C_ATR_F_PASSTHROUGH)
> +				continue;
> +
>  			dev_err(atr->dev, "client 0x%02x not mapped!\n",
>  				msgs[i].addr);
> 
> @@ -486,13 +489,13 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter
> *adap, u16 addr,
> 
>  	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
> 
> -	if (!c2a) {
> +	if (!c2a && !(atr->flags & I2C_ATR_F_PASSTHROUGH)) {
>  		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
>  		mutex_unlock(&chan->alias_pairs_lock);
>  		return -ENXIO;
>  	}
> 
> -	alias = c2a->alias;
> +	alias = c2a ? c2a->alias : addr;
> 
>  	mutex_unlock(&chan->alias_pairs_lock);
> 
> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
> index 7c6a9627191d..f979b931ca05 100644
> --- a/include/linux/i2c-atr.h
> +++ b/include/linux/i2c-atr.h
> @@ -22,9 +22,11 @@ struct i2c_atr;
>   * enum i2c_atr_flags - Flags for an I2C ATR driver
>   *
>   * @I2C_ATR_F_STATIC: ATR does not support dynamic mapping, use static
> mapping + * @I2C_ATR_F_PASSTHROUGH: Allow unmapped incoming addresses to
> pass through */
>  enum i2c_atr_flags {
>  	I2C_ATR_F_STATIC = BIT(0),
> +	I2C_ATR_F_PASSTHROUGH = BIT(1),
>  };
> 
>  /**

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPart3395128.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgY48QACgkQ3R9U/FLj
286Qhw//WK8qW0lMvyrTdm2J/jkXMz46h2If/bll0FOrDJlngudBZZXEIBq39IeS
FeeHPoxZNyckkOYB8ZPVjmx06BGXv4sHmewjacmeAKTIZEDJL+p/2J8OwkJQUuHi
y3aVX6dayMKr7g1kd1vBfSM7FEgaf4s84Qd/+5yfy/ZRGPF2WxLwQSaRZknjReqT
Izoy5Hx1DR2FqfHYKg/xkjdNOOE/9hAkl27Bkv15onv7n5hAFKiPu589f91rgXYO
xF3Aue/4iFFF0MflS1s2v6Qinkbk/5AUXgqzuDe13/noAcvnyF5/HhxTY/wXQnlG
0qf3jojvSyfRdtJwj9o9CjrKqwiXdOxrLqEo/10kA3MgbS/NBBKEs8xlN2rDdZc1
WfL9MpqPjWybVerUg3F1FEVUQP89ez8KhsxLcZuuhAHMzKlivc8Zd1Qk7ygthd4E
Y3v8usC100iy2oKidQ+1sqi5dDHKP0IkuWnBzRC17u/2Ix7ym5YTGCIpn2eoeUrI
z4Psqrt8m3TEj2tfabpAzKOSwgwjxQl+XcLfxMWJtLSukEz32AqhPclH9n8NBGBS
zQn9PtXqOlCBzNjeHO39Rn3uX5O/WAGUYIT7I9b3Gwnc6L7NV7oB/Bef+ttYWnWP
01B1LWu7UK+GvjtchB97rnhZ0xRMyoHJixy6Zvwej9F8ANeGjw8=
=8dxA
-----END PGP SIGNATURE-----

--nextPart3395128.aeNJFYEL58--





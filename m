Return-Path: <linux-i2c+bounces-12120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9CFB18F24
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 16:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58887178514
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 14:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5303923C503;
	Sat,  2 Aug 2025 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="dbSs8A+h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271C62E3707;
	Sat,  2 Aug 2025 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754145189; cv=none; b=XpRskGY1/5tHDxew/3xCGHiIF+Ex8yhJADQvp1/tm7pAkChcx7xQBciZQAdC4HtrOVgrZX8a6laLPYm9HZ/joeMl4BK/Y/lukAavDGbnimGQQUH0s8ThzXUtnp2c8nogSfBheelS3IV7F3Hv5EbTiUnX2Y1FuKSkAoZ5miCyPLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754145189; c=relaxed/simple;
	bh=Jjp8ewlVQ8UJZ3EiVjyQoNU1FB74GM1ttSuUdlGwkRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kbp3yFYRF57lRnoSVXOxkKGfqjhA48k8HvKQpwX9RIj0OuXu0VdMA+RZJ9QVjdX0nkpRhiuOHUUA/6wJx5+pSOcP7Djmjbzo5uX1wXyiYtQG1VXDaPnjolztiT37JmZVYFIsKOqvbl8xnqbMb7PJwJ1DHdzUtspLeDGV+iJB3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=dbSs8A+h; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754145184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AiakosHY3BnvLYT/Wwq36OmWkSDY8QhgMTYb/KAsc9A=;
	b=dbSs8A+hD8Vf/854UvSEOHqYPYNgrfvn+xHxDD6zoe1UlV7IPRw07honqQ44V3p9jgM0b1
	n9nWZR3TFqhp9DXuzEShGdRESTNrxZra65XrB4a1kY1JHI55JG4H1groBvBhiWZZGYp1Ni
	Cu1aiZgO9gvYkvk+3EKGvPuVrub348c=
From: Sven Eckelmann <sven@narfation.org>
To: linux-i2c@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
 Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: Re: [PATCH v3 1/3] i2c: rework RTL9300 I2C controller driver
Date: Sat, 02 Aug 2025 16:33:01 +0200
Message-ID: <7182147.lOV4Wx5bFT@sven-desktop>
In-Reply-To: <20250727114800.3046-2-jelonek.jonas@gmail.com>
References:
 <20250727114800.3046-1-jelonek.jonas@gmail.com>
 <20250727114800.3046-2-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6031783.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6031783.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v3 1/3] i2c: rework RTL9300 I2C controller driver
Date: Sat, 02 Aug 2025 16:33:01 +0200
Message-ID: <7182147.lOV4Wx5bFT@sven-desktop>
In-Reply-To: <20250727114800.3046-2-jelonek.jonas@gmail.com>
MIME-Version: 1.0

On Sunday, 27 July 2025 13:47:58 CEST Jonas Jelonek wrote:
> Rework the RTL9300 I2C controller driver to use more of the regmap
> API, especially make use of reg_field and regmap_field to represent
> registers instead of macros. Most register operations are performed
> through regmap_field_* API then.
> 
> Handle SCL selection using separate chip-specific functions since this
> is already known to differ between the Realtek SoC families in such a
> way that this cannot be properly handled using just a different
> reg_field.
> 
> These changes make it a lot easier to add support for newer generations
> or to handle differences between specific revisions within a series.
> Support can be added by defining a separate driver data structure with
> the corresponding register field definitions and linking it to a new
> compatible string.
[...]

Thank you for the patchset - used it to get the driver working on an RTL931x 
device.

[...]
>  
>  static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
>  				    int size, union i2c_smbus_data *data, int len)
>  {
[...]
> -	ret = regmap_read_poll_timeout(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1,
> -				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 2000);
> +	regmap_field_read_poll_timeout(i2c->fields[F_I2C_TRIG], val, !val, 100, 2000);
>  	if (ret)
>  		return ret;

The "ret =" was lost here. As result, I get "corrupted" data after a timeout 
instead of the expected error.

Kind regards,
	Sven
--nextPart6031783.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaI4hngAKCRBND3cr0xT1
y8k2AQDJeyejALT7/o5Xm7rUo84pp63wYJbdw8QPpYL3XBJcZwEApdGHeFAL+K75
w/4j2n1XOQfUOJbuDZ1sPWXO8gL7mg4=
=+GHf
-----END PGP SIGNATURE-----

--nextPart6031783.31r3eYUQgx--





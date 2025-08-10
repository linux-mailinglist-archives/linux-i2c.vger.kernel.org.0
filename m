Return-Path: <linux-i2c+bounces-12198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1417B1F8BB
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 09:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFF1C17A997
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 07:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAE5232395;
	Sun, 10 Aug 2025 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="etNJ5iP3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5022F39B;
	Sun, 10 Aug 2025 07:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754809994; cv=none; b=B9+ITuV7KdO6iFoSPT0Q2lxdcr0hrd/vyGJ+LZP5PF/eed+FBavMyy9PtlglDIiUA4IAPhqqGFygDUQ/PzADdlCGZfHGGPniEb1EFRD4+fhlBI3QQAHNLiwLCtJoGnmLTWKrAQVSlG2LU+5IUL4wyN7FZJhnWnrhEwQoZmlEFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754809994; c=relaxed/simple;
	bh=tXq7g0Ip4s7UQtl+qKMriocy7Lpxsbx7/asljoaOvR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FTFrpfLUmwG2iUH5JyW6fzO2WQbdlNBINzjuUEe5vbQd/O7d7MWdrxBr2LTuFu+PQ7C8/4p6crZdOmZBmFxEmqhZHOdUjb9u2E5yk20I0thyMChFBryVl1EaT6NWaN5crUlX11v/3yuD7K2Q1jHIv3ll7CswTheksOCRHT4DOzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=etNJ5iP3; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754809990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6rj9/PVDqovSyhTuVWp9Z/V+itba1To7FxDkMEZhaY=;
	b=etNJ5iP3Wl1ea8Uo3x3hAObyeDNBiBpfhfhMbbOWvak6LMYNd0H15Tzsv9sh1bA0FsNMXC
	fp5kxy6kXau04f+qLPsq57EzvswCp/U8n3XLwepp9dj9epURHczP1MlfhepUZKPylJSITr
	DbX61/LzapP6BhoRcdsaBdL/PEtBv54=
From: Sven Eckelmann <sven@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Markus Stockhausen <markus.stockhausen@gmx.de>,
 Harshal Gohel <hg@simonwunderlich.de>,
 Jonas Jelonek <jelonek.jonas@gmail.com>
Subject:
 Re: [PATCH v5 06/11] i2c: rtl9300: remove SMBus Quick operation support
Date: Sun, 10 Aug 2025 09:13:07 +0200
Message-ID: <3644932.iIbC2pHGDl@sven-desktop>
In-Reply-To: <20250809220713.1038947-7-jelonek.jonas@gmail.com>
References:
 <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-7-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9489707.CDJkKcVGEf";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9489707.CDJkKcVGEf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 09:13:07 +0200
Message-ID: <3644932.iIbC2pHGDl@sven-desktop>
In-Reply-To: <20250809220713.1038947-7-jelonek.jonas@gmail.com>
MIME-Version: 1.0

On Sunday, 10 August 2025 00:07:07 CEST Jonas Jelonek wrote:
[...]
> The current implementation of SMBus Quick operation passes a length of
> 0 (which is actually invalid). Before the fix of a bug in a previous
> commit, this led to a read operation of 16 bytes from any register (the
> one of a former transaction or any other value.
> 
> Although there are currently no reports of actual issues this caused.
> However, as an example, i2cdetect by default uses Quick Write operation
> to probe the bus and this may already write anything to some register
> of a device, causing unintended behaviour. This could be the cause of a
> recent brick of one of my DAC cables where there was a checksum mismatch
> of the EEPROM after having run 'i2cdetect -l' before.
[...]

Nice find. I've actually observed odd behavior after/during probing and 
attributed it only to the other problems (especially the low timeout + missing 
check) we found and never did a deep dive to figure out what happened on the 
bus during the probe. Possible that this could be related.

Reviewed-by: Sven Eckelmann <sven@narfation.org>

Kind regards,
	Sven
--nextPart9489707.CDJkKcVGEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJhGgwAKCRBND3cr0xT1
ywFnAQCA099cpUhisbQ/cgr6LA+qilF/G7JT3bf1xS860mOajgEA45J1xl/00vDw
meZuZllT3Q0AYBT+G1cFMV8Ono0mWAs=
=6z8G
-----END PGP SIGNATURE-----

--nextPart9489707.CDJkKcVGEf--





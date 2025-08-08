Return-Path: <linux-i2c+bounces-12164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B1B1EE02
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 19:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1B8116B640
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 17:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585921E1E19;
	Fri,  8 Aug 2025 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="P2izBx7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541110F1;
	Fri,  8 Aug 2025 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754675156; cv=none; b=f7yld/fwcc+UhoT5BbLAhGy6ufeHhc73UN6DADhbmSfKcfzp0YwerLVlA2uAUo5CR0JcCIAAqlYetVfy7cmmPF8mzcYPbROYLcYY3bkQyxdI/O7xnOWqcMEm6z7FFBF4FyQifstmM8H2HbNaYid454Bk5fT/DWc6aHvlSzNuYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754675156; c=relaxed/simple;
	bh=cMPX83TXW5WS1B/djWZ1BWLuRX2sVxKhO971mWW3Bbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QSTbH4ykN7Bj0Ik0PHNwqbXQc6Q+/T+ygc6PSsr3f/dQXqWr5xSUo3WKKDMxtK3TYDk3O5uxV0Ty0YBgUIc7V8yMlKJJIRW6xigFdpMrJ6LLwC7+wzTK69f+QDQ28aE92yTpRfrADOWhSSlYfAnl42GyuA5CMxneq+ieNN0Ulr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=P2izBx7a; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754675145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fpm+EefCxsK9ltMIu4skM6GdnS0CE2R/LNLTBMAwR+8=;
	b=P2izBx7a6ckvP7R/lUPQJzhhq9+t2zVzBAI6BrFG/Ysh4FecA58vIyvKAYaWw9b4GEwyMd
	2nLUt2kwdNAOntXzq6LCjDeZVPBQv5UYiIPxFfU3gIymSLy7iIc3FItFhiwHsDNFizGpZL
	2nA9I426y1rtUbKmifX/URbO3d/2YvU=
From: Sven Eckelmann <sven@narfation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: chris.packham@alliedtelesis.co.nz, Alex Guo <alexguo1023@gmail.com>,
 andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer
Date: Fri, 08 Aug 2025 19:45:39 +0200
Message-ID: <10749199.nUPlyArG6x@sven-desktop>
In-Reply-To: <aJB6u1WoNjiE-tZz@shikoro>
References:
 <20250615235248.529019-1-alexguo1023@gmail.com> <4670491.LvFx2qVVIh@ripper>
 <aJB6u1WoNjiE-tZz@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2364835.iZASKD2KPV";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2364835.iZASKD2KPV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Fri, 08 Aug 2025 19:45:39 +0200
Message-ID: <10749199.nUPlyArG6x@sven-desktop>
In-Reply-To: <aJB6u1WoNjiE-tZz@shikoro>
MIME-Version: 1.0

On Monday, 4 August 2025 11:17:47 CEST Wolfram Sang wrote:
> Yes, we can do that. In general, it doesn't make sense to add this check
> when the ultimate goal is to support SMBus v3 which doesn't need the
> check anymore. But if it is blocking further development, we can apply
> this. The check will be removed when SMBus v3 support comes in.

Yes, when I2C_SMBUS_BLOCK_MAX becomes >= 255 bytes, such a check would not 
be necessary. But this driver is already in Linux 6.13 - and in this version, 
I2C_SMBUS_BLOCK_MAX is just 32 bytes. So, just from the code perspective, it 
would be interesting for Linux stable to get this fixed in longterm kernel 
6.15 (and also the most recent Linux 6.16.y).

If you want to have an argument against this patch then it would be the the 
hardware limitation of this i2c host controller. It only allows to transfer up 
to 16 bytes. But then you could also argue that there might be variants which 
will not have this limitation anymore. And Jonas is already trying to make the 
driver more flexible [1] - the future will only show whether this will ever be 
a relevant check (before I2C_SMBUS_BLOCK_MAX is large enough to make this 
check obsolete).

Btw. I've already picked it up in my patchset [2] to avoid conflicts with this 
patch. And since they (2-4) fix broken functionality in Linux 6.13, this patch 
becomes a requirement for backporting those fixes to the stable kernels.

Kind regards,
	Sven

[1] https://lore.kernel.org/r/20250729075145.2972-1-jelonek.jonas@gmail.com
[2] https://lore.kernel.org/r/20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org
--nextPart2364835.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJY3wwAKCRBND3cr0xT1
y93kAPwNyB6o77zkG3AMKPTc4CK5HZntt58sAq5BoD7c205gSAEAxbybkLWRb6n9
29KQvlkpHYwO0+DMtzCL8HSeI5g7qg4=
=XPxz
-----END PGP SIGNATURE-----

--nextPart2364835.iZASKD2KPV--





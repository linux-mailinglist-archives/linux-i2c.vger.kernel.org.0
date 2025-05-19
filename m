Return-Path: <linux-i2c+bounces-11043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6FABC522
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 19:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BDA41B6205F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ED1288531;
	Mon, 19 May 2025 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J3ct4x9S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FC288520
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674197; cv=none; b=n8mdo385H3J+2QW7MqctHfqdsMViUO54WCFn7giXxH62ihlm5JpRFuadta4ZSnb0/SRQIR0RcsIlvKK4QfL/oknaospPz1Rogs6G7DuNWngWk/S7TVdzp4jisx41YbP2wKkEzRqAlzA/HCE82rphQrOX6R6OKjsm47lMWvSSgvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674197; c=relaxed/simple;
	bh=JYOLy1V8LnTKP6Ii4/TJACY1NDLLiuoT+YsL1UYreTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqBy5lgPuU26MKmH7G1uoGT+jWl7DptzoamFQ7Ho93TExeRkkEQLRD9UrwgtzecTJnBRVkdYAztRRFMHF5xTEK1dFDtpwLO58JNrngSG8wTScVzwCxa1yvmKjomAco7pKSnhzFx+4/rgbCzW+icfVtSVvkM+HP+HDtN7GQe6hmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J3ct4x9S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tosP
	yPyOgyvRyFhM+9E8VMFTT2SJO0IgrpkZvR345OM=; b=J3ct4x9SlIVLdaBucsJI
	d1VMAnBxqggeYDVxkfa0hzoQ8NzTsSkr/7VPh9xXMF2+U5BN01fzS1lNirZYCUut
	yUWwdsn2s7tR6EhsJHc2eFcDs9uCjk3Ca+jhNfd0H8TDRXVZV/8htMh5sBbRB4eu
	3NJqEEyotDDImG1BfAadVGfm+ysfJLa4mcjlj20f3s2Ux52oQ2DhzjLtckIs8N0K
	yrQlHdNPBnZrhqIv8YfsaPZSEIJMdLYEOdmHh/1b7cbM33rM8PualCdIl9H90Ulv
	nXYXxBHerAZzEu9XgaEHeueqGbRjY6du+TCIWK1E2LR3lwx8j1GErf2swnzv+prL
	zQ==
Received: (qmail 2572961 invoked from network); 19 May 2025 19:03:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 19:03:12 +0200
X-UD-Smtp-Session: l3s3148p1@cM4CG4A1jpBZz6uL
Date: Mon, 19 May 2025 19:03:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: slave-eeprom: add latch mode
Message-ID: <aCtkSBZfkc2k1jnb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jian Zhang <zhangjian.3032@bytedance.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209060422.1021512-1-zhangjian.3032@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tyMNv7CWzo/9Mar1"
Content-Disposition: inline
In-Reply-To: <20241209060422.1021512-1-zhangjian.3032@bytedance.com>


--tyMNv7CWzo/9Mar1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2024 at 02:04:21PM +0800, Jian Zhang wrote:
> The read operation is locked by byte, while the write operation is
> locked by block (or based on the amount of data written). If we need to
> ensure the integrity of a "block" of data that the other end can read,
> then we need a latch mode, lock the buffer when a read operation is
> requested.

I don't really understand what you want to fix here. Does this patch
really fix your issue because...

>  	switch (event) {
>  	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (eeprom->latch) {
> +			spin_lock(&eeprom->buffer_lock);
> +			memcpy(eeprom->buffer_latch, eeprom->buffer, eeprom->bin.size);
> +			spin_unlock(&eeprom->buffer_lock);
> +		}

... what advantage brings you this memcpy of the buffer to a latch after
every single byte is received?

> +	if (of_property_read_bool(client->adapter->dev.of_node, "use-latch")) {

If there really is a problem, we don't need a binding for it but should
use the fix in all cases.


--tyMNv7CWzo/9Mar1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrZEQACgkQFA3kzBSg
KbapsA/7B0NXjBKo61utDIL4MDx8yXm2LrModlmuPjzmxkLcnLgpK8uSmUQNM2XC
KJbxf5Klqy3PwwX0X6t+yqti997smRGALB5dFHAAZP4XjtJ4lnv+2X0CTHmNBrli
r++c3Pc63x9ZMRPPnRsriT+wS4XRI8GUIkHDW/ViCXoprMxqS9YjvUXOauRj/8vF
JWE1JvfaEQwC1tbKjhl8kyNiHzHWAy+rxT6YowbcNPup/DhUS+3BsV/yNH6hPfmk
vm7Gkw61UU3U/kteNmNN8zh2mp2zVzGEFSmuZUv9+Gmp7jOKEI7p/A4QvKlFXjy7
RwqPYnyXPNLcw4vEMI2apFHBPo9jNb5khkv4r3hiuvjXFsQwu/8r7/DhdNXICB35
gTO8r1RIimAqdHBnVoCWnbDyQLWeK+WtKxYNYS3jiFayUnw5GhEZ+ASMgzd1prw7
V9lKGV1hFsPr731vrOaqebf0lKPfy+vNF53Z347ZMMOhRVsQMPDiYEmwpz/9POB1
soEdma9U+TjNjAEyWYLf/Hwo4jBfvs+iL9C1L9ZliBi++uomRQ4fwPpdXK4qyrig
S+Y5iA8KWe35XCKFMPhC4C+cjoHkCDtxNl0E/QQgmEMBDShGmn3+cEpCeIuPtSW/
HlQ16YrIVMxqYn/jWbqdbJtdOwopfQxlHf8wqFPakNcQFYsejzc=
=CLRB
-----END PGP SIGNATURE-----

--tyMNv7CWzo/9Mar1--


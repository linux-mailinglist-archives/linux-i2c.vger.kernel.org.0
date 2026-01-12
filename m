Return-Path: <linux-i2c+bounces-15033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 188E9D119AE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D55B1304378F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 09:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C5826F289;
	Mon, 12 Jan 2026 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iYadSOvo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12C26D4EF
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211229; cv=none; b=TTKs8hxPPS7yudq7dVCFughgNXeHAdJWcCzEzTZT3WpBC4rGHeivmRz3KvkaSzMhOwqZzZ7l2sj7ReIFwH9NXXTALebtbSUqfhKMRyytEn7bYY05ST44KdXjhsAa3rQSks6H25emA1rgEZvLqSouDghBH81f2ft0r/SOXIbVF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211229; c=relaxed/simple;
	bh=H1rIB8JT7j1F1SsEK+m7eEpaCjy2KSzAe7nJD7PoDHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3Zkqpr3NPICDu8hlHhVJkASsBWZ7XYzsukXlgxFet2OWNup1OQXy6ex7L3Q7dno3WLG0Lk3Zb9QQkhqKRAiGMXit8ZQBZMD1NXFw9KLlFFfLXuj5Ml4wROsdf2bLqSSIT+m5dRa3ePt1XVB3vWYZyVln665uLHRDPPx7poh7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iYadSOvo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47755de027eso35219585e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 01:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768211225; x=1768816025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pHomYl2ivRajFrYS12hVcD69qEtT5HA49SWMPUby8IM=;
        b=iYadSOvosa8oDTmwrMlz/F0XogpBg1xL8oNBbQb1ezVCThk+5QniyxjXOnNN7MT+St
         JSaesSfivRsZZX9cDi0M4JtjrQwrDcb7+kOryunR+jOSK2kftgGd8JtvPaSh1fuXgPiu
         p6y28MurQ3+suFxfuWvfs04Di5bqBOy0852ZoG75IQeEzCIu5dCLuuesuLjORJecc+xW
         BD9aApaYE5Z+6Vomq2rmt8IYqh/jMnvuZeI38TH5JmrLVTtyF+wxk2H9YuiN5ImK5fs6
         3JjvVu82brzcHI1aLrLQdBqoZGPesoP+WEuDstdTTRI2eKJox0tH8z6HArfRo3s7pYgm
         Rx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768211225; x=1768816025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHomYl2ivRajFrYS12hVcD69qEtT5HA49SWMPUby8IM=;
        b=Q/Rkc1BWnOyYMgWGOn2Qvr/FWViqYqnsYq21v3IYZ0wt4l1zz5xjaxdoxHcQf04U0s
         kusPnDqQLzcakBRMv55gI8BrowPTncsJhNt/nnMF91o5aYOJPglkeHKiSzcO7WH/6EiW
         y0ngAVuVrKAxwVaWVqbayCQYGJUo/GLMDMjyBBWqkkv58qe6MJQd6sW7QvemNEeu/lLn
         JzuxdnxwvIBCBVY/kyuB5WdkhmUYSvUuhnAJd4oceE6FqmebPgOU1BIpRLqw+iu6+xGB
         5APm7F9VcjzYfohK2WCrlC165X2kgBAIPwCnPFadYP5XEMuQXJv1mFhhm1CKnBx3X7N/
         DuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRgjj3lBcyE3u4rsW/TEOJjNb6SoYrXKJGoQiJ2heB+j1xe9OHE5sGsRP/j8QEAk4Le5RHeZ1CEZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXTMPqfWGyrSIYIaxgPBj0GBwSMUpQPqj3P389AwPDJ/u9i3r
	xTa86jLaprDSXeKuj4r7C13kiR+oDVnsVauhr3JG9AJA0wBKLFxeJ/az3b+/OoU9LB8=
X-Gm-Gg: AY/fxX6sPS+82t0hF+K57Vf5JeBqcRX+0XIoL4h9OSuRJLgO1oEzOMRW9sXlFfkZ3Qw
	JwYMMfTlwU8znzYHhdf/dOdZMTRAE4oalhwgnF5zzoz5ZlIROD6XaoGqZ146xIhd4FK1iifaUMw
	SQIFHJ+vX605jQlr3wmhXKj553GcpbRsS79it5v/vupOjiXjGrLx6XhSO6/+HmHllFbkgTgjd95
	90yfRK8O5AdygLQDPh02DwmXjKjFyjob39QdIpqw9b55ErQqVcHLJCiiB23xG5JRrrkq5nzOcW6
	DuCeVdN8ezQ7ZTICZ8Fv7kgd2RO8bFTs1t/24ZlJ6wcxFLPSRgnWDLvqO/S2BVs+piOTqm5xPBE
	r8JbOntu352++4tukZVT1cY04RDFMyJf6T0vZN+7DXVqO26aOmS151QsFYKpWyIB8QA9xwhQYL6
	r+T9cEHAnZNErGTwQZro/LYiMgYpOoQOqfgdnaaI1xsNt8iVUzPWLzVq7lLqNyMr/s5yNI5JucY
	Q==
X-Google-Smtp-Source: AGHT+IHf77l9AfND69btVe1lX8mlVsMkWU02V7BH21A3l88Gzesx9Loyd0MkDTayntUnGr66ErNR8A==
X-Received: by 2002:a05:600c:34c5:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-47d84b3275fmr231217715e9.24.1768211225348;
        Mon, 12 Jan 2026 01:47:05 -0800 (PST)
Received: from localhost (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5084:e327:623:5b2b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0e199bsm37403204f8f.16.2026.01.12.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:47:04 -0800 (PST)
Date: Mon, 12 Jan 2026 10:47:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/13] fsi: Convert to bus probe mechanism
Message-ID: <rwvoi4v3wcrfcbj2sg6mknlasp5klrlpacgwgl2jvwh6ub6vls@iovrqjblvz44>
References: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gulhdosi7vr5zgpw"
Content-Disposition: inline
In-Reply-To: <cover.1765279318.git.u.kleine-koenig@baylibre.com>


--gulhdosi7vr5zgpw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/13] fsi: Convert to bus probe mechanism
MIME-Version: 1.0

Hello Eddie,

On Tue, Dec 09, 2025 at 12:39:28PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this is the 2nd installment of the series converting the fsi bus to use
> bus methods for .probe and .remove. The changes since the first
> iteration---that can be found at
> https://lore.kernel.org/lkml/cover.1764434226.git.ukleinek@kernel.org/
> --- are:
>=20
>  - (trivially) rebase to v6.18
>  - add tags by Andi (for the i2c parts) and Mark Brown (for the spi
>    parts)
>  - Add a patch converting drivers/fsi/i2cr-scom.c (#8)
>=20
> In the earlier thread I thought I made a mistake for (implicit) v1, but
> I confused fsi with fsl and the problem doesn't apply here as it doesn't
> touch the shutdown callback.
>=20
> This series is not urgent, but it would be great to get this into
> v6.19-rc1.  With Mark's Acks and Andi's tags (though they are not an
> Ack) this should be fine to be picked up in one go by Eddie.
>=20
> As before there are two commit refs that should refer to the commit for
> patch #2 ("fsi: Assign driver's bus in fsi_driver_register()"). As I
> cannot know the commit hash yet, I wrote "FIXME" and these need updating
> when the series is picked up.

gentle ping. While my quest to drop .probe() and .remove() is still in
early stages, I'd like to see this series go in before it bitrots. It
should have all the acks necessary to merge it.

Alternatively, should I ask Greg (added to Cc:) to merge?

Best regards
Uwe

--gulhdosi7vr5zgpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlkwxMACgkQj4D7WH0S
/k6GiAgAkRS5olpPFZKwo4VTDgvbmksvaU1QbSMFn/TyV5Sa/8iUVJafCpS/9JLR
QD6bUHvbIFwaweQJDAyKbujbqu10t+mSKXD+j2Y3ZL+BoNb6Jb3OqvWkY0T3FCtv
V3/iv61qVcUJkGV503qJXp2wSF2Ktpq//DHF6VjDYGwUtXjeLQcWIK08CiNWK87b
CQl2kWQXAGDuJWss7/6EzaukWcjIlmeVHrSUB6zYEGf5g057po8Cv1jMgKrn/ibS
YEoVFtHskgwW7neXzzZeL7lszfTxHV/PZQw96O47PxB3nqucFG2SdQw/RVXTwhSG
S8/1GkvPICLnL+KkB9JxWxXqUBcD9w==
=0gfj
-----END PGP SIGNATURE-----

--gulhdosi7vr5zgpw--


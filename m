Return-Path: <linux-i2c+bounces-8318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC99E3779
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 11:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 250A5B2B424
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 10:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EC918CBF2;
	Wed,  4 Dec 2024 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="W2DrslDP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527218595B
	for <linux-i2c@vger.kernel.org>; Wed,  4 Dec 2024 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733307946; cv=none; b=k2NckYnWCiZ5iDCO5Kt5hwcQvR2kJP4Srteqc5iiL3kPE5KibehXBd3AByVw96YyFLKmBVzKJBip8YKMJ6SXqHKeoQRbzbHBKb5JfSBbDoqP1IrMGechKF1g7QXfaWOn3XsVv5UkRmYl6TCQ/cuICAJ620Pl+nc9cKMn5sU45IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733307946; c=relaxed/simple;
	bh=yIj9V9MbUxd+uEeYnXJKa2HrdJUVjok/LBo0v5525uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGOq9/0tLcotn6Ihe0dWvWwtDf6Kapg/iJrhoy+StCECP19ZowGPrt4KTpZ5o2gEYxnFJfEAwuoC1VJvWwJgiD1PULxax+/GbImoXWRmmKL0iqL35UDUuum3MmTP80wCNngRDZU01/AXO2PJs92sfVeMvOZvxdJNSfCRfcrxVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=W2DrslDP; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-385e2c52c21so2861800f8f.2
        for <linux-i2c@vger.kernel.org>; Wed, 04 Dec 2024 02:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733307942; x=1733912742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIj9V9MbUxd+uEeYnXJKa2HrdJUVjok/LBo0v5525uE=;
        b=W2DrslDPmsNJ3E1AIzOmpsD2hzDAC/XsIObvPnj8I/YCL/aRB3PasiaSrhiwNgLb0j
         rL1zPnI4sMXrwttqfaeRoTnpzctPl2j/c4EiSmzFS3Gcgc4d0oP0gdDRlgX05dCTC2gI
         r/kuWXdhv8sUTzRDQxdzEjC7q+3DdZBtSIx7UayyuF1j/lFOyoGnXAcQFTgDUAOEbHPG
         pGG4BCPH6rcdASYZjXprfw0EM0kauqolHyVNzsgHddjy7f7ZTS4i2J6UobELhR70K9Y2
         B0999pdMvzg4KoXsuRCAnXUi8dUKMWH7dsCigVXUShpSAJnKNYW0PMyka3fnfB926UqU
         HjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733307942; x=1733912742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIj9V9MbUxd+uEeYnXJKa2HrdJUVjok/LBo0v5525uE=;
        b=Qs3To1k8B9sBmsWxLcZXzxUGNksNX3bRvX8UcpGSgHNL+zyqi6Y6mqKMQZ8j3JW0Zi
         JHc/BoTvdAGV9s1uJGdnkBsL27CV+5mFWERJrs2L7i/l5usCWlroW/KFjsC2wNOrQV3w
         undO71IMSAoBndN9GcC/ABYQ4cOCILyd/J0aJVGFylEh2aJhGEZDj6idpFV4ai9SKBXv
         wMUa4akCiX3LEtHK4uT4s6xCmLBrnhztsU8Q5ohaBFu90fH0xoDYGTvT1VmA+HGAtPBP
         +YnxcQjg64PE5SXF4HQE/GbRAjVYADaPbhxg+/b/NXcr3+bu1fsONJG6bS5beTDbXw4e
         fczg==
X-Forwarded-Encrypted: i=1; AJvYcCVCrsK2Kapp1ESAWlSU1gKvZLMZAAUMdxtaqj/F5EmXM8rCltrhn/3X8dWwA8iKG+mSnFFfR4FuoH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdQpdwboeXw21+FgOslXRewhh1PRPUYTWxflir3k4kvbo4y7hV
	ouZ33Lo3n561U/MtIiAmnA7JIP6UHGkl9RcqoquUQBXhAUiZLF6zRH+SY6AAS1dWiAki4q/DG/D
	2VtBZvw==
X-Gm-Gg: ASbGnctnJykCsJCrFAZzriGtyKOLS6N62oZFw/Fiu6DXCC7b97A8OchjKCqQHKraW5H
	9n499pGizNQvFv7N/Q8FBJiIkvCB+yTEJtVKm1qvV6+gFjShvGYmO/0Tb2YXfRxFKpIRpZ1SmHF
	OM4w5AR60xHXLMytMU9j4POTlvv1STlntnGC/pPFkJEzUoaZyJDslOwNoPvbjveRPX2XjmacAeg
	QOp0sMcjWb8oFyg1fIx/TV19bLqiqBSthjvOEZSx7X3vDSrDrSgcYXekK5iKRU7uSZaGpXRdZkl
	ogdB
X-Google-Smtp-Source: AGHT+IGJijFhWBDbrvTPo7EblkC/XecEBAvzRxtenksDItAxC1gKqYWsSeo0smkJQhJRhrcVnlpV5w==
X-Received: by 2002:a5d:6d08:0:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-385fd3f2173mr4717442f8f.12.1733307942052;
        Wed, 04 Dec 2024 02:25:42 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b2f7sm19447215e9.1.2024.12.04.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:25:41 -0800 (PST)
Date: Wed, 4 Dec 2024 11:25:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <k75ryxfif2jhzb4b6ipkyxol22rt4p4uv4dquajkiwj5m5du6s@mxe2q7s2n575>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
 <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
 <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="euiwfkwusq7nsm5p"
Content-Disposition: inline
In-Reply-To: <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>


--euiwfkwusq7nsm5p
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
MIME-Version: 1.0

Hello,

On Wed, Dec 04, 2024 at 03:23:52AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 03, 2024 at 11:46:07PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
> > > On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export=
=2Eh>
> > > > is included. So move the define above the include block.
> > >=20
> > > As in the other email I pointed out the doc says that we need to unde=
f the
> > > symbol. No need to move it around.
> > >
> > > The only requirement is to place that before any EXPORT_SYMBOL*() we =
want to
> > > add it to.
> > [...]
>=20
> Perhaps we need to update the documentation first.

I addressed that in https://lore.kernel.org/all/3dd7ff6fa0a636de86e09128601=
6be8c90e03631.1733305665.git.ukleinek@kernel.org/

Best regards
Uwe

--euiwfkwusq7nsm5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdQLiEACgkQj4D7WH0S
/k7uMggAhleuC0ILy1tF8No5E6YLBfrxMyaF5nt2nsFnQD2fAx50vczcftVJYRdJ
ZrAtXNn5yUmRPhuvXaV3g16FvL+LZTjRrg8VhpzN5Og2YX9q+FGmFHUnyeBZCgEP
D4LiaqvtihTTlsvjUI5I6osLKzkRAxMHM4ZSTFcb2ZqpB18470F9gDW0UZ/Ei02S
flMgsQPGVwSt+la1xZ4PnHzifZu8BMPfj+Kfmyoleqd4jJdqbES8YFlskP6udx6J
JH0UDYJ7HU1VNVgweBQRUkag3YOfEuVm/3nrj5mEP5sUwGeqP8it6cf+hAyhxKAG
Ym7ipR8f6iL1e2MKN3cD8Ep1tNMbGQ==
=mMRg
-----END PGP SIGNATURE-----

--euiwfkwusq7nsm5p--


Return-Path: <linux-i2c+bounces-10821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF0EAAC1C7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EAE53A6310
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 10:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0C1270563;
	Tue,  6 May 2025 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VALaqXbB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603C15573F;
	Tue,  6 May 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528984; cv=none; b=CCUmG4yLhMTm9s1RwrgYo2Ogenk+uZrcQ9ITnLD0fXpz4prCISRc14YtMjPGXHf2iwwwTZT9lht3FuqxeC6ktn/Cp4yvbbPM3qFfDxxGEP6IEONFyHP2wSaAXLVT7QK3K+MfzZ8REwCvnb3nv1ytBLstsf7r7z8xUgKI9wM+Uf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528984; c=relaxed/simple;
	bh=GA5ZpnID6igHQeFhaVM1Qu7EkyLsdryND2TVMd43AxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBlSvc4nbWhoEgVx4eMct7sA6NdajGkyTSv2WZO1RGLdVreYHmHvSHnbnLhHe7Ko3htE5d2e7sJ84T3VsW4fmNhQjYt4rj5quWnNOI5wfmQu1CRz72H3pMAWVEiFo6NOquPOSA533sle8xI+AynwyB9llrflctmIrZmbnNSfid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VALaqXbB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9B2C4CEE4;
	Tue,  6 May 2025 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746528983;
	bh=GA5ZpnID6igHQeFhaVM1Qu7EkyLsdryND2TVMd43AxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VALaqXbBU21GEo0EF59CUDy2Om4a8W2Evcq19YuXW2QWIqMGomanWGf4NUFTJr8T2
	 wG+Wci8SxOAIHoxeaAaGSY8UTI9vi6Xvr6TLXEFRxgwMx4Lag57jrufY9h9uLdrQR6
	 kVLbbyjhGN9gdxcHPaEcEJvDA+l+bznyxUNkh60+7A0E9L9On7mxTyTfSGqDVzHuOW
	 DLczOE9pKHZ5sQLOHMCc/tAHR+z4vM3q0SCFx7OfgDimZL0uRvQkPth5NoyHUNOg+G
	 DLfwDsaXsPLz8AjoL9HsKQXxss6+vpkCNN1x7ZMp5c2xKUGkbnhnfLqZptF7jGST44
	 GOiQJRPTXczeA==
Date: Tue, 6 May 2025 11:56:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-i2c@vger.kernel.org,
	prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-corei2c: add smbus support
Message-ID: <20250506-bunny-puma-996aafbf3f56@spud>
References: <20250430-preview-dormitory-85191523283d@spud>
 <3421bf4a-afa1-4b4c-8421-bad7187d3d8e@quicinc.com>
 <7q4gdh3jcbnsptmdv6fywnwqta5nekof4wtut35apw5wphhkio@veeu4ogcm44h>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="20FjOMVKKGof8BGx"
Content-Disposition: inline
In-Reply-To: <7q4gdh3jcbnsptmdv6fywnwqta5nekof4wtut35apw5wphhkio@veeu4ogcm44h>


--20FjOMVKKGof8BGx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2025 at 10:04:27PM +0200, Andi Shyti wrote:
> Hi,
>=20
> On Wed, Apr 30, 2025 at 05:06:09PM +0530, Mukesh Kumar Savaliya wrote:
> > On 4/30/2025 4:53 PM, Conor Dooley wrote:
> > > From: prashanth kumar burujukindi <prashanthkumar.burujukindi@microch=
ip.com>
> > >=20
> > > In this driver the supported SMBUS commands are smbus_quick,
> > > smbus_byte, smbus_byte_data, smbus_word_data and smbus_block_data.
> > >=20
> > Write completely in imperative mood. something like :
> >=20
> > Add support for SMBUS commands in driver
> >=20
> > Add support for SMBUS commands: smbus_quick, smbus_byte, smbus_byte_dat=
a,
> > smbus_word_data, and smbus_block_data.
>=20
> yes, I agree that the original commit log is a bit lazy written :-)

I don't personally think the suggested wording makes any meaningful
difference, but I can rework it if required.

> > Also mention below limitations here .

I actually removed them from the commit message, since they're not
limitations just what was and was not tested. I can put them back too
if that's needed.

> > SMBUS block read is supported by the controller but has not been tested=
 due
> > to lack of hardware. However, SMBUS I2C block read has been tested.
>=20
> Smbus i2c block has not been tested? If so, can we leave it out?
> What is the interest to keep it in?

What's the interest in adding any feature? Someone might want to use it.
We did not have a piece of hardware that uses it, so didn't do testing
of that specific command, but a customer may well want to so we included
it. Again, if you think removing it is the play, I can do that.

Cheers,
Conor.


--20FjOMVKKGof8BGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBnq0wAKCRB4tDGHoIJi
0jdYAQDoDbL9wfGYgWjhpFIl3U1CUgwFBkvgTqNVU9pISEKhaQEA2HL2vRmyNiuE
NhfTAbHkN9decclgXBD3bNvp3uUdPwY=
=X6gl
-----END PGP SIGNATURE-----

--20FjOMVKKGof8BGx--


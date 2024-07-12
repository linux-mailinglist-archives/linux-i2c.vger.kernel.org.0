Return-Path: <linux-i2c+bounces-4961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB592F8A3
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB8F31C21A99
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC65143753;
	Fri, 12 Jul 2024 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G6W35PpB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC810F7
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720778701; cv=none; b=LKMIEQ+rK5yXklCYmp6NW/owCN0lFKBuMhlx8SBDBsSnm3yzpdWrUxHhTmRcP4KFMQU1xyGE81oqe2bUgyFlABQt0vugdrJYY/F4qrNzxruKtmxtgAxwThMWabzl/tYIO3bQ95rIVD25Tc8EJjhwa1fb34Bzq5jJYUyL+Qhu59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720778701; c=relaxed/simple;
	bh=KeU0I2xuAiEYWRk8K4R+I7PbimtqwIOMf34YjXKiw50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeHb+m6gFh3FIPYJitTYWpGacXO0CsbcIJIdaALwXkjK0ci0OQx4DJvGmCHzUc7INBE0kCNRP8hXXX8GCOJK/CVfXOsLxS2ZvCt3khH34OiD4fsdojQ6tHETrT+ukcrA/rBnIU9ysBwioF6THOySQbPWcrYLnQxQDxZffu791Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G6W35PpB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KeU0
	I2xuAiEYWRk8K4R+I7PbimtqwIOMf34YjXKiw50=; b=G6W35PpBY5gqG+rQ/7Fi
	tC4MZAFB1qaRPd4nr2r5cIsyiFuK7JCFc5TOXsZev7LMxQxxatovsfTCrPCVT1bW
	BWltSLgRLslWLUesEoYI7/uMs453OVd7I5Jo/+Pe2MSJfHEi+kGypXplcSg8MhLw
	BIfoR4K+6685lgeAorbUb4VjUICoZZCDcF7KsdSr4SuXQ328oqKok7X1TZA+SMiA
	6Lgb5gj/K9TzTIFwRzTFOjgSFDE9XIaJlR6wOj/52bL614Cw5dlrkN51L4jOkec8
	QwNf8TDw+uiDjJAQMBnPvORJvqYkNXCNZaycCJeu4UHXONiWD/yqOAl5wb33ZtG/
	Kw==
Received: (qmail 1117777 invoked from network); 12 Jul 2024 12:04:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 12:04:56 +0200
X-UD-Smtp-Session: l3s3148p1@IgvxAgodQuggAwDPXwmZAIsFIv4n+Dpm
Date: Fri, 12 Jul 2024 12:04:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-i2c@vger.kernel.org, jdelvare@suse.de,
	thomas.petazzoni@bootlin.com
Subject: Re: [PATCH i2c-tools] eeprog: use force option when eeprog gets data
 from a pipe
Message-ID: <ZpD_yK_g4DMNWIxq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-i2c@vger.kernel.org, jdelvare@suse.de,
	thomas.petazzoni@bootlin.com
References: <20240626090833.356666-1-thomas.richard@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LGJsvIIYVk54QlIS"
Content-Disposition: inline
In-Reply-To: <20240626090833.356666-1-thomas.richard@bootlin.com>


--LGJsvIIYVk54QlIS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 11:08:33AM +0200, Thomas Richard wrote:
> When a pipe is used to send data to eeprog, the force option shall be use=
d.
> If not, the first character is catched by confirm_action().
>=20
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks, applied!


--LGJsvIIYVk54QlIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaQ/8gACgkQFA3kzBSg
KbaIaxAAhxdDN90uzxSLRiUkv4SBy2Bdg65SHR90OtThq4RmbJTXSq3q9s5d2Ebs
EWb2cgQu3Y7Y2gojww/H/pxpFvBp90CMhoeKuRENJ3FRbin++lkiHSy+vzi2nFDB
JT02JmX3yex2HDz0fTcuLNozZrpkcArv2vQ307BWfVC2aC+H8S1wDc6A2p4KszTV
hcWw0rg7o373J8dUhdNP/nrH7CLprx/jd85sq01uNKBptA0Snh6viRBBA+I6Z2HJ
7l1xb5etr3mPI4Pnb0aTwgK5u/1WSIzFWQLCoHP0+xf8PwYnFGNO6l1VJeKguLS+
eGiIK86DT3pChKGkM8BPDFEwwqIhqZnowLPth66HDFFWESWAMs7AMTwfokDb0Z4f
sfGcgqeWssfCQaIFFQYS/2YxLb6vfVWkqyrMJHb2XokxqUpBrUuvPG1urDngKd/C
pkCSLg0Z+kV47nVWh2dHNHs2Bn8wzMJv5eRS08zdliBSl7+OKEXMMqHsOMUI4qVb
qGwUIpJ3iCCfRlTCLO6kL+DlBNL8wiKo9t5/LScOlCWr48amYAlD8WwCRfkfy4AN
dLdoZ7zQTkW2C+FAvHfQeyn/htr6QgTT6utGe3tDUSUhJkWQQPLTt0AISttPD40g
tkIdTaaQqwrHTwtQlvXuG0X8QuemgkVRngTGUqzPjfd4Z/2Px6Y=
=WD5q
-----END PGP SIGNATURE-----

--LGJsvIIYVk54QlIS--


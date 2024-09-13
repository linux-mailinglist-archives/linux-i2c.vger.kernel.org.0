Return-Path: <linux-i2c+bounces-6724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8397873C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DA971F2143C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 17:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA94484A57;
	Fri, 13 Sep 2024 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgMo7YC2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D058F6A;
	Fri, 13 Sep 2024 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250025; cv=none; b=aKg4GwIDEo/BRsxa2d/La8D/9FNF3KMQ71QOuKaLZPKVtQPkpnpE380xVralv2wQmO99bY2ttFgm7yBl6SDVDo1MqR7YKTS6RzXtug8t5P6lwLZavzVTO8NQGow+fnx+hM8R2qV/8CMbU4BranOb3hsVbFTFl/iqwRZrlhLUWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250025; c=relaxed/simple;
	bh=dF4UvyQtVTZgCLe2Wz+2rrKiqMSg3aXnfOSK2lhFzLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhO104YRmfw6PAd1z4LPdD8P/XnZRA1yMFkUvYPRi6f5fVNkL0i6Oz2Ycah0xe5nwsPda8GKJZYk+MQSi0goMW5sNSBg2IuzIZJe3bX+UA2pf1D4xUGQc8nyY13alc9k2O608QUt8cvnpiYb0knse9/7kjS+6OthTCZfFV0CApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgMo7YC2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6911C4CEC0;
	Fri, 13 Sep 2024 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726250025;
	bh=dF4UvyQtVTZgCLe2Wz+2rrKiqMSg3aXnfOSK2lhFzLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgMo7YC2ckDMwBZsN3oddaGz9KR+HcOXi8HK3oNr1dxTF1SGa6aW+xoKdJ2k8Gkid
	 Dq80SdmiO2UtCC9QVDjmGPGdkajjvU2MPNUhB6Wj3o9owrc1GjskuzEY+sAeXwjk7A
	 sxEIWE7Id/hVdchsuME6TJSrVlYm55gBViZhhtwGlJ64x9lyON5rnjfdKz8gvd184L
	 gGrw5KB3RppdTPQQ0SuOIEi5EDhZuZmIfEo7Vru39ZqrmELuhQ+NFbzBPzvfIFu8wZ
	 Y6p5sEWniX9ar8pP8nA8Rau94TiKoDEMOICTtFhXLRzrvPx5jyCkX3axfQvCUaJsgV
	 dTs+eJ+LsH7PQ==
Date: Fri, 13 Sep 2024 18:53:41 +0100
From: Conor Dooley <conor@kernel.org>
To: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 0/2] pca954x: Add DT bindings and driver changes for
 reset after timeout
Message-ID: <20240913-retaining-require-59ff15d696e9@spud>
References: <DB6PR07MB3509B9378807A7968E272D959D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lzmOt9CzUvTyDX9b"
Content-Disposition: inline
In-Reply-To: <DB6PR07MB3509B9378807A7968E272D959D652@DB6PR07MB3509.eurprd07.prod.outlook.com>


--lzmOt9CzUvTyDX9b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 10:36:43AM +0000, Wojciech Siudy (Nokia) wrote:
> From: Wojciech Siudy <wojciech.siudy@nokia.com>
>=20
> The pca954x mux might not respond under certain cicumstances, like device=
 behind
> it holding SDA after recovery loop or some internal issue in mux itself. =
Those
> situations are indicated by ETIMEDOUT returned from I2C transaction attem=
pting
> selecting or deselecting the channel. According to device documentation t=
he
> reset pulse restores I2C subsystem of the mux and deselects the channel.
>=20
> Since the mux switches using transistors, the failure of line behind mux =
that
> is currently conneted prevents sending commands to mux itself, so externa=
l reset
> signal is required.=20
>=20
> The following series of patches implements the reset functionality if it =
was
> selected in devicetree, beceuse the reset line might not be dedivated in =
some
> applications and such reset pulse would break other chips.

FYI, something went a bit wrong with this series, and it has not been
threaded correctly. How did you send it?

--lzmOt9CzUvTyDX9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuR8JQAKCRB4tDGHoIJi
0qTxAQDbx1zjAQv/JN4Izv5B70lr4crUplxACCkqRG1gud1MeQEAjE2GTx90mYoZ
CAGT2YZ9m5GmcooJKoRcKROtgL4tAQE=
=wwuu
-----END PGP SIGNATURE-----

--lzmOt9CzUvTyDX9b--


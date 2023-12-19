Return-Path: <linux-i2c+bounces-872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA10818B26
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 16:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE97B1F23876
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 15:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4731C69D;
	Tue, 19 Dec 2023 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buhQIoJL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6471D522;
	Tue, 19 Dec 2023 15:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2E5C433C8;
	Tue, 19 Dec 2023 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702999497;
	bh=Z5r2iggyiWlPUAZbWAbSjId+ThoZdOn1YxqIEOkmg14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buhQIoJLeN5iHjaWohjmRrk5VWSZn6oA5JdwE633t2ZsQQzHMnDODzR8dPHY6nJ/G
	 DFhEnNXKtocvSZVUCjyIoAq0by/qlC0oZzasjUvF2s1d1pUj+1SfXaRr3ZG3A+UtIN
	 ZNmZqPw+9mz3ej65InMoq8E4hBPk9PaNcj43YVJac0e3WGbLTCeooBW1Cr16ip91lT
	 AfgNXB/gKnnY3iPAx1exxOuTJHsT09D+l/LU8ZxWT4jIy/ixOEtWD4x+9ZQO6UGshB
	 iKfjHWl8qGtoda1kXtVu19iAo0CgDkdSZPbOrKT0kja7UOHzsPq30wWccubUf12gsc
	 jN+i5oI61hoYg==
Date: Tue, 19 Dec 2023 15:24:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: wsa@kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] i2c: make i2c_bus_type const
Message-ID: <2512ee2f-05ce-4496-9ac3-f3b3a2e4a6b6@sirena.org.uk>
References: <2023121942-jumble-unethical-3163@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="afW+xaqZsOSbFAHv"
Content-Disposition: inline
In-Reply-To: <2023121942-jumble-unethical-3163@gregkh>
X-Cookie: System restarting, wait...


--afW+xaqZsOSbFAHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 19, 2023 at 04:22:43PM +0100, Greg Kroah-Hartman wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the i2c_bus_type variable to be a constant structure as well, placing
> it into read-only memory which can not be modified at runtime.

Acked-by: Mark Brown <broonie@kernel.org>

--afW+xaqZsOSbFAHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWBtcIACgkQJNaLcl1U
h9AWBgf9GIWnQ9OsLWyHoQ5nwfN1rt2XudsksR4RCKj8rPvwWV4xiTJr8Iwyp5Bx
uHkUb0QULlGDAZmPQwWIeuEq3QlFMuc1K7ohvPcPhOdJ8ecvhmNdh9lha/whvlK3
S4XnAlWBg4Jq4g3P6y/C3y7nnIzIbY0K/9uN8HfuGqu9fwo5gXkof3puksGa5ghB
s3t2PrpYTByhEbroKX7SqMDhtAqLwl2yGbOICXka4zQh3ynthlZ3ycPywXf7/Hvx
BPva1UzeezeEiDGSKhMvPbMxWh5vVMeoEkQEYmDZRAoAEd522vwZmob8Yawn9Bn1
Ex2gRrHzcFRCr3D6s8U8hBe32grcLw==
=PG7I
-----END PGP SIGNATURE-----

--afW+xaqZsOSbFAHv--


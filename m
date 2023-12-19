Return-Path: <linux-i2c+bounces-864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA775818724
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 13:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8C91C235AE
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 12:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00934171AF;
	Tue, 19 Dec 2023 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXZM3VRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B2118E09;
	Tue, 19 Dec 2023 12:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576A0C433C7;
	Tue, 19 Dec 2023 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702987990;
	bh=SRbJeb/lafoOVi38gDCirQ380OjOLL/YF1Vy1K7bXbs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=GXZM3VRuQRDhB+YjCDHplLpulygeailXQj/l7EahCLNnNk7S6KppMCFMW2fQW2Bc+
	 GcdwFTwVjKX4TizCFWGbEFjhPABemIsovIRk/9SiZMLukPxTVys6UiENN0lR7tiOb8
	 a9ruGNtUM5/WmEJhwBFNZxld+BDCZB93sJriWcgngwFfqejwkr+J3qHbebOyAUrOgE
	 VYC8IB+aPNfjqjOA1kwb82buy1ri0Sg9pNeCwqEzhV35pN//kkPi+5XctkppdXAUEG
	 nvBOahCweOHynS+ItfAfRfikVX9COGenUtcKajvvt7MIzGVdn8AyHqhffi1VBLELm1
	 oHwIdXdqzZWVQ==
Date: Tue, 19 Dec 2023 13:13:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, intel-gfx@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: Re: [PATCH v5 00/20] remove I2C_CLASS_DDC support
Message-ID: <ZYGI0j1sQKWHyjgF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
 <ZV/FNWfw0jdXSglr@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfTXMlsJedlWZlXe"
Content-Disposition: inline
In-Reply-To: <ZV/FNWfw0jdXSglr@ninjato>


--nfTXMlsJedlWZlXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I created an immutable branch for this which the buildbots will
> hopefully check over night. I will reply with comments tomorrow when I
> got the buildbot results.

Applied to for-next, thanks!


--nfTXMlsJedlWZlXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBiM4ACgkQFA3kzBSg
KbbkDhAAlu3skAFMgL/czpyvc8H7iWxUzDlW5sljLuKQm3A0YXwBnsqjJmjCb/LG
H1zt31+/vygKszONX+ZtYzzzYxxeM0SE/gnaHdlexO6ohMXRdfMYF21WGwJVGLKq
iIVKhcRRxxWrB/mrgfv3s7tzBpM72r8xdOXOv72gEy25axtKmZu1B7G0UDxsRgoY
eX3bNKQYB/fL2JNR5htEUCW7ZfWIpGhPIPEjuXmIKgQOKgK97h1QpsADcftbHMpJ
NRulrstcOPJpZPvA7fpp9B0AIc3sLcA9hMR/JmGSzfZ/3ToGTXqfUAgH6mxbvWrf
Uf7HbOyyNFj2a03qHgQK6E3wDVR+rZ99v5fCriroj9g15+K2Paw5XOWNrode1NiO
5dal0ykGNFWh7Ru0TnPy0l4ouVmI3GwBAB1fBek3mSG1PpTzw2cIvIrAW8fjzEuu
xTQMjD7D8UPyE7yREFir6azghFNinIYPanaJyWycB7x1lYfwy8wbDlJNIaiWrDd6
lOSjG3iZ1XSY9LC0qibZo3vSGWFZfVjxSAMOVtsKBG3mTakCp2me/WUZDowtowhl
siROJjd87lXAh9paay6AV+KAAc4WYIQ3wzaIT8Kabya0A3aQTPh5f11l8SKfimeX
mOlNuwam1yEf3xbXUcqBnOUMQ7wewOU2tB2/g2pihA/Y0B6ZrLc=
=W3AE
-----END PGP SIGNATURE-----

--nfTXMlsJedlWZlXe--


Return-Path: <linux-i2c+bounces-134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00807EA259
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 18:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0563E1C20942
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 17:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D41224FA;
	Mon, 13 Nov 2023 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIjkaZQj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30EC224EA;
	Mon, 13 Nov 2023 17:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4991AC433C7;
	Mon, 13 Nov 2023 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699897796;
	bh=OlVdpAafS+/TnL2gNZWocfkiT+WXch7O/Gj4jH3CWTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIjkaZQjXatW09ZeXbTIPo+q5RrNWjCsOk0HG3uQ9jZx/Jj/JwWg8masZL8QKT0ZZ
	 WQhSyQhVc2mhkpHTByG3kY/lTylyhO+Jz5Xe32ZS4JAfPZ3uZEtnt2UfkpAMfVaYra
	 Z3MLkka6LfZyMsAw09xuTPN7X38dJDuZgUxM5ddajimSmVXShqJDnkUemjsy82m6XW
	 kfYKsF2y/34lhawChlHd8v7/XDDz13zS5JPzIQ0wGWvUiEcJxhx8/E8P39xxN3f2nj
	 yON8dcggobGU7B0jvYDgW8cWNd2lF2xwMBQwNELv/PcH6ryjBoTuxjmxRgM7bnhZrW
	 B1cIyTJrNKMmw==
Date: Mon, 13 Nov 2023 12:49:53 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
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
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
Message-ID: <ZVJhwSS16+/Zzt0f@shikoro>
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
References: <20231113112344.719-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zxnb7iIcQAl5ewYC"
Content-Disposition: inline
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>


--Zxnb7iIcQAl5ewYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Preferably this series should be applied via the i2c tree.

Are we in a hurry here, i.e. does it block further development of the
i801 smbus driver? My gut feeling says the patches should rather go via
drm and fbdev trees, but I may be convinced otherwise.


--Zxnb7iIcQAl5ewYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVSYcEACgkQFA3kzBSg
KbZH2w//eUnZg+R48cg2NHPwlDqb/Y0KJdo6xOk9tXkaIu+sNP9+GauuCw1EMTe3
AIDZoh7pkBamF2ZsoBRIOQOkzRpNj4bN+2L9mbd8SrPSpxaRa8jU3E1prJ7+/NS0
FJUPmwO6XA9JCOmTtkNvivsp16QjSQfVE+UjbBT0qH0+lKo6RQ9PDbwtIdkmzVOZ
vGvEqYzOpUB9UkUekEYESgJ/SCbm2lm397qC+d79JXapjDjD8AZliufTjd/jiOCG
MTVbm6mw9CPGThQsyNd9bjUbaNnqyoz3D0SjxKUG3NPlEYy9uigCj853+J56xO27
JjENHBt0RFz/oPHWpKko6kfMaDCS7m/aNnETGRuZ4fHBb6rviz/3EGLWYc0HoRds
6kw7kmMfmh4T0ZMERMDnRsgRiLHzueUujA9Uhh972jiX62CCaWuSjQm/s6lXpAzC
TT+UETbrdSSX6IJN5eP4E9Rg6ouyKxWGT1N+B4/NPMEjPUfzMFQQgna0ph8aHNcd
JEI9d/HAUvjvf8tQwo2+1UajwmmX1Yf/C905CT+IGqOLF21LsX7B0zoXELDRsPMD
ISj6RpuOXI0jhWV6YPlFTA8pFvqvG+lFfpP6kW1VEkYnXMwSbp+K8aN9bcYITWeH
4OB/vXxnxxEtQ8CgH6yC+jwJWW6jd7KllJQjmD5qi+F4xxOCzwY=
=fxbp
-----END PGP SIGNATURE-----

--Zxnb7iIcQAl5ewYC--


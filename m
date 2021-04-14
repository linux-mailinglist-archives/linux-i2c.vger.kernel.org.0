Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B9635EED5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhDNHy1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 03:54:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:37224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231773AbhDNHy0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 03:54:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8515601FE;
        Wed, 14 Apr 2021 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618386845;
        bh=softkseoAUjSpfEYL5jTXDTAaQzfx1q8W/S1QvzexdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nAd0M7Ghe4MpoE/UYqEqLI4Yqu+L7uf0vZSf79kF9Xvi1dW/74tN6M4X48QilRwTs
         XOFsssOjSte8LARsOtr/OXc0PWTx4L2mhftu4t5rSwvjUQm+fztrOJK2wDgQZ7xoa1
         aj2KNEQMCxQySGu/thro2BJtSioSIlmgQjtE6wPOU+d9z3ZYjlejzClrPz++Z0oq5r
         i3tTMusCcJSyDDiPxgA83aAqjibqaoHNz7C+D+QHe55hREAOiHYwlc0FWKuwbdc27I
         ekVByzbArRbTRo0JEG0ALnYICKISnB3Lq9FzA/Px+OgrEaIGwdGPkUlcxKNNAXMcmi
         V7iLOVwdEuBGQ==
Date:   Wed, 14 Apr 2021 09:54:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Tony Lindgren <tony@atomide.com>,
        Vignesh R <vigneshr@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Fix rumtime PM imbalance on error
Message-ID: <20210414075402.GB2180@ninjato>
References: <20210407033030.13419-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
In-Reply-To: <20210407033030.13419-1-dinghao.liu@zju.edu.cn>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 11:30:30AM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() will increase the rumtime PM counter
> even it returns an error. Thus a pairing decrement is needed
> to prevent refcount leak. Fix this by replacing this API with
> pm_runtime_resume_and_get(), which will not change the runtime
> PM counter on error.
>=20
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Thanks, yet I applied this series now:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D217733&state=
=3D*


--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2n5oACgkQFA3kzBSg
KbbBlw/+KCP1394QbnoxEQGcMIhDmtwcitwfT54WE700oJeB1WtGe3RzHA5VGVw2
IxgXsHdHkq5VNKi+xZvXBiddrxuogegsRQQpOcttdfWpUclOCDoxfSgWbFVN7p9+
VoNYezUGHnnwP0GIZyfaJLT0yNM4kotK3ye+sNVA/YqUXlXQe1dSemksXi5HtCGJ
90GoYm6VNUlgMXC/kDUZojFvkBV1FNQtt/lpvmNNCDcIrUSA5P74M1Y7QPc67/wy
x8HoN2vlOC4yy3nConWQGDjQ4CuGgtEbqBnuomvyAEExkaYUIiuqyyDPm6duAabK
p02JT/SKoe4pCPO3fd4OzpUsLbOiIUIVrZA43f2O05EGMEe5wYxtw7CFZY0iYLhf
GDygfBF1IhGxWB6NXQawjuQ/Ot8mbQik6IYT4loBPLqeUiMjdnsmhUoLS+fhJzSk
YlSQG73g7ukgs0H6j8k+a70+/GKkkuiiKf0u1h4aBb2wi4qJLmDPaoaXme4p2gDN
VJZTTQgTwoWmWwVFWDr0KfBVOWfOkTUyebwtrIs0m2efjOrqrcEyA9pAb/IlwR/o
X69dOX7d5ZXlB3YmDC79l2wcAFWJYKucEvPfB97Z6WX5uMfgAG5+ZNm/iAYo1rx6
nUMWBgP0A5TIfImCgW0rTrtRsR+qEfIs6CZl1EfSrS38VZwyVXA=
=gj+A
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5FE46158D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 13:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbhK2M5x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 07:57:53 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41162 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhK2Mzx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 07:55:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09F3CB810A1;
        Mon, 29 Nov 2021 12:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194F3C53FCB;
        Mon, 29 Nov 2021 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638190353;
        bh=c+hJCgT7nD8Aff6H/94yNwkxSoHUS9aZu/eXKfvl8y0=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=F+SCY/Ud+cOzAn4K76jOmIJ0tCSY55bJL7O4fAog9ys9SIBlonxACgxm5vDQ3XXN6
         e2fRvqkSzdDXJSD2wnfit8fnIM1qWgrOwDiTXPImFCDnzqD65aU2yhJe19L3f1xGn9
         Ogh4KPSftMKimbA7s3ZA6lJZHlEDTCPZo+v1XoI6W6rQkTzo0bBVtTbm+nDXx3L16a
         KDkpec0wwLbf3MxniLust3ItZ13aNPoB8/QvfdEgAJ9riOp0rp8EIeQ266G3yLX+Hy
         M8Y9Gjz/Hc1i1/DTfGikjl0g8HO2P8RcQMyx9erNHwyfWHKws6YWJSbxs7ZJXE9swy
         nv1Xi07lDd7dA==
Date:   Mon, 29 Nov 2021 13:52:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 2/4] i2c: stm32f7: recover the bus on access timeout
Message-ID: <YaTNDq7rEyQIopim@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
 <YaTE0f9ciy5JRZ3Q@kunai>
 <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5hCTBkD/yBfPADtw"
Content-Disposition: inline
In-Reply-To: <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5hCTBkD/yBfPADtw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

> > > +		stm32f7_i2c_wait_free_bus(i2c_dev);
> >=20
> > This does only a controller reset, not a bus recovery with 9 toggling
> > pulses, or?
>=20
> indeed. I might better rework this and at the same time introduce the
> bus recovery mechanism via the bus recovery callback in this driver.
> Please don't merge this patch and I will rework that.

Wait a sec. Resetting a controller at the end of a failed transfer might
make sense if the controller is otherwise in an confused state.

Full bus recovery (9 pulses) should be done at the beginning of a
transfer when SDA is low, though.

So, I'd actually suggest to apply this patch and add full bus recovery
based on SDA low at the beginning of a transfer seperately.

What do you think?

All the best,

   Wolfram


--5hCTBkD/yBfPADtw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkzQ4ACgkQFA3kzBSg
Kbb09RAApgWh5w47oO8V4rNkg78h6Cf6iocL3kiEtiG6Gxgcl/INGRIw02rb0eUb
iMfzC1fBQsdhA49WMXjKTaQ3Y/wcp2ecs7j5IF82NuI5S/zYIuuY2OIMcipfh690
UyDdz/5Vkm9dVak14Joaqm/zPhZuyJiIjq/4ncRerM+lfJ2ebS6yVFyAPwd8/No4
M1Vdtz4HG0gL6GIqO4nYOpk7rVBWGxIQaE0FEU9xCB7T8lUbolSdRKPrnhh7E1qx
NfzvvI1+ANmBaPjOD3ITCqW54wWKPhJJmU+0ymuho0qFHwzqRJvJwS/AvPwNxIRZ
/nsgxX2IVT+eL1D8YtxupdIB5o7JhvsuWQ1TlCGmnNpGTKxdNhwtwVMxqPzu+rS+
F14IZTvcQz0eiYu5s+7TGB5l13RlYsI6RT2cw9J0vniY09uFePDxd4xoe4T2l6ca
994KrTvxgJbJM6Up/A9DDbLUJerAbI1TV+rp6VTGH3fOHEpthkw6g+WZwHQgN18p
eW4RrkfKOyhrkMOD66msHgsnc6wcCMatzdWq5oaLkimFAloAtv2Lv6+m7UG+6A6d
X4WPLE4f6OB/RnrC3ntAJGq7mNygj4CACoMJTSSGuDFrmYOeSAaR3lmLFVd+7Mzo
LMdaovdObwqsZgvVyGHQTF7nGRbIlb5zbrP0MgpT9y5fadY8QLc=
=DxgC
-----END PGP SIGNATURE-----

--5hCTBkD/yBfPADtw--

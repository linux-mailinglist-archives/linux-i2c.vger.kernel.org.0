Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7788E275CE5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 18:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgIWQIe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 12:08:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgIWQId (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Sep 2020 12:08:33 -0400
Received: from localhost (p54b330c5.dip0.t-ipconnect.de [84.179.48.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37618206B2;
        Wed, 23 Sep 2020 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600877312;
        bh=an17JaWyOcVvUP7g5g5wS+0ARVwPjrcA8vaDrV6hcwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pcjhw9splOjCesdaHdVG8sQLjOsqYHW5f8zq/dkndrMOEgiXsoYyT57vmkz3ve+WV
         +JT8SPqeN2NecwM9N8HAjpEiAPc2rJjd83QxQNfr+Yuy44Y+yUuBeY1FIfsErQ3rrt
         hzO7jd7WnL3xqbtru/bVyFrG1PJVOxsv6bzeTwD0=
Date:   Wed, 23 Sep 2020 18:08:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     nicolas.vincent@vossloh.com
Cc:     jochen@scram.de, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cpm: Fix i2c_ram structure
Message-ID: <20200923160829.GB6697@ninjato>
References: <20200923140840.8700-1-nicolas.vincent@vossloh.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <20200923140840.8700-1-nicolas.vincent@vossloh.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 04:08:40PM +0200, nico.vince@gmail.com wrote:
> From: Nicolas VINCENT <nicolas.vincent@vossloh.com>
>=20
> the i2c_ram structure is missing the sdmatmp field mentionned in
> datasheet for MPC8272 at paragraph 36.5. With this field missing, the
> hardware would write past the allocated memory done through
> cpm_muram_alloc for the i2c_ram structure and land in memory allocated
> for the buffers descriptors corrupting the cbd_bufaddr field. Since this
> field is only set during setup(), the first i2c transaction would work
> and the following would send data read from an arbitrary memory
> location.
>=20
> Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>

Thanks!

Is someone able to identify a Fixes: tag I could add?

> ---
>  drivers/i2c/busses/i2c-cpm.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 1213e1932ccb..24d584a1c9a7 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -65,6 +65,9 @@ struct i2c_ram {
>  	char    res1[4];	/* Reserved */
>  	ushort  rpbase;		/* Relocation pointer */
>  	char    res2[2];	/* Reserved */
> +	/* The following elements are only for CPM2 */
> +	char    res3[4];	/* Reserved */
> +	uint    sdmatmp;	/* Internal */
>  };
> =20
>  #define I2COM_START	0x80
> --=20
> 2.17.1
>=20

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9rcvwACgkQFA3kzBSg
KbYHIA//V7lQwDovwcbA5CXxljKHwr0KVgCuBYLvJQytcDn4O8unPLoB6G5OWCsw
RgrrEIu346XQYrTsKqAtzkUmAmCZ/kzaARBgnFvsdz4vx0Cv/5LT//aKGM/n565o
ERuDfgMbjjki4ItZa+jDc18kj75lkLLpS06SerQp7kbqvtyAgL+jpSYHnbg4Qql7
MGRvCovoEAqjmEbs5zh/vqBIwsK5ytI3U2cpea1ymFxoPAMv62DOKX+EVMlm/y0k
K8v1psq/bn2jq5pgWcc6+/7hZIA1Jt4KHOpIZm4ywOF8HY2pzVRdt2B3Kd24NKiD
OSKZ7LG5JeuhDdoBKcH6RPfVHBbZuO/bt7tEdp8IA2fYdulExyl3Fu7V92IDVaIJ
0tjwvDO4MZOi18niOwHDcG0ThrTjGbGtb3oUooH6EHwpoMA6NArmDw2ZKTDxrOYx
JBy/Oh4QvgTouT3EXX+Hb6Vd7mLMa5NKm8uYbPd/u5Ci/T+nwHG760zt+iMdB2yY
0E+6XyNU/SRApaviqzL3xvTHDL3rBUQhEbpluPWSvahOpHrD1UIJTTDT+3G+1COi
S24J/RgrDgnycPipvMXEETklz5gI2zQ80MXaVoMHyI2pSnMNc43n1vyyOrpNSqm5
8onLyXyWeKqPGYLPVzWog0KTnDinThoI8LOdzDYGcojKSd+DUb0=
=YeFJ
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

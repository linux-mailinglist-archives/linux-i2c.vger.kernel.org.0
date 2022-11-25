Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9B36384E9
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Nov 2022 09:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKYIB5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Nov 2022 03:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiKYIB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Nov 2022 03:01:57 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC382FC3B;
        Fri, 25 Nov 2022 00:01:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A8040CE2C5D;
        Fri, 25 Nov 2022 08:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D9CC433C1;
        Fri, 25 Nov 2022 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669363313;
        bh=xz/vBs09gIxDbgbq0+9vP4XNM4g5Ai2cR2nFasWMr7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q2REWND8ROIpovJNvDMHc1kcORQ1AhE6D/w4AEMpOzQ2z+3q2aisTYjYrv78qIw+C
         /Uc0XYBGE8TyU4661oam4yeyxG3joF+YiT43jwWwtvifjqYifGoNOKGXYJNcEFHDO7
         5deZ/JC78GIcZz5M942tzEIPccihweuYcK3lw5Z4kmZtor6SXrK1Gb+5CzM8pf0hUX
         9EhUK2c9Kk0AOItI457K+mxlN1huhcaPxDrkvKS+UGvgRipzzI0gUy4BVyKYZSYcW9
         ViJXo+2RzWXAd1GBTpeXWoSAdXhnqWBYlsVlBHuIEatrIca5zLYOi+AV8bvdmmIm3Q
         Heb1DsJ/opmdg==
Date:   Fri, 25 Nov 2022 09:01:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Use device_match_of_node()
Message-ID: <Y4B2bnfLS4A9VS/s@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202211251551030468773@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fie70k562p6YCs3c"
Content-Disposition: inline
In-Reply-To: <202211251551030468773@zte.com.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Fie70k562p6YCs3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 25, 2022 at 03:51:03PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Replace the open-code with device_match_of_node().

Frankly, I don't like it. It doesn't look more readable and it doesn't
prevent from subtle bugs. device_match_of_node() was introduced when you
are *iterating* over a list of devices, see the commit which introduced
it. I think replacing every 'open coded' version with this helper is a
bad idea.

Happy hacking,

   Wolfram

>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/i2c/i2c-core-of.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 3ed74aa4b44b..307a0adf6bc1 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -115,11 +115,11 @@ void of_i2c_register_devices(struct i2c_adapter *ad=
ap)
>=20
>  static int of_dev_or_parent_node_match(struct device *dev, const void *d=
ata)
>  {
> -	if (dev->of_node =3D=3D data)
> +	if (device_match_of_node(dev, data))
>  		return 1;
>=20
>  	if (dev->parent)
> -		return dev->parent->of_node =3D=3D data;
> +		return device_match_of_node(dev->parent, data);
>=20
>  	return 0;
>  }
> --=20
> 2.25.1

--Fie70k562p6YCs3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOAdmoACgkQFA3kzBSg
KbYCpw/+MqP4qdy3I5kIkeapx187nEBYcPkPmZ6DRn7oqxmwcD0PJ/d5Rjbm/T+t
SSX5Yy+EgPE3QImPsJ+zlVuDzbKZ/I2PXugwKjPBJkMxbOOZVNbsMks1thsAV3GN
IquB3iG7LZRgHH4bv+i7wDvsalG/SufMpDMs9/x4PuAKpX/IZwuceTpy9ZB87z0j
si+KBB99XWHPlUF2CI2bZhXEyFYOoqoKU8Ms2cmGOjrNCmbEs1T0sQyLpkgjsEit
rVWMew9rATX+3ptm6GnGBhony7NIZ9KE3xY7IdY//6GE0jZbV+/PGDWplbeRkBI1
MaspQM4qJwJcFxt965J9HkNDPtD9ToXAkpXG77WQvGxWhw+0iRsJ/6CdtGZUj7Jz
jQ4HscQ8P0h4D2hZAvp4Nmh4LSnop1wYP9t++RK0gdUlHJT+cRz6j3dnaHEidVp5
KMhuO53l5zH4BhpBy3gEhvsH4WR6+wEkNu44hkTkJvtdKWFKUugr8BwGvrOaQSWQ
aO1/8/YsTHdZAEbfFlqpzUfsa3T30D2egqDGDSbEj+5GLFST7muzZhdkHCPB6Q9E
i7/oDgC2IINmyTe/IjLKKfypza0p4ed65mZRqVcEwTCueisclo8daw6wXyS9jrYi
H8eOuqfiabURrJwgTfMM4QgycT8+TAwttg7bYpogttGoVLM6OGg=
=uKqc
-----END PGP SIGNATURE-----

--Fie70k562p6YCs3c--

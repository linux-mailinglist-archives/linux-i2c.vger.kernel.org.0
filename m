Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794DD7D8730
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 19:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbjJZREe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 13:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234902AbjJZREb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 13:04:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A47E1A1
        for <linux-i2c@vger.kernel.org>; Thu, 26 Oct 2023 10:04:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FDBC433C7;
        Thu, 26 Oct 2023 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698339853;
        bh=3tDUludn3f+SL6nd6faYQ7fO91uDyKpOf3egqOQZVvA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lRqQjK6FmlHErvv3X03VbYOTCq+Ht+Mw6BSLzdOGGlpPnEB7gBHr8OJBQPsVjHooF
         QEFHhL7F0qJeIEAFMbj6W+xuA2aIdF4L/8tmsbDsz14B84IKBjSb/GaQJEW25iklTU
         kvaF+FSt5whuHoNIg6PjsCNn7z4xe20FkpPx7U9H6b9ytJLyTQBxrgiuUMXV1iEoMZ
         Cqe8VSavEC3oA4WxtF4EgNhkvj+yFq1Qsrji8k3yEoxCIFMPnIHhqLnt7qPpr9dTej
         XXXE39ow4RUcbnG7ckK8gzSkYSyTbsiq8IT6kG3ap9oYXycTz0lIOz04/r2XmTrRkh
         7CQnIM5/g1CSA==
Date:   Thu, 26 Oct 2023 19:04:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix lockdep warning for sparsely nested
 adapter chain
Message-ID: <ZTqcB/JOZ8+GXq4b@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Daniel Mack <daniel@zonque.org>, linux-i2c@vger.kernel.org
References: <20231018094613.849007-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bqAGIuzDNRlQD6GE"
Content-Disposition: inline
In-Reply-To: <20231018094613.849007-1-daniel@zonque.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bqAGIuzDNRlQD6GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, Oct 18, 2023 at 11:46:13AM +0200, Daniel Mack wrote:
> When adapters are chained in a sparse manner (with intermediate MFD devic=
es,

So, you have an MFD including an i2c-mux or something?

> for instance) the code currently fails to use the correct subclass for
> the adapter's bus_lock which leads to false-positive lockdep warnings.
>=20
> Fix this by walking the entire pedigree of the device and count all
> adapters along the way instead of just checking the immediate parent.

Sounds reasonable to me.

>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
> This hit me when during the development of a driver stack that isn't
> submitted mainline yet. This patch could however be discussed
> independently I think.

Yes, it can :)

>=20
>  drivers/i2c/i2c-core-base.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 60746652fd52..4692a1e5ea0a 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1189,9 +1189,11 @@ static void i2c_adapter_dev_release(struct device =
*dev)
>  unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
>  {
>  	unsigned int depth =3D 0;
> +	struct device *parent;
> =20
> -	while ((adapter =3D i2c_parent_is_i2c_adapter(adapter)))

I never noticed we overwrite the 'adapter' function argument. Much
better with your version and the local variable.

> -		depth++;
> +	for (parent =3D adapter->dev.parent; parent; parent =3D parent->parent)
> +		if (parent->type =3D=3D &i2c_adapter_type)
> +			depth++;

I am not sure myself. Is the code explaining itself or should we add a
short comment why we use a for-loop? I tend to leave it as is.

Thanks for this patch!

   Wolfram


--bqAGIuzDNRlQD6GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU6nAQACgkQFA3kzBSg
KbYFRw/9ExfX9BF+fVwCCUDQ+dcvb68T30cJTo3Md2POAsltSvnp788BglszqzoJ
s2nRo7meflEdtln3d8dTauQAXWPKg3QcupgtrY9s02ilRE661eOJbIXI1Ay6dpG7
/YPCHgSIsfl8wUb1ueFhm5Ip89N5k9Ph1aoIf0B0mrcc7VFij2ch8Dm2chmKyaiy
Nmym9OgwY0RYbSyJGFhJ6+xf2Sofl9QXysR1ar2CyAhHFAQDkg/fk+9jqp3XXDdP
HGxk0wKKtL2xYSNxIeIAv/AaBxWuCMg2lUT86bfmLKnb4pMURbMT51alLRZ0+tGm
wWSC/PNmB/0NxEevWrGwoJ/jyYjTAjMeijfyJB5oNSuAQEHAg4aRfNGZxIlMje3c
oZGc28b/ukaJ9NDdX2YVpf6agoDP84CyhX0MhBhe/eb0hM86+WWcaGqTMYdsdpNF
cGZYNmRu5BFTqW6r+N01HViPUhXuUzmN8oWmOs6bypLqmy6+/gjo9S7sRdP76sMg
D70XjvEQxyA1uN7oy5JmtRReZzIyabwvjokRb0JSp+fV1YwKno5Zg93tCYDM2AOQ
feBen+UAMsdLHM4sVoN/1L8q6piZGAl/P8KaSfpr1UcQGYH0FVOFQwFPImxGiREd
MoTABvVp7Vn2cuBkKPCrRltDpFjUbi7yLl9dJObOUfD95LPIWv8=
=hxj2
-----END PGP SIGNATURE-----

--bqAGIuzDNRlQD6GE--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1773A635D73
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 13:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237516AbiKWMnN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 07:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236865AbiKWMmO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 07:42:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E0666CB8;
        Wed, 23 Nov 2022 04:41:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 55920B81F3E;
        Wed, 23 Nov 2022 12:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DEAC433C1;
        Wed, 23 Nov 2022 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669207300;
        bh=RO6o1Y2z01qCZCGMJGU+iAdpzYb7jAi5dytjDqoWwDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OgP9CysF1TVrSkWzoY1SXb1ToN2sI3kzVv2dmbj2yJe0E2+iWrQu3P0cKxq/0D2Xp
         DTXgVbiNiwlvvslKP+cZ6ChSqpGOsM0uOURvGTZR6AV2M4u2pLjQgfFC1DHt0mThy2
         cg4fQkEunaH6NtWSfsISO/Zvg0DlTu+ymRdSnFjCN84JGPdjeUW2zu81H1MHZZPek/
         VCHOoFsQjJg5g9z/suVpd2TDqzK8njYJOdlRFnK6RAYcejlvDdWXM7kd0oL5cHxNs3
         GRyVRhZX1REUrqG6J4N63q9wb1vdxohwMUoibLxczdfy5i0ZJ5m5UteoFisjJRymFJ
         S1PU/LZ6ouxWw==
Date:   Wed, 23 Nov 2022 12:41:29 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 541/606] regulator: fan53555: Convert to i2c's
 .probe_new()
Message-ID: <Y34U+VQyRcUqfd0G@sirena.org.uk>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-542-uwe@kleine-koenig.org>
 <Y30l2LiPQIxb+Vll@sirena.org.uk>
 <20221122200140.eyz7543bg2udl7be@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhLIDG3lxUf5c1Z+"
Content-Disposition: inline
In-Reply-To: <20221122200140.eyz7543bg2udl7be@pengutronix.de>
X-Cookie: I'm rated PG-34!!
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zhLIDG3lxUf5c1Z+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 09:01:40PM +0100, Uwe Kleine-K=F6nig wrote:
> On Tue, Nov 22, 2022 at 07:41:12PM +0000, Mark Brown wrote:
> > On Fri, Nov 18, 2022 at 11:44:35PM +0100, Uwe Kleine-K=F6nig wrote:

> > > +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);

> > This function is only in -next so I'll skip all the patches that need
> > it.

> Just in case you missed that information from the cover letter:
> You can pull this function into your tree from Wolfram's immutable
> branch at

> 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client=
_device_id_helper-immutable

No, the bit I found about it in the commit message (which I had to go
looking for...) was a link to some discussion about how it'd be a good
idea to apply it.  I suspect things might go more smoothly if things
were resent as per-subsystem serieses TBH.

--zhLIDG3lxUf5c1Z+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+FPgACgkQJNaLcl1U
h9AKTwf/TCGuJS9KOzogIaCUJcig76QWaJtAVD34leua6nC0PoVzvpihetd0+bWP
rkRcgs67Etut/mvmfnsQuUuRpg/7HjS4yo7RX9L1DqvI56p0R6Ik8jSv72frmeMw
uODXFkYuY/YLNsuB/3ZYlBz0JfzVN3N56Lhnsyklt4g6y+sHrcqvhAKwa93QeR5E
oCfZBaLp/wmnQPSxEgYKm2NcVu/dhi8W8r3pZUKaQlcji/GC7URy/N2q3Xi0RNRq
HeobPU4pOO8fS4tc8ZTr93+K6HDRM2HQ0Hgc3y7ZY2h30TRtfZK9q5iX48nuRwhm
UU413WpxRbBuYXd5LsuBHqStfz0o8A==
=QdFW
-----END PGP SIGNATURE-----

--zhLIDG3lxUf5c1Z+--

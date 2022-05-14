Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682D1527185
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 16:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiENODp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 10:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiENODp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 10:03:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CB6645F
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 07:03:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C68D60F0B
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 14:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00DDC340EE;
        Sat, 14 May 2022 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652537023;
        bh=WMmrCSLtB71BPsIvJODDWKw6HBF2sAKV4A7ywaLkL+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YZ8eScUNxPPq4gzvF+GYHoHEqrvwgNMvjM/sDGcavvnRSVN6JtgG3B+aLdhkv6LAA
         /BfbXiix/XAnNTRtRO/WslZ8TSm7P6CUywA272fG3haqfU/O3qFrwq8yI3j2LI0UZk
         Ft6qDU97Yd8axx64bAvBqFrjBib6L0yDNUsO/TSEnwzkylbYb6yCLC7X2jwnjYjAHk
         9e9hlm1DaoiPbuMwJj8PQvsusHHi38ZH0hz6BEYyXCmH/7THL0aUwy3sdGQ4kqRwUo
         Hi2sAXd4YK2JXw/CtSL8CbWEYdaiJneVOoL08cP5MWAx/Q+Npst7SY3qIJCmOT57kf
         w89tZ+LZkMN5g==
Date:   Sat, 14 May 2022 16:03:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
Subject: Re: [PATCH 1/4] i2c-xiic: return value of xiic_reinit
Message-ID: <Yn+2u6gcfkRdh0Y3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
 <20220420075924.14546-2-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cHCH5h0TEq1yO2Sr"
Content-Disposition: inline
In-Reply-To: <20220420075924.14546-2-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cHCH5h0TEq1yO2Sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 01:29:21PM +0530, Shubhrajyoti Datta wrote:
> Check the return value of xiic_reinit.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--cHCH5h0TEq1yO2Sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/trsACgkQFA3kzBSg
KbYL6A//fA5L0F8N3TBg5VhnRf9w3CFL8KQABQnEvogwNs+R+KW2hZtaEVvHshML
obubHBqg2H0pjFmPhESbAbLaKww3C7WWrABh1msKYQf2bUCsjMokPK9VW/SdaSru
aHzEKO1TO3cb2knhdm+bhnGL0O3AJOaD2bnQ1Icm2f8axSNGcS45+q9MldphwStY
5yuCStoOB9ZPluKqahy9UNYPu6pKZbLVZWXUaiAV7ykBurwczYZXA2dsS3z70t6w
R/avxxc7NtW8MQ8eeZ9sxbAFTQ00LIONKvyPyAy9NChZifygj67nxHf4pC0cgQkW
HwMMB1FQ67ODbdAyFSFdBvBw+r29pH5afY/eiCI6epkHru2KZ2TEDZZYrTHH7svu
rs+OXgXtG5Qo+JMGQv8lHiUYafP/fg1yDETjBvqIusNhyzY29BVZhR6vCf8YtEVY
3OPWpmej+EVWlUxy8nWHkZWDsJAynCIsP19DcqAeq1r4XK1jJGJIAs4HkZpuu6I2
We0h0v2aQ5rx9UCxL6lPtZIUSTt8g94SbEdbOg2n/K282g0UpQ3AklDXkiSCAICo
0rGR4yHwN+wMGGY+yfvYYN4LCcAJhE/pEUIbFE0mLaOhJhvh3DBt9KrHdycpLuC5
Fr5QSmVdS4qhhs++q1uIR+5uCud5nVeacCi/eZTaCqaS56+fw90=
=2rOc
-----END PGP SIGNATURE-----

--cHCH5h0TEq1yO2Sr--

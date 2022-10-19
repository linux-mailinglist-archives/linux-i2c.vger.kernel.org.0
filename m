Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42700605091
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 21:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiJSThw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 15:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiJSThv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 15:37:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E8A1C77CD;
        Wed, 19 Oct 2022 12:37:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E9706619B2;
        Wed, 19 Oct 2022 19:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E8BC433D6;
        Wed, 19 Oct 2022 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666208264;
        bh=zzDnXnBL9vEr+QpUWo9r+S/EQsKUu96j8JwyBHOVwtI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V9F+WKgQjG4vYQB00lvJhfXxWHGnqU2tOoUuEzbytipTu6D8xcBWMLJKlgy1OMlfN
         l0ZT1MAirDjOYZYjrwUx5lYN7bA4vYrBfBPnmgO29j5+x7b+hLnPC61faSeykpOtf8
         4QkAa2Q2ln+0IHUW04VwgxjTqEgeRgh4Qi2bUYnJbcwbCoS7ESZVjfWCKx4l5PGv60
         NTczhVvzYzx0m+dX4l8VZFNkBlgTCnGLPaB5usJJu1suMaCP92EOpzbiA/RyRlHCx6
         SJbOjS2yXaojSfQI2Ib5J0+NWI6mY9G+1kbcDS/7GdUhYru2kA+tmCZjO9LFTTatXg
         BHZhiFwKfbW8g==
Date:   Wed, 19 Oct 2022 21:37:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     tumic@gpxsee.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v3 1/2] i2c: xiic: Added platform module alias for the
 xiic I2C driver
Message-ID: <Y1BSBH2WsTg2HITv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, tumic@gpxsee.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Lizhi Hou <lizhi.hou@amd.com>,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
References: <20221018140338.7080-1-tumic@gpxsee.org>
 <20221018140338.7080-2-tumic@gpxsee.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uxB784pxQw7s8Yt3"
Content-Disposition: inline
In-Reply-To: <20221018140338.7080-2-tumic@gpxsee.org>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uxB784pxQw7s8Yt3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 04:03:37PM +0200, tumic@gpxsee.org wrote:
> From: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>
>=20
> The missing "platform" alias is required for the mgb4 v4l2 driver to load
> the i2c controller driver when probing the HW.
>=20
> Signed-off-by: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>

Applied to for-current, thanks!


--uxB784pxQw7s8Yt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQUgQACgkQFA3kzBSg
KbY98w//Qs7csy1GDLfOayVJM3t8Rq5MxB/m3g3Bf8phgPF3Iy9Au7q/xS6V2HR/
ze1O3+artSqEEICWofLyRnZt6PDc0G4hj/8KvUlyu0R9PL/75vBJl2wY/ixFtoWd
iPG1p+Xje4Q4r2dms806Kx71S6zFf/r75UUd/1H+Ki5mTGdfLr7YQmHweQLvqrlM
3+zHSGTrBlOQxIoca1xR1QWWxV/6mrEVOS99Qtv0rMPajBi2fSMe70eATrq51Tx9
qIuv+UdFQI1ZNwnHqhysjuWRd4Gw/HrjYFxQQ9CV4cn4EAq++U44ImepKBtQwqmL
QHup6ApTt+kk22drCuuG1dcod7nfpoRjGP2kacSRpfBRLmTR0PXxWi5/U2F+XRs+
xqUMBtYJIRB3ED4eUVGJ9iJi5TjLYsk+GWqFUzzdjbuuEHCDYurbfifJ3+fnQK9Y
enf2UHOWq/Tz9hBa+xIO2d6zU3tNf5rP99lHLBU24Nw1StCtFGX/Gyyb1TkdVUmv
78ubr2ZVtttJcl6TT2/3vX3V5NQvmuNCGouQX4bvRMgyUDJ4y01ZX9I0bUCQbu37
8wmd+6Nq/18IWk3nQbnPQ2ewE68HhfNzjV+QUPvi9hVLzbpNszLtwVRu+lXzYXq3
M55ibROv6PTvBNNB3CbmcyZOU6t0wFthxZRBTZj2amHHth+9Myo=
=OMev
-----END PGP SIGNATURE-----

--uxB784pxQw7s8Yt3--

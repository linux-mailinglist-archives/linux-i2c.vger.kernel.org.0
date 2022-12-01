Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B151E63FAC0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Dec 2022 23:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiLAWmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 17:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbiLAWmV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 17:42:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F236FC4CEC;
        Thu,  1 Dec 2022 14:42:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E5FF620E0;
        Thu,  1 Dec 2022 22:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9948FC433C1;
        Thu,  1 Dec 2022 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669934525;
        bh=ILDcuQPQ0P6LMEU7XozooiCZHpPcni+OPJtYOt+KBG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FszLgQkBcN9W/NkjDzWYuKNu27IopkZoOdP+ZBsktfd27eOfxAv6BqAg3QuURnacL
         Nlivka3FvL1FCtJWJn8OQfnKWJQ7UvXxtBFNH5RCV368as6TV6yE2ly2Uhutz7AHjz
         2c1wALiAu0Bs4ax1zQW5D5yC6gTG02MGU5b8pfjNIHYsS3zvIUKZxb6BbMkbNE6wn6
         3B/vgSv+SQptkcum5hRD/y+W87bQX5V/4fALeNVzi7W27FTb6zZpSTDfKCYwfRz6NI
         3rk7kfxEvHwoguTEveHwEafoLmJ8eO3TYHXcg+O+eK2gULkzvuW4FGptVTB73kAB56
         DOSSDUynv2ExA==
Date:   Thu, 1 Dec 2022 23:42:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     carsten.haitzler@foss.arm.com
Cc:     michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cadence: Fix regression with bus recovery
Message-ID: <Y4kturekuvluszoq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        carsten.haitzler@foss.arm.com, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221128105158.1536551-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="guh+gwQS+Eh/KDBC"
Content-Disposition: inline
In-Reply-To: <20221128105158.1536551-1-carsten.haitzler@foss.arm.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--guh+gwQS+Eh/KDBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 10:51:58AM +0000, carsten.haitzler@foss.arm.com wro=
te:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
>=20
> Commit "i2c: cadence: Add standard bus recovery support" breaks for i2c
> devices that have no pinctrl defined. There is no requirement for this
> to exist in the DT. This has worked perfectly well without this before in
> at least 1 real usage case on hardware (Mali Komeda DPU, Cadence i2c to
> talk to a tda99xx phy). Adding the requirement to have pinctrl set up in
> the device tree (or otherwise be found) is a regression where the whole
> i2c device is lost entirely (in this case dropping entire devices which
> then leads to the drm display stack unable to find the phy for display
> output, thus having no drm display device and so on down the chain).
>=20
> This converts the above commit to an enhancement if pinctrl can be found
> for the i2c device, providing a timeout on read with recovery, but if not,
> do what used to be done rather than a fatal loss of a device.
>=20
> This restores the mentioned display devices to their working state again.
>=20
> Fixes: 58b924241d0a ("i2c: cadence: Add standard bus recovery support")
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>

Fixed this checkpatch check:

CHECK: Unbalanced braces around else statement
#55: FILE: drivers/i2c/busses/i2c-cadence.c:1272:
+	} else

and applied to for-current, thanks!


--guh+gwQS+Eh/KDBC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJLbYACgkQFA3kzBSg
KbaFHg/+NOUmAhWQClMmII+ahnTIiIwOV8w1yaU6ZYq2BUyFQfQ1Eh5N4wSfoeCH
Zp8g1zWV2MLznhdXNcLVkFQWFvshcoMFA2TXjnCA/R1psxixa+Dj0WO2e+1jGUd0
U4/MZJeqgc5sqJj4tmomgNWql/npgKt9UzUU8etJm6YGumYzdj1dMDgTVSu7gayA
xKJyZ1VZjxHOb4Rnzpk/62uEX4lATgWxcgArttjY9o/PdZjfQ/xDeQd+UnqzGaHF
18mDZiSeUeO7sstpEAmP4O/tj3jJBQqPHxiJnxjwljrYqEF5mYHhpxKjKNaAgfWD
EjgOqELccLSPCPnNuhnZ9bmYtZNkO820x+jIRDuOuJauQwNUVgAPjSta/dwDKE53
bNyVucCQM8uXDCa/xGIlzRcdbQFiDEtWH+zwNej7GTb7bcP/KFBaeWxYPjgU4mbJ
zViw2I8tz52ormzThKKuZ7Uc9JOZeXfkLEFd9mUY9xLV+sP9QSRGkjRmYIDYkt3+
irA+JkBOknqEPqgU96EPeiTr6yq+lUPkzl4NIEL41i4qugpGl+bXW0ODbtmwr8n4
TVUfNAnbIXGWwiCaGIOni0jCGLdsUMwovuKBrTHpyIWyJx292rGmAdu8ASeiTapo
14osGlpuh1y9xGADTbgVt97Z0qxZP47QHaDW5zkKKxeGBYnjesk=
=zXXy
-----END PGP SIGNATURE-----

--guh+gwQS+Eh/KDBC--

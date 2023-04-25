Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D316EDB70
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 07:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbjDYF7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 01:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233362AbjDYF73 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 01:59:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B778BBB83
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 22:59:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CB5E62B82
        for <linux-i2c@vger.kernel.org>; Tue, 25 Apr 2023 05:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29517C433D2;
        Tue, 25 Apr 2023 05:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682402358;
        bh=FNeOjhMSGGVAXSnXv1IQndR0czffvNIa9+yffUfUOzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FlgHPKvoy+WYO/q/JpIJG0zsljMmP1RKX+PEgVANrGkb97TVA3QgY/XJzAZyr57oR
         3WNPFdtjQ+yO00fn9sSYxMKbtHPUD6rYUVNTJb2R7PJLn4aJneTRRhLkONJkFCasqW
         qyzzzxsNlqBM3Hs1T+ln2luDS3E+qDxqsKGGXGw+0Sw35PPNDGtYnBJAPoXQLESWnB
         pdxvx+4RAk9bCVakhoPdOC31VtZ1YyUPgLxxcepLxZ0ls83+kHXeNiKMKPGxpqsXB2
         RxwsVAKLUQX4dyVFC+FghTGWQjoGq2g4w3U8A38eZsYblBdqFvDwfm08mrpmfZXXXR
         xoATNgR0pnOng==
Date:   Tue, 25 Apr 2023 07:59:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Murphy <lists@colorremedies.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: intel-lpss 0000:00:15.1: idma64_irq: status=0x0, millions of
 lines spamming journal
Message-ID: <ZEdsLw+dJhdHVdEO@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Murphy <lists@colorremedies.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <47ff45c8-20da-4eac-acad-6d51353f95c6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fno9DScLuFFfDqTR"
Content-Disposition: inline
In-Reply-To: <47ff45c8-20da-4eac-acad-6d51353f95c6@app.fastmail.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fno9DScLuFFfDqTR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


CCing the designware maintainers. Not sure if it really is the I2C part
of lpss which regressed, though. There wasn't a change to the driver
since 6.3-rc1. The changes in rc1 seem unrelated to me, but I leave that
to the pros.

On Mon, Apr 24, 2023 at 05:51:15PM -0400, Chris Murphy wrote:
> Downstream bug has dmesg, lspci, acpidump attached
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2188969
>=20
> The gist is repeating message:
>=20
> kernel: intel-lpss 0000:00:15.1: idma64_irq: status=3D0x0
>=20
> ~6800 times in a couple seconds, and in a few hours racked up over 3.3 mi=
llion.
>=20
> Bug first appears in 6.3.0-0.rc2.20230317git38e04b3e4240.27.fc39.x86_64+d=
ebug
> Last good version is 6.3.0-0.rc2.20230315git6015b1aca1a2.25.fc39.x86_64+d=
ebug
>=20
> Bug appears in 6.3.0 release. It does not appear in 6.2 series kernels or=
 older.
>=20
>=20
> --
> Chris Murphy

--fno9DScLuFFfDqTR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRHbCsACgkQFA3kzBSg
Kbb5tw//SZOGmUS8Wrx+kDY582IK7m5Evp5LpW4zU53yBzaz6ff1rfU3E/dqVKmL
vC19nmAIm39fz2/W/6vALTtPSLNId5IbboAJVWUPeblKtSpcNGTWudNMKiH265oy
CqWn1G9XtOh0mz5VoxnY3n+yRknsIxlWy8X5yj+0QYoEsdgasbLKQX/8ZXFHXSyd
skeAJA3nm+UL71cKbVdTj02q+SiqnJXk4yOYeEN01RRRQWXn3L/rWRlEFnFXK9wY
V82jJ7dp8sd/muEE8vQ0P68emtejYKHJZZQ1ohospUkqSFcn/3cqBknlhygF84wp
lNx+lbSXyUIO+4ikKoJccMNMgYQxbjKvcwGl3S/B6vG/LV5dEJZLoZ4mh4ydwoGm
vCb6gZqZi43MGGbOP6Ev9soMPNFptEfSAdoLT0WbS4oSogYth51AUpnaqqZA6uwL
Dk2NILZIXEZDfqB6kbSCeTA0wPx9qUcx50kyvwFE6zU3c6qg4Kqh9NNHXjG89q5W
gzG3mzD+LCcgFBcxFVAOdcblyTGpoxtDQed7ZhsgPwF3mmPJSQFH0AzLpx2LZK+b
dJmFU+33zfyBoQqE9qFumKRLZmspnrqbIrGHef14j3rRJIEOhUrsj19hguN4vfNL
ZQIpN9RkEz+Ftv2Xey8IWvA4xGstV6NdrBdVPFCkHWaRyHePfL8=
=NA0V
-----END PGP SIGNATURE-----

--fno9DScLuFFfDqTR--

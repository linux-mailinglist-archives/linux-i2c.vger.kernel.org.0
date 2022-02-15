Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD814B66FF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiBOJI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:08:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235640AbiBOJI6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:08:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67BC13DCA;
        Tue, 15 Feb 2022 01:08:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 47282B81806;
        Tue, 15 Feb 2022 09:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7EEC340EC;
        Tue, 15 Feb 2022 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916122;
        bh=ZNO8TI8MMfIyG+Txd0JtWfjzN83NmBBd0o8oxWTjKPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qu1/FDvg7HAUqQOhLB3Dtzz5DJDtgTdepxAddtkhxL8AtvmnUnK0UiUrRUbwSTny/
         xd2zHiMkswIMpA0bDm2Cz68aNArivuYy53jXxQ7sWmqysjHbvNQVP7MNQQVqqzjzhc
         mM5bGpUM1Au000g6XwT1pYx6S0Kn7G83aCmbODcYnPD3ISyz4Z2Yqeioy0zJqe1ixV
         l5FymZGO646b5MawiPggsPHjDKH+h2zlcuXClXpWCNG+kpfQd/HI7MIcl/Zudmpl1M
         iK6yyGd/QleFFGk74Pm7VrAqQovHTHI4JJXbpPmLoPojUt4AI00pjNvfL7iM+Tnm1z
         T4hJwXel64M6w==
Date:   Tue, 15 Feb 2022 10:08:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 5/5] i2c: designware-pci: Switch to use
 i2c_new_ccgx_ucsi()
Message-ID: <YgttldLT+O8I7PXV@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <20220105141935.24109-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="noqXf99UqhOvZJh5"
Content-Disposition: inline
In-Reply-To: <20220105141935.24109-5-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--noqXf99UqhOvZJh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:19:35PM +0200, Andy Shevchenko wrote:
> Instead of open coded variant switch to use i2c_new_ccgx_ucsi().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--noqXf99UqhOvZJh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbZUACgkQFA3kzBSg
KbYpkg//WIs/bUPRmAhuwh6WPU4S97fhc7TNpnAl25T8ZeqzVDHfqPuASzByiH/Q
YmmszfDC3WmR3SCt9yQitsYYHIHkdYELZzg+qZSF2EJ3w/pe63hx94gPVwnaRea5
97h1UcmSbZE/9LQGId1hH5B/dQFnF1qwgHMPVPVEIgbEllo4D5PrZuhuYkxDmR/i
x/HVgGbSsgcEpG8bXDHpuXZ3kto/vjh5N0h0vdwd0Y5LrL1ogM++QGNfpAaCNn8a
FRCj7wAyo8dmZecSA8LtICR91tV8bZ4ED2ZEJ3/CCoK4tgFRfxmmcMWbUW9gOMS7
c9HOSsBg9XV8l049Qf6SfjsNgDQzhVOCfmZ+tCe1DPjRR/IpXbumKg3l37K26tPJ
6RBKK/EDmfzfyMBCZXsVA+63MNzLL9WUl0etayPnDvebt2QQa7OWJAvzX4zLE+Eo
NY/yEsZnasf7E01RzJbLYBFBYyT8UjYJGU1xZr+nsZkTfvKVezsHbGN9nz4+z9TR
NcYMOzRA46pzujyrrmkRNv7YNaOu3HyI0VytXFhizV6jYg8Uv85UZuSnropFNWGI
Df+HJBtfFedfB6iTNgZgdVO9VbngGBIo89Q2SsOJ1wrHLFdv1n7p15Q1yChjbDFV
BADjn/cfeI7ld17+XrUJ14893UH/wPmNWeMT039Jv8l6AiH/x1Q=
=BwJc
-----END PGP SIGNATURE-----

--noqXf99UqhOvZJh5--

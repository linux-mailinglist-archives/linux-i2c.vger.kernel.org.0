Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E006AA05B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 20:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjCCT4s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 14:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjCCT4s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 14:56:48 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BA26153E
        for <linux-i2c@vger.kernel.org>; Fri,  3 Mar 2023 11:56:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8B16ACE2257
        for <linux-i2c@vger.kernel.org>; Fri,  3 Mar 2023 19:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A89EC433D2;
        Fri,  3 Mar 2023 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677873403;
        bh=JQo1jIrE3xyU6N5VDTj7I+kSMwlFq6cXXpqrsdd2gZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=grRb9WvyWB6k3iMS7SoRIWc5V/mGjwbw+6SYKjKX6/vtlNDfW8B9IDmUxsYhJmlbA
         IxzwOj0e/Q+lkBgqPVaTTQGGFglu13KgOj/sxMhZJ3bWp9fR2B1PohC8RWHHv/NesI
         BK+5yyhxi3qR6dZHSLAxpLzRGRVFti86KFKn+oyd/V6i1PNYlf929uMDXgEjzI+sOz
         qUYtwfRDbhtZUfBerBFoeUOCE6xyH7u3F+Uo1szNKa3bd+z0m3dP15LjPxSQV3lTQ4
         x/jdMHLLIhOXeA4GAeYKPY44ZKDKfU6w2MV+4kkRnuSHTx3sv2Jwxf2YAM5jLy7DcL
         SOc73xAKQBLIQ==
Date:   Fri, 3 Mar 2023 20:56:39 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Benjamin Gray <bgray@linux.ibm.com>
Cc:     linux-i2c@vger.kernel.org, arnd@arndb.de,
        Sven Peter <sven@svenpeter.dev>, mpe@ellerman.id.au
Subject: Re: [PATCH v2 1/2] i2c: Disable I2C_APPLE when I2C_PASEMI is a
 builtin
Message-ID: <ZAJQ90AAzCg83ot/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Benjamin Gray <bgray@linux.ibm.com>, linux-i2c@vger.kernel.org,
        arnd@arndb.de, Sven Peter <sven@svenpeter.dev>, mpe@ellerman.id.au
References: <20230227233318.120415-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QmIATQ1h8zIEbdS/"
Content-Disposition: inline
In-Reply-To: <20230227233318.120415-1-bgray@linux.ibm.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QmIATQ1h8zIEbdS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 10:33:17AM +1100, Benjamin Gray wrote:
> The ppc64le_allmodconfig sets I2C_PASEMI=3Dy and leaves COMPILE_TEST to
> default to y and I2C_APPLE to default to m, running into a known
> incompatible configuration that breaks the build [1]. Specifically,
> a common dependency (i2c-pasemi-core.o in this case) cannot be used by
> both builtin and module consumers.
>=20
> Disable I2C_APPLE when I2C_PASEMI is a builtin to prevent this.
>=20
> [1]: https://lore.kernel.org/all/202112061809.XT99aPrf-lkp@intel.com
>=20
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Applied to for-current, thanks!


--QmIATQ1h8zIEbdS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQCUPcACgkQFA3kzBSg
KbZwrQ/5AVTObPe5EoOtQvaCVPwxMs0YnZpui3zJwOzX4spKEKW1ZTmoA68xokDb
6QrUsz1jrrJd/qlO3443Px2zetvxvIbdPoCF10rnpBMbs/QGRGF0PFfxkRbyrL0I
ApJHH2HrgufOWCZph3t36PNUei8wHs+pRg5Ab2SR3mIvL2Jp061e3BzK7l2AAqmh
nVsJsqh13i3MQYVHZ9xuzwOMAMIUe3gBuAkKc61Ji9R5KOS7um1/BTt/jDtnDyfn
3vs1nsvqBxdnHTcW1MkFQxaPXnjJ6yVvI/5YNYz7Hsg4+59OJ4waYlaXMmu64p3b
V1AfJBdsI+jfRtRwzBV+AOfaL75JRg6ibxeZEd0eoYDtmk9eW55ub7GpALqCNMBA
e6GM5QE5DPXUsxdBpdRItxuT2H/slh/m5UjtNa3D97AwJ+BRyS0b9CtE9Z83otA7
VgXCL0MFPAwX97peIr5jyDNj8PItuhAqcjEK9HrUPgxsKF2IlE8/dyR8mpHdNODf
2f7Kmv+DBKsolRkb69UlnHPzVWMGs2v7VP0tD6AcCSiCdZfbbQb6l0dfKQYzZMU9
OOep7cA5FSH0kwDtGO/bDpEtcHD8HwZxcXKPv6w7u8iDIDdxPlBDiO9K6CqLRV8e
VyohUqzBfzKF+pUAhyuoMaifBYKAE1ESEK2MzNhBrjJurC2L0XI=
=YDHz
-----END PGP SIGNATURE-----

--QmIATQ1h8zIEbdS/--

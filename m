Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBC1788FC5
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbjHYUWv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 16:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjHYUWj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 16:22:39 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC491E54
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 13:22:34 -0700 (PDT)
Received: from localhost (i5E861F7A.versanet.de [94.134.31.122])
        by pokefinder.org (Postfix) with ESMTPSA id 13352A42A23;
        Fri, 25 Aug 2023 22:13:35 +0200 (CEST)
Date:   Fri, 25 Aug 2023 22:13:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 2/2] i2c: mlxcpld: Add support for extended
 transaction length
Message-ID: <ZOkLbtb4adrNj7Ij@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, linux-i2c@vger.kernel.org
References: <20230822185137.36215-1-vadimp@nvidia.com>
 <20230822185137.36215-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="loBirHhAgEDgINNV"
Content-Disposition: inline
In-Reply-To: <20230822185137.36215-3-vadimp@nvidia.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--loBirHhAgEDgINNV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 06:51:37PM +0000, Vadim Pasternak wrote:
> Add support for extended length of read and write transactions.
> New FPGA logic allows to increase size of the read and write
> transactions length. This feature is verified through capability
> register 'CPBLTY_REG'. Two bits 5 and 6 of the register are used for
> length capability detection. Value '10' indicates support of extended
> transaction length - 128 bytes for read transactions and 132 for write
> transactions.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Applied to for-next, thanks!


--loBirHhAgEDgINNV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpC24ACgkQFA3kzBSg
KbYXLQ//W0JD/YmMtaCzeOJ2ABTg9naZrJ6kIXBtFQ7Oww69cw9tccO4fiyyHXCm
g85MWsFdqeIZQieJMVmLJr9t7Tzsexn4t8+QdD87Q676Lel/+miIZLbh/iq3MrXd
zlGi4CL2sIeyii3TCRZU0GmXKdLKBNkP/bTqwgDXnzBiMS65fMyacLDo450VoLDX
UWlDf2pDjU/wa9wNEJT9Lz4cGfH2Ev5ivhaiCZPJgCXO0a0qZ4+DZUG7LFtUONf2
PpCjQn8ll+KCt8jx1h8LBNkCu7Ndj/R2NgchE0kg9hLZOq3KFOiIpyfsdHBegpNb
5OqTPvveMGoWGKdon7kotUYW5C4StZYjMEqdDky7WsfEMJ6Fyt1YIJVUFOhoYnze
3iR+bySjeErwqEuuqEDNu3+/7O3fLq4NW732grxZAILMHhhWcEnXFIL7XZtb85PP
DvjEebVVf1E+qmK6e3f4PR/zaOnG1vJzoDsTzgjU9d02ffiKwjJs4t/O6NODRIHU
OSb6r6tVtRlNujoXiaj6dDML4+g0+Zh7rmZoxPsgCFT6ZGEZlUPteZWgLr9MfAm4
osq4jbllc7a5G0mycaQauD0fYkuFzRnOsdNVfEsWweP0oUyOA8X9KnWGR0j9I38o
Ac0V5Mjx3yS8SlOAgbQPybQEC0N9boAwX83U3aOJ95HmCAiM4Jw=
=NVds
-----END PGP SIGNATURE-----

--loBirHhAgEDgINNV--

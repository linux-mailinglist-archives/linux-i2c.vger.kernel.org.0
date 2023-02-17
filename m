Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AE169B4E1
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjBQVkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjBQVkp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:40:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC8660F82
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 13:40:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 205A46202A
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 21:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12095C433EF;
        Fri, 17 Feb 2023 21:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670043;
        bh=+yGY0Ibtc7bss8JpYgM9hqdWDtpZFJZVw9pY0eKK3qg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iUUQfkCO5nmSWL81dSEvWS0pXqzTAhTQgizIsas3HJnOWwIt9AWy1/h7mQi2seyGK
         kKa3L0YNQmK90vf7eycQH5m0btUKLqxhu539GoxvEFv8uXDxEHtlF/KRk/kb2+ZyCn
         H1u9sYIGpOW9PDmlhiVyrl1ASdCt/UtP/Ar8yjYtpXEIj3yhM4vgwPpyCsjK5Ai2op
         0uzsZ3+Nop2SEimuggrZPMBHFYACkF4uRNa6bM26qoeHthjdq9WlptMwK07OOOhazC
         0Plrbimq2xED+0wBzljTcw3lfrNpcKtyASxnAcfYJugPnyLZZqFq4lXDogr2pvPFCD
         AxkPYzLM2GKJg==
Date:   Fri, 17 Feb 2023 22:40:40 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 2/6] i2c: i801: Handle SMBAUXCTL_E32B in
 i801_block_transaction_by_block only
Message-ID: <Y+/0WARXik9f4GyA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20230216170830.206f0bb9@endymion.delvare>
 <20230216171117.03d94f66@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hjeCCR1I048INzLv"
Content-Disposition: inline
In-Reply-To: <20230216171117.03d94f66@endymion.delvare>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hjeCCR1I048INzLv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 05:11:17PM +0100, Jean Delvare wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Currently we touch SMBAUXCTL even if not needed. That's the case for block
> commands that don't use block buffer mode, either because block buffer
> mode isn't available or because it's not supported for the respective
> command (e.g. I2C block transfer). Improve this by setting/resetting
> SMBAUXCTL_E32B in i801_block_transaction_by_block() only.
>=20
> Small downside is that we now access SMBAUXCTL twice for transactions
> that use PEC and block buffer mode. But this should a rather rare case
> and the impact is negligible.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--hjeCCR1I048INzLv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9FgACgkQFA3kzBSg
KbYAZRAAsKaKLgpgIVRMyiKctzZa3uMtJUR6Af45CMd1bXPZYWZImXctU+ZgV2Gg
PqUHbS6a0j207tLWMpi3P+D9XK1ifc2UWDF2MfP/gFiOTBnzotl7BIFB1oL51HTL
OluVeCivkzUpYUGRY1XkLlOHUgTOKS4J7Qjsd/DHgbaP6gMwCAdhDG2o5ntoNwWt
tXfmtCfarlnQ/L71IlI7qAii4ijPLx8wsemR4PlPbahLsuqpCPK9HdChrnyMvwS3
ALU178cXpx1cq8zz1MZ8JXH4eWb5M2PrpEkTppyb0rnctPL4UyMUdks08k8rJhxR
eHIdRd4XlSXPcRtNdr0LytO5HBjjH3IMd8ovQPLhd4LomOGSKIwlWhG1r89ZUB/Q
JeRkmcNRycRZflz6Fkr33uzMwtVIypVDm751Qkl/Vn3kFoMA+PzzmpidEKLf3vY/
FoQpAi8zuOQBTUFxaUngA4l7ztkfs6RQCzIPdfGTX112iLJJwPfl/2LrYurhJCFc
/wJmPeHzdCPvIhAai/MTIOebQ36AuxfyyPH+weEUvssryS1SW6t60GMsi3bTCHO7
T3qY8foDejnE1xSVdqlY6OdkB84p21KF4gXKj87p9MN/Qlk/0rJT91upeEVP4PEW
ThrXwYdzHkIvLtGvDJpj3keFC6kWDHqo1wmPFU8mv2t3QMj5K00=
=Qc/3
-----END PGP SIGNATURE-----

--hjeCCR1I048INzLv--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBD5549B7E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 20:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245295AbiFMS3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 14:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245636AbiFMS3W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 14:29:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9031FB227E;
        Mon, 13 Jun 2022 07:44:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA76B61363;
        Mon, 13 Jun 2022 14:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85710C34114;
        Mon, 13 Jun 2022 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655131474;
        bh=mVPcnBqff4Qg8JmFyDlY5tck7ujgQlmYljTopZhsfwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=npBL6noPLhOvqurAUFEXI06PVTFaowFh/a1v2bfo0Vhw+B1slp+Dnnj4lvQs79T6X
         AjC24IR/OAJcjmJe822xBWn2hBBLxKE094kCn5JPa+Enqw8rWaQ+5z3XBuNHeG+qyk
         IxnjO0S23IAU1LiHKcMRLaGfGCWJF2aZZPk4VVW+qHskXyqPAh9TbS3QaQJdt0tMHi
         d9d1WfAhe0uGInHm2u/QYz3Gp5/eV8zmiZvvR6kkprYfdQZZoGuETNcYoMAM3bPtAk
         aZXtqWRzHByo9LPNNrU6Epwl+4SZSLR70CvLFWdGk3CWR94CnXC/UwNYPm604Jw64j
         ajGguXDVI04fg==
Date:   Mon, 13 Jun 2022 16:44:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add include/dt-bindings/i2c to I2C
 SUBSYSTEM HOST DRIVERS
Message-ID: <YqdNTgCNGT0Y5y2T@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220613114614.21510-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3qqK9zQnklREXAWN"
Content-Disposition: inline
In-Reply-To: <20220613114614.21510-1-lukas.bulwahn@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3qqK9zQnklREXAWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2022 at 01:46:14PM +0200, Lukas Bulwahn wrote:
> Maintainers of the directory Documentation/devicetree/bindings/i2c
> are also the maintainers of the corresponding directory
> include/dt-bindings/i2c.
>=20
> Add the file entry for include/dt-bindings/i2c to the appropriate
> section in MAINTAINERS.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to for-current, thanks!


--3qqK9zQnklREXAWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKnTU4ACgkQFA3kzBSg
KbbBHA/+Mb15/3R9zbn9P90XoGh7h9cFJqnCEDQELBlPGUXBfErYrpLpNeH2wnee
2nXy9uZX/DZSNTCmPOzpzvb+DbZeF82xqf1XJohVFs+6NyWQxjETu9+/ink5UAet
plEeZVBSLvhjXl/kC55cJTxMKa94pNx5isIYfG7gaXBMpFqt+Pm6ecqkUe2WxFu5
h8T/PIw8QzjsKI+Z7Oap53QzrdomAu5GHfU+O/PjRVmL+DDTIbzJKyw9Oq4QB4S5
h0zyIrgl2WZBjioX0GKO92H8tRiWLzyLSB5OLcff9H3WkNt7iOhEtlU1nMO9jzyg
6Bk1872XyT0WR653s/yH27nC3aFvA0ggz4mU9YNLxdzuUwbrRhNXpHM0+340RNNL
F8budrCM2EbepLjG8qBt6kQUKowamTOVyOSSr3E0PVmDvQryzliJ/HbSoBIE0+2J
sCnNdzSBreQ17hOShTHkiKkENrSILErFvd+DHKbw5wRLyTnlGu60+QK0BSX8dR7m
Q3dGbZgVZMdHmX/MQuphIARJU7X3lcunObFvbpV4HZUigKB0gNRPivmb2yvwVenB
aQ4NnVMK2HEm4BSLmOG/Ddvc6Jowpof7kzq+AUz+z46C6EojK0sWDPA8v6Eh428j
nOToyzaj+B+lndhZqATTfGFUMEDSpnUlgQCXTODZiZWV7+MHLbA=
=YW+Z
-----END PGP SIGNATURE-----

--3qqK9zQnklREXAWN--

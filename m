Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2416D8F74
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 08:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235403AbjDFGcQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 02:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbjDFGcO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 02:32:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4E39012;
        Wed,  5 Apr 2023 23:32:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F02CF62BD3;
        Thu,  6 Apr 2023 06:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01E3C433D2;
        Thu,  6 Apr 2023 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680762731;
        bh=mrVMi9ItADs5lRaa8AhkduPiL3Eq0avtJIAJj0gI7ig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XT8jMJ1XiECcNN72+tAGjMk7omT2tmZuErDNNPte4WWUua/LrIUC5Fz5Qnrx+Z/0w
         UEkNOCCzfNvR8ZGxVcPOCvkQXh3kWhO2YaBa2Be3S6N8ZHUvROfGNuY9r3i4nu/KmE
         IuyWqxb27V9Sr0QKKkZKMjsLn/uvH9h4in/dXNSuh9EXIIBMQ0AoUROJtGUlwgP+5Q
         h7VtcNInDtxYJwRr+VDKGnyVt3rtxTcyNSWMCzlE3H9Lfa5DVSgNjHTBHXGmTyWeSr
         d5kOiJllkN878qCjYTSSQDQvaS3zxnUSdYaWSB09BAMXxAWPqSW+g0tRzHH6HdCLSJ
         U1r9gO9j8QhVQ==
Date:   Thu, 6 Apr 2023 08:32:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for
 polling
Message-ID: <ZC5nYIliBHxj1DpF@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230405125643.42398-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wQ/uxqoF42HFNEs1"
Content-Disposition: inline
In-Reply-To: <20230405125643.42398-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wQ/uxqoF42HFNEs1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 03:56:43PM +0300, Andy Shevchenko wrote:
> Convert the usage of an open-coded custom tight poll while loop
> with the provided readl_poll_timeout_atomic() macro.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--wQ/uxqoF42HFNEs1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQuZ10ACgkQFA3kzBSg
KbaqLg//fWX65SX7kU/8rJRFAyue0/0Pt4+/sEu68vYWODd5sr2fmUwOWiBbVkjU
TOWfrNI6J8SzjR/dqTfHP5+bmiPeg9wvLdszjBRX+ISBQC1+UfWZIrxHKYAmSgJH
38pWvUfquM3pe/LT+7FivZtZMojuFa7jyEibTnZxkha0vLw+UVZPyKm6ojcPVDaG
+DdlnB0CPrTNXxF0/65Ao8ksDWpP0spiAGMpvXMdozgPcY9ggoURsZ+NiOi1WKCY
VTph6lhrpKcAJZ/tObpA5vUwm/uJwKHdbYb0uePiy/RAQF5Cs7FE6UlnKCXjf6Ow
paMj8qX6MC+iiCDUHl8hA/PqHPCkUJeu0UTUo14OS41l3sZakZPQIrn6UWgFatKC
RKAmzXO6r7WSLOIDMSn2TwCBQhK+tMlTOn6jYLHw9nm9q3x4BtPznP9n6SD3CAdI
YytjE0EH1mqaZLQQTPzWgIGkFsP+72ZKbp9LUz1wmjjU/Cya4sCXkqqYHL95LKu6
q3CCWMW3Ts0Xkw53oYKE8ssakkbPlWVZQELQBKoha0sBfERvyrM9ugBtpypC9opD
3GU37zaTbVZ+/f/C/u2fqAdS5hWwsfsOQ10nEEKwzfhQFJN6Ezqjr89I2lXHpxYX
xkRuTbl/KmrlyARShoR1++ouTks3n/Lnb0ePEr+frgKFjjte2I4=
=f4P3
-----END PGP SIGNATURE-----

--wQ/uxqoF42HFNEs1--

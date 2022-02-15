Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEC84B66F9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbiBOJIQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:08:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235620AbiBOJIQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:08:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070E713DC5;
        Tue, 15 Feb 2022 01:08:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A32A616B1;
        Tue, 15 Feb 2022 09:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4AEC340F0;
        Tue, 15 Feb 2022 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916086;
        bh=qBce8r5nHj65iVepwtnKMuxU/ThZlllZkmnW/KG9kpc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oGTdV36CaY++4KaGNNRa4EI2d7hLA9m+TXJ783u2OoJ1I69rwuiYvvp+v87Fow/ec
         DCmXO+pvpisk7tnjeUAgtU9HJAOAEADybeuk6JwXaXNR7RYUjmNN1fQ5Wh94SuST0A
         /soPP+0KJmx/ase4l2/EfNW6lk+2KU+Q9IgBqYrXR1FLayk964RxATZjtXhv4ZwbMW
         l6hUGRyoRD3r2khQ+yHB57lHQVrOANH96RrIMR1KjqjWbGOJWk9TjdNAjSg5rliXzl
         o7hlvrhHCCAvZHPmyYgWsEgj1ya8NOpVB0oEE49x35RRQClHPMx0nb5Mfzok87O/3s
         JM6ahQPEolGUw==
Date:   Tue, 15 Feb 2022 10:08:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 2/5] i2c: nvidia-gpu: Switch to use i2c_new_ccgx_ucsi()
Message-ID: <Ygttcvz2od5tJc5W@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <20220105141935.24109-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xQ7oV1U/odrWWnQL"
Content-Disposition: inline
In-Reply-To: <20220105141935.24109-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xQ7oV1U/odrWWnQL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:19:32PM +0200, Andy Shevchenko wrote:
> Instead of open coded variant switch to use i2c_new_ccgx_ucsi().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--xQ7oV1U/odrWWnQL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbXIACgkQFA3kzBSg
KbagrBAAtmbu8lAIL/SZDzqwZzD1VUUQrhIS59AyTi/+RtTcJ/iQKAauJxtx4PoG
spdcf9RpwbcMfezV9iA/JmMgqek338M5yD8E/ZEYRzCYqBdRkGFBawYbl4sRlclL
Nao12fqzfuRIZqkSOiM3VoMm+IY/38N3nPiAhJn4HFRtc1rKHA7hrl54PZSR7zcN
uWeYKS9rlJHL440aHHiNcw4p7ldhUWXbq95WphWOZHhPrzkDRtDKpBqwvvfV/DJr
l35q6tsn1UHVUeMfg2AXh5HpxlfwYdoKl/AyKHlB9RI+1WTiy+Be/HIudpdftrfq
TAbJx3fPb/sWyFG2ca2TDRjeMx/575+eM1AL3Z2EqOJ8g4C7IxNQqwL16PbuFBV3
me5k+HYoFBrNKRIP/R9p2sapfHrS38UcaUPNq5o7ySxD9jqQVGN4pgjasV1fMufp
H5aYKOrGi4UXYeNbOoQceI/1Uhh4KhvHR1lO/Gnm7OJTdgxQISJWndV5tDSUyJwf
iJ735uXY7smLqd6cx14uKtz3XNgTRHehq9o1jyprcZe7NS2kh0HWGqM8kZnAHfCK
Cc+7Ekc/YqQwnE8/3CdneuAv6hhM8Hlg6AkeNKIURc4Z/uT+eQiDbpwHjLzqp9RP
xYF2YVyrKV+8PEyunM+EriRhHlPqki8b9ojMV2rMm/N1oJNU+08=
=sHaB
-----END PGP SIGNATURE-----

--xQ7oV1U/odrWWnQL--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE337D1EF2
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 20:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjJUSec (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 14:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJUSec (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 14:34:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036F0114;
        Sat, 21 Oct 2023 11:34:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E34C433C7;
        Sat, 21 Oct 2023 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697913266;
        bh=2IMZ7iFSlhjVxu/VTWm4dQq1ViJWvD2O8nqsU123hsI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Imz4h9ik9Z0meo1QALRSvieG/apyUw8g88eOzV2t7xUSkUChO9bwvEz7AD8GSWoib
         S7F49bfhcTvXjb9WLbai7uD8PT1U+DLCViKzqyVayRDAXAHql9lzf1TirVYukUo1EP
         Plwo/igPIJqXuE3tIVON21tCwn6h2o9z0BzMiE8Z7fMLrO6SYVpw9ZUMvfVopgm8kC
         GGDBXBZlFIJDsO/h3XmFRuvX6iMoq+T30Er7cJTvxrnF5WJFoXzofjGXGeV8YgkEKj
         Yn0YLepoOX2ERwa5Yg4dPr5t1k1Aev7RLNx2Dw0nxTtzqQwvR2i6j6QsGcwDVHsyH/
         0QUWcSeNZlo8A==
Date:   Sat, 21 Oct 2023 20:34:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        stable@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: stm32f7: Fix PEC handling in case of SMBUS
 transfers
Message-ID: <ZTQZr9QocS+Qls0P@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        stable@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231010084455.1718830-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ODTK9yyIQXicmMUN"
Content-Disposition: inline
In-Reply-To: <20231010084455.1718830-1-alain.volmat@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ODTK9yyIQXicmMUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:44:54AM +0200, Alain Volmat wrote:
> In case of SMBUS byte read with PEC enabled, the whole transfer
> is split into two commands.  A first write command, followed by
> a read command.  The write command does not have any PEC byte
> and a PEC byte is appended at the end of the read command.
> (cf Read byte protocol with PEC in SMBUS specification)
>=20
> Within the STM32 I2C controller, handling (either sending
> or receiving) of the PEC byte is done via the PECBYTE bit in
> register CR2.
>=20
> Currently, the PECBYTE is set at the beginning of a transfer,
> which lead to sending a PEC byte at the end of the write command
> (hence losing the real last byte), and also does not check the
> PEC byte received during the read command.
>=20
> This patch corrects the function stm32f7_i2c_smbus_xfer_msg
> in order to only set the PECBYTE during the read command.
>=20
> Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols suppo=
rt")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Applied to for-current, thanks!

BTW, there are some patches pending from this series for stm32f4/7. Do
you have time for an ack?

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D359230


--ODTK9yyIQXicmMUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0GaoACgkQFA3kzBSg
KbZcAA/8CTJ0qwqy93erVsUOzCzgDrO437q8fryQz8SPGRvQfAysYCmJcG4uccTT
QZ3WUJ8VoX6gWFl63Hql44rvvn6px4vxoLOD+kx3ue+3kuS4DKEKOaQ0mH02eBsv
k3tFT76nnkTCV+10itUJ/EM+GUBsXVX3xoTgG3Rko7u1pQdyt5ro5AFaJX/IAAQe
o5wttCU/pIG/a850p5mfsv3wcl/JHaAG8Lzd7Fss6uTlqfcIAgcwHZs/gygstJB2
01Fim6Be9LuAopCCkI3hh0/keo/BSLqwsXrtvXRV6bRKgcSmvTqJJDkjjxT6a+l+
ABWjG3z88wTtI81VywiR3gFkuRp+InlTbuILncjG+yay4dm0aehL8eNh6STKNRIM
u8ynrhBEIuuAXEQ0/6g43CSQQGpTt4PcPhWyK1vsNlVFGfFSaclRXFQEMh27oARy
GMDdXrH/7lYQ7xeoQPKuO9oYOoTQtbMjC6Mwz6IkY9CpKNQwxxen9rNePrpVdUiV
odjcAizzMb6CPP2A6wFM7LtkbfpozPYHZ9L1/Ujm0D5c7Fb3g9cRTiMWpokDXzV7
4aUNkE6GAPgkPJPulLYoTjphzUfDoRjVJGXoK/cfVQWR6ad3Kk1c2r4HJ+xTQKVJ
Q3quC5MhJKcyLfVEBfJUbL4LwKo19s6gUxTSFvVOW10+s/6/9rc=
=GBVW
-----END PGP SIGNATURE-----

--ODTK9yyIQXicmMUN--

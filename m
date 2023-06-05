Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2427B7221EF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjFEJT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjFEJTv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:19:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3344BD3;
        Mon,  5 Jun 2023 02:19:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4374618AC;
        Mon,  5 Jun 2023 09:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1E2C433D2;
        Mon,  5 Jun 2023 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685956788;
        bh=2KMPCs3xnPma3Gp/cOtdvN3P4pMzbtx3iOi5EAEKZrw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pEbr2DnCHI0idUvQ+tk8/DkMsYYi4sumV8SlhfLBA9KYWBkwbdG/wZrTuTG0NXUTA
         VRfyOJeReQLMzSDGp613ILMIAIpYF2Dyu4jQoyhRO940JaUf2ifeiJ9cw+Em7kiGsW
         Nc18C9eu5U7IbsMGps3HafY2NyDtcW4rl9yPXtJi9DYcR7nV9dXgQLJadrKtY6GeEJ
         T8lSToSvLYxSRhwpTwZlSdqkkxfwhcA+dnE8F6kXZcWenKR4xs3bg9iKZxPBiFAK0L
         7yjLM/wZJRI9uJ607s6l4i3f0BI4QRWuM0DTYOoguhY6VJQYtbe11wShjzdO9Dqeut
         7iPY7ThjTK0dA==
Date:   Mon, 5 Jun 2023 11:19:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH RESEND v2 3/3] i2c: rzv2m: Disable the operation of unit
 in case of error
Message-ID: <ZH2osTPbiv+sT+m5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
References: <20230526135738.348294-1-biju.das.jz@bp.renesas.com>
 <20230526135738.348294-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ngymaOImUZrnMJf1"
Content-Disposition: inline
In-Reply-To: <20230526135738.348294-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ngymaOImUZrnMJf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 02:57:38PM +0100, Biju Das wrote:
> The remove and suspend callbacks disable the operation of the unit.
> Do the same in probe() in case of error.
>=20
> While at it, introduce a helper function rzv2m_i2c_disable() for
> disabling the operation of the unit and this function is shared
> between probe error path, remove and suspend callbacks.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied to for-next, thanks!

Do you maybe want to add yourself as a MAINTAINER for this driver?


--ngymaOImUZrnMJf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9qLAACgkQFA3kzBSg
KbYfexAAjRyRoSQKskHX2/Vj1ponnPgBHqkq+eGCAnVr9Et1QuvJjaAx0B+gXeji
4VjTP2WSLDRDHSy7LsNrVfwaaRvb2kpa/mkbqBtHRC098Rl+pP9ixRgSrUgFZxpN
QNDXoVoRWEF690RGIkC5CNjuZA1TeCdWkNxzoXyxT/nJ05p1UU0OUPne1aeYtnPI
rofQF3KwU8ysQ0wHzkwt0sbJOrso8iwiLcd2tPAxEQD38fTe4VIXdLUqnDonrSj9
+z4D0WKGz+CpbEjxkUbkWvCUvnKljf6bD1k4D8bU5dq1LZvrQ+qpSGdnAMfRHey1
WAbOP61lEQyZ1ZVT8kjTADVrLv/1VYFAqT5s5BaLuNy97hYDIz5Vx/5DFHa4xeYE
RB4Tn2YotpyAii9ZtJo3+WWvy5c80NwZKXsfIshuRuVkABYa9HwfdbpUplnIZ6qH
Jf4Hlk1QjoSzWm137w2fl5+wsGsu9dGhOuN0sCKAORspQHQNAh37cVuRExUHM+/9
eUl6stH2BWSLgT4p3+WjSTQVtA1vSXagTXiERNoiTHsUJmKGnrN5n4VqNRTnTtXE
VzEkxNx9nxSJBrlZZz1041T960MPBIdd5U8Z/ADSAoZKDhg+MNpsCXeFdCf2BSKo
lDPXhDaxoQMYNiOkbLyGUJNIE5GVo52h2q14UNr3lX53JtuvLsQ=
=noJa
-----END PGP SIGNATURE-----

--ngymaOImUZrnMJf1--

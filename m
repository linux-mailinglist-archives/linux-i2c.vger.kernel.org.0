Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E6E7221EA
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjFEJTT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjFEJTS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:19:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71C3BD;
        Mon,  5 Jun 2023 02:19:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D2B96122B;
        Mon,  5 Jun 2023 09:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01985C433D2;
        Mon,  5 Jun 2023 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685956756;
        bh=uJxh5a0p3tUtSyZBgfM0zebsjyEIF+2aDxr5+cM71x8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YdALKJZ2+SScMOXIiPDqVd1hkfUL8mQJZJy1Oz3dsZDbCkJCYlTP2seHyyhFfuycj
         CiTC2cK89VWwIyKi/xbRFvOmCzxPXrXvfa0WEdKvsm2tj+j/c7mjOgId6BHT3wypcM
         qgtRi8SLjDDQ9gfJlFlzLptbHyu0tC8n1Jzot9WlyYmycTiKmbHmgi+7RJc0siM8mq
         uk0WWp/VWn9dAexcPeDjmjmJTRSxZKQ+LuUQF4cEVSuaXjKJMf2DrFL1I0xj+Evh4p
         77ceCo+QXWzc1aZzlsCYzgorGrS5KuT8iW43SzPUfvzhZjNwyxC7OrdrcsOnnbXtp0
         m80oeJygyfavQ==
Date:   Mon, 5 Jun 2023 11:19:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH RESEND v2 2/3] i2c: rzv2m: Replace lowercase macros with
 static inline functions
Message-ID: <ZH2okGIa8TiYgGWI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
References: <20230526135738.348294-1-biju.das.jz@bp.renesas.com>
 <20230526135738.348294-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2nYjjvXQjSbpuTwX"
Content-Disposition: inline
In-Reply-To: <20230526135738.348294-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2nYjjvXQjSbpuTwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 02:57:37PM +0100, Biju Das wrote:
> Convert macros bit_setl and bit_clrl with static inline functions
> as normally we'd put macro names in all uppercase.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied to for-next, thanks!


--2nYjjvXQjSbpuTwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9qJAACgkQFA3kzBSg
KbYXORAAlKlPTHoW7ptarhRb4Z/qoNO71KDaiX9V1yZsmsXlLssnoV3KOIBh+Zaf
cKvswWjoZkCCckla40aGtBIUEfbfEIA2hRxe3DlujYyEqHX+nhJktvD8IOIkktG1
fkYpUMzVP5rMasK7NKPoeLTVDSJJzOYW4pcha2rUxxzxRWjlTz67YvZSiZDCyHKG
h2ZvrqHJEwiP+llQP2MtUS+3hAv0OXVdT5OaXflelz/6yCvAGKFqqkxDERxjsM93
SAowSjKD7eNo25frOtvVAv7rUZOpDeZIoLKOblo+RB2Qh0B1ABfqo00oHsH+Xf08
EFJt4DgiqIQTRE1UJDzF7kkVW04RGbMrIQnQhqDwauk+Ok6LGTRI4l/wBKrXP1r5
2nlqBthtssa/gI2f3rITfqSMPHN6M58I03V5ZZFUndvtGpcqQab7uQTYIf815X79
MsHaiu3IyHMWPrqp9fxcYEGhvvleLR1vBe/xbCTBFXLy8HDsw8TDWdQ2jAhqcXur
nxvWz4oRQ4TXn8HzilNlCWsrtc6PJsrXlF2kU3+58CyrQWEWb+n+sMNU8t/Zfgvo
FeXuubc5JujpdVpvrH3o6lwQ3B7NofYbdY8HuZhm6XUsdhuINGlUwd7NHHgXg5fM
pzoOPSlL8Hgv1PrDsf+Z0TT1gVC+STMiRLxGM0mHrALqHHTqatk=
=NhCz
-----END PGP SIGNATURE-----

--2nYjjvXQjSbpuTwX--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351664E1911
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Mar 2022 00:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244407AbiCSX4e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Mar 2022 19:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244167AbiCSX4d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Mar 2022 19:56:33 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CBF1260E
        for <linux-i2c@vger.kernel.org>; Sat, 19 Mar 2022 16:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZM2ZEeuC6lpJwrPr+IXjDG97Vj96
        lpq+j02dyZgyb/0=; b=pTLoAdlFopPEWMlgQRrqh2/hFIFjYPN+pPl2twR9ttGI
        syUKf38Kv0kLSOxxa5eL0wpXduklyx41ikHXlTBYEUjcL3wjbZHAWbI8iT3iyt5o
        YA+JmAlWGUaxBR5bpqx7uZoFybUXIaa5Gakj3WWW/PLU8kybxGsAy9SY1k7N/PY=
Received: (qmail 268820 invoked from network); 20 Mar 2022 00:55:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2022 00:55:07 +0100
X-UD-Smtp-Session: l3s3148p1@ck0o/pra4LYgAQnoAFEUABJj7ywuHcUy
Date:   Sun, 20 Mar 2022 00:55:06 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: do not deactivate a master that
 is not active
Message-ID: <YjZtWjCi9RZmNwh9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yt/opaDK38OEDsvz"
Content-Disposition: inline
In-Reply-To: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yt/opaDK38OEDsvz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 12:22:35PM +0100, Peter Rosin wrote:
> Attempting to rollback the activation of the current master when
> the current master has not been activated is bad. priv->cur_chan
> and priv->cur_adap are both still zeroed out and the rollback
> may result in attempts to revert an of changeset that has not been
> applied and do result in calls to both del and put the zeroed out
> i2c_adapter. Maybe it crashes, or whatever, but it's bad in any
> case.
>=20
> Fixes: e9d1a0a41d44 ("i2c: mux: demux-pinctrl: Fix an error handling path=
 in 'i2c_demux_pinctrl_probe()'")
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Peter Rosin <peda@axentia.se>

Applied to for-next, thanks!


--yt/opaDK38OEDsvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI2bVYACgkQFA3kzBSg
KbYf/xAAh7akQku3l0CLWnxvOX2HK+NkGP+xNzVuMYiCSHF/7GF9hJabfVr8djge
lVRvFvqPL0vhyacVYHaqlw5d7CCgErYOieRGqrwKjM2Z93qtMFRYt0IE9GOlQ0E4
nYL6DiTDOKyNmcNgu5Z9tN7duZjIhNyO/9xsG40uDVsygAtq6uuvZbyXhcgHoGq9
lgHW507gGInFdE5XIVFa9OjUCTPkU9LF/PGLSsJGqZtKerdkSVOgiXn/RCtS00SV
4CVUfLoS11tWiQpectasjnYTTCvaB1aQ9gtaB7fysIdKWLEaqqXp6ECb7x+ETIYP
OLbghQG/XvXyeGy+tTopyd9r8/7AoL7A5QmFEdVlDL7OjLrW31LnsiL/LI/1c4qU
Kad4NKLUXoa/iRsWvqym80nbt1V52Gu13FQxOvSOMU9zf+iVGcBdS1eKl942EuUk
63sPtn5IMqk10mgyE/GdX8R6XF6QXE0M45VC4Iyic9emG26Aml1rCKY3JQDsD0pf
Kx1GFGjToRBEHrjsic7yIirTIpA9PBIRGLfXwHId7hFBzg2tcMAkrOI86q/mMEIb
LdNHscZQHICKUrvetb7i2Gg2Xfp15jgFvDCKn8cDVvleE0DIyyj6gJKxEVw+IHTP
oruPYeWD+aS32hLLsuiVufROzFcZRs0ZMHp0fakIDu+yTJo617o=
=Mn0B
-----END PGP SIGNATURE-----

--yt/opaDK38OEDsvz--

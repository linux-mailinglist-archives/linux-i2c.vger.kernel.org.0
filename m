Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A615958F3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 12:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiHPKum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 06:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233687AbiHPKuG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 06:50:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E577390C
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:37:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C78C1B81693
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 10:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDEEC433C1;
        Tue, 16 Aug 2022 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660646264;
        bh=ckb31w0FKSWwPTOsTlvPZB/2Z0COsQnlSAMJwHfPeMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jcgs9bq1RxYg38cOws+k1575pay2uXWVEcS6b43xbSHGpgzX5FQEl/G7RW18eCs0M
         u0xvAGsHGGzsfXqGZjfbtmZnt/0EadUJpLSYbWr3m7FceON0ZeRNaLKWx+f3ivD7Aa
         l8athBJB0oQjZzGBpOW85J9kcHdmMLhlNfkicF9/gNJOYRUlEsaO1zbAAxi2czXLwm
         8Mv5lDCWEY3XBH0xwVMRx3zhSznonXT1tcn5A/8/NuEfGX/UTSQoqxWrUQFcYngY5+
         MSKOj5FCNCDrQ5MUDfVJIrTlGR6SdxdoS0xwLsw9+b44S8U9EA+N+zeWqSSuDq6XEP
         KqPznZNx+c/Vg==
Date:   Tue, 16 Aug 2022 12:37:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/6] drm/i2c/sil164: Drop no-op remove function
Message-ID: <YvtzcyNpaVkrifBp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K69F4JvRrkAxeUhn"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-2-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K69F4JvRrkAxeUhn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 10:02:25AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> A remove callback that just returns 0 is equivalent to no callback at all
> as can be seen in i2c_device_remove(). So simplify accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to an immutable branch, thanks!


--K69F4JvRrkAxeUhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7c3MACgkQFA3kzBSg
KbagXxAAkHn4KekvpzKMTfLn08xFhh7cpxn6nDNrs48ktED+UMvrOcXFy1Nubg3C
TWZbePopinGhFxl43Qk4fsu4vFiKaZTt8WdmMudfY04BSSZfsRbo499eOTljg1Iv
JXcZQrp2Fu0eAFb6hXQFTR2AlvE0Yqpi4ISge19yFomY+aAhSzXGpcN6WWTWOcQC
nxbv/MZOq/qKv94obRmtaOCzDNfsT1wCnqtg4KXHEDEaafQDLxBOFj6PWE0m4ZKY
dsDYnQGwXIBflZT+D5mS8puOGprrLTJX7FFJI5/ms4SW13HLdJHuJznGelovROcM
iLOYILuFzJKcqc0xM5ffh77o5Svc5kTFL5t41fmaJ2qlVxdLJnOQC1QuBDvTS0BT
b6H4DFgu7T/RkmlBuMNEFjWWJ1gzOqQcZZRzCEVRZ6nVk0aN+lrMZIPHKK5lU9LX
daaD/QQfkXCYYlM1XtPCIysDHAuVXSowlxvRR80uTsPz18vd5Pag4opBMhN9eYyT
nPnDWEdACw+uGJN7Gb45zLAxc6izzpc1pHMZ+Fpb76vEV9bx1xo0D561Aym4pgMG
XZZh3yqSfqQHxHTZvDHILpPfXneY+kdz2GlLpA43EEnO0jFaYX3oGrsdpgPIV+wS
9ZPnGw/++foa4229Jrm9GFG37q9ruG/guU95cKGCFq3+NzInrIs=
=sxh8
-----END PGP SIGNATURE-----

--K69F4JvRrkAxeUhn--

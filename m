Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87337A5DA1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjISJTt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 05:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjISJTs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:19:48 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FE7EC
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 02:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=z9Zs
        uHwEZUIWASPOFJZ2VSAj24t8rvIQrp2qTIo7Sq0=; b=SLn3HXE3pAVfbz8T2klX
        XWLMlaqY5fdPKZ/h7NDKbzYsXOoZe4US6SnJvJaPyg/SBDEU2tmDyFhIqsOgZHRB
        Vh799PtWbNZzRRhSYYuJemRpdrTv8p6n56xKlCTDBxh5ulmILcPVYvTt//VMQKjJ
        G8YqO+KhHMi/U0QnvR2tyDR023FuJ+L0GBk8ZhzXD/QRQYa2WdYsr+P6U4Hmq5RP
        UUS62CWXszn2Ph2U8nr1xnZQBet0sbJyqjt3tjeom+YzyYHBYqqAuR0v4GvGaXVF
        W5ePHN3BjIxus50PzZk/H3ZzfiH9J3ld3l5W6sY8A4Yhqgr7I7/sbLJf7lr5zES1
        2A==
Received: (qmail 158853 invoked from network); 19 Sep 2023 11:19:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2023 11:19:40 +0200
X-UD-Smtp-Session: l3s3148p1@Ga0nwrIFKG4ucraB
Date:   Tue, 19 Sep 2023 11:19:39 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/2] i2c: rcar: reset controller is mandatory for
 Gen3+
Message-ID: <ZQlnq4pYp9ZCu0Zs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
 <20230913062950.4968-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdX8Ug6sQX97_CyFbpAN1Emp7d891wJAWg8pLpnM3q+ysQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ysEcuAOE9amobVtl"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8Ug6sQX97_CyFbpAN1Emp7d891wJAWg8pLpnM3q+ysQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ysEcuAOE9amobVtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

> > +               priv->flags &=3D ~ID_P_NO_RXDMA;
> > +               ret =3D rcar_i2c_do_reset(priv);
> > +               if (ret)
> > +                       priv->flags |=3D ID_P_NO_RXDMA;
>=20
> This is pre-existing, but if rcar_i2c_do_reset() returns an error,
> that means the I2C block couldn't get out of reset.  Are we sure we
> can still do PIO transfers in that case, or should this be considered
> a fatal error?

Makes sense. I will double check what to do here.

> > +               ret =3D reset_control_status(priv->rstc);
> > +               if (ret < 0)
> > +                       return ret;
>=20
> This is a pre-existing check, but do you really need it?
> This condition will be true if the reset is still asserted, which
> could happen due to some glitch, or force-booting into a new kernel
> using kexec.  And AFAIUI, that should be resolved by the call to
> rcar_i2c_do_reset() above.

This check is needed to ensure reset_control_status() really works
because we need it in rcar_i2c_do_reset(). From the docs:

"reset_control_status - returns a negative errno if not supported,..."

The code only checks for that, not for the status of the reset line.

All the best,

   Wolfram


--ysEcuAOE9amobVtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJZ6sACgkQFA3kzBSg
KbYoDw//aZy7iwPGybw6ZkERehAgnr513j2t7STUONRHbrQbX/ENB6Tgk74j1Rwm
l3MsPzFanNxsM85CmB7RvMv9xj7by3ECyBkUWSgKsZP7Et3BlHEjEgho4USd7jvv
JYbcJkj/hs7VgNAliLIU8XdOiTuN4wA6M6TyatJYgwV1v0ry3gnIQO2tFYs7AznW
UU1BNwSMbgXbnbzWqVM2HvkYI/eSf0mer79BTFULuoUMydZt5/V8aSzu9z+vYTEz
qLmdhVL52VejmreKrcsx12z23THa6qL9dceFQiRf5Uh3fDzwVGbOaTyTmNQ+/gaM
QrEgd1tq+NzxsUojURBH/Ch7Dp/AfkiQgNI4JEMnppvj1FAHGGCwzA5nlKM1zTPD
mazH3Cramm9Zqt08vbR10erZgDZvCrFSekVytmbH6UaZITs/NxUYLVfRwSeK3TGy
5tNFOpl9nS78AFm5Sqotup800KHGVPOrHwtm3gg2ag0GxgXBQd/cXllmaAAz7x6a
42t8ZyACkXRorYhdO7WKPBejg3uJa5qFccpAraNnDrUbXYXH/59P0r7nash/vs0D
65TBcf2hAW41odAeYTeDME7vVPFb8c9rsa6RMQ4ErPoCkUTmEnb/9HjQyw8mHG3X
RWzirIgEHjelXwh17NBr2AysEAYPH4zRpAAf50S9OCyo5gV/+WE=
=F0az
-----END PGP SIGNATURE-----

--ysEcuAOE9amobVtl--

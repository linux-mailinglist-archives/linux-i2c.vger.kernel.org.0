Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95C5B4CB12F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 22:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245208AbiCBVX1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 16:23:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245225AbiCBVX0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 16:23:26 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BDF27CCD
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 13:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=MwoWmhJ+L5r33MNaUe69ZqsjwqZf
        jvz0RcaU0lS4/UA=; b=aTmph1cKarEUpB5nU+9CwBYH3V0/+/c1bcD3QyAFRjb7
        FmUF2T21oAxOY4cazDQbqj0QkJR1coqGR6US1vB0zYx76BBa2Ybn08ePAP7ytHpj
        RNwlXrJHQROp6//RovsYW8P02Qh9YMtPFks37/8yCdDqt6qUHYYVn7G/fIQbfRA=
Received: (qmail 259064 invoked from network); 2 Mar 2022 22:22:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Mar 2022 22:22:37 +0100
X-UD-Smtp-Session: l3s3148p1@MRp74ULZAMQgAQnoAGk1AHiBA1wHs4oK
Date:   Wed, 2 Mar 2022 22:22:37 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: do not deactivate a master that
 is not active
Message-ID: <Yh/gHSaRNs9Z8La2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
 <Yh/e4OzQ/hYSb+dg@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jepbhLwGEDWuNCcE"
Content-Disposition: inline
In-Reply-To: <Yh/e4OzQ/hYSb+dg@ninjato>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jepbhLwGEDWuNCcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 10:17:20PM +0100, Wolfram Sang wrote:
>=20
> > Attempting to rollback the activation of the current master when
> > the current master has not been activated is bad. priv->cur_chan
>=20
> But the master is activated?
>=20
> 259         /* switch to first parent as active master */
> 260         i2c_demux_activate_master(priv, 0);
>=20
> Or am I missing something? :)

But _this_ code is affected by the problem you describe, or?

237                 if (!adap_np) {
238                         dev_err(&pdev->dev, "can't get phandle for pare=
nt %d\n", i);
239                         err =3D -ENOENT;
240                         goto err_rollback;
241                 }


--jepbhLwGEDWuNCcE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf4B0ACgkQFA3kzBSg
KbZK3g/5AeBNwiDpQudH0ZbIc5TMhKbBsoyIbxK1jJHIxDFPY03TN9vnLHzzKG0R
POEMO5fIluTgrKSBuRg0n0osCGXCo6oznf7/Ni6xqZkUdIG9Q/TJNG4lZ3U7EvEB
ftzMkHTngywmLqohz+u0nIg0EPXvXJca3ONQZyoSNjf6c8Km1+X+5dXvvwhpBRpS
cp9mDdM7Mnb8DSCMcmKGFOpc14Lfq5Fna5jC29C9ajqWgrvgpTWiUMCarEuGpiug
Y8Q6V7i1aHkFozZW4RZqjvj4UDXXkktmvhKkih12VYcGGJMLM9jiDvCT7bF4Sf/S
QREGU3ce5HxB1LeIwLY+OM4jR5PSOQj1DljvmceI0jm3E0aK6oitXug59OzP07zs
05iAxLA95Q6VvwX05H5ecNlra1k8Q9VlzGnnu6lgUYd9t90DXCedeDSryjzLL4Tb
tMKeip+XxNpaHo5So+RgwCE9+uynKB3VEzqtMCOFe6+XTuH9OV3K69m3wKbC1tzE
js+9aWXuhohRVr0ccNceRoU9iFIOGqosrHGj7Pp/MCT50vtKQiPL50ZHP4G7fss+
Jzm8SUoaFJmonQJSgVglRECkvUs5fPgws8SScsD+dA3H/KkiM0YVTQf+/jHJvInf
LqcHydfykflEfLAew50sZLnaBvMuL7NbUY0CiR793urZvDWlS4k=
=cnxv
-----END PGP SIGNATURE-----

--jepbhLwGEDWuNCcE--

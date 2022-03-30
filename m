Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FE74EBF84
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 13:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245759AbiC3LGD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 07:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245758AbiC3LGB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 07:06:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8828ABC80
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=JnKcrmaUr8MXflidFAPHWOHNq89m
        zF96ivzsWPZDlp0=; b=yOMfIHgkZLWCbFmZe5XxSBX8AQQOB5Qsl6+WpihJZgRe
        v7SOTFafZa6jaxDeIjgp3m8SPdsRNHGlOA2Sr+5ay6dOAk4cD5b6TQQ+WcJ+F31Y
        oxPe3VvZYV/bMU2GFTcf8XRK1ykKDnLzxHGqDQYEH1IkjvhAIv6bptpl13+sOmY=
Received: (qmail 2163323 invoked from network); 30 Mar 2022 13:04:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2022 13:04:14 +0200
X-UD-Smtp-Session: l3s3148p1@lwSAgW3b1KkgAQnoAFSoAOQGPeMhapNB
Date:   Wed, 30 Mar 2022 13:04:14 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <YkQ5LkUyicWFLlSJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <0a07902900bc4ecc84bd93a6b85a2e0c@svr-ies-mbx-02.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7A78cr3tGLoNFLbr"
Content-Disposition: inline
In-Reply-To: <0a07902900bc4ecc84bd93a6b85a2e0c@svr-ies-mbx-02.mgc.mentorg.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7A78cr3tGLoNFLbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

thanks for your patience, I can finally work on this issue.

> > You could wire up two R-Car I2C instances, set up one as an I2C slave
> > handled by the I2C testunit and then use the other instance with
> > SMBUS_BLOCK_PROC_CALL which also needs RECV_LEN. Check
> > Documentation/i2c/slave-testunit-backend.rst for details.
>=20
> You mean physical connection of two R-Car boards via I2C bus,
> or physical connection of I2C bus wires on the single board, right?

I have two instances on the same board wired.

> It looks like all the boards, that I have access to, do not have
> I2C bus wires exposed to some connectors, so both variants would
> require hardware re-wiring modification of the boards, which is
> not an option for me. Or do I understand you incorrectly and you
> mean something different?

Probably you understood correctly. Which boards do you have access to?
I use the EXIO connectors on a Salvator-X(S).

> Most of complexity in my patch is related to DMA transfers support,
> that I'm trying to retain for SMBus block data transfers too (for the rest
> of bytes after the first "length" byte). Your simple patch makes
> the driver perform all M_RECV_LEN transfers in PIO mode only (with no DMA=
 at all),
> which is probably not quite good (it's a pity to loose existing HW capabi=
lity,
> already supported by the driver).

I will have a look into RECV_LEN and DMA. I already started looking into
it but will need to dive in some more. Stay tuned, I hope to have the
next response ready this week.

> >  	/* If next received data is the _LAST_, go to new phase. */
> > -	if (priv->pos + 1 =3D=3D msg->len) {
> > +	if (priv->pos + 1 =3D=3D msg->len && !recv_len_init) {
>=20
> If a message contains a single byte after the length byte,
> when we come here after processing the length (in the same function call),
> "pos" is 1, "len" is 2, and we indeed are going to process the last byte.
> However, "recv_len_init" is still "true", and we skip these corresponding
> register writes, which is probably incorrect.
> The flag in this case should be re-set back to "false" after length
> processing and "pos" moving, but I think the variant in my patch
> (leaving this "if" unchanged, but skipping it on the first pass with "got=
o")
> may be even simpler.

I also need to look into this but thank you already for the detailed
explanation!

> >  	u32 func =3D I2C_FUNC_I2C | I2C_FUNC_SLAVE |
> > -		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> > +		   (I2C_FUNC_SMBUS_EMUL_ALL & ~I2C_FUNC_SMBUS_QUICK);
>=20
> This flags setting adds also I2C_FUNC_SMBUS_BLOCK_PROC_CALL flag,
> which is missed in my patch. My patch should probably be updated
> to include it too (if you'll agree to take my variant ;-) ).

Yes, the final version, whatever it will be, should use this new macro.

Until soon,

   Wolfram


--7A78cr3tGLoNFLbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJEOS0ACgkQFA3kzBSg
KbYguQ/+Ld+9afqc4XhIG4nAN+lj+DUkz729gZiU5UB/KxgJa9PPM2YjVmQlLSNB
5L9eWZfczS4pGcMCTLV+DZ6voo2ZEkTWFZBT7lo+MeymgOxfHDGIm333Oozkta1h
k1ygwwl+zY15+5diAcTDXSkUd4DkV/MAg97Lkcnlf0VNGLHMkjOB+gpUuC9suqPm
jGUKfklvlkhH4h5415XyyNYm3n/8wrUyqeJJztVl3NeEIkCAOrQrkmML915ptRd8
m4najskIiifu69CnScwy+UV0Yr96bTCcy+y55zRvHfJzZdQ6NRFkHItsmQ+8kdiP
8I2jpJ2fPhHjhmwTs35GCd6/C9XuXQsMizHtx1y44LE5klgZFpefuuQaKbSuXjoc
XhR8kgRKZXa2mPA/zYi5BPLbKvXU5accFhkX/hk7pEWN9U1HFiC+FNxGlRssV5Fg
CAzuBb1JmUu+jiGgs8CmS1q+H2ZVPEDYNRlvx4ZTjaIUlC/xslIIViP8e48gqsMK
MXeAAq7wqiSXmQO8iX8LOlNj8KQ9b58/AW8vVvBbUjxpB3wollCp108+2rXr8alQ
CzF3LeA1nK3icDxQ1w7FYG31lhFzLokvc1a55K3u5EnCv7qA/unki1miPKJQInIf
LuUiCsXXTyJjke2dzni/pRwyMirRXroVuwiewjq11efqQaWmc+A=
=jcun
-----END PGP SIGNATURE-----

--7A78cr3tGLoNFLbr--

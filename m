Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 345634EBF5D
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 12:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245668AbiC3LAW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 07:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245650AbiC3LAS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 07:00:18 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABFF13F42
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=3qeT2jnWJKE3c4ByGF5uQGcKoZ3I
        WXAG6HjQjmwsXH8=; b=p2SQXBmqqnEqYZwYoIAMTg5VXha6vhrbD+/4Bfrurus3
        KqGTGW3BR00m/rdLPZ+KAbDv+ajUP4N4tB0azLUiTQMJC23MbuDcTaDlYYGDJ6iw
        Q9NJHlaIRMkujWfRveS4o3KoTSSsk6gMwSshC9LrGhJj7r6XEvn4RRjIVTZu+Kg=
Received: (qmail 2161148 invoked from network); 30 Mar 2022 12:58:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2022 12:58:29 +0200
X-UD-Smtp-Session: l3s3148p1@Ay70bG3b0qkgAQnoAFSoAOQGPeMhapNB
Date:   Wed, 30 Mar 2022 12:58:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <YkQ31VMqj1MXqBd3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SU7q6hDtTecwI3kF"
Content-Disposition: inline
In-Reply-To: <20220323215229.GA9403@lxhi-065>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SU7q6hDtTecwI3kF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eugeniu,

coming back to this topic, thanks for your patience everyone.

> >=20
> > You could wire up two R-Car I2C instances, set up one as an I2C slave
> > handled by the I2C testunit and then use the other instance with
> > SMBUS_BLOCK_PROC_CALL which also needs RECV_LEN. Check
> > Documentation/i2c/slave-testunit-backend.rst for details.
>=20
> I am obviously not an SMBus expert, but I wonder if simply testing the
> PCA9654 I/O Expander with SMBus support on the H3-Salvator-X target
> could be acceptable as a test procedure? See some test results below.

As long as the first read value is 8 (or lower than 32), it will work.
But it is testing only this one value while my method above is more
flexible and allows for arbitrary test patterns. However, your tests
already showed that Andrew's patch seems to be not correct.

> ############################################################
> #################### ANDREW'S V2 PATCH #####################
> ############################################################
> root@rcar-gen3:# i2cget -y 4 0x68 0 i 8
> 0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08
>=20
> root@rcar-gen3:# i2cget -y 4 0x68 0 s
> 0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08

This is wrong. The first byte is the length byte and should not be seen
here. Check the i2c_smbus_read_block_data() implementation in i2c-tools.

> ############################################################
> ##################### WOLFRAM'S PATCH ######################
> ############################################################
> root@rcar-gen3:# i2cget -y 4 0x68 0 i 8
> 0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08
>=20
> root@rcar-gen3:# i2cget -y 4 0x68 0 s
> 0xff 0x06 0xff 0x5f 0xff 0x11 0x08 0x08

This is how it should look like IMO.

Happy hacking,

   Wolfram


--SU7q6hDtTecwI3kF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJEN9EACgkQFA3kzBSg
KbaAXBAAlZZLS94v+HMkqaOzIRjX5ubPE5+ENYFHENboY9VHJ+hVy/AmAZX/pwpR
P0cq7P2qshtcZf4zfeVxNFc+Lzt3kpwg9UU6tUshtlTGESY1UpWEv6Vf+MZqETSn
4eHdcoRBbfIlbPI551ad71PFB0YMBCe6r2u/rqdOZWrbw8oPbm3xVd+tIEt7c6Fx
WZWFXwc4mGAuaMUnkZOB4l+cXTCgGqaARxzykJEtFuVvhHMmkF7Uss64EF33SF2o
+u4LNxO/OkTqEIsFxDtacWggJpjm9plcH2GhL6wSC6iDw9hv8X3yCjO5wr8kneol
YaeOIteY+QfXTbELEKfdvyrFk6Ig5G4NejYsj7QErRqeCnqE1RgC1EoPZGXGM+gI
VDj7RO/65negbrBiKh75agH870jpYRue92qdoX1o39v+R9JrVeUKUmdUvWzEzA14
R1zuCNAm6+qiypFGqX6WE9QC+6wJmFMCD9/Lb9iKXzsjiZcKVQnzJxy79uQArfVg
rQQKa44/cXI7lOE8kboVEeH/O3kvFVtiTa2eJ1Q3YerVYbdsZycAKgUHu5792iGg
n+4Ke2dl4634zU2HRymLEB2v9UH5Qe1fYVcYCzJ06dap2s5jkoTuzwOZKuNIhmkS
eckLadbmZX5sf0clXiXwmbfO+k6X1bdMZBLMn1Fn6UxbrHnOy5E=
=PuJK
-----END PGP SIGNATURE-----

--SU7q6hDtTecwI3kF--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C044D7DAD80
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 18:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjJ2RZn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 13:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjJ2RZm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 13:25:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC682AB;
        Sun, 29 Oct 2023 10:25:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7471C433C8;
        Sun, 29 Oct 2023 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698600340;
        bh=HPQRMUVS1V2LjKPce0wyFQlweC21CxGf3flRl1o5x/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qp3oD0/D/6HmQCxJMUYOQT1DL/kkFEbBIfw4WLMeN9CCuD5lkaTNi+Lwz2I2A0qIL
         oFXMQ/umkuWjNIuER6eaiT77J3D4jGunWEm48K0AKbMo8vpvMVrewxWSCrskcYjLiY
         eJZCw9AdPhL3V4X3trcqzrvQ6Zt1/DBjB4sPnrbl7q9V2pDgaNZZlcHcLrHEj3/tuj
         U0pxFb/cL2CpgINtZayCH8J/uFbu8gH6H6PRZT3xZc9z+YrIYg3TFIhX5ZZteRiyDn
         zVPcSVjAbHIghd1KrSuFcTsnLqN7sAHILyAIP8/kf1U5XM8eCGYD1c/3L8UNu//RRc
         7dA27ZGnp0vww==
Date:   Sun, 29 Oct 2023 18:25:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Riwen Lu <luriwen@hotmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiongxin@kylinos.cn, Riwen Lu <luriwen@kylinos.cn>
Subject: Re: [PATCH v1] i2c: i2c-core-base: Modify the maximum idr id for i2c
 adapter
Message-ID: <ZT6VkUjzhy3/rEP2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Riwen Lu <luriwen@hotmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, xiongxin@kylinos.cn,
        Riwen Lu <luriwen@kylinos.cn>
References: <TYCP286MB26079F414019C8AC9303E412B1E69@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
 <Y7wvLi2lA1bSH5By@ninjato>
 <TYCP286MB2607A8F23BC707F4E4FD8859B1FF9@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mJtofPj6c6/iEMDq"
Content-Disposition: inline
In-Reply-To: <TYCP286MB2607A8F23BC707F4E4FD8859B1FF9@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mJtofPj6c6/iEMDq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The Phytium i2c driver would register the i2c adapter with idr id 0 by
> calling function i2c_add_numbered_adapter(adap). Then, function
> idr_alloc(&i2c_adapter_idr, adap, adap->nr, adap->nr + 1, GFP_KERNEL)=EF=
=BC=9B
> allocate the idr failed because idr id adap->nr(It equal to _UID) has been
> allocated by MWV207 GPU, and print the following error:
>=20
> couldn't get idr
> i2c-phytium-platform PHYT0038:00: fail to add adapter: -16

i2c-phytium-platform is not an upstream driver, right? Why does it not
simply use i2c_add_adapter() instead of i2c_add_numbered_adapter()?


--mJtofPj6c6/iEMDq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU+lZAACgkQFA3kzBSg
KbYCKQ/+JNKaF3np2WhIeAFiW4M1ewdsE0Do931EqeeRBbKQffivEV0hlWd2V4D1
6kvbBs/1IHua5S/DwKIpo+NvoLgcMSbHONfVoI6Frs76CFUz4MOKo8JvUVydMfnm
Ig7XQ58qkjHKQIxexS9q7dVDbAZ2sHS9olJgCVAihFpeKxNMkijuAKbzFcWsbNop
TagoeL4gSMFyFmFQ7je2NdfOYShLcIJpruYJVnBfcxtpPPd7J0KDTxEUC+M1Fay8
bAh8/uNf1MdZomMZtukNDgq43ewv874eSJVc38JnpQ6vHijF98uaFsH5GSSaNpbj
2r6MWGng5XlHBmHo/8hNN1r5zOY4INs6k8ml+udgnL4j5YG6uA+rl2wu0SLdYGC2
gyeeuAWCpppeVu3ox1rCWmvSNZVUK09bXt5oPKVuaSvq1NK9ZD2tl0OMWDHUM2JY
fheimO+Obfyh/352NjvtuMA2gvLY9c8JCeww5Z2m74/8qYWc3aDFBNSXiTeyseNl
5nafOEC34l9YLX0sTMV4LPJ7qlte328hm4hLuh8XPYOdxtIY8qkoihHUy8dr3RhD
XvI4RUEVzMV65TCGOlo6ae64gVT5WGkkF7OTQzQtyEFQ428y3WaJTbp1m/pvVW8v
3KNVKPm3aLO73F2AnggWM271pTBRIDG525P32akyn+ItQGJYoHM=
=6XA5
-----END PGP SIGNATURE-----

--mJtofPj6c6/iEMDq--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7AC5E5418
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 22:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiIUUCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 16:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiIUUCD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 16:02:03 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9EE86898
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=0wdNs9UZiUObyNmDCzuVAN8FVQSF
        4SXvo6exaqTNLH4=; b=G5KoAGDwj4mUKlInQ0LOzUG5YZDQVAlvx6aTQFFtm+/G
        84yR35rY+ega9cc62KHjwQxSLg2YK1We9f38YTHYX3O+UKJmkOEykIZtAVO9KDqU
        kbPzPGJJs8VR+OYkktw1Js5M1QNI4tU4b1RHwi8T47+5pCrLBWgfIAO+SxtLqjs=
Received: (qmail 1347624 invoked from network); 21 Sep 2022 22:02:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2022 22:02:00 +0200
X-UD-Smtp-Session: l3s3148p1@xrjnajXpWOMgAwDtxwncAPgJb5TsabMI
Date:   Wed, 21 Sep 2022 22:01:59 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: How to remove DT support from a driver? (was Re: [PATCH v5 8/8] i2c:
 i2c-mlxbf.c: Update binding devicetree)
Message-ID: <Yyttt3DiQpMZYejA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
 <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
 <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pm1Lj2tDeBpt8LQv"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pm1Lj2tDeBpt8LQv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I have a question for you and Wolfram, we don=E2=80=99t use device trees =
and
> are not planning to use device trees; we only use ACPI tables. But I
> think when Khalil submitted the first version of the i2c-mlxbf.c
> driver, it was requested from him to add devicetree support. Do you
> know why? Is it possible to remove the device tree support and so this
> doc? or is devicetree support a requirement regardless of the actual
> implementation?=20

The first version sent from Khalil to the public I2C mailing list already
had DT bindings [1]. I don't see a sign of someone of the public list
requesting DT bindings. Maybe it was company internal?

Technically, there is no requirement to support DT, especially since you
have working ACPI. I don't know the process, though, of removing DT
support. You would basically need to be sure that no user made use of
the DT bindings introduced before. I don't know to what degree you can
assume that.

Maybe the DT list has more to add here?

Happy hacking,

   Wolfram

[1] http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D73827&stat=
e=3D*


--Pm1Lj2tDeBpt8LQv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMrbbcACgkQFA3kzBSg
KbaIvA/9FSSkOUXl9RVM+YmOszSc7oaeV13hKjWUwmowouGcHCSMfdZKi/X9Natc
NnzoPup7TRc2DXsMhHof2QSijm2+q6SXGEqK5cdED8/O4pm5VYziNpPbvzf5l6hl
Tf9JkpTG5CuQFb9niieM+ZeZ9nyqIKkYODITcxKz8HFoijxxXa8eoN42gwVRv1Z/
R4gcqkfSU2ySBsMOvmrocmKocd6XcT+LycwGF5vODGECkKOm/9o1w5oojQh8gmMF
nF9IANO6DrZeq7MbNCBmkxJQV/RgwiHdzF91hWvWO95E4UyPe3RcC9mOgJTGP3La
1f/68TPXjDAncICLdolg7G35aotOFDkiCqyBRsNgkXM11Ms/3YG1IHtwFbIMCexm
rHqcE7KEzuzdqZJycOXfgdPPubAC6IePkpQC4OfOtH0KiIOTOw0yso8lGNylKobq
HM2Nt8SbFgHjrRER+bnvtXL9ZylS9QrjI2TEMYzubRA+Ir4BJ8yroCk/TyLcGWLm
NH2khopzyRIRC9Fsz8oFVRgMP66/rdclx3P1rx1oRWjtd9UiBzh21qZRYddfB2wN
00LCOowrR7m4BojLO2wma9Aiff+ieMFAeyBvllrRpHXgAkgckhvldj4PHdV/WfVE
f4AkGpE8Pfs0BxfdMrqLEJIYQRB3yenrp737X//sNae3QGluHuI=
=YihV
-----END PGP SIGNATURE-----

--Pm1Lj2tDeBpt8LQv--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B674CDEF2
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Mar 2022 22:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiCDUoC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Mar 2022 15:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiCDUoA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Mar 2022 15:44:00 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C44230E68;
        Fri,  4 Mar 2022 12:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1646426558;
        bh=avVKest8nf1VF3/YI54jobn1lGq5BmcOz47RyPALIck=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=bR/J+w2eKA8Fr4ZmFuRBiXjAoZ7sAMdRaBkCKpkBfWQ8J6UxXubHPBQ9v0cSPFWxV
         GFVWZCzFaIx2SA8k40/4dhgnSugqBmJPVkr04LrX+yaNNdvwUS7lhNN6AlnXrar/t2
         OZjYZ+UcGJ+c3fG0K/tk9imAgQd6Zswn5ZB0oAc4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0G1d-1oMJaM35Fv-00xIgu; Fri, 04
 Mar 2022 21:42:37 +0100
Date:   Fri, 4 Mar 2022 21:42:34 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
        Benjamin Fair <benjaminfair@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, bence98@sch.bme.hu,
        arnd@arndb.de, sven@svenpeter.dev,
        Rob Herring <robh+dt@kernel.org>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
        jie.deng@intel.com, avifishman70@gmail.com,
        Patrick Venture <venture@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
        Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
Message-ID: <YiJ5unrCb82ZMV4Z@latitude>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
 <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
 <YiDNdlEKqorDFkZB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PXMPnXsV2kwhaoxF"
Content-Disposition: inline
In-Reply-To: <YiDNdlEKqorDFkZB@smile.fi.intel.com>
X-Provags-ID: V03:K1:Zli3HN5UeRh8y7YdfY7dSXaXcoTBQJonefjHcxXAcSPHHiLbEUo
 COUWcmB3iv+h63RKwjP8auhxTimzHpMO0E7dpg6Nddpx678VDmNrR+vzqUTX5EKaP/7WloY
 FD3ANPuTqADzACb/t6LPyyBxCrFN/iviQlJ+JGqH87km+zF4Y0NJOr5TpCvOZr930esCkgO
 F4gxdgS4iye97RMJaEapw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iR6a6/NuSJw=:B5Me0AONULYMpmO5CvccFi
 W62cBkOpnOmnYttFnp7/QWj4u/EJ0b/3/RzF1TlxnFgYKYTNTlLNx3N4aCAa7hqqD2vBjIPKm
 5M4uSiMDGg/KcMkxKvB19vkq1RuV/48YEwT0OzbeJd3DwhnP0ZunakUeVmVMLuT+z9UQ6Wn+3
 CsXWz05DRX33fSaXEWjW5BAdbtn33OP5MdXM8BBDtZgFluNWbfiwxmrn3FKxB2yM89BVO2P3O
 OJq4CKZcm1S1GwqBhmRBj0KUpoP/0xa2XNpGpu9Yc6Ix540mflHFCUecqRxSUvssVp6Ap/viB
 FeVax6wYjhtQljYbVwcZhIk90iTATJaLNIkJy8GpsCegkIwLoO7Tu4u0p415uMhIZ8NLfKQVO
 oN5c8l6quAP6RkuB2sCymtyjml+Aq1KnXCxRSBvgLYaVJwzOTJH0mn7XiAbm5mn78OYxLtWFl
 Pinb4pbKIoCFIT4I6KxidMdl9NpTwHMkNkxh6xCbThbqSxEEmf0ZdI0CHDmW82Sb7M80jCgeV
 w/50LQuyc23GCINlR96eCEtLMznApSe2qTLknHzlL5Kwgbh6c4MvigbWWyTV+S+sFtl4DCa5G
 LxmoAl3Gg36JX+SDNOniD0PyBqrpMq183zDOxvQcoPbsRP7oDfHPz2U3iLgQH7LXgmHVIcsS4
 U++MyObQCgJQu+WKvY0pmAco9p9S7UGTYvnwfl14uFUXLo0vUF1PNupLaAHT+cHNDGNjqrz8U
 iyEb77N7yarc31zw7ICTyrCElY/k/HmHQVLwyvSixAIxPZW4bM1EvnwutZTB+UoZnNNJO+i1X
 g6rEX74oJ/1FCn1EubPV1lDAEKRmXYT1CqZKNYIuQdZrimFnSdmX8CpvqWJwqNb5FbEOu9I5u
 wij/YIRZJU9FGx3tWxuAee8iI9ZCcgdu/3eP9L2pmC6JFOP/S0md3d+pEyc3qiFISlKdX+kTU
 k13nO/rgbCdfhox6VDp4BWZYM4/ZZSNNqiOjGSEXAOIZJq57tXjekjTpCkbx4+BFLTcPeSjf5
 /3eK9fpB+J2Fc/33uBe0og/VlvwMdgNLzUYzbBALMLsqal/NamVU/KFnGk/hPjxGDCmQq3s8X
 K3RsRYLAviA8Ak=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PXMPnXsV2kwhaoxF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Mar 03, 2022 at 04:15:18PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 03, 2022 at 02:54:27PM +0200, Tali Perry wrote:
> > > On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > >
> > > > Use ioread8 instead of ioread32 to access the SMBnCTL3 register sin=
ce
> > > > the register is only 8-bit wide.
> > >
> > > > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller=
 driver")
> > >
> > > No, this is bad commit message, since you have bitwise masks and ther=
e is
> > > nothing to fix from functional point of view. So, why is this a fix?
> > >
> >=20
> > The next gen of this device is a 64 bit cpu.
> > The module is and was 8 bit.
> >=20
> > The ioread32 that seemed to work smoothly on a 32 bit machine
> > was causing a panic on a 64 bit machine.
> > since the module is 8 bit we changed to ioread8.
> > This is working both for the 32 and 64 CPUs with no issue.
>=20
> Then the commit message is completely wrong here.

I disagree: The commit message is perhaps incomplete, but not wrong.
The SMBnCTL3 register was specified as 8 bits wide in the datasheets of
multiple chip generations, as far as I can tell, but the driver wrongly
made a 32-bit access, which just happened not to blow up.

So, indeed, "since the register is only 8-bit wide" seems to be a
correct claim.

> And provide necessary (no need to have noisy commit messages)
> bits of the oops to show what's going on

I guess it's blowing up now because SMBnCTL3 isn't 32-bit aligned
(being at offset 0x0e in the controller).


Jonathan

--PXMPnXsV2kwhaoxF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIieZgACgkQCDBEmo7z
X9vLSg//fITuy/ADChnXLOLttsuqN0fnIxt64hs6/pBiL3cnl2CIy2UYqmqWn/cJ
EldCmMStePptCzalodvcviUUuEzLdFbIhRhCf+3KiMvsiHAxpb1btCpO/tSWO7KZ
XERAbEgWgfMsl8cTnX6FQzbjDCGRZ7GdYHL8duoQwa0UcR1UY5n83S2SkhrBCEF5
Ls0ooLJ1A/bjK16EdLai2g6U5IF+/n6reWCXXTQz8i20BLVtPznqgaXXeskTnCwr
PMwOogzXEB9/5zsbEDY9pTH4WT1k+/sISONAI5R31A5NCqZ9ITkVKb+kHjom9HtT
HoxHRra/i33qmiOsBXF8TF8H5UuMGmucItead9upr9NCOXmqwyks5lcdphPPsysS
s518aMEDTqcJxNQJ7Ko4veKKgy7bXr6Lct7GO/tbV3zeEdJayIVkdxroFeV1mrFj
PhOhl6/kd4JUluD4BSJXWU6BVp2CrwoGRAPSB9q+KyLZt0Zlx6jJ/AX86x+jn3em
tbqlADio6jbSUvOgN2HGuj9ey6XFemQCnxPdVZFRYYSjUKZP70p3Td9GXkNVmgOs
Oa/YO829ME+h6WelCPi6n6jHquf7AZM2ounhk4timphHvMvRjHSuJdBetSImnWq8
acxQRLbfZgB/xdBBLTTPyPOgYr79+44fh2GjFWsMVY0DPMFVZx0=
=ay5W
-----END PGP SIGNATURE-----

--PXMPnXsV2kwhaoxF--

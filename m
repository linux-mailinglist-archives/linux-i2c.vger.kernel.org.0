Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846554ABEF6
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiBGNSi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442187AbiBGMU1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 07:20:27 -0500
X-Greylist: delayed 329 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 04:06:24 PST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7B5C0302EC;
        Mon,  7 Feb 2022 04:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644235582;
        bh=ny+4Ok9hjLmZqMdJOe+AHOHZyUc8dQTSBOKig5sw1Zw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Gl5KqIy622abwGTYrM6Xo1WJVLlSblrb3aZsWKqO25F/xWICAtUsE3POqESd0qXde
         bM/ExhXbhRuSDpoDn5S6s91bGYfLyLKUZ7uc7DIowflvAYfIr1dY18SX2aNmS/sclK
         gxxRpSL13TkqoebmCiH+62phf+icKdvYCL4KdPtY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1oO2ST3tkI-01709e; Mon, 07
 Feb 2022 13:00:24 +0100
Date:   Mon, 7 Feb 2022 13:00:20 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Message-ID: <YgEJ1M40AG9EuRPI@latitude>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LFTVFI5jLgkqvDDv"
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-7-warp5tw@gmail.com>
X-Provags-ID: V03:K1:yg89WwvSEPrQ7hqxZPv4583IrZHv7A7T87r0LqD6PbFz3C7FN/u
 DCigsPCdor6D5A6cW9pbDSVK9Wv7zDCZff+OnUfqn03zB/IKN/kfRue1QlcueWxNEcDF7cq
 v7kUL6I1LDa0n/X7JpqTp/cVEV9z/uaWTnAp/M1NjLk7sw5xbBxX58aGYTsD5gpunxjgfA6
 1P2h57S5hXSollPCTcc1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z6mXA6PRim8=:mnjFTZTnYE8Rw0YqXK6Ju9
 EyPZ1VT51XgCvfmBG89lRz0bIoctrULAb1vHRywr1bHkpSSwpOwU0JPSZ39f3VTQosv8+n1Ln
 IQVwl0P/pmchLf2hPEcwXPEnSZMBm3aPCaOjTLDdOGt8WuofFTsg1NlDXtQAL6hUxb+f664Jz
 T+nFYfH4wkQ5ZBbFBK/I1AXur7v6YhZSh8h+7xuw4hxMPhG/+rCCkyuTK9vCxesBVcSfUeEYq
 mUhEUHyTm/66iNDunR7t9MeOmnO+mI8sF+p3StscGU4QQi6spe15p5Pngk2exoUrb3pB/ZO9i
 FiTER85pcKwlVJhkCK9IoC+CVAG2bKbA7hR7QdGCrfsvhg/hRrg1O1/ZZdm0K7lIfIadS8HwE
 pVBznNpqhml5Itx44k7c8eBlzeSt+27H8YOXX4Ym4PVhr4ews0awjftUpJeZ+56kHELa6avPO
 U852nmB3gVtbZsavfSn7vLW2EYf8+GGgh59FNdLcauJ1l6ooLVkAUbSPStdot8gKGFt2hs28V
 IbLHjLl+NeuCZoX4xP8BN94diXVD3PNsJWiM1LtCbfoncST5NqOjTORtI1JV7XLqpGpdd4km7
 erfOMwc6A0hwDkeRubSfBFCfjCcU+CPZ4adDSnNDxTS3YwqGjJNxJHg7tT8gsQbXOErA0ygG7
 +M/MTFCxEobsuk1+UAnWW3NqFNCg4eRJuEApMJk8TxglvXJY4YTHFEjCJwAHJxQADWXjku1Ni
 kXch0HbzJjH1oLesnaeUg50UmWEV2e80HLpeGpnjXBfZ//GED0SBhbm8XX5IuYJbVPjFPbi3L
 RWV9odHYf4B/9ACh7uvqZbIMPsvnw4OBY58eMEO+TjToDpGRiNARX8yRfjzxapiV+MdAxkDgv
 7E28V+Kldm2f8OOLYeSMo2HkfkfT4jGeQ90kaYr5aGzWiXxVPa2kuPKuARG8FEJZBdqiBZpMW
 XCBODFxdHxmrZ/AKTKiPQAyMynqiU9sRb/Yvvw0cXIbvF/V29PmBHv0+Xz2ZKu/QYGj/N4Y35
 Lo1+r6P+QHMQiIx9Y6hKhS3hR5e4zKQs7IQxVUiglyngVV00yzbBiqvCrYYBjatETOfB6/k3U
 I+VXA3WMgs0SLg=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LFTVFI5jLgkqvDDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> NPCM8XX uses a similar i2c module as NPCM7XX.
> The only difference is that the internal HW FIFO
> is larger.
>=20
> Related Makefile and Kconfig files are modified
> to support as well.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")

It's not really a bug fix, but rather an additional feature.
Therefore, I suggest removing the Fixes tag from this patch.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
[...]
>  /* init register and default value required to enable module */
>  #define NPCM_I2CSEGCTL			0xE4
> +#ifdef CONFIG_ARCH_NPCM7XX
>  #define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
> +#else
> +#define NPCM_I2CSEGCTL_INIT_VAL		0x9333F000
> +#endif

This is going to cause problems when someone tries to compile a kernel
that runs on both NPCM7xx and NPCM8xx (because the driver will then only
work on NPCM7xx).

And every time another platform is added, this approach will make the
code less readable.

A more future-proof approach is probably to have a struct with chip-
specific data (such as the I2CSECCTL initialization value), which is
then selected via the .data field in of_device_id.


>  static const struct of_device_id npcm_i2c_bus_of_table[] =3D {
>  	{ .compatible =3D "nuvoton,npcm750-i2c", },
> +	{ .compatible =3D "nuvoton,npcm845-i2c", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);

e.g.:

	static const struct of_device_id npcm_i2c_bus_of_table[] =3D {
		{ .compatible =3D "nuvoton,npcm750-i2c", .data =3D &npcm750_info },
		{ .compatible =3D "nuvoton,npcm845-i2c", .data =3D &npcm845_info },
		{}
	};
	MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);


Best regards,
Jonathan

--LFTVFI5jLgkqvDDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIBCaYACgkQCDBEmo7z
X9uI7A/+MWPp/zPHPaH3lYE4rWHKtXP/hbBmF0vkBrZkvhLAh69d3QhFSCURD+7b
aC2EGxA6Jmnnbq4iGi76fSAge1D6KiDCpYvi3QLRSY5h66nEyvnAs2JlZZXMfBkQ
TTCWSzdULh1ow8+IdwzTuQ/ngCNk+Dar1R8tsPvZjfgjNA+huM/UuBNP6c8XY/pe
r1gGazpuFO5IittQwGVqW0f7WVdu7gBGsuOBlpdS4xMGdw5Zp2XSmMXPjESEI6Tp
lCycBXLdhzEokfA76PhOuRSjn6V3fyZYlw/iIxLh/vISBD+XtAt9RuvvqHmxIlS0
T+rqm3Kdn6BPb6xYxdBt2lySI6838dS7CvAI4ntu42bGTM+xboOSXm7RTUT0/PRV
cGV3Uo3vx9fLNWVjxLhEbuMYyGY1AbE5UuORWkij2XilAWrwOqvFUWWu0Xw5UnaA
SaWSZHU7/9QP16BCwoVt5Nv2HiygMddN50dZFAzcy2oLXoChLFThcrc5KGKvfX/4
ltXWQ4XI+7riX9QhoD9HX2SLwTNaX1V8nHojvzbflb7UIvujg8VSu2uBq6hRElDe
BrBEbtEkFYVzs2zkULWGsp9bQGcwJF3gVEWFTpxuLWS6xFB3kJqPhVffoqxL4NbD
W3HqOmJArx3js3avkgpp3LzI8hAAYfq+yP3Fibsmc9Z89mU5rYE=
=8qyc
-----END PGP SIGNATURE-----

--LFTVFI5jLgkqvDDv--

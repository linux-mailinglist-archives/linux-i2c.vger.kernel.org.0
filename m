Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE11C5F84A3
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Oct 2022 11:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiJHJtS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Oct 2022 05:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiJHJtR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Oct 2022 05:49:17 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FB31A201;
        Sat,  8 Oct 2022 02:49:15 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 663295C0050;
        Sat,  8 Oct 2022 05:49:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 08 Oct 2022 05:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1665222555; x=
        1665308955; bh=uVFJ/ixFTuJnrPpiJX6LTMPl44z8m+rvMsabaV3ZgAc=; b=O
        ghPHC9z0ghD0VkEkl8iG4dY+2QNDwjO10Q1Hpe1rOIrEAv9mK/A4M+kp538aSLAR
        5ozhbtz+ZgI0IyohsvGY7FCRfeFIsV4rGmZ3xmquheDgmaWRKLzdDs46vYiPLGps
        CJG8ZSGkPYqKH5zKV/rdXDOcA73L4DAbv4TvHhNyAxpxMbCYinwIN/APhOzWNK8v
        U7Up73CoV3ZmJYjVYrVTmCe7qeb5tb3DftB5BwePZNdEApMC96LGqAe4NTjg2Csm
        K8R3Fs2YOkSkgHTlPH/3nRawT2MSjKdwCaL4rECj42wxNECQN61NVkuO5x6XM5ED
        ydZ5Oqu0a2h4+lbvClQ/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665222555; x=
        1665308955; bh=uVFJ/ixFTuJnrPpiJX6LTMPl44z8m+rvMsabaV3ZgAc=; b=O
        xZUcRRG6CuHz40Ik0Oh2py6Z3KNeNlrX7gOx+fx2ajE8ZJF4whTQkSfHIKMRknCl
        gloqnYKIVGOTtZpLAnyhvGtj4Td7yLVFivuo6ujEP4x3M0KfgcKXO8oV04hPHv3T
        EvJPeaMmz2de0HGf3KnrgJv8XLX/pFiWfWV/FUw6KJ4KtmXQl7Hyl7cHEF2Ikg2T
        v98RywUfLr1rQAjxgpxgRNzFK5o0JWqRB8WELoUgc4KUhOcGYkTEi2qOmoHEk7FR
        Z0ZH7fmrEKvqKwISHCKi+eAKc0atBQoyomNkIR28VeCLleboqXMdknruEVuFTkkF
        9RwOkolCtcNUgnpOLh+rQ==
X-ME-Sender: <xms:mkdBY2csKk4dWgRzzMCiAYzpTpTQuwavSpLNvj5IqG3Jk2g_a7C0JQ>
    <xme:mkdBYwOOw7QyPEFxhrnW1IIcUl_VqEemqI9mpi-GADdrT29ffa4OgBbSXEvboQs9T
    I_qlw2zd_kB-x78yZg>
X-ME-Received: <xmr:mkdBY3iB_iSfoX-w5HxF8uTrARZt64JIqNtqseAmtl-nLtZr5f0WSlmVvvXR8HHIku3NTVbdhUKW_3_6XqUN1SxuAWfqLScYtki03aLp63o-2aMCO060Al8AireyLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiledgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptgfghfggufffkfhfvegjvffosehtqhhmtdhhtdejnecuhfhrohhmpefuvhgv
    nhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhepffdvueeggeffieelgeeitdekteejkeehhefhheduledvueduvdelffeiveel
    teeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggv
    vh
X-ME-Proxy: <xmx:mkdBYz9cMhi2VMI_HwJyTOrHl8m5-Mc7qWqP6NdfdnVE5b2mFFGvJg>
    <xmx:mkdBYyulqXQyO6biOiXHkhTQKUfr9zdvX7VfpeM4_YHbEsHx2FfSug>
    <xmx:mkdBY6GRKiXirMwbybVRoJtuWp43MPA0NJTLP5DfjagZeG-TF4eyag>
    <xmx:m0dBY8IKIxMzynN_XVgkRTjRWgvWQqzsb6PDFUnKJa-pnb7BmkycsQ>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Oct 2022 05:49:03 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Sven Peter <sven@svenpeter.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3] i2c/pasemi: PASemi I2C controller IRQ enablement
Date:   Sat, 8 Oct 2022 11:48:42 +0200
Message-Id: <A0B81E7F-BF26-424D-B9E5-5647323B24EC@svenpeter.dev>
References: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
To:     Arminder Singh <arminders208@outlook.com>
X-Mailer: iPhone Mail (20A362)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

> On 7. Oct 2022, at 02:43, Arminder Singh <arminders208@outlook.com> wrote:=

>=20
> =EF=BB=BFThis patch adds IRQ support to the PASemi I2C controller driver t=
o=20
> increase the performace of I2C transactions on platforms with PASemi I2C=20=

> controllers. While primarily intended for Apple silicon platforms, this=20=

> patch should also help in enabling IRQ support for older PASemi hardware=20=

> as well should the need arise.
>=20
> Signed-off-by: Arminder Singh <arminders208@outlook.com>
> ---
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.

I think Wolfram suggested to keep this in the commit message. If in doubt li=
sten to him and not me because he=E2=80=99s much more experienced with the k=
ernel than I am ;)

>=20
> This version of the patch only contains fixes to the whitespace and
> alignment issues found in v2 of the patch, and as such the testing that
> Christian Zigotsky did on PASemi hardware for v2 of the patch also applies=

> to this version of the patch as well.
> (See v2 patch email thread for the "Tested-by" tag)

You can just collect and keep those tags above your signed off by if you onl=
y change things like whitespaces.

>=20
> v2 to v3 changes:
> - Fixed some whitespace and alignment issues found in v2 of the patch
>=20
> v1 to v2 changes:
> - moved completion setup from pasemi_platform_i2c_probe to
>   pasemi_i2c_common_probe to allow PASemi and Apple platforms to share
>   common completion setup code in case PASemi hardware gets IRQ support
>   added
> - initialized the status variable in pasemi_smb_waitready when going down
>   the non-IRQ path
> - removed an unnecessary cast of dev_id in the IRQ handler
> - fixed alignment of struct member names in i2c-pasemi-core.h
>   (addresses Christophe's feedback in the original submission)
> - IRQs are now disabled after the wait_for_completion_timeout call
>   instead of inside the IRQ handler
>   (prevents the IRQ from going off after the completion times out)
> - changed the request_irq call to a devm_request_irq call to obviate
>   the need for a remove function and a free_irq call
>   (thanks to Sven for pointing this out in the original submission)
> - added a reinit_completion call to pasemi_reset=20
>   as a failsafe to prevent missed interrupts from causing the completion
>   to never complete (thanks to Arnd Bergmann for pointing this out)
> - removed the bitmask variable in favor of just using the value
>   directly (it wasn't used anywhere else)
>=20
> v2 linked here: https://lore.kernel.org/linux-i2c/MN2PR01MB535821C8058C781=
4B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com/
> v1 linked here: https://lore.kernel.org/linux-i2c/MN2PR01MB535838492432C91=
0F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com/T/#m11b3504c2667517aad752=
1514c99ca0e07a9381f
>=20
> Hopefully the patch is good to go this time around!
>=20
> drivers/i2c/busses/i2c-pasemi-core.c     | 29 ++++++++++++++++++++----
> drivers/i2c/busses/i2c-pasemi-core.h     |  5 ++++
> drivers/i2c/busses/i2c-pasemi-platform.c |  6 +++++
> 3 files changed, 36 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c=
-pasemi-core.c
> index 9028ffb58cc0..4855144b370e 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -21,6 +21,7 @@
> #define REG_MTXFIFO    0x00
> #define REG_MRXFIFO    0x04
> #define REG_SMSTA    0x14
> +#define REG_IMASK    0x18
> #define REG_CTL        0x1c
> #define REG_REV        0x28
>=20
> @@ -66,6 +67,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
>        val |=3D CTL_EN;
>=20
>    reg_write(smbus, REG_CTL, val);
> +    reinit_completion(&smbus->irq_completion);
> }
>=20
> static void pasemi_smb_clear(struct pasemi_smbus *smbus)
> @@ -81,11 +83,18 @@ static int pasemi_smb_waitready(struct pasemi_smbus *s=
mbus)
>    int timeout =3D 10;
>    unsigned int status;
>=20
> -    status =3D reg_read(smbus, REG_SMSTA);
> -
> -    while (!(status & SMSTA_XEN) && timeout--) {
> -        msleep(1);
> +    if (smbus->use_irq) {
> +        reinit_completion(&smbus->irq_completion);
> +        reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> +        wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiff=
ies(10));
> +        reg_write(smbus, REG_IMASK, 0);
>        status =3D reg_read(smbus, REG_SMSTA);
> +    } else {
> +        status =3D reg_read(smbus, REG_SMSTA);
> +        while (!(status & SMSTA_XEN) && timeout--) {
> +            msleep(1);
> +            status =3D reg_read(smbus, REG_SMSTA);
> +        }
>    }
>=20
>    /* Got NACK? */
> @@ -344,10 +353,14 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smb=
us)
>=20
>    /* set up the sysfs linkage to our parent device */
>    smbus->adapter.dev.parent =3D smbus->dev;
> +    smbus->use_irq =3D 0;
> +    init_completion(&smbus->irq_completion);
>=20
>    if (smbus->hw_rev !=3D PASEMI_HW_REV_PCI)
>        smbus->hw_rev =3D reg_read(smbus, REG_REV);
>=20
> +    reg_write(smbus, REG_IMASK, 0);
> +
>    pasemi_reset(smbus);
>=20
>    error =3D devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
> @@ -356,3 +369,11 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbu=
s)
>=20
>    return 0;
> }
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> +{
> +    struct pasemi_smbus *smbus =3D dev_id;
> +
> +    complete(&smbus->irq_completion);

I only realized just now that you also want to disable the interrupt right h=
ere by writing to IMASK. This is a level sensitive interrupt at AIC level so=
 the moment this handler returns it will fire again until you reach the writ=
e above after the completion wait a bit later.


> +    return IRQ_HANDLED;
> +}
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c=
-pasemi-core.h
> index 4655124a37f3..88821f4e8a9f 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.h
> +++ b/drivers/i2c/busses/i2c-pasemi-core.h
> @@ -7,6 +7,7 @@
> #include <linux/i2c-smbus.h>
> #include <linux/io.h>
> #include <linux/kernel.h>
> +#include <linux/completion.h>
>=20
> #define PASEMI_HW_REV_PCI -1
>=20
> @@ -16,6 +17,10 @@ struct pasemi_smbus {
>    void __iomem        *ioaddr;
>    unsigned int         clk_div;
>    int             hw_rev;
> +    int             use_irq;
> +    struct completion     irq_completion;
> };
>=20
> int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id);
> diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses=
/i2c-pasemi-platform.c
> index 88a54aaf7e3c..e35945a91dbe 100644
> --- a/drivers/i2c/busses/i2c-pasemi-platform.c
> +++ b/drivers/i2c/busses/i2c-pasemi-platform.c
> @@ -49,6 +49,7 @@ static int pasemi_platform_i2c_probe(struct platform_dev=
ice *pdev)
>    struct pasemi_smbus *smbus;
>    u32 frequency;
>    int error;
> +    int irq_num;
>=20
>    data =3D devm_kzalloc(dev, sizeof(struct pasemi_platform_i2c_data),
>                GFP_KERNEL);
> @@ -82,6 +83,11 @@ static int pasemi_platform_i2c_probe(struct platform_de=
vice *pdev)
>    if (error)
>        goto out_clk_disable;
>=20
> +    irq_num =3D platform_get_irq(pdev, 0);
> +    error =3D devm_request_irq(smbus->dev, irq_num, pasemi_irq_handler, 0=
, "pasemi_apple_i2c", (void *)smbus);
> +
> +    if (!error)
> +        smbus->use_irq =3D 1;
>    platform_set_drvdata(pdev, data);
>=20
>    return 0;
> --=20
> 2.34.1
>=20

Sven=20=


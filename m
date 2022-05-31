Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5208538DD1
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 11:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245284AbiEaJgE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 05:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237594AbiEaJgD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 05:36:03 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF27819BE
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 02:35:58 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t144so16749684oie.7
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rNIUiIBXyDGvzHE+zEymfz2BuuwWa1afkL1Ck+gh5so=;
        b=bUd/ibq+bmZUSmRa/qTzHSW6UPiz5wLoLGk3kS74svogQoGRP9EnEwUMFZQQx2Dtr4
         6xZ/PXALBWBE7Wq3nYGo/doZcb2ASNxDtz1uDwfoYA0moFl/6d0BEl7f8UFyYp82szmJ
         tzjFCMtOy9B3Rt6P+xaaL/FOThNkMjon01ZTazOeHw1qZv53Wq6+te8b84bErXZZXuCP
         Z44t7iicNlvEnxEMmAuizTvVk4+Wkwx7V/CxgXq4JcoPrvb9VZqiz4m4A8ZMA8StTTQU
         mgF5dVb7OTGEY6sHO00KEz99z7YFaEajC0N+NvcrIAa1KJsnXTA7wRU4bvzj08sYVcMQ
         JibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rNIUiIBXyDGvzHE+zEymfz2BuuwWa1afkL1Ck+gh5so=;
        b=VSsXSAkbnvzV/gHfSwbPhPk1EyLTWs8erTloDQugS7HgXc8d1uSrjd9BgH7BLQCTmk
         x7UdPLikss6W4nU7pDBxUQKYNAwMyf5lCOy7etmu67QieNqaD9P8KckKb4DcAQ9+C3zh
         EmmQkZl8VoOMxWhQq30Uwv3u0Ml4Rho/pNBtdXVYaLh7+Lbvaq7/sDBCHgfG3yNgBXnb
         XrrQDHZSd/JQJa2n03zexspBjNXwRY+tlWqsnD7iCVrACYPwrjAwPEm9VTIC90JoBXoD
         +08YKgTg4exFrxophCxP6XJGEEQ5w4MWyvycwQfyCePH1Gs4eTuY5GmIrfUlbfy47nlv
         Owhg==
X-Gm-Message-State: AOAM533FUtu/Fu9AXQ8SP1ycS4KkQNFJ753W/TPe0g6SKD6AIRgiA7J1
        4H5I/S5XFiudA8A3LEhKyjIyK+2d6gICmby1TW6kZQ==
X-Google-Smtp-Source: ABdhPJxBNxkVY3rd7hL5fhkw0+H4Wgohxf2NOuEGwfG7qs2dWKUzMdr6nRKwgndZs0sFXNaAopWhP5rfACegYpbKokM=
X-Received: by 2002:aca:ac93:0:b0:32a:e3b6:7c52 with SMTP id
 v141-20020acaac93000000b0032ae3b67c52mr11585107oie.294.1653989757860; Tue, 31
 May 2022 02:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
 <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com> <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
 <e62fba0b-ebb9-934a-d7cf-6da33ecc4335@linux.alibaba.com> <CACPK8Xc+v132vM-ytdAUFhywFXGpPF+uPSBWi68ROf_PLD4VQQ@mail.gmail.com>
 <0f5cd773-2d0a-b782-b967-ecbcec3de7b1@linux.alibaba.com>
In-Reply-To: <0f5cd773-2d0a-b782-b967-ecbcec3de7b1@linux.alibaba.com>
From:   Lei Yu <yulei.sh@bytedance.com>
Date:   Tue, 31 May 2022 17:35:47 +0800
Message-ID: <CAGm54UFUxNpwKjQyQnqtbys_nfgx2KcEEJt3-0nJWYjyjM9pvw@mail.gmail.com>
Subject: Re: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after timeout
To:     Heyi Guo <guoheyi@linux.alibaba.com>
Cc:     Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I hit a similar problem that has a slightly different backtrace on a
malfunctioning device.
https://pastebin.com/TiWdkdrG

With this patch, the kernel panic is gone and it gets below logs instead:

 aspeed-i2c-bus 1e78a180.i2c-bus: bus in unknown state. irq_status: 0x1
 aspeed-i2c-bus 1e78a180.i2c-bus: irq handled !=3D irq. expected
0x00000001, but was 0x00000000
 aspeed-i2c-bus 1e78a180.i2c-bus: bus in unknown state. irq_status: 0x10
 aspeed-i2c-bus 1e78a180.i2c-bus: irq handled !=3D irq. expected
0x00000010, but was 0x00000000

So I think this patch is good in that it prevents the kernel panic.

On Wed, Jan 19, 2022 at 11:00 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote=
:
>
>
> =E5=9C=A8 2022/1/17 =E4=B8=8B=E5=8D=882:38, Joel Stanley =E5=86=99=E9=81=
=93:
> > On Fri, 14 Jan 2022 at 14:01, Heyi Guo <guoheyi@linux.alibaba.com> wrot=
e:
> >> Hi Joel,
> >>
> >>
> >> =E5=9C=A8 2022/1/11 =E4=B8=8B=E5=8D=886:51, Joel Stanley =E5=86=99=E9=
=81=93:
> >>> On Tue, 11 Jan 2022 at 07:52, Heyi Guo <guoheyi@linux.alibaba.com> wr=
ote:
> >>>> Hi all,
> >>>>
> >>>> Any comments?
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Heyi
> >>>>
> >>>> =E5=9C=A8 2022/1/9 =E4=B8=8B=E5=8D=889:26, Heyi Guo =E5=86=99=E9=81=
=93:
> >>>>> The memory will be freed by the caller if transfer timeout occurs,
> >>>>> then it would trigger kernel panic if the peer device responds with
> >>>>> something after timeout and triggers the interrupt handler of aspee=
d
> >>>>> i2c driver.
> >>>>>
> >>>>> Set the msgs pointer to NULL to avoid invalid memory reference afte=
r
> >>>>> timeout to fix this potential kernel panic.
> >>> Thanks for the patch. How did you discover this issue? Do you have a
> >>> test I can run to reproduce the crash?
> >> We are using one i2c channel to communicate with another MCU by
> >> implementing user space SSIF protocol, and the MCU may not respond in
> >> time if it is busy. If it responds after timeout occurs, it will trigg=
er
> >> below kernel panic:
> >>
> > Thanks for the details. It looks like you've done some testing of
> > this, which is good.
> >
> >> After applying this patch, we'll get below warning instead:
> >>
> >> "bus in unknown state. irq_status: 0x%x\n"
> > Given we get to here in the irq handler, we've done these two tests:
> >
> >   - aspeed_i2c_is_irq_error()
> >   - the state is not INACTIVE or PENDING
> >
> > but there's no buffer ready for us to use. So what has triggered the
> > IRQ in this case? Do you have a record of the irq status bits?
> >
> > I am wondering if the driver should know that the transaction has
> > timed out, instead of detecting this unknown state.
>
> Yes, some drivers will try to abort the transaction before returning to
> the caller, if timeout happens.
>
> The irq status bits are not always the same; searching from the history
> logs, I found some messages like below:
>
> [  495.289499] aspeed-i2c-bus 1e78a680.i2c-bus: bus in unknown state.
> irq_status: 0x2
> [  495.298003] aspeed-i2c-bus 1e78a680.i2c-bus: bus in unknown state.
> irq_status: 0x10
>
> [   65.176761] aspeed-i2c-bus 1e78a680.i2c-bus: bus in unknown state.
> irq_status: 0x15
>
> Thanks,
>
> Heyi
>
> >
> >
> >>> Can you provide a Fixes tag?
> >> I think the bug was introduced by the first commit of this file :(
> >>
> >> f327c686d3ba44eda79a2d9e02a6a242e0b75787
> >>
> >>
> >>> Do other i2c master drivers do this? I took a quick look at the meson
> >>> driver and it doesn't appear to clear it's pointer to msgs.
> >> It is hard to say. It seems other drivers have some recover scheme lik=
e
> >> aborting the transfer, or loop each messages in process context and
> >> don't do much in IRQ handler, which may disable interrupts or not reta=
in
> >> the buffer pointer before returning timeout.
> > I think your change is okay to go in as it fixes the crash, but first
> > I want to work out if there's some missing handling of a timeout
> > condition that we should add as well.
> >
> >
> >> Thanks,
> >>
> >> Heyi
> >>
> >>
> >>>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >>>>>
> >>>>> -------
> >>>>>
> >>>>> Cc: Brendan Higgins <brendanhiggins@google.com>
> >>>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >>>>> Cc: Joel Stanley <joel@jms.id.au>
> >>>>> Cc: Andrew Jeffery <andrew@aj.id.au>
> >>>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >>>>> Cc: linux-i2c@vger.kernel.org
> >>>>> Cc: openbmc@lists.ozlabs.org
> >>>>> Cc: linux-arm-kernel@lists.infradead.org
> >>>>> Cc: linux-aspeed@lists.ozlabs.org
> >>>>> ---
> >>>>>     drivers/i2c/busses/i2c-aspeed.c | 5 +++++
> >>>>>     1 file changed, 5 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i=
2c-aspeed.c
> >>>>> index 67e8b97c0c950..3ab0396168680 100644
> >>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
> >>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
> >>>>> @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_a=
dapter *adap,
> >>>>>                 spin_lock_irqsave(&bus->lock, flags);
> >>>>>                 if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PEND=
ING)
> >>>>>                         bus->master_state =3D ASPEED_I2C_MASTER_INA=
CTIVE;
> >>>>> +             /*
> >>>>> +              * All the buffers may be freed after returning to ca=
ller, so
> >>>>> +              * set msgs to NULL to avoid memory reference after f=
reeing.
> >>>>> +              */
> >>>>> +             bus->msgs =3D NULL;
> >>>>>                 spin_unlock_irqrestore(&bus->lock, flags);
> >>>>>
> >>>>>                 return -ETIMEDOUT;



--=20
BRs,
Lei YU

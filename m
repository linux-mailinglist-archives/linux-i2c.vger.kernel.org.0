Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2ED1DAE21
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 10:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETI6r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 04:58:47 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39747 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgETI6r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 04:58:47 -0400
Received: by mail-oi1-f194.google.com with SMTP id s198so2289309oie.6;
        Wed, 20 May 2020 01:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVN0l6dkyp8QjxTSfWQNJ42yzsbv3rlL++sZ/Fmr/EQ=;
        b=AIgt+wofdWpd7QenGPmlrzIniaNgSZJ09LktAnS8rLtHVmgv8kNb5/TiY70cL1+SU6
         CIrMq4CrN1kG0R9+AsYs57MOvilbzwry1uQzP8xs496+EiFuMOTsTkiOA391s70/Cf6k
         +tdgoGKkbeoj1uNGUWNdoIic9vDpJuXRcnKFH86foyXn//OaMQ+Nl2+So9vUhBMWNDO/
         h4wN34mCF+44CvhRFgA3Ixl0X6gkIi3u3ob0aJzBcZeNEHsdTnaKG9j3F9HjrJ4gXZBh
         A/xbFy5awSz1aDhrzL2bBmRemb17nUPwiU/0z+J4ML+mI6w7f67hyo6+yVPGQ72n8r6e
         WBdA==
X-Gm-Message-State: AOAM530dZqyIKLpZEwAsfi9otn6x2NLH5PjIz1PFfQUyB5PkTYlB0uG5
        f8Yod+1PUN2393Mo1u9Mrx5EK15gj3zIq+2xImk=
X-Google-Smtp-Source: ABdhPJzsp1KkludV5paXyJn6bhpNw9pEmNANefZA2kLe4n+VS3fWRm3omJ908y2AEgg+QDYjQSTdABC5K6IYoIwFj84=
X-Received: by 2002:aca:cd93:: with SMTP id d141mr2338860oig.148.1589965125631;
 Wed, 20 May 2020 01:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-3-git-send-email-qii.wang@mediatek.com> <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
 <1589857073.25512.34.camel@mhfsdcap03> <CAMuHMdXgp85PVteunxrHYcMTqFgQWHmXXCVJM_KX76xkCADMpw@mail.gmail.com>
 <1589964062.25512.67.camel@mhfsdcap03>
In-Reply-To: <1589964062.25512.67.camel@mhfsdcap03>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 May 2020 10:58:34 +0200
Message-ID: <CAMuHMdXZTU+4-WyVjvv=i28x+MRVrAdRPM0_ybvkkFuh-ps+eg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     Joe Perches <joe@perches.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
        Wolfram Sang <wsa@the-dreams.de>, leilk.liu@mediatek.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Qii,

On Wed, May 20, 2020 at 10:44 AM Qii Wang <qii.wang@mediatek.com> wrote:
> On Tue, 2020-05-19 at 09:14 +0200, Geert Uytterhoeven wrote:
> > On Tue, May 19, 2020 at 4:59 AM Qii Wang <qii.wang@mediatek.com> wrote:
> > > On Mon, 2020-05-18 at 17:44 +0200, Geert Uytterhoeven wrote:
> > > > On Thu, May 14, 2020 at 3:13 PM Qii Wang <qii.wang@mediatek.com> wrote:
> > > > > This patch adds a algorithm to calculate some ac-timing parameters
> > > > > which can fully meet I2C Spec.
> > > > >
> > > > > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > > > > ---
> > > > >  drivers/i2c/busses/i2c-mt65xx.c | 328 +++++++++++++++++++++++++++++++++-------
> > > > >  1 file changed, 277 insertions(+), 51 deletions(-)
> > > > >
> > > > > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > > > > index 0ca6c38a..7020618 100644
> > > > > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > > > > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > > >
> > > > > +/*
> > > > > + * Check and Calculate i2c ac-timing
> > > > > + *
> > > > > + * Hardware design:
> > > > > + * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
> > > > > + * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
> > > > > + *
> > > > > + * Sample_ns is rounded down for xxx_cnt_div would be greater
> > > > > + * than the smallest spec.
> > > > > + * The sda_timing is chosen as the middle value between
> > > > > + * the largest and smallest.
> > > > > + */
> > > > > +static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> > > > > +                                  unsigned int clk_src,
> > > > > +                                  unsigned int check_speed,
> > > > > +                                  unsigned int step_cnt,
> > > > > +                                  unsigned int sample_cnt)
> > > > > +{
> > > > > +       const struct i2c_spec_values *spec;
> > > > > +       unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> > > > > +       unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> > > > > +       long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> > > >
> > > > So sample_ns is a 64-bit value. Is that really needed?
> > > >
> > >
> > > (1000000000 * (sample_cnt + 1)) / clk_src value is a 32-bit, (1000000000
> > > * (sample_cnt + 1)) will over 32-bit if sample_cnt is 7.
> >
> > The intermediate value will indeed not fit in 32-bit.
> > But that doesn't mean the end result won't fit in 32-bit.
> > As you divide spec->min_low_ns and spec->min_su_dat_ns (which I assume
> > are small numbers) by sample_ns below, sample_ns cannot be very large,
> > or the quotient will be zero anyway.
> > So just doing the multiplication in 64-bit, followed by a 64-by-32
> > division is probably fine:
> >
> >     unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1), clk_src);
> >
> > You may want to take precautions for the case where the passed value of
> > clk_src is a small number (can that happen?).
> >
> > BTW, clk_get_rate() returns "unsigned long", while mtk_i2c_set_speed()
> > takes an "unsigned int" parent_clk, which may cause future issues.
> > You may want to change that to "unsigned long", along the whole
> > propagation path, and use div64_ul() instead of div_u64() above.
> >
>
> The return type of div_u64 is u64(unsigned long long), there is a
> compulsory type conversion operator. Do you think it is needed?

The result of a 64-by-32 bit division may indeed not fit in 32-bit, so that's
why it returns u64.
If you know the quotient will always fit, it's fine.

> BTW, we just need to change the type of sample_ns to unsigned int, no
> matter which method is used, what is your opinion?

Indeed.

BTW, I just realize

    long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;

wasn't doing what you wanted anyway, as 1000000000 is (implicit) int,
and sample_cnt is unsigned int, so the multiplication was done in 32-bit,
possible leading to a truncation.  Hence that division was done in 32-bit, too,
that's why I didn't notice a call to __udivdi3() in the assembler output here.

So you have to force the multiplication to be done in 64-bit, e.g.
by changing the constant to 1000000000ULL, and use div_u64() for
the division.

>
> > > I think 1000000000 and clk_src is too big, maybe I can reduce then with
> > > be divided all by 1000.
> > > example:
> > >
> > > unsigned int sample_ns;
> > > unsigned int clk_src_khz = clk_src / 1000;
> >
> > That may cause too much loss of precision.
> >
>
> clk_src is more than MHz and less than GHZ for MTK i2c controller, so it
> wouldn't cause too much loss of precision.

OK, so that would work, too.

> > >
> > > if(clk_src_khz)
> > >         sample_ns = (1000000 * (sample_cnt + 1)) / clk_src_khz;
> > > else
> > >         return -EINVAL;
> > >
> > > > > +       if (!i2c->dev_comp->timing_adjust)
> > > > > +               return 0;
> > > > > +
> > > > > +       if (i2c->dev_comp->ltiming_adjust)
> > > > > +               max_sta_cnt = 0x100;
> > > > > +
> > > > > +       spec = mtk_i2c_get_spec(check_speed);
> > > > > +
> > > > > +       if (i2c->dev_comp->ltiming_adjust)
> > > > > +               clk_ns = 1000000000 / clk_src;
> > > > > +       else
> > > > > +               clk_ns = sample_ns / 2;
> > > > > +
> > > > > +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> > > > > +       if (su_sta_cnt > max_sta_cnt)
> > > > > +               return -1;
> > > > > +
> > > > > +       low_cnt = DIV_ROUND_UP(spec->min_low_ns, sample_ns);
> > > >
> > > > So this is a 32-bit by 64-bit division (indeed, not 64-by-32!)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D77670BE99
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 14:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjEVMnE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 22 May 2023 08:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233231AbjEVMnD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 08:43:03 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A7792;
        Mon, 22 May 2023 05:43:02 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-561deaad117so77146127b3.0;
        Mon, 22 May 2023 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759381; x=1687351381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApxxVlw6HRBad7byC8f2plGXUyPRSfp8tQx8kZgiQK4=;
        b=ePh68md3qSVp3NQzJWRhfc+LnKtjZsRfAJJ2P8lcjCC7ytIsF5WJF7iSGu5eu9yO0a
         ncxuZM+igPG1s7lKIzrUfzRcJ7CqIMNIy/drhqIXBHdTc6KLnvET/WTkzgM21lWFRD5W
         REuau5PWpo6pI0kfldkhwt5nySEqZBUIUldJHI4qG8pR/eEG4HyR4mUO18pA5Mr2Qzs/
         /zWMr6xr3gJpEyTRVUPn71qbwxmFRDg+b9Le6Cii6eck9STi6m5hrY1UC8TmPMTVEaCa
         X5UYso1koymxgV9BkAC/cEJV9jEk0pYizLQb2bKN04ltinXbIv19ldW6pKf8qdm0kCQE
         z02Q==
X-Gm-Message-State: AC+VfDwnLd/C2fMWwCVDwnTQjL1k/C2L64kB+OnwQ6IVwX1UHdExY0a0
        8pVQTiEFXmiRrBoOfqO//5gigTtM/K5e5A==
X-Google-Smtp-Source: ACHHUZ6aroA8HnPSzuojLNFertVghRZ4BXmaE1ZEYyJMLFqxt24paeYq8OoksUrdlohEheVrfvl30g==
X-Received: by 2002:a0d:d857:0:b0:544:57ba:a32e with SMTP id a84-20020a0dd857000000b0054457baa32emr10374888ywe.9.1684759380811;
        Mon, 22 May 2023 05:43:00 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id a131-20020a0dd889000000b0054c0f3fd3ddsm2059704ywe.30.2023.05.22.05.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 05:42:59 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-561d5a16be0so78586607b3.2;
        Mon, 22 May 2023 05:42:59 -0700 (PDT)
X-Received: by 2002:a81:5d41:0:b0:55a:ab98:a2ef with SMTP id
 r62-20020a815d41000000b0055aab98a2efmr12210137ywb.40.1684759379710; Mon, 22
 May 2023 05:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230522104157.333217-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWPF8SvJ=OyPBFSwTD65ic+KB-um0zYWVL6imO-ddgC6g@mail.gmail.com> <OS0PR01MB5922DAE12A85AC045B6222DB86439@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922DAE12A85AC045B6222DB86439@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 May 2023 14:42:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBoazJtsZ89zv1_xG9CtJ+hnasZLrW_13xtoVKANN+cg@mail.gmail.com>
Message-ID: <CAMuHMdXBoazJtsZ89zv1_xG9CtJ+hnasZLrW_13xtoVKANN+cg@mail.gmail.com>
Subject: Re: [PATCH] i2c: Add i2c_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Mon, May 22, 2023 at 2:38 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Monday, May 22, 2023 12:29 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Wolfram Sang <wsa@kernel.org>; linux-i2c@vger.kernel.org; Alessandro
> > Zummo <a.zummo@towertech.it>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-renesas-
> > soc@vger.kernel.org
> > Subject: Re: [PATCH] i2c: Add i2c_get_match_data()
> >
> > Hi Biju,
> >
> > On Mon, May 22, 2023 at 12:42 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add i2c_get_match_data() similar to of_device_get_match_data(), so
> > > that we can optimize the driver code that uses both I2C and DT-based
> > > matching.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/i2c/i2c-core-base.c
> > > +++ b/drivers/i2c/i2c-core-base.c
> > > @@ -99,8 +99,8 @@ const char *i2c_freq_mode_string(u32 bus_freq_hz)  }
> > > EXPORT_SYMBOL_GPL(i2c_freq_mode_string);
> > >
> > > -const struct i2c_device_id *i2c_match_id(const struct i2c_device_id
> > *id,
> > > -                                               const struct
> > i2c_client *client)
> > > +static const struct i2c_device_id *i2c_match_device_id(const struct
> > i2c_device_id *id,
> > > +                                                      const struct
> > > +i2c_client *client)
> > >  {
> > >         if (!(id && client))
> > >                 return NULL;
> > > @@ -110,10 +110,30 @@ const struct i2c_device_id *i2c_match_id(const
> > struct i2c_device_id *id,
> > >                         return id;
> > >                 id++;
> > >         }
> > > +
> > >         return NULL;
> > >  }
> > > +
> > > +const struct i2c_device_id *i2c_match_id(const struct i2c_device_id
> > *id,
> > > +                                        const struct i2c_client
> > > +*client) {
> > > +       return i2c_match_device_id(id, client); }
> > >  EXPORT_SYMBOL_GPL(i2c_match_id);
> >
> > Is there any reason why you're adding a new intermediate?
>
> The same code is shared between below function.
> As discussed below, it is not required.
>
> >
> > >
> > > +const void *i2c_get_match_data(const struct i2c_device_id *id,
> > > +                              const struct i2c_client *client)
> >
> > I think this should take the id table from the i2c_driver, as pointed to
> > by client->dev.driver, instead of from an explicitly passed parameter.
>
> You mean const void *i2c_get_match_data(const struct i2c_client *client)??
>
> struct i2c_driver       *driver = client->dev.driver;

also needs to_i2c_driver()

>
> And then call
>
> match = i2c_match_id(driver->id_table, client)??

Exactly.

> > > +{
> > > +       const struct i2c_device_id *match;
> > > +
> > > +       match = i2c_match_device_id(id, client);
> > > +       if (!match)
> > > +               return NULL;
> > > +
> > > +       return (const void *)match->driver_data;
> >
> > One can discuss about the returned type: personally, I won't mind "const
> > void *" for consistency with other subsystems (e.g. DT), but as
> > i2c_device_id.driver_data has type "kernel_ulong_t", other people might
> > prefer the latter.
>
> The advantage of void*, is upper layer don't need casting.

Depending on what the driver wants...
Some drivers want integers, other want pointers...

> eg: with kernel_ulong_t as return parameter:
>
> isl1208->config = (struct isl1208_config *)i2c_get_match_data;

I know ;-)
For the isl1208 case, "void *" simplifies the driver...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9F3675FC63
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 18:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjGXQnq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 24 Jul 2023 12:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjGXQnq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 12:43:46 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66F5E53;
        Mon, 24 Jul 2023 09:43:44 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-583d702129cso19327707b3.3;
        Mon, 24 Jul 2023 09:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217024; x=1690821824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mElFEfwbMG8KCjvO65hzvFcgmIqLhBTgsDuwotg3/g=;
        b=cNmCfiHe0xNzLtyJwXP7iyN9dxRmZGLZ5HF95Ijbo/5y0ycZR094LdrItiCmPb/IU3
         VHtmAC0jQKtE860FXPKLNHiKU61Hde2xfM1GNEJhx7u+Ntm85Ry5c1dJsbVKhOzwG2ff
         tP+bSMARCO+l/wMmsgRc0f1OqTaPEQtPNAKjgJUqSrX7sZSeug9NGqYZYjZ9U11PraK9
         /exrYqWH+B9LLWEZmXI0VKB6IWtr7DeVPY06r1ulrd+1hPgAQAVL1PBi5idXaGhZKC3m
         hV/b8iMZmQJ/TyVgl0Gh7uMlg9k1ayV7nS3H6HzlJTSi+ceY4r+teiLWmkNO8ZPT+XSC
         f2kQ==
X-Gm-Message-State: ABy/qLb32l54oyGqoL6h3yhNslhE57saAvaC5dXHyxyJBe6u9iztFd9O
        MVqKBgDX/FkS97T6yRfh5PxABv3QzHfz6Q==
X-Google-Smtp-Source: APBJJlGXT/DfJqfeLlJOI2NkY/DyZycFLs0Zh8NqiyfddgQXP1ky+jxfNkk7LdC1L9b2SB8ZjMNv0w==
X-Received: by 2002:a81:5e83:0:b0:56d:3b91:7e76 with SMTP id s125-20020a815e83000000b0056d3b917e76mr8370521ywb.12.1690217023789;
        Mon, 24 Jul 2023 09:43:43 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id t199-20020a0dead0000000b0056f3779557esm2891682ywe.113.2023.07.24.09.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 09:43:43 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d0548cf861aso3474962276.3;
        Mon, 24 Jul 2023 09:43:43 -0700 (PDT)
X-Received: by 2002:a25:34e:0:b0:d0f:b553:8284 with SMTP id
 75-20020a25034e000000b00d0fb5538284mr922146ybd.20.1690217023116; Mon, 24 Jul
 2023 09:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-3-biju.das.jz@bp.renesas.com> <CAMuHMdWThYuw+fwoz8xwHRyDDgTQUkW_c_ANkjzuMggqZCm3zg@mail.gmail.com>
 <OS0PR01MB5922CA1B457D6747478DCCB18602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL6oLoPviI8ZtSKV@google.com>
In-Reply-To: <ZL6oLoPviI8ZtSKV@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 18:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtajSfa91Yg6codr8rVTvkWWykUgs=mDuS9hfsRbnAiQ@mail.gmail.com>
Message-ID: <CAMuHMdWtajSfa91Yg6codr8rVTvkWWykUgs=mDuS9hfsRbnAiQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
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

Hi Dmitry,

On Mon, Jul 24, 2023 at 6:35 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Jul 24, 2023 at 03:06:50PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data()
> > > callback
> > > On Sun, Jul 23, 2023 at 10:37 AM Biju Das <biju.das.jz@bp.renesas.com>
> > > wrote:
> > > > Add i2c_device_get_match_data() callback to struct bus_type().
> > > >
> > > > While at it, introduced i2c_get_match_data_helper() to avoid code
> > > > duplication with i2c_get_match_data().
> > > >
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/i2c/i2c-core-base.c
> > > > +++ b/drivers/i2c/i2c-core-base.c
> > > > @@ -114,20 +114,41 @@ const struct i2c_device_id *i2c_match_id(const
> > > > struct i2c_device_id *id,  }  EXPORT_SYMBOL_GPL(i2c_match_id);
> > > >
> > > > +static void *i2c_get_match_data_helper(struct i2c_driver *driver,
> > >
> > > static const void *
> >
> > I missed this.
> >
> > >
> > > > +                                      const struct i2c_client
> > > > +*client) {
> > > > +       const struct i2c_device_id *match;
> > > > +
> > > > +       match = i2c_match_id(driver->id_table, client);
> > > > +       if (!match)
> > > > +               return NULL;
> > > > +
> > > > +       return (const void *)match->driver_data;
> > >
> > > I guess your compiler didn't complain about the const/non-const
> > > conversion when returning because it inlined the function?
> >
> > It complained. Somehow, I didn't notice that warning before sending the patch.
> >
> > >
> > > > +}
> > > > +
> > > > +static const void *i2c_device_get_match_data(const struct device
> > > > +*dev) {
> > > > +       const struct i2c_client *client = to_i2c_client(dev);
> >
> > Not sure, non-const i2c_verify_client(dev)to be used here??
>
> Good call, it actually should, as i2c bus contains instances of both
> i2c_client and i2c_adapter.
>
> Unfortunately i2c_verify_client() right now is a function, we might need
> to turn it into a macro to allow transparently handle const/non-const
> device argument... If this is too hard at the moment we could open-code
> i2c_verify_client() in i2c_device_get_match_data() and first check on
> the device type before doing to_i2c_client() conversion.

Tadah, we have _Generic()! See container_of_const():
https://elixir.bootlin.com/linux/latest/source/include/linux/container_of.h#L25

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

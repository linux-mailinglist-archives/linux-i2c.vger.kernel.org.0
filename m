Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA93763DFA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 19:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjGZR4z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 13:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjGZR4y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 13:56:54 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7352219B5;
        Wed, 26 Jul 2023 10:56:53 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-56584266c41so71512eaf.2;
        Wed, 26 Jul 2023 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690394213; x=1690999013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lKC7yIqYsrjx/KcimjYlO6svaY9VIrsj7sssH7YbqJk=;
        b=WCTRYPiBSjlWUTH6Uk84UhAmutM4WTHMjGdJbYSEgdTkJB+O9mu+Y/5g3GjGyxt/K7
         wuF65QdIJUM6P5a+WLJQxE8XN3wlPX1b6+cx6HdTAP7X9xuiTJRY4wrYDCIiJLaj0o8u
         bKGzjB0To1/4fa/TQYfM+H4vfax+vXvaQBFGJiW5/JTwvGoOQFI6RrVBMR6gCrYDMn/K
         Y8djgajfq4RM7/G1wK3kSFqjWdvupZyClOdNZCtVwGnQXsinCeaJmlzLKrGtXITBeSTT
         uTg0v8THk6kZ0QDPuTD6KWtD2l7C1ph8KAwzI/LAp6FmPLsOm8wVqv2nTQnNsKJzElIR
         ZEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690394213; x=1690999013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKC7yIqYsrjx/KcimjYlO6svaY9VIrsj7sssH7YbqJk=;
        b=KqoDRZITy3MOJvhP/68Q8Rne8J6lypDDVmvjorMsKG66VJ6brx4rROvug4uzS2WMft
         QCn7XVnG0IjogmjRNqYyKTPblJcD6ecKmPsPh75SOgeUg22KHuGyFxGZG7q/tRefWwEg
         ntM99JRgSNnk/comxxvP7U+oeEWeUTaHuv3RAm0a3vwDQyAfiBlf9HOA6PfQcpfdj3k/
         hizo79xxby4z9gU8wfCYRLRnXrdJVIUI02DJVHbzYjJyPDnUolufJ1lwvCUDw8C7774+
         ucA76E4CIKlx46GeUGk+y8lEvrenxsFp5/e/qykAX8gz/ueLi+dyvD/74cZiN8LKp9K8
         2SxQ==
X-Gm-Message-State: ABy/qLbXCnmBDT0YcT/t+mt0sToAymFgrCyNbeWUfJYqxBKBKGpyFqnC
        uPiDfr3UbVbER55wv8dPNVGRXvB6BaCkE9LbDCk=
X-Google-Smtp-Source: APBJJlGbsejwfnDZjbxP+DhbbMZlqrCmSfZtxXI8TNa5Jnngxp2mg/R/7j4IIDpJOKZhOvm7wVuYcSpQmyltEx3m1jw=
X-Received: by 2002:a4a:344a:0:b0:566:f763:8fb7 with SMTP id
 n10-20020a4a344a000000b00566f7638fb7mr2107959oof.2.1690394212464; Wed, 26 Jul
 2023 10:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230726130804.186313-1-biju.das.jz@bp.renesas.com>
 <20230726130804.186313-3-biju.das.jz@bp.renesas.com> <ZMFNYQHqWrS+zSXQ@smile.fi.intel.com>
In-Reply-To: <ZMFNYQHqWrS+zSXQ@smile.fi.intel.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Wed, 26 Jul 2023 10:56:41 -0700
Message-ID: <CAKdAkRT1Zdut28YYG9PxOQXfvMGZuXD8=qG9q4KtHKNvsxy76A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data() callback
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 26, 2023 at 07:44:17PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 26, 2023 at 02:08:04PM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().
> >
> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
>
> I have not been Cc'ed to this...
>
> ...
>
> > +static const void *i2c_device_get_match_data(const struct device *dev)
> > +{
> > +   const struct i2c_client *client = (dev->type == &i2c_client_type) ?
> > +                                     to_i2c_client(dev) : NULL;
>
> There is an API i2c_verify_client() or something like this, I don't remember
> by heart.

It's been discussed in a separate thread. i2c_verify_client() needs a
non-const pointer. It would be nice to clean up i2c_verify_client() to
accept both variants, but that can be done later.

>
> > +   if (!dev->driver)
> > +           return NULL;
> > +
> > +   return i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
> > +}
>
> ...
>
> > +const void *i2c_get_match_data(const struct i2c_client *client)
> > +{
> > +   const struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
> >     const void *data;
> >
> >     data = device_get_match_data(&client->dev);
> > -   if (!data) {
> > -           match = i2c_match_id(driver->id_table, client);
> > -           if (!match)
> > -                   return NULL;
> > -
> > -           data = (const void *)match->driver_data;
> > -   }
> > +   if (!data)
> > +           data = i2c_get_match_data_helper(driver, client);
>
>       if (data)
>               return data;
>
>       return i2c_...;
>
> >
> >     return data;
> >  }
>
> ...
>
> Side question, what is the idea for i2c_of_match_device()? Shouldn't you also
> take it into consideration?

Good call. I think we need to add something like

        if (!data && driver->driver.of_match_table) {
                match =
i2c_of_match_device_sysfs(driver->driver.of_match_table, client);
                if (match)
                        data = match->data;
        }

to i2c_device_get_match_data().

Thanks.


--
Dmitry

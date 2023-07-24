Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F38075FC82
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 18:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjGXQsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 12:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbjGXQsB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 12:48:01 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAEDE54;
        Mon, 24 Jul 2023 09:48:00 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bba2318546so9540155ad.1;
        Mon, 24 Jul 2023 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690217280; x=1690822080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PYD0hO/73RLHG1Kqjz6IG3vhMtCtbhdWc2dF4WhuywA=;
        b=oMRoTi+KeIB9SvpAwdBDmSWi2QhaANeUOv9Q5MjdOE1TmO1J4QsqRu7f/o0ykMqcUi
         FVy9/+HnX0vj6sAP/NWnmayZP3NrtsDencqU5AOeFAzPuVKYsa3SZphiWO6A+7hgupLl
         rLYS0ZCduMmZedo4sd38xCCZxSW8F++vy+v1qpHfwxmofns57eGAQjMHz/nTh1bTQ14z
         k7duyhviN2agGm1FduuyfO7KF5HOX2U8JwfoQWphvxDQ9Zu/j9weKbrrOJYv0w6B5rfh
         QTl9kwC2StGrQdDsMFO8fBdmX1RrhnHd0SuwT1EkLAbrSK2ba5Ss0i+RKOhS94gmGdV2
         AuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217280; x=1690822080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYD0hO/73RLHG1Kqjz6IG3vhMtCtbhdWc2dF4WhuywA=;
        b=hcyCaSx2Yz1yW+IjnMivS68pP0ulXD+sPg76dw0HP51CfDGCJjOIkTzU7mx5gAcNre
         xKTBCRrg2E0fKW7xC758KEYfEaKaMsj3Gj8FRrjmFpsXkyBHwfog+i0BuZRrigBtUVgY
         8DH5R+d5CuijfynWpezF5BnhJMc5rQkE5MMnUbpC6pys23VmV917GiMq4pYA5Mx7xm62
         Ve5IdEqK4YIk5VCM89ajJhPpxNT0oht1bRg1P37mx4vfpQ4sAFFjSae94EdoJVZGDPHE
         yhb71kua736xW4ygJt74Q6ptOYewY2JrjBsvmD1mXWkkeLcsdJpKJcnpsQKGGZtoejFL
         V2IQ==
X-Gm-Message-State: ABy/qLb+q/6sxrsGGgqMHK6hmJc4AoroXFJTkZ4B9tJVnPPWrBSivT8y
        7iOjA5/wnq7eHWO1MrHC1TY=
X-Google-Smtp-Source: APBJJlEpBH75tSQRrD4Ojvr0evDdQ4bxZsndFkG3aBMluVNyxjAjz0aUKz+MTudMh6CSnAAdMGZLkg==
X-Received: by 2002:a17:902:e88e:b0:1bb:1e69:28c0 with SMTP id w14-20020a170902e88e00b001bb1e6928c0mr15240641plg.30.1690217279915;
        Mon, 24 Jul 2023 09:47:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8db:3c3:1ff4:2ae3])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b001b05e96d859sm9162024pls.135.2023.07.24.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:47:59 -0700 (PDT)
Date:   Mon, 24 Jul 2023 09:47:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZL6rPKt+KFDBEK+/@google.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWThYuw+fwoz8xwHRyDDgTQUkW_c_ANkjzuMggqZCm3zg@mail.gmail.com>
 <OS0PR01MB5922CA1B457D6747478DCCB18602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL6oLoPviI8ZtSKV@google.com>
 <CAMuHMdWtajSfa91Yg6codr8rVTvkWWykUgs=mDuS9hfsRbnAiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWtajSfa91Yg6codr8rVTvkWWykUgs=mDuS9hfsRbnAiQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 24, 2023 at 06:43:30PM +0200, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Mon, Jul 24, 2023 at 6:35 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Mon, Jul 24, 2023 at 03:06:50PM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data()
> > > > callback
> > > > On Sun, Jul 23, 2023 at 10:37 AM Biju Das <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > Add i2c_device_get_match_data() callback to struct bus_type().
> > > > >
> > > > > While at it, introduced i2c_get_match_data_helper() to avoid code
> > > > > duplication with i2c_get_match_data().
> > > > >
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/i2c/i2c-core-base.c
> > > > > +++ b/drivers/i2c/i2c-core-base.c
> > > > > @@ -114,20 +114,41 @@ const struct i2c_device_id *i2c_match_id(const
> > > > > struct i2c_device_id *id,  }  EXPORT_SYMBOL_GPL(i2c_match_id);
> > > > >
> > > > > +static void *i2c_get_match_data_helper(struct i2c_driver *driver,
> > > >
> > > > static const void *
> > >
> > > I missed this.
> > >
> > > >
> > > > > +                                      const struct i2c_client
> > > > > +*client) {
> > > > > +       const struct i2c_device_id *match;
> > > > > +
> > > > > +       match = i2c_match_id(driver->id_table, client);
> > > > > +       if (!match)
> > > > > +               return NULL;
> > > > > +
> > > > > +       return (const void *)match->driver_data;
> > > >
> > > > I guess your compiler didn't complain about the const/non-const
> > > > conversion when returning because it inlined the function?
> > >
> > > It complained. Somehow, I didn't notice that warning before sending the patch.
> > >
> > > >
> > > > > +}
> > > > > +
> > > > > +static const void *i2c_device_get_match_data(const struct device
> > > > > +*dev) {
> > > > > +       const struct i2c_client *client = to_i2c_client(dev);
> > >
> > > Not sure, non-const i2c_verify_client(dev)to be used here??
> >
> > Good call, it actually should, as i2c bus contains instances of both
> > i2c_client and i2c_adapter.
> >
> > Unfortunately i2c_verify_client() right now is a function, we might need
> > to turn it into a macro to allow transparently handle const/non-const
> > device argument... If this is too hard at the moment we could open-code
> > i2c_verify_client() in i2c_device_get_match_data() and first check on
> > the device type before doing to_i2c_client() conversion.
> 
> Tadah, we have _Generic()! See container_of_const():
> https://elixir.bootlin.com/linux/latest/source/include/linux/container_of.h#L25

I think we might want to go through all buses and switch to_XXX()
implementations there to use container_of_const() instead of old
container_of() there.

This still does not help with i2c_verify_client() being currently a
function, so it still needs to be converted to a macro to be able to
return const and nont-const pointers, depending on the argument type.

Thanks.

-- 
Dmitry

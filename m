Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940C360518D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 22:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbiJSUsy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 16:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiJSUsx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 16:48:53 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795DA1D73E8;
        Wed, 19 Oct 2022 13:48:40 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id d18-20020a05683025d200b00661c6f1b6a4so10219266otu.1;
        Wed, 19 Oct 2022 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2ny2FO1w+h5elXA/iimjCsCpEt6/e0h9fUeOA8PjnM=;
        b=ZRdgOQFPwAadGoJwO1DifSEOn8dKAXDT6QkB1gX73/6jJSYUJ4G5rT5mmji8gzVeOj
         ZJhR23t06a1HauIYMAv2lGXA5EkuHP6lSqP4jcXAvX75QH5q6ywUZ67pf++EZfnwKcbU
         wMRA+5ATISaQ0chrRbm6Tj2utRsiZNNU0GSmgbltPPoeFESus/PP65u17cS2MjMoY4p4
         0PGQvO6/LZE/74tbIb3GWCpMuAFEoVUErSlK5nV3tNGd5i/yyaszlUylcn/lSFDs6IUE
         nZLYTrcjtv6EOVGLVS3NCZb9YCrjEQlhtsZNlVpzZTi9l0DidewKnuiX3JVrYz5s1OTe
         zXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2ny2FO1w+h5elXA/iimjCsCpEt6/e0h9fUeOA8PjnM=;
        b=FxEoev19FoT0IrUDdBJZQjWQlueyfXkmQeJKd2x+dFGOBP5Wph7IkyYqSenLbbbLnP
         FkP9IjErwRNGeatzRJ9kt4ElvfknUW8s9A+Kjhdq/CDSbNZDav/LoGFtHU2JEkyCrDrx
         z74FqS7JlJ+Er0H1KxLnyN+XBtydhtKuTah9ZUQK4DPfOcqdZOon1YHx4gOTh3/l9OlQ
         y/iJt3J0zCBDIo7XG4WWfsz397IJ4CgJyzfT2bQOUCZJ0t0fQMhP4P+wTKGZh4gpt6Fz
         YpeuurgQWqUhC9cq1kMaUUWPtlsGIxGAcYcVVerGs1AGisoP0oYhVTWPAJsbp5WwI00w
         XUAA==
X-Gm-Message-State: ACrzQf1yA54CFai4mJa43w+hkzBTg0OC2Hbi2k5TrLSEXkt9YJa0RIng
        F2/HyzYAcx0qC0x3rSnO2sKtjGcO52IVQ6VkW7wzrfVBbDI=
X-Google-Smtp-Source: AMsMyM6LSJLygfOcFCuntn9V5AmHOfvkWLvzfLTcYp3XGpUH9B2nl0q5BMLvyYBbAdD9TQonVqExBbfrIIpmGfgWfzA=
X-Received: by 2002:a9d:1b65:0:b0:661:b90c:6475 with SMTP id
 l92-20020a9d1b65000000b00661b90c6475mr5042825otl.110.1666212507436; Wed, 19
 Oct 2022 13:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220718153448.173652-1-jason.gerecke@wacom.com>
 <20220803145937.698603-1-jason.gerecke@wacom.com> <CAHp75Vd6yEctJoNT6TpJ1+h4ZQckyLsaUSeSCV4MHqg+LUDkcg@mail.gmail.com>
 <CANRwn3TutF6skHQHk08dFUa8gLMVGxui_QN7YK6nDacSpRHtLg@mail.gmail.com> <Y1BZ8CjSnrKi+Yos@shikoro>
In-Reply-To: <Y1BZ8CjSnrKi+Yos@shikoro>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Wed, 19 Oct 2022 13:48:14 -0700
Message-ID: <CANRwn3SmrGX2-cqMK=dDTJR=OaxoVM9C+fsaa8jz96ADtH02DA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: Use u8 type in i2c transfer calls
To:     Wolfram Sang <wsa-dev@sang-engineering.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 19, 2022 at 1:11 PM Wolfram Sang
<wsa-dev@sang-engineering.com> wrote:
>
>
> > > I believe you need to create a coccinelle script and run it over the
> > > kernel source tree and then create a patch out of it.
> >
> > This would definitely be necessary to unify all callers to using
> > unsigned variables rather than just swapping which callers generate
> > the pointer-sign warnings.
>
> I am all for using u8 because this is the proper type.
>
> Yet, if we touch this function argument, I'd also like to remove all
> inconsistencies once and for all. Removing some warnings here and add
> some there is not a good choice IMO. However, how to do this switch of
> types cleanly without too much churn, I sadly have no good idea yet.
>

I spent a little time trying to put together a Coccinelle script to
take care of everything but I eventually realized the size of the task
was larger than I was comfortable with. In particular, even though I
might be able to put together a script, I worry I don't have a good
way to test the resulting treewide changes to avoid regression.

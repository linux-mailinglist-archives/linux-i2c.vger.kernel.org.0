Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86367B216E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 17:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbjI1PeZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 11:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbjI1PeY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 11:34:24 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C06BD6
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 08:34:20 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405524e6740so112488535e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695915259; x=1696520059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPcO+w8ucX2Hx5NDf2A2yA/OpGfxKq0CQU9JiiMp1zk=;
        b=EMmmGWTEkHtiw7bkXAQ1ddBBLZnKi/q6Qf1JULOjyHG/6djeohT+VG9jUuI0UmSI0y
         MLaxbbRlTaw/bDSpD/Rcw0XO9dS2V91U25yYCDHT0yD+mQJJ0Rc1srBCMyRPMfCi08KF
         fl6E9d4oGWaCZ28u2YuhTcxjfGympn0i5OnOMilJkI64O8qstW2I2ixfLQaZmihCUnYm
         90FF8iG9l3WvEt/Joiy1X8AwN7U+4x4KT+oGqR+KhoDfxanVM6E40k+BIBcMmwoZObtI
         h+TwyTPaYeq6KNO7fmJCSFwr355UTahl9eXvftlgH5BznYMlgdWtbS2ou6N+448qKaDb
         kQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695915259; x=1696520059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPcO+w8ucX2Hx5NDf2A2yA/OpGfxKq0CQU9JiiMp1zk=;
        b=Dv0smFMcnifx4T0DrQbunvO3/9IeujS3jcbRh0rQnXTCFLnB+tGezuds1bsZp1sB5t
         S2nfS/3T42aYujcm2C5msvyr84zKJmX4J0xb31lp1h+YL7XPvZi3OMuVUWJblAjl+eQh
         OmZVhBRXEiR6sZYnwYsPazScbYA5yovAICkZgDEbo/SkWGi/CoilTWtkCD9O18V73W6G
         JZLHTH4/IGW3xxI2N68ctPiOkYkFEN0ZvP9wgyfpNaQ8gUR59kmkOQAm9xECFnWjhUjt
         cE1PiAFeFLoTEvbMEzAfSSMhENuYih86QIfC0hyhG85j+0/9vo7YPeWzMJ/5wJ8kDd6/
         pJ4w==
X-Gm-Message-State: AOJu0YzqAawbmB3giaKazhI//NHagn3IEc06Znf8z3NV2wUuu0cOTzt3
        nqXa1TNB+zqCyXTSseUF3sca6TV9zwjFUxB4AsgD9LpagZJU5QGpwXSSwQ==
X-Google-Smtp-Source: AGHT+IFFHVyIifX/x4sTt72b2cxEbzAc/0B86oWfZyfgQ9jUG7c91JaBbzAZMDZMyfMjEBWT8GFH60SO418+InqwmVA=
X-Received: by 2002:a5d:604a:0:b0:317:7062:32d2 with SMTP id
 j10-20020a5d604a000000b00317706232d2mr1563963wrt.54.1695915258588; Thu, 28
 Sep 2023 08:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230928101655.47d3dd2a@endymion.delvare> <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
In-Reply-To: <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Sep 2023 08:34:07 -0700
Message-ID: <CAKwvOdkw-13grHe6NXrPpyxtH1VxHshVo3rY31iY=V8kk93fMg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 28, 2023 at 8:03=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Jean,
>
> On Thu, Sep 28, 2023 at 10:16:55AM +0200, Jean Delvare wrote:
> > The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> > written at a time when the i2c core did not support muxing. They are
> > essentially board-specific hacks. If we had to add support for these
> > boards today, we would implement it in a completely different way.
> >
> > These Tyan server boards are 18 years old by now, so I very much doubt
> > any of these is still running today. So let's just drop this clumsy
> > code. If anyone really still needs this support and complains, I'll
> > rewrite it in a proper way on top of i2c-mux.
> >
> > This also fixes the following warnings:
> > drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' =
was not declared. Should it be static?
> > drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus=
' was not declared. Should it be static?
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Andi Shyti <andi.shyti@kernel.org>
>
> I think I commented here that I had double thoughts on this. I

Please consider using an explicit NACK if you feel strongly.  My
reading of your comment was that you did not feel strongly.

> said that on one hand I like the cleanup, but on the other what's
> wrong keeping them here?

We can always resurrect the driver if someone complains, which I
believe there's prior art for.  Nothing is ever truly dead with git.
"That is not dead which can eternal lie, and with strange aeons even
death may die" or something.

>
> Maybe someone is still using these devices.
>
> BTW, do you really have them?

I think Wolfram wrote the drivers.  If he's the sole author and stuck
with maintaining these, I can totally see a maintainer saying "it's
time to put this old dog down."
--=20
Thanks,
~Nick Desaulniers

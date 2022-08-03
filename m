Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC08B589206
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 20:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236829AbiHCSF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 14:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiHCSF4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 14:05:56 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8305F77;
        Wed,  3 Aug 2022 11:05:55 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id y127so29547925yby.8;
        Wed, 03 Aug 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbdbY8yIJ0uTWf9qBQFzv9nINeYGG1xxo79cVcNxuOM=;
        b=p/1Iqv7TWGZVayT5NBG3z12I5BwshJFtf9TWoEZFTFDwxSRDRql8/+X6BmA7Lj1Ed9
         1KbYWeUV2FHXogaHAo5+JKLkKoQ2/0zs4x5jLNeItJZFeef2vr/eiXTy+GJBBYzW2WRn
         aCctA6DFwAx34OoeQHaGLFBT8PtWvmHX9XTNH17EfEf6Fe/bUhBk5SS+UrCQzAj6Elw7
         R45SUz1YBQqvlbowOJkKPqVWZ/jU/Mv8zopLVZl67/L4U/pUx2xe0TznIvQswQRuyViE
         Jd1SLP9dSw+ocrIUoo/iUlvNKdwgcjTyU0gHsWNX00sAv6+7jSWR1fUpDBKiwDdmnb0X
         a1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbdbY8yIJ0uTWf9qBQFzv9nINeYGG1xxo79cVcNxuOM=;
        b=wXcNlcDkAGSvfAAAz4dfX8UrT65+AZb/xhmZAIgiDWQvZ+5ZBjjIBn58N3seXa2vXh
         QidVHdgt86nHtDb8K+Wdqus2ChKMorsnlkAZz2hkKm50fN/nTJjfouc4vv3SpoyjelC6
         C4dg706BHIazpX3zhRuuWx1X4XgHQ49JJ9EEGl/2o1sRZ1ABu1+sKr8oggngPJngYgEU
         iAFjUO1eab44LT1eOibO88kz2OdI9RgqwnHInKqjzZLwCfpHFd6d+/wcPUcF/Exij6wM
         sGqoGl5kMndv8aldpMUf0PE8y0xIQHqbjL8lWph4vPJkAshyPdJP+teBya+SL/j+fmqe
         4NoQ==
X-Gm-Message-State: ACgBeo0vkj77faBmGqhdbs191U74iCQOg0J+jm1mPk4MPVHEuPHRJSue
        yR9hdi/ZdamQAJGeZUwHmk6ufV+2SStnpgZ7e6N6gSCeWKk=
X-Google-Smtp-Source: AA6agR6/GpsUxAsAd2SvFQEnjYRrDx7CLHP/H3v2FCH7RFWu3DCf8qB72XIkMLxWd3n3T7bVTBLjo6AgRxb1o35vEYg=
X-Received: by 2002:a25:75d7:0:b0:66f:cdfc:a986 with SMTP id
 q206-20020a2575d7000000b0066fcdfca986mr19678173ybc.268.1659549954471; Wed, 03
 Aug 2022 11:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220718153448.173652-1-jason.gerecke@wacom.com>
 <20220803145937.698603-1-jason.gerecke@wacom.com> <CAHp75Vd6yEctJoNT6TpJ1+h4ZQckyLsaUSeSCV4MHqg+LUDkcg@mail.gmail.com>
In-Reply-To: <CAHp75Vd6yEctJoNT6TpJ1+h4ZQckyLsaUSeSCV4MHqg+LUDkcg@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Wed, 3 Aug 2022 11:06:18 -0700
Message-ID: <CANRwn3TutF6skHQHk08dFUa8gLMVGxui_QN7YK6nDacSpRHtLg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: Use u8 type in i2c transfer calls
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
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

On Wed, Aug 3, 2022 at 9:47 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Aug 3, 2022 at 4:59 PM Jason Gerecke <killertofu@gmail.com> wrote:
> >
> > The 'i2c_transfer_buffer_flags' function (and related inlines) defines its
>
> We refer to the functions like func() (without any quotes as well).
>
> > 'buf' argument to be of type 'char*'. This is a poor choice of type given
>
> char *
>
> > that most callers actually pass a 'u8*' and that the function itself ends
>
> most of the callers
>
> u8 *
>
> > up just storing the variable to a 'u8*'-typed member of 'struct i2c_msg'
>
> u8 *
>
> > anyway.
> >
> > Changing the type of the 'buf' argument to 'u8*' vastly reduces the number
>
> u8 *
>
> > of (admittedly usually-silent) Wpointer-sign warnings that are generated
>
> -Wpointer-sign or replace with simple English words.
>
> > as the types get needlessly juggled back and forth.
> >
> > At the same time, update the max1363 driver to match the new interface so
> > we don't introduce a new Wincompatible-function-pointer-types warning.
>
> -Wincompatible-function-pointer-types
>
> ...
>
Ack to all.

> > Changes in v2:
> >   - Added modifications to the max1363 driver required to avoid warnings
>
> Have you really checked _all_ callers of APIs that you have changed here?
>
> For example, drivers/media/usb/em28xx/em28xx-input.c still uses
> unsigned char for i2c_master_recv().
>

This particular example shouldn't result in a new warning since
unsigned char and u8 are equivalent types, and u8 is used by the new
API.

Assuming you're referring to callers that are still using *signed*
variables with this API, however, I intentionally ignored them. IIRC,
there were about 400 files using unsigned and about 60 files using
signed. Those 60 files will now generate their own pointer-sign
warnings, but I rationalized it as a still-substantial improvement
over the current state of things.

As for normally-silent warnings *other* than Wpointer-sign (e.g. the
Wincompatible-pointer-types in max1363), I also did not explicitly
check for those. It is possible other warnings may be out there.

> I believe you need to create a coccinelle script and run it over the
> kernel source tree and then create a patch out of it.
>
> --
> With Best Regards,
> Andy Shevchenko

This would definitely be necessary to unify all callers to using
unsigned variables rather than just swapping which callers generate
the pointer-sign warnings.

Jason

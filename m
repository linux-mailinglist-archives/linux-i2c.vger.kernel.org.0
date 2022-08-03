Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25FEF5890C0
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 18:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbiHCQra (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 12:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiHCQr2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 12:47:28 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471B21ADB6;
        Wed,  3 Aug 2022 09:47:27 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r4so14489949edi.8;
        Wed, 03 Aug 2022 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=F9U8c5AKnNzADIrH/woXdXw4Gb44VjbMAOdRYmkqed4=;
        b=XlNmQq6S0+jFh4sI5VMS9M71qHh8MAqZaCCjTzikhPe54IetlcJDPAJP4Lyw4C9MUJ
         f5IBMXHrBga7+ekouyx1g+DIzkZn4SJhrSuJQmu5hxfonUr8kAObWR37LKhgL7mPAQTY
         uKRn2l/tbYrf+zOu2WC8Is4HeaUyqYXfLC4++EkFDiFbxrpOWO64Y6yAwuLpOCouKPu/
         NczmDyL7OZ/dktIO5/k21eQwXbJdy5cWVyE1tsu7rn/NubH5l37Vv7JFXUDLQjnFvMO2
         4zYADWk5kOPyp29OpozCPo0M9yEErqd40s2MGMhXx9IiOpQ47GW7eZb2mu8+paquwQIu
         dwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=F9U8c5AKnNzADIrH/woXdXw4Gb44VjbMAOdRYmkqed4=;
        b=FCRFC1oLcJk1CEORodiaVK1gGLrVNSxvMf7Ne21EvEs/XUJtLW6SrbnVr2NQDTE6sU
         A3ILEL6b0Uw536FpAiH8fxUZ9W2A6UcWljTdFk660j5Fvg9pN9BmqYl/Pt+Qy7J1BWcN
         nsFhMttOwh++I3YLxe4BE/9z6Mdfqm2B3fC6S9IWRHT4le/ROX69f1v9za1wx1JoafdO
         7IDMa9ee6/v4GcVcVN7GXVYJ+0PpnvnP+Yobg4s1dORgCwmzBu938nz+EjdMp+SpPNJd
         dsZR9PcuyhmnLRDDWoCBn5fvRZfwwufjH6+D5j/kd+d0mB7tZpqXYVb729iFOO9Nt72n
         yKEw==
X-Gm-Message-State: AJIora/HPnsoDXRN3trCgIlwjBh+VvnWnNSFcY846V4ebFMAhzHlycP/
        iwp8Olow6d5/oWD/SQqnjBFP7t3zugrq4DStO/s=
X-Google-Smtp-Source: AGRyM1tijRtTlwrij9+gOsmp+egQvFU4YUIh9jrOQHap6DUWAT20SFlkm/kgaq3ikXR8bG5bsPMiHriEGiA6MKUL2cE=
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id
 fj8-20020a0564022b8800b0043a6c586c64mr27201021edb.348.1659545245667; Wed, 03
 Aug 2022 09:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220718153448.173652-1-jason.gerecke@wacom.com> <20220803145937.698603-1-jason.gerecke@wacom.com>
In-Reply-To: <20220803145937.698603-1-jason.gerecke@wacom.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Aug 2022 18:46:48 +0200
Message-ID: <CAHp75Vd6yEctJoNT6TpJ1+h4ZQckyLsaUSeSCV4MHqg+LUDkcg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: Use u8 type in i2c transfer calls
To:     Jason Gerecke <killertofu@gmail.com>
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

On Wed, Aug 3, 2022 at 4:59 PM Jason Gerecke <killertofu@gmail.com> wrote:
>
> The 'i2c_transfer_buffer_flags' function (and related inlines) defines its

We refer to the functions like func() (without any quotes as well).

> 'buf' argument to be of type 'char*'. This is a poor choice of type given

char *

> that most callers actually pass a 'u8*' and that the function itself ends

most of the callers

u8 *

> up just storing the variable to a 'u8*'-typed member of 'struct i2c_msg'

u8 *

> anyway.
>
> Changing the type of the 'buf' argument to 'u8*' vastly reduces the number

u8 *

> of (admittedly usually-silent) Wpointer-sign warnings that are generated

-Wpointer-sign or replace with simple English words.

> as the types get needlessly juggled back and forth.
>
> At the same time, update the max1363 driver to match the new interface so
> we don't introduce a new Wincompatible-function-pointer-types warning.

-Wincompatible-function-pointer-types

...

> Changes in v2:
>   - Added modifications to the max1363 driver required to avoid warnings

Have you really checked _all_ callers of APIs that you have changed here?

For example, drivers/media/usb/em28xx/em28xx-input.c still uses
unsigned char for i2c_master_recv().

I believe you need to create a coccinelle script and run it over the
kernel source tree and then create a patch out of it.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5379F6A0567
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 10:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbjBWJzw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 23 Feb 2023 04:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbjBWJzc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 04:55:32 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743731E1E4;
        Thu, 23 Feb 2023 01:55:31 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id h16so10030915qta.8;
        Thu, 23 Feb 2023 01:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXrWb+RJzAAA7brRcQbYGgS5+dy15Kv9F2Mt8wEyV6s=;
        b=mnSjkLVrmE7i9bNBN2uvhvpmDHcGTk71jmgIWefTvYX/G0O46X789k8sKAv/utBb67
         8/AL7awXVrRGUzUoBUPsvxS4ybZo53Y1ackd4Q11Wt/JKZwKv6CenVoSB0nchERYLxdl
         gBaO6y9f4uUvZIXYFAbyZpV/CZgYQ7RS7/vrR30WjqzyPtmGMOeRF7pClC7fUeHEiT0j
         2+gG2F4F+y8RIz0+XsIESPysyhAprvEt2xwlaV0gz4wnAHfmBPDpRb/L8mc3UMcqLnNy
         C28UgW1RT+MHPZ+Yc6g7coKmeAxijPsU7OF9Por6HYOJEzalocim/jV0w9CHdbZMfCmm
         EuJQ==
X-Gm-Message-State: AO0yUKWv/DQzrxFNYDQTp/qJudhxSV4P04R+TcWu6jxa5ROHAO0jwhya
        jYjOQCmGTC8g0WP+wJJlbpk1QCEk5XJ/siSp
X-Google-Smtp-Source: AK7set9Qkh1P897xqvUjPFlXBSrVq5MiyA5KhOlwNl6+kMkDOkS6zeN1TRDbU3tY0VjntRLKF9PlOA==
X-Received: by 2002:ac8:7f48:0:b0:3b8:ea00:7021 with SMTP id g8-20020ac87f48000000b003b8ea007021mr17105908qtk.28.1677146130298;
        Thu, 23 Feb 2023 01:55:30 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id e13-20020a05620a12cd00b007423c122457sm2057737qkl.63.2023.02.23.01.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:55:29 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536e10ae021so131418377b3.7;
        Thu, 23 Feb 2023 01:55:29 -0800 (PST)
X-Received: by 2002:a81:4312:0:b0:52f:1c23:ef1 with SMTP id
 q18-20020a814312000000b0052f1c230ef1mr1756000ywa.5.1677146129399; Thu, 23 Feb
 2023 01:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com> <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
 <Y/UD3HWNy8uKYShC@smile.fi.intel.com> <0235f0fed989a8b027db720663699f5d@protonic.nl>
 <Y/ZKdN4nuHcL4DgE@smile.fi.intel.com> <Y/ZOyGo8X7r258EC@smile.fi.intel.com>
 <06f29d66-f16a-039c-ecd0-155bdcce00c1@linaro.org> <Y/ZoyaV10TCWhloT@smile.fi.intel.com>
In-Reply-To: <Y/ZoyaV10TCWhloT@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Feb 2023 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbYapqG1eirbRoxS9akue+URKOV338efMp1c0CbwUEKg@mail.gmail.com>
Message-ID: <CAMuHMdXbYapqG1eirbRoxS9akue+URKOV338efMp1c0CbwUEKg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of device_get_match_data()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Wed, Feb 22, 2023 at 8:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Feb 22, 2023 at 07:46:25PM +0100, Krzysztof Kozlowski wrote:
> > On 22/02/2023 18:20, Andy Shevchenko wrote:
> > >>> Which effectively breaks i.e. user-space instantiation for other display
> > >>> types which now do work due to i2c_of_match_device().
> > >>> (so my suggestion above is not sufficient).
> > >>>
> > >>> Are you proposing extending and searching the I2C ID table to work around
> > >>> that?
> > >>
> > >> See (1) above. This is the downside I have noticed after sending this series.
> > >> So, the I²C ID table match has to be restored, but the above mentioned issues
> > >> with existing table are not gone, hence they need to be addressed in the next
> > >> version.
> > >
> > > I see now what you mean. So, we have even more issues in this driver:
> > > - I²C table is not in sync with all devices supported
> >
> > Does anything actually rely on i2c_device_id table? ACPI would match
> > either via ACPI or OF tables. All modern ARM systems (e.g. imx6) are
> > DT-based. Maybe just drop the I2C ID table?
>
> For I²C it's still possible to enumerate the device via sysfs, which is ABI.

Yes, and AFAIK, that worked fine. E.g.

    echo adafruit,3130 0x70 > /sys/class/i2c/i2c-adapter/.../new_device

Cfr. https://lore.kernel.org/all/20211019144520.3613926-3-geert@linux-m68k.org/

Note that that example actually includes the manufacturer.
I didn't check whether the I2C core takes that part into account when
matching, or just strips it.

> > > - the OF ID table seems has something really badly formed for adafruit
> > >   (just a number after a comma)
> >
> > Maybe it is a model number? It was documented:
> > Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
>
> Yes, it's not a problem for ACPI/DT platforms, the problem is for the above
> way of enumeration, so if we have more than 1 manufacturer that uses plain
> numbers for the model, I²C framework may not distinguish which driver to use.
>
> I.o.w. the part after comma in the compatible strings of the I²C devices must
> be unique globally to make that enumeration disambiguous.

Which is not unique to this driver?
I bet you can find other compatible values that become non-unique
after stripping the manufacturer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

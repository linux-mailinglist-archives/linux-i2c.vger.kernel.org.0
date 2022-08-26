Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBC5A5A2B62
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Aug 2022 17:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbiHZPhp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Aug 2022 11:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiHZPho (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Aug 2022 11:37:44 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A9878580;
        Fri, 26 Aug 2022 08:37:43 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id h22so1525656qtu.2;
        Fri, 26 Aug 2022 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=e6jaOjFBpgR9xO4tqPzgFu2wlQE44tE09/Gb4vXzB34=;
        b=WvgvXV7Fla3xt0XKEFci2P0LRVXRyfTe+IZ0O1w7xIrlfqTxZv5ju02530GrSRRAHX
         2YcPljebe3Ov4u42Jxif6NwTyVJPYM5Ep7YYL+7ZbMU+gDLeKOlpINY83cdo1FVsAkw/
         D+SVT+mXlfV8A+JHq7i136qGgy46C3EXyzchbD17VMSBFqtMF+WvsWwM5ee+VDNWvHNA
         b9ijgZnSXgYIWK/IMk+TjXDNlTRAq1VSmWRxMxlpqQfv0BG+Mrm3Ze/DR4CbgsGq4+Ad
         H5yUAG+JkGes+wpJK5iB+ZWFxjNeLpUljl2wr5rRik/f5c0RbT6CnR46elGI0aIG4XSn
         2q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=e6jaOjFBpgR9xO4tqPzgFu2wlQE44tE09/Gb4vXzB34=;
        b=UN59+U4NAhYfgVS9NFFkiMVqjH8VVQV6RN0VbGuknpHDWllCg7F7929uvo8ktAAbgu
         c87UORsUJu8RmYjhZ/wBgRwrnfH2bwRT4IcxY2OfB3cq5mnfZcy9lLbMhM8lq820Waa5
         8N3U1F/QLUGsee2RBDv7R1CTK9icwDnhyGJvj4K2j8AjcWJYePJRfLtOKU5prbyEwmnT
         3wDBjbLC0rP83VYLe63RZIv3JwagXB4y1kcJ0Q/9iiPvdzBDMY79tJF/O+6M/uEea8ty
         Fkj+OsDxj9LDBfSQKf3WPoqiqafHJ7QKoYdSyIdZbt46X+nxppYoo85oc5EOu72q4At3
         X1ww==
X-Gm-Message-State: ACgBeo2rI00BLSvVy1tUuUcRcF5IpRSrX5Nb9F9E3aLTS9vjt+ans+UF
        cwndMddOgRXR3RBZkrwI+edo15ZNdQva59v/UuA=
X-Google-Smtp-Source: AA6agR61j9Nq+CRmZzl3FVALT+u/DpGW7KoVRAsPQBtKcgjIuJ7Fyv9tWAmXr3R1JoUUcIFiEOTZJybTcgnNPu767/w=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr265879qtj.384.1661528262405; Fri, 26
 Aug 2022 08:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
 <YwTsnCdxM5I6BoJu@smile.fi.intel.com> <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
 <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
 <787644272b3b260980ff8b9efc317ce3194b0acc.camel@microchip.com>
 <YweFttaSE2GOoW83@smile.fi.intel.com> <8f9e8be7084ad78671198f03313058809038a3f8.camel@microchip.com>
 <a1d8278eb7e94c26de1022eec480a22fced120f0.camel@microchip.com>
In-Reply-To: <a1d8278eb7e94c26de1022eec480a22fced120f0.camel@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Aug 2022 18:37:06 +0300
Message-ID: <CAHp75VcUKeRhh40dB4Lqh=TE93GhfzaBJ-3uDWrJedDTGLa5vQ@mail.gmail.com>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
To:     Tharunkumar.Pasumarthi@microchip.com
Cc:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh@kernel.org>, Jan Dabros <jsd@semihalf.com>,
        Olof Johansson <olof@lixom.net>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
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

On Fri, Aug 26, 2022 at 4:04 PM <Tharunkumar.Pasumarthi@microchip.com> wrote:
> On Fri, 2022-08-26 at 04:00 +0000, Tharunkumar Pasumarthi - I67821 wrote:
> > On Thu, 2022-08-25 at 17:22 +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 25, 2022 at 01:15:42PM +0000,
> > > Tharunkumar.Pasumarthi@microchip.com wrote:
> > > > On Wed, 2022-08-24 at 21:31 +0300, Andy Shevchenko wrote:
> > > > > On Wed, Aug 24, 2022 at 6:04 PM <Tharunkumar.Pasumarthi@microchip.com>
> > > > > wrote:
> > > > > > On Tue, 2022-08-23 at 18:05 +0300, Andy Shevchenko wrote:
> > > > > > > On Tue, Aug 23, 2022 at 08:26:03PM +0530, Tharun Kumar P wrote:

...

> > > > > > > > +#define SMB_IDLE_SCALING_100KHZ              0x03E803C9
> > > > > > > > +#define SMB_IDLE_SCALING_400KHZ              0x01F4009D
> > > > > > > > +#define SMB_IDLE_SCALING_1000KHZ     0x01F4009D
> > > > > > >
> > > > > > > Shouldn't these magics be decimals?
> > > > >
> > > > > This Q seems unanswered.
> > > >
> > > > These magic numbers need not be decimals. Configuring registers with these
> > > > values in driver will set the time in device. However, these values do not
> > > > convey any meaning when represented in decimals.
> > >
> > > Hmm... Maybe you don't see this, but I see the following:
> > >
> > > 0x03E803C9 = 65536 (i.e. 2^16) * 1000 + 969
> > > 0x01F4009D = 32768 (i.e. 2^15) * 1000 + 157
> > >
> > > Pretty much sounds like a bit 15 for standard mode and bit 16 for fast modes
> > > shifted by 1000 to have a room for the time in presumably nanoseconds up to
> > > 1
> > > us.
> > >
> > > Please, dig up into the documentation, vendor chat, etc to get more
> > > information
> > > on these values.
> >
>
> I have went through the documentation.
>
> Following is the bit mapping of idle scaling register:
> Reserved [31:28]
> Fair Idle Delay [27:16]
> Reserved [15:12]
> Bus Idle Min [11:0]
>
> 'Bus Idle Min' field will indicate the number of ticks of the baud clock
> required to program 'bus idle period' delay and can have maximum value of 4095.
> 'Fair Idle Min' field will indicate the number of ticks of the baud clock
> required to program 'fair idle' delay and can have maximum value of 4095.
>
> So, either the entire IDLE_SCALING_REG value can be in hex or I could do
> something like below:

No hex.

> #define BUS_IDLE_MIN_TICKS     <VALUE_IN_DECIMAL>
> #define FAIR_IDLE_DELAY_TICKS  <VALUE_IN_DECIMAL>
>
> #define IDLE_SCALING_REG ((FAIR_IDLE_DELAY_TICKS << 16) | BUS_IDLE_MIN_TICKS)
>
> Which of these 2 approaches do you feel is better?

Of course one with the comment explaining the thing and two decimal numbers.
Now, since we know that both values are

1000 and 969
500 and 157

It's easy to see the difference and meaning.

So per each mode you need to have those pairs of decimal numbers in ticks.
and one comment explaining all what you have explained here in this mail.

> > Sure, I will go through the documentation. Thanks.
> > Also, I will modify these magic numbers to decimals.

-- 
With Best Regards,
Andy Shevchenko

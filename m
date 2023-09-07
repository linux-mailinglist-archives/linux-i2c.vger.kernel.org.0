Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF95797948
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 19:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240748AbjIGRJy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 13:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240852AbjIGRJx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 13:09:53 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7151717;
        Thu,  7 Sep 2023 10:09:21 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-57354433a7dso689481eaf.1;
        Thu, 07 Sep 2023 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694106504; x=1694711304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiLf3uNcgpAG/VlEyrfKIhMwh6HWTY51ql5QMlDoomc=;
        b=IjkkyQxZNLhbX2MbbuZ1MoN1jJOAxAjLGSD0y+szqHEnmKxFCD6/zE9FkvIWzI+LZh
         iV1FeBo3j684RuTCaGUBuwwOoBPCGMR4uXikaKiOptNspec8Yt4FMOVzyfH00IGDgO4J
         t04nBcMBOzje5JHNQIjKBNsiym8uacYSy5VHxvRJWuZh5BDUSZr0cs57jW1k4IC/39M3
         ucfBwiMTmKrzBfL8emAHqF5EfNw1vGYfL5srnOG0JbLXM2sIdJprmAMyV2s2muhprzGe
         tyqMfWThNedlgR/Mv5FVYYkRuDcDJyIQw/aNqSl3bSKDvkJOWcvKaJGdEUDafJQ2uZ8z
         k/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106504; x=1694711304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiLf3uNcgpAG/VlEyrfKIhMwh6HWTY51ql5QMlDoomc=;
        b=XLKUDDy3RPOGX+r7ZOC8+nP1kHBtDXe0SBsp1+UxFE48nLW+kgHg1i72a2B3m4jLoB
         MggfjWqh8dnwPJ0+9hwbVkeNkjdiCRINfCMgmDHumhb++PEqY4r2D+/BZboEhm9YNNoa
         1FoFeck9zvyANz66yk+9f3RLJKmBQT8npEWlsA3fzGnVhcDRdcGC2Xj8//t06LIYqlj2
         JDY3V06J2qA6ZQU60g3jusZ1bQ6zlrUL5mYuG7k2kFmr/feOC3LObJ2TV6p9BAeCV2Kg
         PhNITC7Um/SBTOfQU13mTkK52djv/jbt3/P5vXD90XtlEU1+UFRzW0KDTjyUVRgA9gnY
         K5yw==
X-Gm-Message-State: AOJu0Yzt7zYHoXPy8pzJauJrcMcdonv6rQDmDdSOxJNcfGtzORi8uxB3
        aw7G/FI6FS6qvHdFo3MmJIuZDNpM3c1Yu1SXzj0=
X-Google-Smtp-Source: AGHT+IFK9cveQPqw6uw7m0RaAlVH54NgqS7eB/Xf2/i7HYl5lAD2mx7mV1DCJ7P3cb8TLnN7G3v8hGn5vDHx3AT62p4=
X-Received: by 2002:a05:6808:2394:b0:3a9:e8e2:57a7 with SMTP id
 bp20-20020a056808239400b003a9e8e257a7mr198349oib.53.1694106503725; Thu, 07
 Sep 2023 10:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAEwN+MCorDCS7EhN40Qgja_nY+SFc3G61Zd6yntqAS+w26YO9Q@mail.gmail.com>
 <ZPnR4Cx6_Hh3weEl@debian.me> <ZPnWb15ucCotffav@shell.armlinux.org.uk> <CAJX_Q+0-v=oadJ697VDawyEhDSPBAS_oqakZFHWVUfsnbCanMA@mail.gmail.com>
In-Reply-To: <CAJX_Q+0-v=oadJ697VDawyEhDSPBAS_oqakZFHWVUfsnbCanMA@mail.gmail.com>
From:   Raul Piper <raulpblooper@gmail.com>
Date:   Thu, 7 Sep 2023 22:38:10 +0530
Message-ID: <CAEwN+MAtQSSwDLiERG4uEhv5YpS6EZrL4FER3wxVx+e3paxz4w@mail.gmail.com>
Subject: Re: Debugging i2c : i2cdetect cant detect a device on i2c line
To:     tanure@linux.com
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Devicetree <devicetree@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 7, 2023 at 9:47=E2=80=AFPM Lucas Tanure <tanure@linux.com> wrot=
e:
>
>
>
> On Thu, 7 Sept 2023, 14:56 Russell King (Oracle), <linux@armlinux.org.uk>=
 wrote:
>>
>> On Thu, Sep 07, 2023 at 08:36:32PM +0700, Bagas Sanjaya wrote:
>> > [also Cc: devicetree and ARM folks]
>> >
>> > On Thu, Sep 07, 2023 at 08:21:44AM +0530, Raul Piper wrote:
>> > > Hello ,
>> > > I am trying to detect an i2c device A on i2c1 line on  one of the Ar=
m
>> > > Cortex A7 platform but not able to see any device on a given address=
 (
>> > > 0x3d) .
>> > >
>> > > Is there any parameters of i2c which i can change like rise/fall tim=
e
>> > > , timeout etc in a device tree or kernel source and re test it?
>> > > I have tried changing the i2c speed from 100KHz to 400 KHz  but no s=
uccess.
>> > > I have even tried removing the 1.5K pull ups on the i2c lines but no=
 result.
>>
>> Honestly, from this description, I'm wondering if this posting is a joke=
.
>>
>> I2C is entirely _reliant_ on pull-ups. It's a wire-or bus, and the
>> logic 1 state is created by no device pulling the signal low, thereby
>> allowing the pull-up resistor to pull the line to the logic 1 state.
>>
>> The pull-up must be the correct strength for the devices on the bus.
>> If it is too strong, then a driver may not be able to pull the signal
>> sufficiently low for other devices to register it as a logic 0.
>>
>> Conversely, the pull-up must be strong enough so that the rise-time
>> of the signal is sufficient to register as a logic 1.
>>
>> If it's a problem with the rise time, then increasing the clock rate
>> will just make the situation worse.

Where can I change this time? Can you please provide example of some
device/device tree?

>>
>> So, if other devices work on the bus, it could be that the Vil
>> threshold of this device is not being achieved, whereas the other
>> devices are happy. Therefore, I would suggest you study the data
>> sheets of the device that isn't being detected.
What Vil threshold? I checked the power supply to this device and it
is ~3.3 V as expected.

>>
>> Lastly, if the undetectable device has a reset line, it's possible
>> that the device isn't responding because it's being held in reset.
The device is fine, I am sure about it. As the device provides data on
USART as well and I am getting it.
>
> Please try to use an logic analyser like saleae logic.
> Probe the i2c bus, reset line, power lines, pins that set the i2c address=
 for the device.
> Can tell us which device it is?

Its a GPS sensor(still under development) .Logic Analyser gives NACK
on the given address.
I may be using the wrong pull ups value which i am checking.But from
software point of view is there a Device tree setting to enable the
internal pull ups or adjust the rise/fall time as said above.

>
>
>
>> --
>> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
>> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
>>
>> _______________________________________________
>> Kernelnewbies mailing list
>> Kernelnewbies@kernelnewbies.org
>> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies

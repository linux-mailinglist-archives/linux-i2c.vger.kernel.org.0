Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A457A423AB8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 11:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237944AbhJFJn2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 6 Oct 2021 05:43:28 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:36949 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhJFJn1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Oct 2021 05:43:27 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQ5aw-1mC0J42QfA-00M4xv; Wed, 06 Oct 2021 11:41:34 +0200
Received: by mail-wr1-f42.google.com with SMTP id k7so6810786wrd.13;
        Wed, 06 Oct 2021 02:41:34 -0700 (PDT)
X-Gm-Message-State: AOAM530u/ownZuuA3zVDh3d2oiuLzMmnMLEJ2x6vQP8VdxU3JEqBkcS+
        RVtw8ha/X5+c17u1nQ3WcnBMVUSM4HUVci8Mdr0=
X-Google-Smtp-Source: ABdhPJzuUsHOXGfVTMW+P7qssYpQP5oaRsPeV3BXJdI5XYLdC7KWD9rwYpR6EFP3ZXNbb0wReeC/Muz0a9i/u3qzDE0=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr4566458wrc.71.1633513294130;
 Wed, 06 Oct 2021 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com> <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
 <YVx9IMk7cJSCK79/@piout.net> <CAF9_jYT6mbk6dr8=ZYZ8B=gxnuHas7QBfDfuoTJnMzSKZt=WGw@mail.gmail.com>
In-Reply-To: <CAF9_jYT6mbk6dr8=ZYZ8B=gxnuHas7QBfDfuoTJnMzSKZt=WGw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 6 Oct 2021 11:41:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0f=fahxax1jOz32uLzitV_PRPoHAfrQLx_qccmh_gcXg@mail.gmail.com>
Message-ID: <CAK8P3a0f=fahxax1jOz32uLzitV_PRPoHAfrQLx_qccmh_gcXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To:     =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, jarkko.nikula@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Konrad Adamczyk <ka@semihalf.com>,
        Tomasz Nowicki <tn@semihalf.com>,
        Jacek Majkowski <jam@semihalf.com>,
        Alexandru Stan <amstan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:caADEqYTCLfH+k3Y7hPGJn6G9RJraNCHQm1NIlSbgN8T0jbYhbA
 7nVXwb3WV3+p9IdemOCH+KkPRvtdrAwzE020vJmV8MKkATQGHhUUpxJBzRhrV48ZfJWjzWs
 ia1D1VgZM+nDRNwnB3Mzr6jwdqRc1PdEpTyGss1od/qqwa3pVfRLltpy1WV41qggFpjkxfM
 uWhxGFtjjSmXdTvLM5DJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I2PFHYwSZdE=:aihFdij185WnWvcVUAaHfO
 xnVrmDc/jQxCptzbEScEXqi1kHN0SXlUTwCvlWP4gJFn1upEWOUBSX41C8ij7xPQ0VyDyZbbV
 k4UM/SGFppTKWJ6PNf5jqUXH7HnwrIqJwqU58VSaFt9Xae9iK2KPR4W1D9gHvPd3um9PDTELD
 s/gbM8u3NW+hctJ8w4Lfocp8J25colOuvSzYeHrg3U53P70GoROaWrRkyxN8SQWtZ/c83KR45
 V40DR/iqNa+yKXDgtFvnuEO+M7UoMhZR0kjpFas/Gx8xEEUL8Q8ncXQxuzUfyyhasJRe5MC4i
 V6zqCkRzRpfPMvoa94h61UBuqVXWSx4vif7l3rFes7/e9mur+YFkalzKBEDgmY6MuJi+KBXOL
 ZqPmCp+41rf43HBrbFWYNPa3duk+7YXsEJA1DLgvImo4kCN+ZGDe4iyp+QmyHQpGPjCDcT0wa
 wQUf6vaQ0ydS1cKzaxPY0aqJwa2FyIgJZJ7v0NGycb57pUuJgJNIEU1feZLydOybq5CIGBuDr
 IPt1be1PKIAr3Q+9S4K0A7mf+HInfqO6/1ufUA/aLhGourTSDci+DK7XeWPwtPGC12pSAIvnA
 JLtHoHg1mzn0kQEI7QKJQna68Whn3WejZmFSu6fXC7s9npwyityizSCXN9pqigZCiQwZe8CS3
 TUHQRs3+IuMpVS2YOT1cOPEQGRnwQ2ZBE7981v5im3GZbjw2e3S3DKNb8q+p3ClCLec0aXZzk
 xgQ0c1ZZaDjN8iyxAGrpF8PQ8LOKaNqlPVR3JWC7BE8G5/g/QDKTf60hJ1PGlaCPhn91mOtYw
 a16EVR7GqmssxpDiWTYkyP1wvAH1DoX4LMnpTKyfglDt3JB0OSO70+bYoYIm7AjJntY9jmxXG
 a85WgBFu0+TQRbP+XR5Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 6, 2021 at 11:21 AM Paweł Anikiel <pan@semihalf.com> wrote:
> On Tue, Oct 5, 2021 at 6:28 PM Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>>
>> What happens when two nodes have the same busno property because e.g.
>> one is in a dtsi and the other one is in a dts?
>
>
> If busno is set, the alias is ignored (the code that checks aliases
> is never reached). If two nodes have the same busno property, we get
> a WARN in drivers/i2c/i2c-core-base.c:1637, and only on of them
> gets attached.
>
> What is a better way of doing this then? Is adding aliases to the
> devicetree like this okay?
>
> aliases {
> ...
> i2c0 = &i2c0;
> i2c1 = &i2c1;
> };

Yes, this is the normal way to do it.

The way I tend to think of it is that the soc.dtsi file contains a description
of hardware that exists inside of the chip and is as much as possible
detached from how an OS uses it or what is connected to it on the
outside. You then have the board.dts file that contains everything specific
to the board.

The /chosen and /aliases nodes in turn are specific to the individual
machine, based on local configuration, installed OS and boot loader,
and how the devices on the board are used.

We tend to have the /aliases node populated with a sensible configuration
of how we expect them to be used for a given board. So if your machine
connects two of the internal i2c buses on the SoC, it makes sense to assign
them the aliases i2c0 and i2c1. On the other hand, if one of them is
not connected anywhere, you may skip that, or if there is an additional
i2c controller in programmable logic or behind some gpio lines, you can
make that your i2c0 alias.

      Arnd

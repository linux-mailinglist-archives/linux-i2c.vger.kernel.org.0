Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB283B7F12
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 10:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbhF3Iep (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 04:34:45 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:35561 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbhF3Iep (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Jun 2021 04:34:45 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mj8a5-1lKEsU1GI1-00fCAA; Wed, 30 Jun 2021 10:32:15 +0200
Received: by mail-wr1-f50.google.com with SMTP id u8so2526305wrq.8;
        Wed, 30 Jun 2021 01:32:15 -0700 (PDT)
X-Gm-Message-State: AOAM531sGk/R+iOy4rJ/+iSVTKi7839hsPnWUam5O1V18yW4F02z+0AU
        pEGaz6MRO6PLwuaTwyPYxiU5fFZweyzcpcK1CDE=
X-Google-Smtp-Source: ABdhPJy+MGLGtZBULVT9Dq0Wsw+8kotCQEn+TV7Gj+Esc9Dq1TbrZjPLHyuAOFtqReu5JqSeSkHTDFb+c6zwiG1Jzss=
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr18081260wrr.361.1625041934904;
 Wed, 30 Jun 2021 01:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato> <05cc9484-f97b-0533-64fe-ff917c6b87ee@intel.com>
 <YNwd/t3DMKSOrTAT@ninjato> <3016ab8b-cbff-1309-6a1f-080703a4130f@intel.com>
 <CAK8P3a0Ew+RS_1buR+1OneH8XEqVjPOr0FGCF5d6CvFQuJqg6g@mail.gmail.com> <YNwmO0LhcS//hvc5@smile.fi.intel.com>
In-Reply-To: <YNwmO0LhcS//hvc5@smile.fi.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 30 Jun 2021 10:29:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09CR4xnm+JW70quHz=6=AedrtNAc_2o=ZUNZ_Y30KnJw@mail.gmail.com>
Message-ID: <CAK8P3a09CR4xnm+JW70quHz=6=AedrtNAc_2o=ZUNZ_Y30KnJw@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jie Deng <jie.deng@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, conghui.chen@intel.com,
        kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0er6ohVeWS6+pgXIRAlWL5u2VryJWzbRIWzKbos8+85sZw6atpa
 iDBeef1gXRUGmtF8tIAZbVSarOPf8yOTVpK5WwWGzpjyjbfWrxS20P2vnz42ZC3/vFd2rEn
 YrXnvJrp7GcC5cWmmljxpDBwscgHk+KotU4ABEmfbD1TPFwm9r5CKc7jKTK1FRo7kJ4WOzp
 PlYhPCtFgCCx1XZKxmBvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NDOslyLj47s=:tTQArK5qCBola4jiXmg4h7
 uY1eqwNk+HNqDNKZ9IjRYe9vquC501733dhzsnYIaFJFpXxpF40O6mnkiEJuFBSFkvsbGe9sJ
 MusjjJUI3Q9o5vY9jOjEe1Msee7JGBnjU0QZS7t5AO3XWRgLeXsB8gJ8RcGCIQjBZJsop0Oh5
 LBZywvxacIEjB81K9IZSAaq4ALpUXCFFyypznWL2Wi1sFcih0D39DOdAF40hOjMj6V8ywWq35
 C6DvB2oYlqz8pWKym33RhjYEIoUuO/kM22QlYn4Wn7XmO+L8hsaajTfR6nB7ue27tusJUR6A9
 fRL9ZzbdiNddeQ3qoqG14d0B5yaYhw0uZ0TQco1v7UViWR4YlniSNegsxOKR8VnkElVEkJEC3
 sPF5A9SAgrH5t0TzZYeLDYU0Uenm4WgRM/rU5erpNvnIayoLcahE661vR3ttcraRD8r201RUy
 /BUEV8a/pjV56MzeeJf+UYmNiseB01Abq09pJfVWIjjR2GMx61frck7II5LdJYnuVfdFg2qv+
 aurJfdkRZyKYdv4w9nwRiI0BlK6zLi3SY/uIkn68al3JoGE/Qv/5OAa5+CotcTMjy+dfiwQnA
 pYSkVUeKde199/gxGT93Mq1YAKZYCTDqPwAgRPQzzBYCZeYDBpkIRtobbB5hb+oZVB//sgY6C
 CR03v6AzYCCqXlEr/VmZf5Ve+Wyl0lQK67tDDkBQ/8QQMj1vl5hpuwalN7upN0sqLIgtKLcnT
 PD6eZeoeL7ONBDUOtubd8jwOKtrc4aQU1cRMpeAr0OaWR3M5289eQA0PcktiDraWB5nBoGoHO
 MBiy2EBz/8XSc0k9wh/kj8sj8j/Tq5haWxV7Z4lbjcbA9a3KRnFB7qZxIGwfuQz9Hvcn09g7x
 oC0DVbh3hEiZQBe4CeBKBkS1GDkxaEkIrJ1vCTonKeJKnB1sQu22J63QuC1tEJc4lIOzE81Zo
 v7YXhgL9XLpa00LxSr5UHYUsFgooUWpYcS8qpe9uoIWoVRCXerrkZ
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 30, 2021 at 10:09 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 30, 2021 at 09:55:49AM +0200, Arnd Bergmann wrote:
> > On Wed, Jun 30, 2021 at 9:51 AM Jie Deng <jie.deng@intel.com> wrote:
>
> ...
>
> > On a related note, we are apparently still missing the bit in the virtio bus
> > layer that fills in the dev->of_node pointer of the virtio device. Without
> > this, it is not actually possible to automatically probe i2c devices connected
> > to a virtio-i2c bus. The same problem came up again with the virtio-gpio
> > driver that suffers from the same issue.
>
> Don't we need to take care about fwnode handle as well?

I'm fairly sure this gets set up automatically on DT based systems, based
on the dev->of_node of the virtio device, with no changes to the i2c
core core.

If you want to automatically probe i2c devices on a virtio-i2c controller
with ACPI, I have no idea if that would require changes to both
i2c-core-acpi.c as well as the virtio core, or just one of them.
So far, my assumption was that this would not be needed with ACPI.

        Arnd

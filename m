Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383783B7E6C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 09:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhF3IAy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 04:00:54 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:51355 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbhF3IAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Jun 2021 04:00:53 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MWixU-1ljA7M0oNU-00X3Kn; Wed, 30 Jun 2021 09:58:24 +0200
Received: by mail-wr1-f48.google.com with SMTP id v5so2440312wrt.3;
        Wed, 30 Jun 2021 00:58:24 -0700 (PDT)
X-Gm-Message-State: AOAM532CmRsIWO/Mc7g2Y1m6ZYKpznUsa5IAkkeZKGsVSIj/6pNkp+zc
        ooC+Gkxcd1IfSyhZ4/PBJjysiQDVqpVgOCCbOHQ=
X-Google-Smtp-Source: ABdhPJw/54Ymafy8iJydjgPOOW+N/LuLT/C7tu8FRFKuPYFqT73YoCsIrQFVMpqbzhM8lXHUuzTJSikU14gArx6gH0Q=
X-Received: by 2002:adf:e107:: with SMTP id t7mr37559025wrz.165.1625039903884;
 Wed, 30 Jun 2021 00:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato> <05cc9484-f97b-0533-64fe-ff917c6b87ee@intel.com>
 <YNwd/t3DMKSOrTAT@ninjato> <3016ab8b-cbff-1309-6a1f-080703a4130f@intel.com>
In-Reply-To: <3016ab8b-cbff-1309-6a1f-080703a4130f@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 30 Jun 2021 09:55:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Ew+RS_1buR+1OneH8XEqVjPOr0FGCF5d6CvFQuJqg6g@mail.gmail.com>
Message-ID: <CAK8P3a0Ew+RS_1buR+1OneH8XEqVjPOr0FGCF5d6CvFQuJqg6g@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Jie Deng <jie.deng@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
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
X-Provags-ID: V03:K1:6egYPYexTmL/MQIuD73eM2fYrrSLN1LLs/3bxSH3ZOnZ17tD4Ke
 bMlNqaOgRZmh7TPit/Ztgkj/QRdXk3dpnIEfG9jaWr+jEmh/2MToYlsBU8WvlWJgiPLPC6M
 cX5ZoWFjM58WD9JjmzvpXD+dAnsdVAumXV2uXhPwIrGUnjlcItCcoKcupIPmzPd90L8/viS
 nyzZTS43zCMS5DXEuj0hw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bd/ORH/iKMw=:vazu2uKZHxqr6kCR3d/1GJ
 ky5yHRxj2jlpE+HloqKXSpD0NdsFitDEgYk9F2suYwYDwHJkHPqpBY6As+DvY4UvYEahkkuYV
 YgpqPqvFxzGf0eatwaZ5pt4NIzvLERh/ImqfVCku6DePl7qhCGWBxKc7sORi78Oac48/moDhw
 mMCKHgsLYerA8vMRI15b0dS4zTaRP1/WQrCif2vgdVvJ0jcIJIi2vrOSxq2JRW/CIaH65r1AB
 UnH+IRTzGh5zYzS7XC3+BGbcp8jo87XFGUndyCRS+jxnDmYIFzu43kNbGcJdeEuBvsxX3vXzD
 wYykQO4Bt3Zsh3nybhAeyDtMqDwHfvwqRvp7Hskj/jPxlGhWU1AcfUWllCQHO1dwJPGMfCTW4
 z2M3J/gjjrDsn0zBvUcf8ZE1yMyv8rULHM/2nXp4a2VirbY9ZB8naj4J7+LwyKyRFVjUQ6S3f
 +207c+kgp5EL68hEpOyHHrP1a3eDX55R5Q/RKY+7HGTSkGNLjklJETfoz77rTVfb2Py1OLr0I
 Fro9ZlVHQGcgXE6TZ98K0NfLq+UhKtW/ahbo36L3+CkxJSpkPlnpNBbqnBE2MS4DMHD6t/j6/
 P4SaBrmMhuLE+VZ2fAYCmdgDmndY8AIPar2MQnTGiw/pZMJmEqQfWOCQXhuHJ9C+PDydAGZgw
 4GAg=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 30, 2021 at 9:51 AM Jie Deng <jie.deng@intel.com> wrote:
> On 2021/6/30 15:32, Wolfram Sang wrote:
> >>>> +  snprintf(vi->adap.name, sizeof(vi->adap.name), "Virtio I2C Adapter");
> >>> Is there something to add so you can distinguish multiple instances?
> >>> Most people want that.
> >>
> >> I find the I2C core will set a device name "i2c-%d" for this purpose, right?
> >>
> >> I think this name can be used to distinguish the adapter types while
> >> "i2c-%d" can be used to
> >>
> >> distinguish instances. Does it make sense ?
> > That alone does not help. See the 'i2cdetect -l' output of my Renesas
> > board here:
> >
> > i2c-4 i2c             e66d8000.i2c                            I2C adapter
> > i2c-2 i2c             e6510000.i2c                            I2C adapter
> > i2c-7 i2c             e60b0000.i2c                            I2C adapter
> >
> > Notice that the third column carries the base address, so you know which
> > i2c-%d is which physical bus. I don't know if it makes sense in your
> > "virtual" case, but so far it would always print "Virtio I2C Adapter".
> > Maybe it makes sense to add some parent device name, too?
> >
> > And if this is not reasonable, just skip it. As I said, it can be
> > helpful at times, but it is definately not a show stopper.
>
>
> OK. I will add the virtio_device index for this purpose.
> which indicates the unique position on the virtio bus.

Is that position stable across kernel versions? We do have stable naming
for PCI devices and for platform devices that are the parent of a virtio
device, but I would expect the virtio device to be numbered in probe
order instead.

On a related note, we are apparently still missing the bit in the virtio bus
layer that fills in the dev->of_node pointer of the virtio device. Without
this, it is not actually possible to automatically probe i2c devices connected
to a virtio-i2c bus. The same problem came up again with the virtio-gpio
driver that suffers from the same issue.

       Arnd

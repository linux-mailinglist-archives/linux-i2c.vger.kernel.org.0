Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38FE34177C
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 09:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhCSI1k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 04:27:40 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36003 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234370AbhCSI1b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 04:27:31 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mn2eN-1m508k21Zv-00k4Xz; Fri, 19 Mar 2021 09:27:29 +0100
Received: by mail-oi1-f170.google.com with SMTP id i3so3931293oik.7;
        Fri, 19 Mar 2021 01:27:29 -0700 (PDT)
X-Gm-Message-State: AOAM533Ihr+PLa/+bmsHSMwQTgBv1RMRGRz2DxADtzmDvzOaS7NOvAlV
        rJiczUqGXmnbCUZ2uaVB0xLj+eYYeqJXJaJPelw=
X-Google-Smtp-Source: ABdhPJy2jQ9JuAxE+K1J1eCBybf0lxeN3IOFfRQ13WdcK8b0FXfVMfx6yj7r4z+BrbUCgKPvSM0RF3ODSeFZepyRCyI=
X-Received: by 2002:a05:6808:3d9:: with SMTP id o25mr177972oie.4.1616142448131;
 Fri, 19 Mar 2021 01:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7> <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
 <CAK8P3a3f9bKdOOMgrA9TfeObyEd+eeg8JcTVT8AyS1+s=X2AjQ@mail.gmail.com>
 <20210319035435.a4reve77hnvjdzwk@vireshk-i7> <b135b474-b167-67ad-588c-b0cfe8dc2998@intel.com>
 <20210319054035.47tn747lkagpip6v@vireshk-i7> <834186be-71b1-a67c-8dee-b90527b459c8@intel.com>
 <20210319063553.eq5aorcyiame6u2e@vireshk-i7>
In-Reply-To: <20210319063553.eq5aorcyiame6u2e@vireshk-i7>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 19 Mar 2021 09:27:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0cBdBF6aHj-QMu1jwerYxFVyABm=r4SsyQkOBkbW=ZZg@mail.gmail.com>
Message-ID: <CAK8P3a0cBdBF6aHj-QMu1jwerYxFVyABm=r4SsyQkOBkbW=ZZg@mail.gmail.com>
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1Q37+QolqnRDKOxPz1feO/goy0qtbvnK9nsv9v6P+6CBZawPD8r
 WzVVe9UAzu9w+zYR7Uj1IhlRlb+a9lV+WNhZVm2lShpaF2o3UwYQ//k6Z+sm14tid9x4H2i
 PV7s969Ti1DNs326xRA+/b3AkX14oFlKUAr03oynXXJpF+tH3b5xKhdfeTIHucicxmJxgZ7
 9HyowpFWo3N+LuaSebZ2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EHRUHhdsCFA=:w/QIAkZc2Y4K9o+P0sakqs
 uYcWUhZ1nGQvx0RFqgktW/OT/0z8zZPnIt3yZR7JbCg+pUEFAyZOSesFu71727FzOg4ozK7XU
 IAv9rjvHiARAUm7hNU8iGNL7sz3bQftaQSkbLwnGObiRZ3jcBwjtyNWCywChwFCExlq5lG2TA
 4GRTAmdPSGaMiyAjhYX2gHjxZsW2riWVRAm1BKKmyTI4kgjjSBkCLVuMe+Fc/O2pnKFhJtRPZ
 lNOYxXDY0NiGIWVKmfkoX1iQbR6a642QjiU6OF6EYYzmhCaoJ07UvRpM6QWRVZo8CoDEjM2qt
 2nQ9d4drSKNQ2xtBwCKwHr3R45Sjnzztnx4tjvqMSRzX41hlG6D/dCCz0dXM+oulDckIShvcR
 LX1YfTnJhBouXZcq3buT6KrMm5hZUvEbPP0yojv6oHFMXuvbhS5tRHzJ2mV3yc3WX5i09NkGZ
 5573CFjnse2DbQtK23gyaqmeJw0v9JJ3ugJbtpcIqNIzH3xHfohgb+rpaE+QVziro9rntw5fc
 5gwdO3q1W6stDwWLQ+IXhhi4c5LZFBnEmJzBOCR2GJ6
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 19, 2021 at 7:35 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 19-03-21, 14:29, Jie Deng wrote:
> > I also see example drivers/i2c/busses/i2c-xiic.c. Some people might think
> > this way is more clearer than
> >
> > updating each member in probe. Basically, I think it's just a matter of
> > personal preference which doesn't
>
> Memory used by one instance of struct i2c_adapter (on arm64):
>
> struct i2c_adapter {
...
> };
>
> So, this extra instance that i2c-xiic.c is creating (and that you want to
> create) is going to waste 1KB of memory and it will never be used.
>
> This is bad coding practice IMHO and it is not really about personal preference.

Agreed. At the minimum, it should have been written as an explicit
memcpy() in the few drivers that have that pattern instead of a benign
looking struct assignment, but even then there is nothing good about it
really. Notably, the largest member by far is the 'struct device', and
that by itself should be a red flag as a device is never meant to be
allocated statically (this used to be common in pre-DT days, but
even then was considered bad style).

I suppose the i2c_add_adapter()/i2c_add_numbered_adapter()
interface could be redesigned to handle this better, since every
driver needs to set the same few fields. That however requires finding
someone to spend the effort on coming up with a nice design and
converting lots of drivers over.

       Arnd

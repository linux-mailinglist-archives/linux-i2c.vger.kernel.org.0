Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283CE3282CA
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Mar 2021 16:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237298AbhCAPtG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 1 Mar 2021 10:49:06 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:48677 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbhCAPtF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 10:49:05 -0500
Received: from mail-oo1-f45.google.com ([209.85.161.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mrh9Y-1lbpxe1WLc-00nf8J; Mon, 01 Mar 2021 16:46:26 +0100
Received: by mail-oo1-f45.google.com with SMTP id i11so2546531ood.6;
        Mon, 01 Mar 2021 07:46:26 -0800 (PST)
X-Gm-Message-State: AOAM5301rwlBx1yTijUS8bZSdFHia7pmPFRVbNm+DiCq7w+4cVMwv6re
        otQ5ex9WAZORtgR/o8ucvGA1TajgTx3ars0xWCY=
X-Google-Smtp-Source: ABdhPJw0OM1qORDnXV+EKE2QP/KObZBe+Vec/OkUJU8Ke2XG/5KY1Nlmlqd3W8x9whtxHu0HY7uuwZ88TRZ7BZlo1Jw=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr13363525ooz.26.1614613584991;
 Mon, 01 Mar 2021 07:46:24 -0800 (PST)
MIME-Version: 1.0
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7> <YDzZdc9+6hEvIDS1@smile.fi.intel.com>
 <YDzZocYCA8UC1FCW@smile.fi.intel.com>
In-Reply-To: <YDzZocYCA8UC1FCW@smile.fi.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 1 Mar 2021 16:46:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1g_UXKVnDfDEfj=swqgUNb+bu+1O7mDMfCt55o0w0jxw@mail.gmail.com>
Message-ID: <CAK8P3a1g_UXKVnDfDEfj=swqgUNb+bu+1O7mDMfCt55o0w0jxw@mail.gmail.com>
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:GtnP92y/mpt3PHFMyEpVKP2lKlD5bcRh3gYSr4lpHWdzofVMOQw
 O7Qvn7pmv7oiTWsjb0mOTEJGZX2aV9WkBmE0DHTLk+SGGJtymu7Za9wYt8gM62FHCQts39j
 SAt2jzg/Ju4BF/DPvtv3rDAoYiRPlGY+Eq7tKYQmOAf4k5fdr2N/IRXbMQmqoG1MLufO95F
 DGP2Wi18MlTRSHt4lrfgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:unf9Dn8JTCc=:l1egd/qdzvX9aSwr/p7OVi
 tCKjn2Z4Dxh9oLowOB2NgYuDRyScnVAEakF0OXRIe12b4dQZXWo+aI3wPo2GHdyVY2No0mzyF
 mOFPeyQihvyOXYafVCjfGNcHX31CFVNa+wQulYrzOTsaouSmGm4pGToKN5W4qXeXmpT0mN1CY
 UIDsdhFQYe+mO7nquDlwxOsjmCvA6LEKYCxCTg5NOI6vj8UgpelfC04+HXpbqcelC9N5CM3HJ
 MRi6+ogEBGvLk5aIJgEQASpoexetmUz8lmZZiSglGHyV+FIkDmLV3DITyZohfYpdm/Ln5KZy2
 7KbuSTjrf2oTzLlvTNle8Zsd19KqUxTU01YE8PPmvipeK/X/towPFmKy3NCOYHL9MiSooCtab
 jYUhmffwO0KnB3XUigQI7n4smybyPC9o4oYm0MYNoJpX+8URQ7Ys7q+JiooKWE4gL54NQO6pV
 Le2+dNVarBRE180hRqjQdQssqVxbFpVPfEb7FjnjPzkJEmn+Lf7Iq27uqH88Z/1Z8uI6+ScLC
 IErxtBt0EUKGU5UTac9Ta8Tu6Z0ph2yQB6NIbq3ndITIG6L/gYBpOqrin20xJTC6kDo9VrlLA
 5p6LKWN5vRVDCn6FXUwPH9fcmalULLthnEr8eUf77krqJKw3Op4rXCkO4SMzrNXejOeREUeLS
 by/4=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 1, 2021 at 1:10 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Mar 01, 2021 at 02:09:25PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 01, 2021 at 05:24:41PM +0530, Viresh Kumar wrote:
> > > On 01-03-21, 14:41, Jie Deng wrote:
> > > > +/**
> > > > + * struct virtio_i2c_req - the virtio I2C request structure
> > > > + * @out_hdr: the OUT header of the virtio I2C message
> > > > + * @write_buf: contains one I2C segment being written to the device
> > > > + * @read_buf: contains one I2C segment being read from the device
> > > > + * @in_hdr: the IN header of the virtio I2C message
> > > > + */
> > > > +struct virtio_i2c_req {
> > > > + struct virtio_i2c_out_hdr out_hdr;
> > > > + u8 *write_buf;
> > > > + u8 *read_buf;
> > > > + struct virtio_i2c_in_hdr in_hdr;
> > > > +};
> > >
> > > I am not able to appreciate the use of write/read bufs here as we
> > > aren't trying to read/write data in the same transaction. Why do we
> > > have two bufs here as well as in specs ?
> >
> > I涎 and SMBus support bidirectional transfers as well. I think two buffers is
> > the right thing to do.
>
> Strictly speaking "half duplex".

But the driver does not support this at all: the sglist always has three
members as Viresh says: outhdr, msgbuf and inhdr. It then uses a
bounce buffer for the actual data transfer, and this always goes either
one way or the other.

I think the more important question is: does this driver actually need
the bounce buffer? It doesn't have to worry about adjacent stack
data being clobbered by cache maintenance because virtio is always
cache coherent and, so I suspect the bounce buffer can be left out.

It might actually be simpler to just have a fixed-length array of
headers on the stack and at most the corresponding number of
transfers for one virtqueue_kick().

Is there a reasonable limit on how many transfers we would
expect to handle at once? I see that most callers of i2c_transfer()
hardcode the number to '1' or '2', rarely '3' or '4', while the proposed
implementation seems to be optimized for much larger numbers.

       Arnd

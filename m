Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C811BAB5B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 19:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgD0RdN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 13:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgD0RdM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 13:33:12 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2641C0610D5;
        Mon, 27 Apr 2020 10:33:12 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e6so7721347pjt.4;
        Mon, 27 Apr 2020 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gU5i7xmKV34tR5F18itWfVo5V/gDkXmz2Qiw6wo4HPA=;
        b=fvHmORI8FOw7Qnvkc8nYVBXsWY9A+k7s1JKSy4iw5c1skxBXGFDtcccC7ybwQcyeQE
         EHBSUbeOMHCY5hqkQMLi3XZPTl1OUBUyf+EoSspklOMMGi8oN/AsOwEbTxO5G0q1As9L
         nMGdi5+JyGZbp9fhH7Qc7RcDKyIvqyrj+O4LGRVhayF5I1r9BH4pFJGaoUsvyk3i3GaF
         4NIFdbygiyXpXLRs/Kw6iE0vqEnACIG/5DPNZAsEIIhlVpNi7x2GMZdiy0mAe52+YVDc
         a561/fl228wTi8k9iGW6QYhCd0hrOZycroUO7r4O6iz7ZtvdESTuNL0wVDIU5cSSNG/n
         UZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gU5i7xmKV34tR5F18itWfVo5V/gDkXmz2Qiw6wo4HPA=;
        b=QoKvvscu/jN/IjBFa7ts520Dbxx72suUAK7RdUBVXh2/vNzzkHkEA09C4aJ4qT/DV6
         n2KQ2IuhO+bY/Mgp6mV6HwMNaMSg6I3k5GzL5QKaygF9cFb/uZGIYAYIoVreWfBu4GwV
         aKdzjR5qM9zpxRFqAcuNhvCI9GnzMTAqec9cJq6316gEhEVf4E1yCTgv5I+Qx5fDrZV6
         fuamcu+rOSDw+6m91GU10n/uk290njJo+nbgm9XuOWplXwFCdoue3hLZhifvLnnlZB58
         xlRKw2jCg7cxk6oB6beawRcvTeAXTN2FIpSLxeAMl7Ls9Jpw2tcoQVBChivabjQ0iHXm
         TK+A==
X-Gm-Message-State: AGi0Pub7WryJCIsBRKqNaSuf2irr2NPqiyIWYbCVjzW/fQjCvLnDrqf9
        EsEw64frgtwgLeiNXU/ERxihYNa2JHiIFdZ+UM0=
X-Google-Smtp-Source: APiQypLuzTP1I0aucyGGrv5MdEMHvOrysU+8xgEZbNToy2ArdtXmL+44edA6Rtf4T72RL+fcuOcvArSe8zmt+BW0BBo=
X-Received: by 2002:a17:90a:224b:: with SMTP id c69mr25228026pje.8.1588008792167;
 Mon, 27 Apr 2020 10:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104713.216896-1-hdegoede@redhat.com> <20200426104713.216896-2-hdegoede@redhat.com>
 <CAHp75VdOd6C36oR7HAnqrKiinVBr4YcqqJ=dv3NpR3=Xp0QQ-Q@mail.gmail.com>
 <b5bdffb4-0af2-abb7-21f7-2f5da56d5dc6@redhat.com> <CAHp75VegakBqAzxn1e+MzF3EgB6fNya3L0eZHMh11yct6HHNKw@mail.gmail.com>
 <66619a61-c398-5a8a-4ee0-13dbe5d2c559@redhat.com>
In-Reply-To: <66619a61-c398-5a8a-4ee0-13dbe5d2c559@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Apr 2020 20:33:05 +0300
Message-ID: <CAHp75VcBf1OYQ=W+k1ygHnXkNbA+NuZoiSOQOq6g7SJNc2iFiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: i2c-multi-instantiate: Add flag for
 passing fwnode
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 27, 2020 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 4/27/20 3:18 PM, Andy Shevchenko wrote:
> > On Mon, Apr 27, 2020 at 3:51 PM Hans de Goede <hdegoede@redhat.com> wro=
te:
> >> On 4/26/20 7:59 PM, Andy Shevchenko wrote:
> >>> On Sun, Apr 26, 2020 at 1:47 PM Hans de Goede <hdegoede@redhat.com> w=
rote:

> >>>> In some cases the driver for the i2c_client-s which i2c-multi-instan=
tiate
> >>>> instantiates may need access some fields / methods from to the ACPI =
fwnode
> >>>> for which i2c_clients are being instantiated.
> >>>>
> >>>> An example of this are CPLM3218 ACPI device-s. These contain CPM0 an=
d
> >>>> CPM1 packages with various information (e.g. register init values) w=
hich
> >>>> the driver needs.
> >>>>
> >>>> Passing the fwnode through the i2c_board_info struct also gives the
> >>>> i2c-core access to it, and if we do not pass an IRQ then the i2c-cor=
e
> >>>> will use the fwnode to get an IRQ, see i2c_acpi_get_irq().
> >>>
> >>> I'm wondering, can we rather do it in the same way like we do for
> >>> GPIO/APIC case here.
> >>> Introduce IRQ_RESOURCE_SHARED (or so) and
> >>>
> >>> case _SHARED:
> >>>    irq =3D i2c_acpi_get_irq();
> >>> ...
> >>>
> >>> ?
> >>
> >> I think you are miss-understanding the problem. The problem is not tha=
t
> >> we want to share the IRQ, the problem is that we want to pass the sing=
le
> >> IRQ in the resources to only 1 of the instantiated I2C-clients. But if=
 we
> >> do not pass an IRQ (we leave it at 0) and we do pass the fwnode then
> >> i2c-core-base.c will see that there is an ACPI-node attached to the
> >> device and will call i2c_acpi_get_irq().
> >
> > Do we know ahead which device should take IRQ resource and which should=
 not?
> > Can we use current _NONE flag for them?
>
> The problem is not internal to i2c-multi-instantiate.c, the problem
> (once we pass a fwnode) is the API between i2c-multi-instantiate.c and
> the i2c-core. For the IRQ_RESOURCE_NONE case i2c-multi-instantiate.c
> sets board_info.irq to 0, which is the correct way to specify that
> we do not have an IRQ, but if don't pass an IRQ then the i2c-core
> will try to find one itself.  And once we pass the fwnode, then
> the "try to find one itself" code will call i2c_acpi_get_irq()
> and find the same IRQ for clients we instantiate, leading to
> the earlier mentioned IRQ conflict.

I'm missing something here. Why we need to pass an fwnode in the first plac=
e?
Seems you would like to access to methods from the driver.
But if you simple enumerate the driver in ACPI multi-instantiate won't
be needed.

As far as I understand, the actual driver consumes *both* I=C2=B2C
resources. It's not a multi-instantiate in this case.


--=20
With Best Regards,
Andy Shevchenko

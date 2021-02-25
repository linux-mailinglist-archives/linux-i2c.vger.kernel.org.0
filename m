Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25023252A8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 16:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhBYPpn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 10:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhBYPpJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Feb 2021 10:45:09 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFB6C061574;
        Thu, 25 Feb 2021 07:44:27 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id l18so3758306pji.3;
        Thu, 25 Feb 2021 07:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NsI5KUxHmckWZBlulVpmoyk0qRD6uEF9h8uRVX9ELb8=;
        b=cY89Tq4udqskbxO7a8opwTMeqp+vyMNgS14MbgqsTvYOTlWmsJ1mLDUdDi+28mdmiV
         VREDL1ftstrVRmJwIFtVmj2tiQvKzGvfI4Yj1o4/cYy5QHd10/ccI8xp6vTqtx/vbnqI
         L3mC0sMy1dq6cF8sDSNDA0DUOyn7inMGkMZvuA2CVS4m9J2TWfctwlqX0TO86JXkbSW9
         mUrquRcKkBqgN4lbfLEKRNNXktYbEU+jGmyRT5jKqHs5uaTbCixkjBSAtTG4yOuh5cEf
         E/2H3PnrZQE4KSWYHcCYUTXFZU+zn7j+zIu6kmjRijEvnZRmztYaUl+pwqWCI90HKFEM
         O9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NsI5KUxHmckWZBlulVpmoyk0qRD6uEF9h8uRVX9ELb8=;
        b=W8gfL1i9gQtgj/+2jdAc/U0mBSHngg/N3W8rds9vdllXNsuB/Fcd0LkD2NtN7hB+Kc
         w5rgmSqh5OKY0NPvIDkcWgPWUtswjMBikAaAAluGY4JjxZ6Ec3dI0nPItBdMfvoDmWru
         Grjo6kbLSdJYVVB/3wapDbhcwbXlE1mKb5w++sI09GxCOlMEXZIDnZMQ1douRfiL+xXX
         yRDG3DbZbjvrTmvlCnAAcMChVkZq7PcQKWECQDF66FQD9KSBeJMXslj2A975ajnj4obO
         HC6NomTAYrOP/8O/Y1mUeeYYm7p0D9mBqo1NsRDFu4hXHD2lL8q183tvG54FuBSHfc/U
         SXRA==
X-Gm-Message-State: AOAM530lFf5V20Ffa8WbG/Mno9SKDW2F8wWrsHXagzWFHUhr4MISeYPM
        gWBHkgGoFTjgMH+UBmttO+3O3bPaR8bVPDQcR708Vg5UWh74ykit
X-Google-Smtp-Source: ABdhPJzBW8rI0j2VlRO01cB8A1DDiKx4LSq4UbnetRB+jOlYfVShheS7Ys/KuvfMZBgrqxurQAUkL2LZXnr0xoy9oWQ=
X-Received: by 2002:a17:902:70c7:b029:e3:71cf:33d2 with SMTP id
 l7-20020a17090270c7b02900e371cf33d2mr3426322plt.21.1614267867080; Thu, 25 Feb
 2021 07:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20210223172231.2224-1-andriy.shevchenko@linux.intel.com>
 <fea7ce9a-01a9-cab8-8675-be5c44cb8a27@redhat.com> <YDZLuzNivBP4HcPd@smile.fi.intel.com>
 <7e5f8d81-0ee5-b8ad-ed72-06d4677cd8f7@redhat.com>
In-Reply-To: <7e5f8d81-0ee5-b8ad-ed72-06d4677cd8f7@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Feb 2021 17:44:10 +0200
Message-ID: <CAHp75VeNZ9REU5nCDJ-Rt4Wmsnsz+hcN-P_oopzN8LpVTkU74g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: cht-wc: Use fwnode for the controller and IRQ domain
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 25, 2021 at 5:11 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 2/24/21 1:51 PM, Andy Shevchenko wrote:
> > On Tue, Feb 23, 2021 at 08:25:35PM +0100, Hans de Goede wrote:
> >> On 2/23/21 6:22 PM, Andy Shevchenko wrote:
> >>> It's better to describe the I=C2=B2C controller and associated IRQ do=
main with
> >>> fwnode, so they will find their place in the hierarchy in sysfs and a=
lso
> >>> make easier to debug.

...

> >>> +   set_primary_fwnode(&adap->adapter.dev, fwnode);
> >>
> >> So now we have the main PMIC device i2c-client, the platform-device in=
stantiated
> >> for the MFD-cell for the PMIC's builtin I2C-controller; and the device=
 instantiated
> >> for the adapter-device all 3 share the same ACPI-companion fwnode.
> >
> > Okay, this step in this patch maybe not needed (or should be a separate=
 change,
> > but I don't see clearly what would be the benefit out of it).

Shall I leave this or should be removed in v2?

...

> >>> -   adap->irq_domain =3D irq_domain_add_linear(pdev->dev.of_node, 1,
> >>> -                                            &irq_domain_simple_ops, =
NULL);
> >>> +   adap->irq_domain =3D irq_domain_create_linear(fwnode, 1,
> >>> +                                               &irq_domain_simple_op=
s, NULL);
> >>
> >> Hmm, not sure this is right, admittedly the old code looks weird too, =
but now we
> >> are creating a second irq_domain at the same level as the irq_domain c=
reated for
> >> the IRQ-chip part of the PMIC. But this is really more of a child-doma=
in of just
> >> the I2C-controller MFD-cell. The IRQ-CHIP part of the PMIC has a singl=
e IRQ for the
> >> I2C controller which gets raised both on i2c-transfer completions and =
when the
> >> pin on the PMIC which is reserved as input for the IRQ coming out of t=
he charger-chip
> >> gets triggered.
> >>
> >> IOW we have this:
> >>
> >>
> >>                PMIC
> >>                  |
> >>     ------------------------------
> >>     |       |        |           |
> >>    IRQ1   IRQ2      IRQ3       I2C-IRQ
> >>                                  |
> >>                    ----------------------------------
> >>                    |        |         |             |
> >>                  READIRQ   WRIRQ    NACKIRQ     CLIENT-IRQ
> >>
> >> Where READIRQ, WRIRQ and NACKIRQ are directly consumed
> >> and the CLIENT-IRQ is being represented as a single IRQ on
> >> a new irqchip so that we can pass it along to the i2c-driver
> >> for the charger-chip which is connected to the Whiskey Cove's
> >> builtin I2C controller.
> >>
> >> But doing as you suggest would model the IRQs as:
> >>
> >>                PMIC
> >>                  |
> >>     --------------------------------------------------
> >>     |       |        |           |                    |
> >>    IRQ1   IRQ2      IRQ3       I2C-IRQ           CLIENT-IRQ
> >>
> >> Which is not the same really. I guess it is better then what we
> >> have though ?
> >
> > Hmm... There should not be difference in the hierarchy. add_linear =3D=
=3D
> > create_linear. The propagation of *device* (not an IRQ) fwnode is just
> > convenient way to have IRQ domain be named (instead of 'unknown-N' or s=
o).
> > Maybe I have read __irq_domain_add() code wrongly.
>
> Sorry, this is probably my bad. The first ASCII-art which I posted is
> how things actually work in HW. The second one is how I assumed that
> things would look like in some nested representation of the IRQ-domains
> given that all the IRQs mentioned in the ASCII-art now use the same fwnod=
e
> as parent for their domain. But poking around in sysfs I don't see any
> hierarchical representation of the domains at all. Actually I cannot
> find any representation of the IRQ domains inside sysfs (I've never
> looked at / into this before) ?

I have enabled  GENERIC_IRQ_DEBUGFS to see some information.

> If what you say is right and the fwnode is only used to set a name (where=
 can
> I see those names ?) then your patch is probably correct.

I have checked again and I don't see anything except it uses it as a
domain name and takes reference count.

> > Nevertheless, thinking more about it, why we don't add an IRQ chip via =
regmap
> > IRQ API?
>
> There already is a regmap IRQ chip associated with the MFD device and the
> IRQ handling required here is somewhat tricky (see the comments in the dr=
iver)
> so I would prefer to keep this as is.

Ah, that makes things complicated a bit.

> >> Note I can test any changes made here, but I'm not 100% convinced that
> >> the current version of this patch is correct.
> >
> > If we settle on the idea first. I'm (slowly) looking forward to check a=
nother
> > CherryTrail device we have at the lab, but we lack of some (power) equi=
pment
> > right now to setup it properly. I hope it may have the Whiskey Cove PMI=
C there.
>
> More testing is always welcome :)   With that said, testing these changes=
 really
> is not a lot of work for me.

I would expect that we will have a clash with IRQ domain names and
thus we would need our own fwnode here.

I will think about it, but it sounds like we need to create a
hierarchy of the IRQ domains and take the device's fwnode as a parent
here.

Overall, I stumbled over of_node use in pure ACPI case (simplest "fix"
is to provide a NULL pointer there). If you think we can get rid of
of_node as intermediate step, I will send v2 with that.



--=20
With Best Regards,
Andy Shevchenko

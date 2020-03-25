Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD2AB192A5D
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 14:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgCYNtB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 09:49:01 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42228 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgCYNtB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Mar 2020 09:49:01 -0400
Received: by mail-qt1-f196.google.com with SMTP id t9so2116458qto.9
        for <linux-i2c@vger.kernel.org>; Wed, 25 Mar 2020 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aqwoIFeWasu7LFGFPdHVV0Lyd6mKkML5MpjpybFPze8=;
        b=EE74JW5sNUSawE/nieOmfd+x2MIF880p7qtUdiqMYpYg6462zQ2kLJOkZBp/zZ8luR
         LeLF/vFfOcLYUdB62zmY3K51QFgSZmG/iP4GGx+I5a0SE92IP0U4RF+7aM2l93Qy7Vud
         nvG2VFeMmjohJfjcA0bvIVnJrlCW4v3YxJX2ttJ7WVlcmnMkkyLf4udfKgZJ/2hbbbxA
         rCT2KtINfMQhgJ3CW1CthXBftOq80dz84C2ah45qIhat6XDiKK88vUbHCHvBUfpTJm+4
         sEemxlKWAnJ7BDYhfbS0cKaPeCpokGUgyvW0dQfjILwPQGskDrXNcOe8Zz1MyWcy3S/N
         MB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aqwoIFeWasu7LFGFPdHVV0Lyd6mKkML5MpjpybFPze8=;
        b=Ls4GemOKuFzYgb2GcCjbI2K35VgMvfhe2GksCOjB22q0jLjEResxMz4kWAMnufe6PV
         GzlH8EK+p57LQj8l1OgfjsOFFp1TU7EQZFLHpPcTss3ioXYvg3pDCDiulSSuN3q/HNhC
         zz8ukcgksKzYjaLeML+4QYoK3QqqMQTjNCbMh+rHSvpZ631A5K4aP3L0XERoDcpLv35b
         KdcGBZmUCAf0ovWlZPtfguLlabA7eafy1vm1q89VenOHQlU9iewY30+46EGUZNoYytKo
         0227vtnp69EyTvo7v7kLlpw+uvI6ygYppSa1k7OoMvD8ixJuEHw+J0q7CsszYVqWJjXe
         CUZg==
X-Gm-Message-State: ANhLgQ2S+7VbeDQ6SqiLakpkecRgS8hHbBUKbQdcec1axUAxq/mO4Zoe
        fTLOrt/cA6cxLtSQVAgKGp8ncb7BPXjrn/JqLMXbtA==
X-Google-Smtp-Source: ADFU+vsE+BgKySCoO4pRBagePhRdwuGbjDKSjEAF01BWlpD26chP3U1ysGLrMg10mGmwQ1lasf+U/m2D1z5qMj0K+oU=
X-Received: by 2002:aed:3c4b:: with SMTP id u11mr2955112qte.208.1585144138478;
 Wed, 25 Mar 2020 06:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-6-sakari.ailus@linux.intel.com> <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
 <20200311085555.GH5379@paasikivi.fi.intel.com> <CAMpxmJVPTKW+sYSJ3dnfF8nLAOKEa4Ob7bpxG0KD3Tkdm+rtYw@mail.gmail.com>
 <20200323213101.GB21174@kekkonen.localdomain>
In-Reply-To: <20200323213101.GB21174@kekkonen.localdomain>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 25 Mar 2020 14:48:47 +0100
Message-ID: <CAMpxmJVdyTkZMVuhSy0Ux8VUYTmQN_YEfH-akQsAL3zrwiz8Dw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-acpi@vger.kernel.org,
        Bingbu Cao <bingbu.cao@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 23 mar 2020 o 22:31 Sakari Ailus <sakari.ailus@linux.intel.com>
napisa=C5=82(a):
>
> Bartosz,
>
> On Thu, Mar 12, 2020 at 02:10:32PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 11 mar 2020 o 09:56 Sakari Ailus <sakari.ailus@linux.intel.co=
m> napisa=C5=82(a):
> > >
> > > Hi Bartosz,
> > >
> > > Thanks for the reply.
> > >
> > > On Wed, Jan 29, 2020 at 02:36:17PM +0100, Bartosz Golaszewski wrote:
> > > > wt., 21 sty 2020 o 14:41 Sakari Ailus <sakari.ailus@linux.intel.com=
> napisa=C5=82(a):
> > > > >
> > > > > In certain use cases (where the chip is part of a camera module, =
and the
> > > > > camera module is wired together with a camera privacy LED), power=
ing on
> > > > > the device during probe is undesirable. Add support for the at24 =
to
> > > > > execute probe while being powered off. For this to happen, a hint=
 in form
> > > > > of a device property is required from the firmware.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  drivers/misc/eeprom/at24.c | 31 +++++++++++++++++++++----------
> >
> > [snip!]
> >
> > > > >
> > > > >  static int at24_remove(struct i2c_client *client)
> > > > >  {
> > > > > +       bool low_power;
> > > > > +
> > > > >         pm_runtime_disable(&client->dev);
> > > > > -       pm_runtime_set_suspended(&client->dev);
> > > > > +       low_power =3D acpi_dev_state_low_power(&client->dev);
> > > >
> > > > This is inconsistent. You define the low_power field in the context
> > > > structure (BTW the name low_power is a bit vague here - without
> > > > looking at its assignment it would make me think it's about somethi=
ng
> > > > battery-related, how about 'off_at_probe'?) and instead of reusing
> > >
> > > The field was called probe_powered_off in v1, but I changed it to
> > > probe_low_power (and renamed related functions etc.) based on review
> > > comments --- for the device may not be powered off actually.
> > >
> >
> > But is it actually ever low-power? What are the possible logical
> > states of the device? If I understood correctly: it's either off or on
> > at probe - not actually low-power. Am I missing something? In your
> > cover letter you're writing: "These patches enable calling (and
> > finishing) a driver's probe function without powering on the
> > respective device on busses where the practice is to power on the
> > device for probe." To me there's no mention of a low-power state,
> > which makes the name 'probe_low_power' seem completely unrelated.
>
> See <URL:https://patchwork.kernel.org/patch/10938483/>
>
> I've updated the patches according to the comments but did not update the
> cover page accordingly.
>

I see.

Rafael: I think that there are two issues with patch 1/5:
1. It adds a very specific boolean flag to a structure that's meant to
be very general. As I pointed out in the i2c patch: at the very least
this could be made into an int storing flag values, instead of a
boolean field. But rather than that - it looks to me more like a
device (or bus) feature than a driver feature. Is there any ACPI flag
we could use to pass this information to the driver model without
changing the driver structure?
2. The name is still misleading: probe_low_power doesn't correspond
with what it actually does at all (neither did power_off). I'd go with
something like probe_allow_low_power.

> Generally drivers are interested whether a device is powered on so it can
> be accessed, but the actual power state of the device isn't known to the
> driver when it is, well, not in an operational state. A device may be
> powered from a regulator that is always enabled, for instance.
>
> >
> > > > this field here, you call acpi_dev_state_low_power() again. Either
> > > > don't store the context for the life-time of the device if not
> > > > necessary or don't call acpi_dev_state_low_power() at remove, altho=
ugh
> > > > the commit message doesn't describe whether the latter is done on
> > > > purpose.
> > >
> > > Right. probe-low-power property has the same effect on remove for
> > > consistency, i.e. the device can remain in low power state during rem=
ove.
> > > This is documented in probe_low_power field documentation in the firs=
t
> > > patch.
> > >
> >
> > Just please don't store any state if you're not using it outside of
> > the probe() function.
>
> What exactly are you referring to? The patch adds a local variable to the
> driver's probe and remove functions.
>

Yes, sorry, I looked at the patch and somehow thought it adds a new
field to the data structure and then doesn't reuse it. My bad. Maybe
it was a previous version IDK.


Bartosz

> --
> Kind regards,
>
> Sakari Ailus

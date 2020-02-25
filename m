Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28B5216EF02
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 20:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgBYTal (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 14:30:41 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52539 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728753AbgBYTak (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 14:30:40 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep11so143376pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 11:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c7YvBhKYaRcug4SwCX6amT8Yl2lrmhMSeuLnOwXOQgU=;
        b=RmxfSUoSe9xuTRu3f6VvCjX9p3RqTXhWYFzxRKDqm+y+JTdxrf832YSyahg7MZHNLX
         xPJ2kfmZTGtuVhfDmeeI2m3eLecVz5um8uOSdxZNnifiBTLy/ZzPCVo7WiCz/lyxUok6
         FWNVoaH1gkLXuOBrEU7qUhC+MMtTUR0yvbIhclvQTQKShrsbsa40s2xq9HGpuZsX5+tv
         I+cIv38b4L6tdkJYnodzLG8SbLgqZz/SyCc33w4YePCS7JW64TnWRI3gPc2HmTNY+3gS
         +esf0ZNXY+FkNEn6yHHD9N6Et03JhmWvGDVQW5olU6DN7Qh7Ryv4stkQrnZJKfjQ/jxK
         w1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c7YvBhKYaRcug4SwCX6amT8Yl2lrmhMSeuLnOwXOQgU=;
        b=TomV+BIUhwLAvSuUeVmsI7DYhCyfYsZflbBuu4V43KoD88ux1M9e3CM9ReCa93+VMW
         mT8PeCMDNwKKDHoJ5m03QL1s0WMjK1hNd7UiuYPhSQZ1hMVHSvwxb0YZMZh/13oXzVr1
         kgIobeqHfZXrJHU2PqXzhTpneDtWucDMi+o/jfQtP7vOrNYdX1WY4zpuSLfpojlE3QOa
         fJahvC9b6vZfIpq3OU0VuJZUQNjG1InYpphEwz0hN1iv2YDxcNBF3af35keeoN2ZXfUJ
         ppwY/w59/QFVCMWuViv2FO94LNQg063YbgnvuVsdMDJTgz8GUKIDlkAu3qYyF+0+cDdt
         L0jA==
X-Gm-Message-State: APjAAAVnbVlXqwQxKe5C0erthcSqTulKExDr/Vj6RJ+j03PeoSUTRXia
        OkvGp6iSt0M7v/tjhBV8t6Rr9a3T782VVMTOwOmPJg==
X-Google-Smtp-Source: APXvYqwIehtIWayl8Y2Zzqxv3rR2U4RBBVtCMsCkBtRJPuhdGxnRrSPGxX3OGXxqFFIKBjfFx9viR7GDqI+5iiuIcmo=
X-Received: by 2002:a17:90a:858a:: with SMTP id m10mr587460pjn.117.1582659039680;
 Tue, 25 Feb 2020 11:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20191121095350.158689-1-tali.perry1@gmail.com>
 <20191121095350.158689-3-tali.perry1@gmail.com> <20191125151618.GE2412@kunai>
 <CAHb3i=tGTcu2q15E5CL_od1rDgRDyx=ygoGSCu88AfBrnFn71w@mail.gmail.com> <CAHb3i=s+u1gHXwi7j7V_N-c8f8n7c1XB3QhkY8EAJuv6PA5GNw@mail.gmail.com>
In-Reply-To: <CAHb3i=s+u1gHXwi7j7V_N-c8f8n7c1XB3QhkY8EAJuv6PA5GNw@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 25 Feb 2020 11:30:22 -0800
Message-ID: <CAFd5g47z8Lo1usLRDLL32Pw8LB40+bpcbnJdcvW5ffoVhKM-uA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] i2c: npcm: Add Nuvoton NPCM I2C controller driver
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nancy Yuen <yuenn@google.com>,
        Patrick Venture <venture@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>, syniurge@gmail.com,
        linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 26, 2019 at 1:23 AM Tali Perry <tali.perry1@gmail.com> wrote:
>
> Hi Wolfram,
>
> Thanks for your comments.
>
> The NPCM7XX BMC I2C\SMB controller HW module supports both SMB and I2C.
> It's main features are:
> 1. Supports Fast-Mode (400 KHz clock) I2C and Fast-Mode-plus (1 MHz clock=
) I2C
> 2. Supports the =E2=80=98fairness=E2=80=99 arbitration protocol defined b=
y the MCTP
> SMBus/I2C Transport Binding Specification v1.0.0
> 3. 32KB packets : this is an I2C spec limitation. The HW has no limit
> on packets size. It has a 16 bytes FIFO which can be reloaded over and
> over.
> 4. w\o size byte (for SMB block protocol).
> 5. Both master and slave. It can also replace modes in run time
> (requirement for IPMB and MCTP).
> 6. Bus timing is selected to support both specs.
>
> Originally the HW spec stated SMB everywhere .

Alright, so it sounds like the HW supports I2C and also has SMBus
specific support?

> Should I rename the SMB to I2C all over the driver?

If the HW supports general I2C; then yes, you should use the I2C
naming scheme. If you have SMBus specific support for some things, it
might be helpful to tag on smb in the name for only those
functions/data structures.

Also, please don't top-post.

> On Tue, Nov 26, 2019 at 8:47 AM Tali Perry <tali.perry1@gmail.com> wrote:
> >
> > Hi Wolfram,
> >
> > Thanks for your comments.
> >
> > The NPCM7XX BMC I2C\SMB controller HW module supports both SMB and I2C.
> > It's main features are:
> > 1. Supports Fast-Mode (400 KHz clock) I2C and Fast-Mode-plus (1 MHz clo=
ck) I2C
> > 2. Supports the =E2=80=98fairness=E2=80=99 arbitration protocol defined=
 by the MCTP SMBus/I2C Transport Binding Specification v1.0.0
> > 3. 32KB packets : this is an I2C spec limitation. The HW has no limit o=
n packets size. It has a 16 bytes FIFO which can be reloaded over and over.
> > 4. w\o size byte (for SMB block protocol).
> > 5. Both master and slave. It can also replace modes in run time (requir=
ement for IPMB and MCTP).
> > 6. Bus timing is selected to support both specs.
> >
> > Originally the HW spec stated SMB everywhere .
> >
> > Should I rename the SMB to I2C all over the driver?

And please don't reiterate yourself like this; it can confuse the conversat=
ion.

> > On Mon, Nov 25, 2019 at 5:16 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >>
> >> On Thu, Nov 21, 2019 at 11:53:50AM +0200, Tali Perry wrote:
> >> > Add Nuvoton NPCM BMC i2c controller driver.
> >> >
> >> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> >>
> >> Looking at all this SMB_* naming of the registers and also the quirks,
> >> this looks more like an SMBUS controller to me?
> >>
> >> > +     // currently I2C slave IF only supports single byte operations=
.
> >> > +     // in order to utilyze the npcm HW FIFO, the driver will ask f=
or 16bytes
> >> > +     // at a time, pack them in buffer, and then transmit them all =
together
> >> > +     // to the FIFO and onward to the bus .
> >> > +     // NACK on read will be once reached to bus->adap->quirks->max=
_read_len
> >> > +     // sending a NACK whever the backend requests for it is not su=
pported.
> >>
> >> This for example...
> >>
> >> > +static const struct i2c_adapter_quirks npcm_i2c_quirks =3D {
> >> > +     .max_read_len =3D 32768,
> >> > +     .max_write_len =3D 32768,
> >> > +     .max_num_msgs =3D 2,
> >> > +     .flags =3D I2C_AQ_COMB_WRITE_THEN_READ
> >> > +};
> >>
> >> ... and this. Like SMBus with the only exception of being able to send
> >> 32K in a row. Or?
> >>

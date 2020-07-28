Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1208023147F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 23:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbgG1VQu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 17:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbgG1VQu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 17:16:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F58C061794
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 14:16:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p3so12892994pgh.3
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=pVHGnTdcSTJYpecDHtZxnP25oyJ3KGfHeVNTXFOlw/o=;
        b=q/7q/NuvCwigYgCfiMpkxJn4ULDqf81IcES1Yghe+KVKfl11xx/jEmgbMmGEoL8QZ6
         uN9ra4rfxECUWRwraD1XTbrK/ZABPEUHcoHx2F1nju3J1WCwpndQB6cml03CXT0EHV5R
         BJy2pawlMVAohcZRdcWAjYj56VRtjZdbQDyyDTO0K3aaF86Jy5t3Rl3ge3Uoy7vmrGYL
         9e42lmECN7A92McICum1jrr/eAB+OTYIMxm/qiSIm8GGb6W1Ps0OHRIaF9iUxF+PFxBi
         6D6pYh17Kszv4Uqyjq04SUVT8oqc6sqSxndMDoefRdM0ELGoy1pP6tDxXJ27+31VhZBd
         MudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=pVHGnTdcSTJYpecDHtZxnP25oyJ3KGfHeVNTXFOlw/o=;
        b=qiq4VTvuWEhaaOIVVxcAlbIYBK0DLrTxodeURXn3RYgTgRMHl2oGlZ0IFWfqyjOpWF
         O40BKP9S3GBLLzY5sG85UkJ7Uz4+U9zcrwXjOynsJ5KVX3eOckmmceS1S58rsQ8dk85n
         +8KRl2RoOe5DOijDd8UZMLzHm+ZCRlZGuYeD/uiSOWPV3xTtsspm63a8ObJUbW4lEy+s
         zoX6jr/Con88zKx/NhWjAenvw0mtMj7dX5xsWrF1tRjzU0rKdAOFAsYBV3C2YKdOQJhT
         8l98uMqwC2HyGZyYzQdzt1FAZWAh06QwG3kmKpiSCIhASBzAWrd908w0DHUXLMeZa0ph
         wrJw==
X-Gm-Message-State: AOAM530rELyj4t8Fu+/CA/dnritVEIWt/wYrB0/ifmvOFk4bX6GaKRi3
        iWzS5+7bCs5v5K/XIa4QHHZwOMpoeXk=
X-Google-Smtp-Source: ABdhPJxh3fhWpBN11GpVq9QFbdBnijr0Xz4PIPNVFxQYknAq8xQVnzZ/m9O1/gQlSG5GPCb5dRSkgg==
X-Received: by 2002:a62:84d5:: with SMTP id k204mr24817842pfd.66.1595971009620;
        Tue, 28 Jul 2020 14:16:49 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id w9sm17801037pfq.178.2020.07.28.14.16.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 14:16:48 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <20200728190435.3c4f5d5e@endymion>
Date:   Tue, 28 Jul 2020 14:16:46 -0700
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E3EA2AC-83B1-4B7B-87DB-DBC4FAB2B7D0@gmail.com>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
 <20200728094037.GA980@ninjato> <20200728190435.3c4f5d5e@endymion>
To:     Jean Delvare <jdelvare@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi.

> On Jul 28, 2020, at 10:04 AM, Jean Delvare <jdelvare@suse.de> wrote:
>=20
> Hi Wolfram, Daniel,
>=20
> On Tue, 28 Jul 2020 11:40:37 +0200, Wolfram Sang wrote:
>>> -	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for =
length */
>>> +	__u8 block[I2C_SMBUS3_BLOCK_MAX + 2]; /* block[0] is used for =
length */
>>> 			       /* and one more for user-space =
compatibility */ =20
>>=20
>> I thought about this, too, and wondered if this isn't a size =
regression
>> in userspace with every i2c_smbus_data getting 8 times the size? But
>> maybe it is worth if backwards compatibility is maintained in an
>> otherwise not so intrusive manner? Jean, what do you think?
>=20
> In i2c-tools these are always allocated on the stack and one at a =
time.
> Size isn't an issue in my opinion.

Cool. Meaning we may then leave it at a single i2c_smbus_data.block[257]
declaration in the headers, and i2c_smbus_data can be 255 bytes.

That doesn=E2=80=99t mean we shut the door on 32-byte buffers. After =
all, backward
compat requires we maintain support for those. Just that we need not
bother declaring or promoting dedicated small vs large transfer types
while noone wants one.

Code in need can still make its own. If we learn that there=E2=80=99s =
legitimate=20
demand, we could add a i2c_smbus1_data later to sanction that.

> The only thing I'm truly concerned about here is compatibility. You
> need to ensure that:
>=20
> * User-space binaries that are around today (obviously compiled with
>  the old versions of the kernel uapi headers) will work the same with
>  kernels including your changes.
>=20
> * User-space binaries compiled with the new kernel uapi headers will
>  work with both old and new kernels.
>=20
> For all transfer types. You will have to keep in mind that SMBus-style
> and I2C-style read block transfers differ in who decides the length.
> For I2C, it is the caller (I want to read N bytes from this location),
> for SMBus it is the slave (I want to read a block from this location,
> tell me how long it is). In both cases you need to ensure you do not
> write beyond the buffer, no matter what, and return a proper error =
code
> if it wouldn't fit.

Reverse compatibility would be a more interesting concern.

You=E2=80=99re saying you would need an actual universal binary?
This is indeed beyond only binary backward compatibility.

The headers can=E2=80=99t automate that for you, obviously. The macros =
would have
to be too use-case specific.=20

It has to go into the library. But we can make sure we=E2=80=99re at =
least
not overcomplicating it.

But this can affect matters on how to name new vs old size macros.

For cases which are less interested in the reverse case, and not the
stack space increment either, making I2C_SMBUS_BLOCK_DATA the new smbus3
number was clearly the better choice.

It equates to source compatibility.

In contrast, if we need an I2C_SMBUS_BLOCK3_DATA instead, everything =
needs
a patch to move on.

Should we make that case slightly harder, to promote smbus3 defaults =
elsewhere?
For example, okay if an i2c library build has to compile conditionally, =
as in

#ifdef I2C_SMBUS_BLOCK3_DATA
# .. know that I2C_SMBUS_BLOCK_DATA means smbus3
#else
# .. know that I2C_SMBUS_BLOCK_DATA means smbus1
endif

to pull off the universal binary?

This would also mean we=E2=80=99re likely to add an I2C_FUNC_ to =
indicated smbus3
support at runtime. It=E2=80=99s probably what you already have in mind.

We=E2=80=99d probably still prefer to move all kernel/driver buffers to =
255 bytes
unconditionally. However, I2C_FUNC_ presence normally indicates lower =
level
driver + hardware support, right? Not just a kernel upgrade. Which makes=20=

sense here, too.

I=E2=80=99m just pointing it out because if we want an I2C_FUNC_SMBUS3, =
and at the driver=E2=80=99s
discretion, not just indicating kernel + compatibility support presence,
and if i2c_utils uses that to pick safe size values, that again
means we=E2=80=99re yet again less likely to actually deprecate the old =
transfer numbers.
Some drivers will never be SMBUS3.

> The other compatibility type you need to care about is inside the
> kernel itself: SMBus 2 and SMBus 3 controllers and devices may be =
mixed
> up. Some (I expect most) SMBus 3 devices may be able to work with =
SMBus
> 2 controllers in "degraded" mode, in which case it will be the =
driver's
> responsibility to check the capabilities of the controller and only =
use
> transfer types that are supported.

Yes. This is what=E2=80=99s already happening. It=E2=80=99s the only =
workaround I=E2=80=99m aware
of to get PMBus devices working with what current kernels provide.

It=E2=80=99s basically why I=E2=80=99m here :)

Let=E2=80=99s say your have a device assuming smbus3 limits. If you have =
a legacy
smbus_xfer()-based controller you=E2=80=99re pretty much out of luck.

But if you know what you=E2=80=99ve wired together, you=E2=80=99ll have =
a master_xfer()
implementation with no such limits for fixed length reads=20
(I2C_M_RD, but not I2C_M_RECV_LEN). Here is an example to execute a
PMBus command producing unknown length L > 32:

 1. Do a read_byte() on on that command. It will stop the transfer
    after the length field, but at least you know L now.

 2. Re-invoke the command, this time through I2C_RDWR,
    with a fixed message length (1 + L [ + pec]) to get the full =
transfer
    through. 32B is only for I2C_RECV_LEN.

It=E2=80=99s not pretty, but saves the day. Assume there is plenty of =
code around
which does such things.

> If such "degraded" mode is not
> possible then the driver would simply refuse to bind.

I=E2=80=99d prefer if we keep things as permissive as possible.

For above reasons: not to fence off workarounds which used to be =
possible.

We=E2=80=99re not anticipating the invention of smbus3 here.=20
We=E2=80=99re not paving the way to get there. We=E2=80=99re not setting =
a standard.
We=E2=80=99re only trying to top getting in the of what already =
happened.

It seems perfecty fine to pass an smbus3 transfer from an smbus3 device
found under an smbus2 adapter, just by truncating the data.

The people who open(=E2=80=98/dev/i2c-%d=E2=80=99) are often not the =
type which
roots for autoconfiguration or so-helpful warnings spamming their =
console.

Intuitively, I=E2=80=99d expect the above quiet truncation could be what =
several=20
32B-controller designers may have chosen to do. E.g. when=20
anticipating bit errors in the length prefix observed by their hardware=20=

block-read accellerator?

At least as far as kernel space is concerned, I=E2=80=99d leave it =
there.

I2c libraries may differ, to some degree. Users unhappy with a =
strict-mode
library then at least keep their chance to bypass the library and
grow their own ioctls().

> For such checks
> to be possible, I would expect either one global I2C_FUNC_SMBUS* flag
> to be added to denote SMBus 3 compliance, or possibly several flags =
for
> finer grained control (seems overkill to me but you may have a
> different opinion - also depends on what else SMBus 3 is introducing,
> I admit I did not check). However I did not see that in your =
prototype.
> Do you believe we can do without it? If so, please explain how.

I think in any case, we can make kernel-side buffers smbus3-sized
unconditionally.

Even if we had an I2C_FUNC_SMBUS3 to signal actual support. So far,
everyone confirms not doing so offers only minor savings.
But for a quite realistic bug scenario where drivers and clients
getting semantics wrong will honor that with occasional stack =
corruption.

If it sounds important: I recognize one could make the krealloc()
in i2cdev_ioctl_rdwr in the original patch dependent on an
I2C_FUNC_SMBUS3 from the driver, if we want to avoid it. But it would
be an oddball variant.

User buffers can be 32B or 255B, we just require the command to match,
because I2C_SMBUS has currently no other way to disambiguate message
length limits.

I2C_FUNC_SMBUS3 is nice to have. I=E2=80=99m not against it, I=E2=80=99m =
for it.
For i2c-tools and all clients, it can be valuable to confirm conflicts.

Still, one can keep it indicative only, and not synthesize faults=20
because of a perceived client/adapter/device feature mismatch.=20

We only don=E2=80=99t want to corrupt data. So far we don=E2=80=99t seem =
to need an
I2C_FUNC_SMBUS3 to accommodate that.

I=E2=80=99m not even sure if my new -EMSGSIZE condition in i2c-dev.c is =
such
a good idea.

If noone else thinks it=E2=80=99s critical, maybe we should drop that =
too.
(But the current code makes sure at least all (truncated) transfer
 gets copied_to before before returning it. So libraries may choose
 to ignore this particular ret val and pass the partial result on
 instead.)

Legitimately naive clients trying to avoid smbus1-vs-3 conditionals,
will look at block[0] anyway, vs their buffer length, to figure out that
something may not work as they though it would. At least their stacks
shall be fine. :)

Daniel

> --=20
> Jean Delvare
> SUSE L3 Support


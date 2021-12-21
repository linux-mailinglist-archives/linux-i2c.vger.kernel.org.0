Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7BA47C84B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 21:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbhLUUgB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 15:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbhLUUgB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 15:36:01 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59A5C061746
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 12:36:00 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id o6so10593086edc.4
        for <linux-i2c@vger.kernel.org>; Tue, 21 Dec 2021 12:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Cc6k9W/5KfQMrfyUUbcF3m3pmI+HBcvfTZyXhfKLqOs=;
        b=h7MPCyL+EHZrC4Y/I7Y0lwFUgli6cxS3tAi+3LKS9vdzt4d14V1Cig7wPV/y9Z5IxT
         PSkrkW9GaG9D1cOpBAErHINKSrWkxJjJHo3bQSKg3aqRSG4zKRjRITOKZ6EQA+e5qGxc
         EyWREyrlqsi4RSyIgZ52fvR/3UVmUVGbW7f77ghn53LJbQYRymBnaI2G1nqRmVcv8gIn
         qnuPu5xgDK2fiLpRIZasThv5XxXaabpG7PQVQrZc4GymdqYSYjl/+LEFF8EYXMPl9qr+
         rqcD/eQTz6PZt0TcGJ0IkBQy86ohG3L3GPg/BO+VSEIa8+W5jAb/+oAqmIHsGFfQ3ueI
         FRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Cc6k9W/5KfQMrfyUUbcF3m3pmI+HBcvfTZyXhfKLqOs=;
        b=IRVXm26x/zUrnBC2M+s1C2d5zfxkMTUTCxrvMd6vWwMUFdeH29GrnKE6cZj3Zuizqy
         +XO7YQjL3jok5jfyYpULyUpTrlOM6NtDCUBKaEu2ITTdyWXRvrMc+1QLWNDaASSe7Bcj
         rzYoF8zpts5TzmgLRW5aa/J3UKCEHONDadNRtS2sBQY4rGHadPn0TU4yUpIykbLfzX1p
         LhM4rpOCBFyy6a2/M68i4KrfN+Zc9c6sKBU8MLCjCTQW50g8jv8e7jsAaYwcf8DvR/RU
         qow67aBRjBsISOmLTzgdjFc4iABk0kbfhKahh9R4Q9YHeCOEGmv6wkBv8llTfNb2fojE
         gHbQ==
X-Gm-Message-State: AOAM530ChsA6GVEWwSM2LLktNKTOuSfa93Et/PGBYqm51P1OG6qxPQZu
        sYJFzbHqEm/dp9BZ/bIuX45XLMcmOxuEUZoDJN/Ayg==
X-Google-Smtp-Source: ABdhPJw4NoxOta8RDzBYWeAyXef7SIR5pNNJsoCUsWvqRGDAGe1kmXiasiKHXPhhCOhcJCuU57vw3i0YMkGzEicUjGI=
X-Received: by 2002:aa7:c513:: with SMTP id o19mr11315edq.41.1640118959010;
 Tue, 21 Dec 2021 12:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20211220210643.47842-1-pmenzel@molgen.mpg.de> <CAE_wzQ_Lg1ODV5sEqtW=SauhSXxi6+fh3msOuhnJy8-sNtORcg@mail.gmail.com>
 <CABXOdTeNy3jQ5aQijw9HTpwcNvkEJmddz9yf0Mk-Z+78bDDN-A@mail.gmail.com> <8a7fad1b-b34d-88db-2f6b-462303fe03d9@molgen.mpg.de>
In-Reply-To: <8a7fad1b-b34d-88db-2f6b-462303fe03d9@molgen.mpg.de>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 21 Dec 2021 12:35:47 -0800
Message-ID: <CABXOdTfB4M8AcCOVERpQwddr_N09gpKF67FxRO32S4M9JUaYEQ@mail.gmail.com>
Subject: Re: [PATCH] CHROMIUM: i2c: Add device property for probing
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Dmitry Torokhov <dtor@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tim Wawrzynczak <twawrzynczak@chromium.org>,
        coreboot@coreboot.org, Matt DeVillier <matt.devillier@gmail.com>,
        Felix Singer <felixsinger@posteo.net>,
        Benson Leung <bleung@chromium.org>,
        Justin TerAvest <teravest@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, linux-i2c@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-acpi@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 11:42 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Guenter, dear Dmitry,
>
>
> Am 21.12.21 um 17:47 schrieb Guenter Roeck:
> > On Mon, Dec 20, 2021 at 1:49 PM Dmitry Torokhov <dtor@chromium.org> wro=
te:
>
> >> On Mon, Dec 20, 2021 at 1:07 PM Paul Menzel <pmenzel@molgen.mpg.de> wr=
ote:
> >>>
> >>> From: Furquan Shaikh <furquan@google.com>
>
> >>> Google Chromebooks are often built with devices sourced from differen=
t
> >>> vendors. These need to be probed. To deal with this, the firmware =E2=
=80=93 in
> >>> this case coreboot =E2=80=93 tags such optional devices accordingly =
=E2=80=93 I think
> >>> this is commit fbf2c79b (drivers/i2c/generic: Add config for marking
> >>> device as probed) =E2=80=93 and Chromium OS=E2=80=99 Linux kernel has=
 the patch at hand
> >>> applied to act accordingly. Right after the merge, Dmitry created a
> >>> revert, which was actively discussed for two days but wasn=E2=80=99t =
applied.
> >>> That means, millions of devices shipped with such a firmware and Linu=
x
> >>> kernel. To support these devices with upstream Linux kernel, is there=
 an
> >>> alternative to applying the patch to the Linux kernel, and to support
> >>> the shipped devices?
> >>
> >> *sigh* I should have pushed harder, but I see it managed to
> >> proliferate even into our newer kernels. Not having this patch should
> >> not cause any problems, it can only hurt, because the i2c core has no
> >> idea how to power up and reset the device properly. The only downside
> >> of not having this patch is that we may have devices in sysfs that are
> >> not connected to actual hardware. They do now cause any problems and
> >> is how we have been shipping ARM-based devices where we also dual- and
> >> triple-source components. However if we were to have a device that
> >> switches between several addresses (let's say device in bootloader
> >> mode uses 0x10 address and in normal mode 0x20) this "probing" may
> >> result in device not being detected at all.
>
> On google/sarien, the (upstream) Linux kernel sometimes detects the
> Melfas touchscreen and sometimes not, but in never works. When it=E2=80=
=99s
> detected, the errors below are still shown.
>
> ```
> $ grep i2c voidlinux-linux-5.13.19-messages.txt
> [    9.392598] i2c i2c-7: 2/2 memory slots populated (from DMI)
> [    9.393108] i2c i2c-7: Successfully instantiated SPD at 0x50
> [    9.622151] input: MELFAS MIP4 Touchscreen as
> /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-8/i2c-MLFS0000:00/i=
nput/input6
> [    9.657964] cr50_i2c i2c-GOOG0005:00: cr50 TPM 2.0 (i2c 0x50 irq 114
> id 0x28)
> [    9.662309] elan_i2c i2c-ELAN0000:00: supply vcc not found, using
> dummy regulator
> [    9.773244] elan_i2c i2c-ELAN0000:00: Elan Touchpad: Module ID:
> 0x00d6, Firmware: 0x0005, Sample: 0x0009, IAP: 0x0001
> [    9.773349] input: Elan Touchpad as
> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-9/i2c-ELAN0000:00/i=
nput/input7
> [   10.820307] i2c_designware i2c_designware.0: controller timed out
> [   10.820359] mip4_ts i2c-MLFS0000:00: mip4_i2c_xfer - i2c_transfer
> failed: -110 (-110)
> [   11.844523] i2c_designware i2c_designware.0: controller timed out
> [   11.844635] mip4_ts i2c-MLFS0000:00: mip4_i2c_xfer - i2c_transfer
> failed: -110 (-110)
> [   12.868376] i2c_designware i2c_designware.0: controller timed out
> [   12.868488] mip4_ts i2c-MLFS0000:00: mip4_i2c_xfer - i2c_transfer
> failed: -110 (-110)
> [   12.868570] mip4_ts i2c-MLFS0000:00: Failed to read packet info: -110
> ```
>
> Is that related to the probing stuff?
>

Difficult to say without further testing. I can see two possible
problems: The device may sometimes not be seen because it is powered
off, and/or interrupt handling may not work properly.  You could apply
the patch (commit 11cd1bd03f75 in chromeos-5.15) and see if it
improves the situation. I would also suggest applying commit
b4b55381e5cf ("CHROMIUM: Input: elants_i2c: Default to low level
interrupt for Chromebooks") from chromeos-4.19.

Guenter

> >> If we wanted to do this correctly, coreboot would have to implement
> >> full power and reset control and also add drivers for I2C controllers
> >> to be able to communicate with peripherals, and then adjust _STA
> >> methods to report "not present" when the device is indeed absent. And
> >> note that even in this case we would have issues with "morphing
> >> devices", so coreboot would also need to know how to reset device out
> >> of bootloader mode, and maybe flash firmware so device can work in
> >> normal mode.
>
> What do you mean by =E2=80=9Cbootloader mode=E2=80=9D? coreboot also cann=
ot flash
> anything. That=E2=80=99s up to the payload, and even there support for fl=
ashing
> is rare.
>
> Duncan wrote something about the ACPI _STA method idea, that ASL(?) and
> I2C do not go well together.
>
> >> However coreboot does (or did?) not want to add code to handle i2c
> >> controllers, and would like to push this knowledge to the kernel. And
> >> the kernel does know how to handle peripherals properly, but that
> >> knowledge lies in individual drivers, not i2c core.
>
> Excuse my ignorance, can you give an example driver? Does the Melfas
> touchscreen driver (`drivers/input/touchscreen/melfas_mip4.c`) support it=
?
>
> >> We should remove "linux,probed" from coreboot and not propagate to
> >> newer Chrome OS kernels, and keep it away from upstream.
> >
> > Revert from chromeos-5.15 is at
> > https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/3350347.
> > Everyone please feel free to comment there.
>
> Guenther, thank you for your quick response. Note, that neither Furquan,
> nor Aaron, nor Duncan work at Google anymore, so won=E2=80=99t comment.
> Hopefully, others from the Chromium OS/coreboot folks can chime in.
>
>
> Kind regards,
>
> Paul

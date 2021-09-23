Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239E0415A90
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 11:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240029AbhIWJIP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 05:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240019AbhIWJIO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 05:08:14 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE6BC061756;
        Thu, 23 Sep 2021 02:06:43 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i23so15195518wrb.2;
        Thu, 23 Sep 2021 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W7zJC5aAqnyO98X4K6bFPJj+u1b4jQVw+cClFYWpioo=;
        b=a9ZHfDLE1htrbTBFgFlzlURyjWeEzYOimdnm96oO8kOOASLQMgVEH+PbCXkqRa1QKa
         Xo/mhNjZmJCv6//Yr2udOy4RrQmjbr0q5kcBySyqhwmHCWonJlcwwCqZKCCK+CFSp29v
         ov3qEYsSyjLYIfHE0nIh1soE1ayctAmh2Z0tHgRqzd5fxf0vpFtOJCe5uRJ4S8ZRlmLm
         9QbevfW59NDuCI6XfgPIVS/INi9r/M8UFKHlmojz0vYMwRbxZSJh273lYgBTHKizbJeR
         GE12Hlf0gNNtYLVcD1oFQILaXal7Fz8C9G40Mw0uZ+4A53tnYmRo7jEJdFsIVIoDVL6m
         Gz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W7zJC5aAqnyO98X4K6bFPJj+u1b4jQVw+cClFYWpioo=;
        b=pZMaBQAOt0HaU1m7Z32byYeOwEYOLxwbvsHC8tefWntwMNXj7bZlt7OSS7jsZflV+V
         ry9nmDfpXROnk2txte+rqEgxFloQhiBqCqr560NgA4tZg6ll0sw/sm4jk6/N9xq2KZrf
         oLr11DG2GzW4rc3P5pvvj9bJ5PYZ72zgLFUMJLoSgL6nbNr+ntrG5scbnW9WDD4y/MML
         dEpSJkbnVmPPwGRgtG0dyFEYf0IVky0mHk0uCRO2QLgOIo5SLP91DB2HgjIEllGpczxx
         xD6pAg6pB4tY0PuMF/F80OXQwuVFfCzdQgXdwCxPUm3N012qw/cIJeseTOMI3pMYQtWQ
         eF9A==
X-Gm-Message-State: AOAM531+CVlVlJtCTfQdbM4rQVGX0E4NsM9nTVL5/k2XvJ21Rv+eHyRC
        NkOzZwcCOgwaH5wrrh+nO9f+ClBhkP3e55FHX9I=
X-Google-Smtp-Source: ABdhPJwmaE0WOKFEdoPl71aerkf8BW4hR1ah2KQpCRQqOoPXwAejh3hHj5VunpFrv94eYrn+kbYy/RR8fKnhNZPGDTc=
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr3760465wrd.24.1632388001736;
 Thu, 23 Sep 2021 02:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com> <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com>
In-Reply-To: <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com>
From:   Andrea Ippolito <andrea.ippo@gmail.com>
Date:   Thu, 23 Sep 2021 11:06:05 +0200
Message-ID: <CAGhUXvDWgsZ4+e-PL7EYkf48urJxfCS+eUKfgnqJOSBHM_oqCA@mail.gmail.com>
Subject: Re: Touchpad stickiness on Dell Inspiron/XPS
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     dmitry.torokhov@gmail.com, Alex Hung <alex.hung@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks a lot Hans for your quick reply :)

I will indeed proceed to filing a bug as you suggested and hope for the best.

Have a nice day!

Andrea IPPOLITO

Il giorno gio 23 set 2021 alle ore 11:00 Hans de Goede
<hdegoede@redhat.com> ha scritto:
>
> Hi Andrea,
>
> On 9/23/21 10:47 AM, Andrea Ippolito wrote:
> > Hello,
> >
> > has anyone had a chance to have a look at this report, and can help
> > making some progress on the investigation?
> >
> > Please let me know if there are more suitable channels for this, since
> > most of the things I see in these mailing lists are patches and code
> > reviews, not really reports and discussions around ongoing issues.
>
> Right, bugs are usually discussed in bugzila, you could consider
> filing a bug here:
>
> https://bugzilla.kernel.org/enter_bug.cgi?product=Drivers
>
> But I must be honest here, I don't see much progress being made
> on this until someone with a significant amount of kernel / hw-enablement
> experience gets it hands on one of these models. Either because some
> company wants to run Linux on an affected model and ends up paying
> someone to look at this, or because someone with the necessary
> skills happens to buy one and then gets annoyed enough by this to sink
> enough time into the issue to figure things out.
>
> This hw is still relatively new, so with some luck someone accidentally
> fixes this while fixing another issue, which happens to have the
> same root cause.
>
> Short of one of these 2 happening I don't see this getting resolved
> anytime soon. By all means, do file a bug for this, I just want to
> set expectations about the (un)likelyness of this getting fixed
> (or the bug getting much attention in general) beforehand.
>
> Regards,
>
> Hans
>
>
>
> >
> > Thanks a lot in advance.
> >
> > Regards,
> > Andrea IPPOLITO
> >
> > Il giorno ven 27 ago 2021 alle ore 08:57 Andrea Ippolito
> > <andrea.ippo@gmail.com> ha scritto:
> >>
> >> (resending as plain text)
> >>
> >> Hello everyone,
> >>
> >> I hope I find you well.
> >>
> >> I am writing this to report a touchpad issue faced by me and several
> >> other DELL users across several different distros (HW defect has been
> >> ruled out by people unable to reproduce on Windows).
> >>
> >> First thing that came to mind was to report this to the libinput
> >> project, which I did here:
> >>
> >> https://gitlab.freedesktop.org/libinput/libinput/-/issues/618
> >>
> >> A similar report by another user followed shortly after:
> >>
> >> https://gitlab.freedesktop.org/libinput/libinput/-/issues/636 (will be
> >> closed as dupe eventually, so please keep #618 as reference)
> >>
> >> Issue has been also reported by yet another user on reddit:
> >>
> >> https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5ddy07/
> >> and https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5zjwc8/?utm_source=reddit&utm_medium=web2x&context=3
> >>
> >> And finally, I have reported it on the DELL user forums (no help
> >> whatsoever from DELL):
> >>
> >> https://www.dell.com/community/Inspiron/Tiger-Lake-DELL-Inspiron-Touchpad-Cursor-temporarily-drops/m-p/8021753#M126292
> >>
> >> The investigation on the libinput side appears to be complete, as
> >> maintainers didn't spot anything weird there (also, the issue is also
> >> reproducible with the synaptics lib, suggesting that this might be
> >> lower level).
> >>
> >> Robert Martin suggested to raise this to you now, as per comment:
> >>
> >> https://gitlab.freedesktop.org/libinput/libinput/-/issues/618#note_1042277
> >>
> >> I'm kind of new to Linux mailing lists and bug reporting, so please
> >> forgive me if I'm violating some rules or etiquette, I'd be glad to
> >> rectify if that's the case.
> >>
> >> I also don't know what is the best way to keep the conversation going,
> >> e.g. if there's an issue tracker or instead mailing lists are the
> >> preferred choice.
> >>
> >> You should find some interesting data in the above mentioned reports
> >> already, if not, please don't hesitate to let me know or chime in on
> >> libinput issue #618 directly.
> >>
> >> Thanks a lot in advance.
> >>
> >> Kind regards,
> >> Andrea IPPOLITO
> >
>

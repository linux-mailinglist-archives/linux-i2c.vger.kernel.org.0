Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120543F94AB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Aug 2021 08:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244282AbhH0G6g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Aug 2021 02:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243036AbhH0G6g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Aug 2021 02:58:36 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB541C061757;
        Thu, 26 Aug 2021 23:57:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id z4so8810161wrr.6;
        Thu, 26 Aug 2021 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=La6yDI849v69vetT2DNyixIDuUna3JBK/IQZg7j2d2Q=;
        b=njmcdUkEAWKr2M95rP8rNqdcuWKQLhqjTFkNpkzBysCWLPDGz7+5H/XWaZ1y6ajKeo
         3Lhz1jj69/gHd/W5ByjQv1M8eq83BYVcOnD82ebvghvwdwWqRibItJ6rNq5188c2zoha
         aoT1vOUTyvhjdmETLtklVO0EUuP+SUJgOVVzWAMExidfcUyQ5rjffbC1NLCXvedxrGMZ
         Vo3w+EwgmO7AzwpckgZZ2Ef5+kuLL/kn95K9WW6JI1TpOnF3+1aplOxv6x0XZEMQhgNs
         LNmD5mjO0UKvoJASqqs8dBqYfT1sG+9zp1IbKH7D1YkL2ZotdkMzGY0ADB23NgMYN2W2
         mSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=La6yDI849v69vetT2DNyixIDuUna3JBK/IQZg7j2d2Q=;
        b=O7LS15Q32K0qs8QFeOl/rGL7fcP6Ig5e4f8wqRiBkad3C1yiFSppuQSbk/1aEekJwM
         rhbrAybKKBkkBAW8D2LL8kIyVkKbN2eUXS6NTtAV5n/cuUI1ngELx0wNW1nmH2PZgG5J
         rZcxCghTc0e/QV/ozKlbV/tAvVLRzZ7Iip1/HcqWzBhyt1Y1IGUUe8bHPTS2YUu2l45K
         J4KlMARSwnD0E1KG3LKiy1L4ybytCvsBm+oyLadEiik9F8L61sqJ1BX7UP3vE43COJn+
         HQyRrGFQnWOc+B1qUH0uCi3i5biG+t3cWnRdGn5fAF2RCVKHTpNJP2MMDlUG83s+e0NE
         igeQ==
X-Gm-Message-State: AOAM533SYbLsQRoSSilncG7bmidvyc0pIIDbz7VKgtRs632uUPHGor2M
        i9llu8Nq0azgaXLtIIjcLGiEmt7eHyUsHiCchSHMxbw8bLUde2xx
X-Google-Smtp-Source: ABdhPJz8ItkNDXEzJgJ3TB4cfG53J9d6MELrDBe43+FrWBWEABYXAdiMj8PM9ljy/+Zfhr9Tpiobclt15BTOCHaUkZU=
X-Received: by 2002:adf:c549:: with SMTP id s9mr8461986wrf.344.1630047466162;
 Thu, 26 Aug 2021 23:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
In-Reply-To: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
From:   Andrea Ippolito <andrea.ippo@gmail.com>
Date:   Fri, 27 Aug 2021 08:57:10 +0200
Message-ID: <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
Subject: Re: Touchpad stickiness on Dell Inspiron/XPS
To:     dmitry.torokhov@gmail.com, alex.hung@canonical.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

(resending as plain text)

Hello everyone,

I hope I find you well.

I am writing this to report a touchpad issue faced by me and several
other DELL users across several different distros (HW defect has been
ruled out by people unable to reproduce on Windows).

First thing that came to mind was to report this to the libinput
project, which I did here:

https://gitlab.freedesktop.org/libinput/libinput/-/issues/618

A similar report by another user followed shortly after:

https://gitlab.freedesktop.org/libinput/libinput/-/issues/636 (will be
closed as dupe eventually, so please keep #618 as reference)

Issue has been also reported by yet another user on reddit:

https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5ddy07/
and https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5zjwc8/?utm_source=reddit&utm_medium=web2x&context=3

And finally, I have reported it on the DELL user forums (no help
whatsoever from DELL):

https://www.dell.com/community/Inspiron/Tiger-Lake-DELL-Inspiron-Touchpad-Cursor-temporarily-drops/m-p/8021753#M126292

The investigation on the libinput side appears to be complete, as
maintainers didn't spot anything weird there (also, the issue is also
reproducible with the synaptics lib, suggesting that this might be
lower level).

Robert Martin suggested to raise this to you now, as per comment:

https://gitlab.freedesktop.org/libinput/libinput/-/issues/618#note_1042277

I'm kind of new to Linux mailing lists and bug reporting, so please
forgive me if I'm violating some rules or etiquette, I'd be glad to
rectify if that's the case.

I also don't know what is the best way to keep the conversation going,
e.g. if there's an issue tracker or instead mailing lists are the
preferred choice.

You should find some interesting data in the above mentioned reports
already, if not, please don't hesitate to let me know or chime in on
libinput issue #618 directly.

Thanks a lot in advance.

Kind regards,
Andrea IPPOLITO

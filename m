Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB0E415A3F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 10:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240011AbhIWIt7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 04:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239985AbhIWIt7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 04:49:59 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C139C061574;
        Thu, 23 Sep 2021 01:48:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id g16so14994303wrb.3;
        Thu, 23 Sep 2021 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VJ1ya1dUDNJNcyKmoxaZbYVdhqUTIXFhnv2SIp/UThA=;
        b=Tkb6tuRNp/sc2cLizZQrVuSZ1zRgl474v0Bju+WflaHWatAIZr0jBH3McWQF3iZfrg
         rJjxHvcN4hTu/wfzN96TpA60D1yXdlXKzWrIn4yOlyJ2cKgSeLLes1fEvglNREWirCzT
         wc6gJyjoAVnpHp3goG/FDrwLHNviZFB/eJf5+PLjOldTxKtnowuTByC5PBQGkLW0dYeH
         zQUwPXGD+08zN9WIq3v/VvzKwRMW4LlTI07HlZ5hV8Tcaaicp2VtTJDURu+L54NOlerk
         a1zzuc2AsjuW6bArr6hvrsSbXBPqS60Al0AYh4wFSUpK2POvkgBs8KicUeSyxaFPPxg2
         ZCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VJ1ya1dUDNJNcyKmoxaZbYVdhqUTIXFhnv2SIp/UThA=;
        b=fKqKrQMV/DknkClP9N3Z3Cg7usej0x7XoLm+ZjLQO4dqMQWWTh9fDriyK7L7jQmTnG
         XwDvSMNERaWeFNk5OsxMdsZTUdimDrE+uGwCJDWkWE77Lh5hv27t1z6lI110aXenjw5L
         MOd8re/Y/jl/cu7Hvtm+2zEYN5t0o0QsJlU2J3igm1gQi1T/ECMLLuZ72+80hq0g+SnX
         g26QFgh/ub+X8no4MVCJkSa5PstM/NmpnVfwqwV4i3SHHcASBvWjjLnJ5rV3bVoYFfIp
         rlwcJHEUh7YLHH3Vd7AxGOXC8wdCCuIpIh/8cbkPj59cAqBThjkblYSRa728CKUMqanq
         R7/w==
X-Gm-Message-State: AOAM532nHIRb/Xzuc1xWdKHCE3GDMsdseCHDdJj6hnLdtKxKrqr3wFbK
        pzHEB68kh03Ie4iHzUdyPwekTMjiovV1YgECSCllx7Sx
X-Google-Smtp-Source: ABdhPJzpy90AHamzBQKPcFqzw44Hs6bFwSEwb18VX1uPtzCCuKyOt/teqZZQ4WurcD2iEYamvU8v/pMzVONZqZGjapU=
X-Received: by 2002:a05:6000:1186:: with SMTP id g6mr3781744wrx.126.1632386906455;
 Thu, 23 Sep 2021 01:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
In-Reply-To: <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
From:   Andrea Ippolito <andrea.ippo@gmail.com>
Date:   Thu, 23 Sep 2021 10:47:50 +0200
Message-ID: <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
Subject: Re: Touchpad stickiness on Dell Inspiron/XPS
To:     dmitry.torokhov@gmail.com, Alex Hung <alex.hung@canonical.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

has anyone had a chance to have a look at this report, and can help
making some progress on the investigation?

Please let me know if there are more suitable channels for this, since
most of the things I see in these mailing lists are patches and code
reviews, not really reports and discussions around ongoing issues.

Thanks a lot in advance.

Regards,
Andrea IPPOLITO

Il giorno ven 27 ago 2021 alle ore 08:57 Andrea Ippolito
<andrea.ippo@gmail.com> ha scritto:
>
> (resending as plain text)
>
> Hello everyone,
>
> I hope I find you well.
>
> I am writing this to report a touchpad issue faced by me and several
> other DELL users across several different distros (HW defect has been
> ruled out by people unable to reproduce on Windows).
>
> First thing that came to mind was to report this to the libinput
> project, which I did here:
>
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/618
>
> A similar report by another user followed shortly after:
>
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/636 (will be
> closed as dupe eventually, so please keep #618 as reference)
>
> Issue has been also reported by yet another user on reddit:
>
> https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5ddy07/
> and https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5zjwc8/?utm_source=reddit&utm_medium=web2x&context=3
>
> And finally, I have reported it on the DELL user forums (no help
> whatsoever from DELL):
>
> https://www.dell.com/community/Inspiron/Tiger-Lake-DELL-Inspiron-Touchpad-Cursor-temporarily-drops/m-p/8021753#M126292
>
> The investigation on the libinput side appears to be complete, as
> maintainers didn't spot anything weird there (also, the issue is also
> reproducible with the synaptics lib, suggesting that this might be
> lower level).
>
> Robert Martin suggested to raise this to you now, as per comment:
>
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/618#note_1042277
>
> I'm kind of new to Linux mailing lists and bug reporting, so please
> forgive me if I'm violating some rules or etiquette, I'd be glad to
> rectify if that's the case.
>
> I also don't know what is the best way to keep the conversation going,
> e.g. if there's an issue tracker or instead mailing lists are the
> preferred choice.
>
> You should find some interesting data in the above mentioned reports
> already, if not, please don't hesitate to let me know or chime in on
> libinput issue #618 directly.
>
> Thanks a lot in advance.
>
> Kind regards,
> Andrea IPPOLITO

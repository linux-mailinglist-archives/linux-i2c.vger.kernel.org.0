Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804A41FB3A9
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 16:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729524AbgFPOJn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 10:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729050AbgFPOJk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 10:09:40 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5707BC061573;
        Tue, 16 Jun 2020 07:09:40 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id p187so4840445vkf.0;
        Tue, 16 Jun 2020 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=kvkbSZZ2ghPvtr7g+4DwKKTOPHzQ+JkuiYjOoBKXQ1E=;
        b=MJHlkngFT133npieWpyoGh0urU3iWbGas7CJZrtMJerpGuJtXJBloYvzE44huOfDvE
         a+B2I1EBIwegx2wV251qk0dxjJ99+TVLMAqauve8tcZ/Czgrah7MQQ9zWAcV9Tfi1xha
         368bEbvhG4rwhmCGX8rOyR5bixzGVSwmAMPwD6QW2bTSIQh9lUvIM33As4HJz19uN1Br
         HJp2wwAzWFPjN5Re7TByc9JQSxrZvwsUW3K2FdN4eakM9unoII1EBeAVH+SxY6FAnGxd
         GwnXUnN4QQOVPAAy+h7We3R1u3lxfmC3vixsKANC95sKfUVVE+mFs+DQdYIE/Cezz8YZ
         W4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=kvkbSZZ2ghPvtr7g+4DwKKTOPHzQ+JkuiYjOoBKXQ1E=;
        b=teF1W9dg+PfqGbk34fqDmfqhGa2We0QBrjBA0Wt2YuE+6ZoRLr2qtXxQK++RN12DFV
         1MkV7ZKkHtlHC5m+1ZW4O8CV4CsJB8b8gEP2ZUuVCNCeFS1Y2BiL+f8ex6DnM0fgOy2T
         qfDx0Ah1dbFEfHCyH9n2BPz4dnRjhl/Da53eqFLe2rB/FYmv3oUF7pbe4704WMvQawgB
         Ozl9BVkEwJQWNUJaqfTPbGM/NI1Qeb7r5jmwl6A2XhOmYQYp4IS7gLh6BBDN+mKk6Hyv
         O/2Gb8O1eu8vMfs5LV/84zDNCvTKvPKjytME/sAIWT09N54KUfZa9btD81eAHE281hlu
         OHGg==
X-Gm-Message-State: AOAM532qgNBH/iyy4DKw9tnbgja9vkzjRyq64FKr48tie17uiyyvVYyt
        CtLfCWGOTEfZpYBUIYvRYDQuafvwBvD5Vm+9RJViEw==
X-Google-Smtp-Source: ABdhPJze8O6g9fE6ltSX85adg2jK4puYbKO8MUJwujXYHUy4P5RhKum5p0M5dGxwTqPtL4ATGFihpSZvv1m1jjx+STY=
X-Received: by 2002:a1f:9094:: with SMTP id s142mr1776422vkd.6.1592316579576;
 Tue, 16 Jun 2020 07:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com> <20200616121244.GN20149@phenom.ffwll.local>
In-Reply-To: <20200616121244.GN20149@phenom.ffwll.local>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Tue, 16 Jun 2020 15:05:58 +0100
Message-ID: <CACvgo52PaW97cxMeGhbpD4FUVy5BRAunaCxX3106OOAZm6x67A@mail.gmail.com>
Subject: Re: [PATCH 0/6] remove deprecated i2c_new_device API
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        linux-fbdev <linux-fbdev@vger.kernel.org>, x86@kernel.org,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

On Tue, 16 Jun 2020 at 13:12, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jun 15, 2020 at 09:58:09AM +0200, Wolfram Sang wrote:
> > I want to remove the above API this cycle, and just a few patches have
> > not made it into 5.8-rc1. They have been reviewed and most had been
> > promised to get into linux-next, but well, things happen. So, I hope it
> > is okay for everyone to collect them like this and push them via I2C for
> > 5.8-rc2.
>
> for the drm side of things:
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > One minor exception is the media documentation patch which I simply have
> > missed so far, but it is trivial.
> >
> > And then, finally, there is the removal of the old API as the final
> > patch. Phew, that's been a long ride.
> >
> > I am open for comments, of course.
> >
> > Happy hacking,
> >
> >    Wolfram
> >
> >
> > Wolfram Sang (6):
> >   drm: encoder_slave: fix refcouting error for modules
> >   drm: encoder_slave: use new I2C API

The first two are in drm-misc-next and are to be expected with the 5.9
merge window. As long as that doesn't cause major nuisance proceed as
you prefer.

-Emil

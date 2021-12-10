Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900404703B4
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 16:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242765AbhLJPXz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 10:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242766AbhLJPXz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 10:23:55 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDE2C061746
        for <linux-i2c@vger.kernel.org>; Fri, 10 Dec 2021 07:20:20 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y12so30322932eda.12
        for <linux-i2c@vger.kernel.org>; Fri, 10 Dec 2021 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WQUGFzYCRN/bMkn2Zdb6jyu5vwOhQHOoA0OrZCJaT1A=;
        b=e0wRt7zxKUY3OEkdH0GfooNcEd3kV+xO7nLvcM0NICHgW8d9FcfeVkyQxvdyd2hHDz
         6kTQxXI0vcbeyLzsgT0zdwxpmpHbrY9KvFVVurCeElORngffNMfRaMq30Ju/fH3dGqkh
         jqOmruRmeLLikdSMc4e7CCh11hBpXDx7mZ/vONOziS6Br/vzMebbNlTJNxOneET+DY3m
         kEcpbQMPC2Z4ssSeY3O9xatRM++v4TdpBNWTk+t0KoWUxpjXWghRSQ0pVjbFE1GI6s1t
         faZbw2gHrgCaVRzxMdgvEmCLA2PvumFZClHp+QQi7mtaI9uDBlzw2vpoaq5WqhtOTWQE
         bGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQUGFzYCRN/bMkn2Zdb6jyu5vwOhQHOoA0OrZCJaT1A=;
        b=cJjRvRxQfoKY+uHJs5lzOfZB4n/wv3vz/vTDOVGFuvFTpmahEXjAqOFxtvANuImtGL
         H8UlZ9/CDjRbSx4ThHB9TwrGh6VI2G4SYo2boN809vcI1JIaRmFdcv76qwsvJGqZE0Pn
         qtQZqIpkP77gD5EHyUYnPUYD2w9nNPZrZ2Z4/lJzrj90RKnEUSGrnl19iOnihZqgWY9P
         VdC2SPgAzJuurSGg+QSYanAkdTJ4yHknIezhwAS/WW7NeV4Qhj2buOv/EMO2sT7+yLUo
         HuY9sXZ9r6Gg3VDIlQp4Ig6TlKQ6YupOMB/H656TE5u+YSQiyc5M6NxoRQlyZO2NuIqd
         UKhA==
X-Gm-Message-State: AOAM532yoy1SKabhy+H7r99NGl/ca88JuakJgfDmQLhSswsbPVgqH7I8
        HJ8EFyYnzfSxXnhfhz1LcTp9dNxbCHiIubg+otmRDQ==
X-Google-Smtp-Source: ABdhPJya5KICaGdyHuDD0qj3GbUBH9btCcmKDwGlpHI6Ava6cPQBK3jfi63/i2TKEOQx6XYwjzwxYgJWrY3bOgXIeVo=
X-Received: by 2002:a50:cdd9:: with SMTP id h25mr38364504edj.0.1639149583933;
 Fri, 10 Dec 2021 07:19:43 -0800 (PST)
MIME-Version: 1.0
References: <9ca85ea0eda03d581ccb435052cf37ba19000c3b.1638959309.git.geert+renesas@glider.be>
In-Reply-To: <9ca85ea0eda03d581ccb435052cf37ba19000c3b.1638959309.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Dec 2021 16:19:33 +0100
Message-ID: <CAMRc=MduZub4ZBDohEDhM3Gc39A9S12vKU0tnCxqwC6UGHzEhw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: at24: Rework special case compatible handling
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 8, 2021 at 11:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Sort the compatible values for the special cases by EEPROM size, like is
> done for the normal cases.
> Combine entries with a common fallback using enums, to compact the
> table.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Looks good, applied!

Thanks!
Bart

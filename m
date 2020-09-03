Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DABA25C00E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 13:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgICLLq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 07:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgICLKN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 07:10:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A20C061247;
        Thu,  3 Sep 2020 04:10:11 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u13so1875384pgh.1;
        Thu, 03 Sep 2020 04:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J1i57IRdZhg4OVu4ihUxUTPehYMdVSv4veIZG06bWXs=;
        b=qTSjE1pPHNfO1QDYQ9Ia409UNvEpYppa854Dj58KuStsVelX/b9ITDHVNcirMfta1V
         w9sMOaXM3THG/sQMt4q9TzrIsptXA7M7JX/2SvizD5bBgc+Dpo7k9/KKe5vUoUNuf/Q+
         H3tVkBVFaC0fQqdMevV/2ouY7TNxI0oL8W00lK+f9B4hlyU3u+3xD65RjDjn0PwaW/pB
         hjyIKnX1RwhSmqmIjyNhnUR1PD4T0i9JO4PhmwAh5BNp7cVe1f4DkQLRBoAt7DvFqZRK
         AeOKT3/aCXeYvZIonJSlQ9kA9z4TaJDcKy1mh1thc46CtXdz7ky8VrSiSPFVuMUE0Vzz
         zkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J1i57IRdZhg4OVu4ihUxUTPehYMdVSv4veIZG06bWXs=;
        b=XLMV7kxLQY61JhoSiGl264lnAdzISFNAlgUL1p8+1mdwQvQtiSpGh5M6HivYA5KUo3
         ilTwOR+KWV8Un2ZmIkE96rXpUtKQVJhpfJmo1WcpuT1M5eOI/tIvGhLZv+P3WtOnm9Tq
         yfIDWHo6cG8T7FKzklEwP9H5almE+7z5kfAQrey+QccuuAb0X/4ROpvMCz1m04cYuGom
         bImZ0iJ5LbTJ6xONTIJaaqLo5EDTgGnjd19jOOXfmsWIHteKdjU/GkNzqLq6xSA/cyMk
         aatHQR4lmykh/UsoGN+r8+k3rJNr9Vidnds07KRVuj4Awq/xDsxc6hZkbYHw7FMoY3Vv
         QxLQ==
X-Gm-Message-State: AOAM532lpI++sdnFLnUHDvC849l8iWlVWoQlq3xdRPFjCFkwBBG2cTox
        GvKnPqpdQyxXTKrlMyDTF+OTxFbwkdSQB9TVurA=
X-Google-Smtp-Source: ABdhPJyCwXKGVjz91KGqfY0UKqnCfamjPLQ+Z7zKhx0zAlE0rMJ8Yq95QIAr45mRcsOTIo66t9x+0vzxg/lDu+ElLS8=
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr3407159plr.226.1599131410681;
 Thu, 03 Sep 2020 04:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200903005300.7894-1-digetx@gmail.com> <20200903005300.7894-5-digetx@gmail.com>
In-Reply-To: <20200903005300.7894-5-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Sep 2020 14:09:53 +0300
Message-ID: <CAHp75Vf9P9L1uM+he63D5H+-V3Zwv3jRiKTrXmtB4Sxuk9SC9A@mail.gmail.com>
Subject: Re: [PATCH v3 04/22] i2c: tegra: Don't ignore tegra_i2c_flush_fifos() error
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 3, 2020 at 3:53 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The tegra_i2c_flush_fifos() may fail and transfer should be aborted in
> this case.

Sounds like a fix. To add to previous comment, fixes that are likely
to be backported should have Fixes: tags.

> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 79e542cf3e59..b912a7153e3b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1189,7 +1189,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev =
*i2c_dev,
>         bool dma;
>         u16 xfer_time =3D 100;
>
> -       tegra_i2c_flush_fifos(i2c_dev);
> +       err =3D tegra_i2c_flush_fifos(i2c_dev);
> +       if (err)
> +               return err;
>
>         i2c_dev->msg_buf =3D msg->buf;
>         i2c_dev->msg_buf_remaining =3D msg->len;
> --
> 2.27.0
>


--=20
With Best Regards,
Andy Shevchenko

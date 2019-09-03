Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7647AA6110
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 08:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfICGKB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 02:10:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44675 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfICGKB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 02:10:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id a21so17340399edt.11
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 23:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FwklvvjB3nuDYPkid8mM1XK+kX85ugGYdFr+fnCJwMI=;
        b=YJedTJAPhauAq+02kl/JxsCr9nuoCMNQEInIMj9m4EhXkfpFiZAyMCOwmvFJEG1azF
         M+Uzmd2NAGwqW97Pw2pnMtf+KhZ8Wvbho4ZcHlF16Knp6m/kkV62ZFtD1NYFCR3Yfwuw
         zOcZD+t9OIfD0Ise5jsGVK0GlW+kRYkiGQDWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FwklvvjB3nuDYPkid8mM1XK+kX85ugGYdFr+fnCJwMI=;
        b=gBq4T/DH0NPg8MdbenrPtvGGJQXyiZ85y7XJc46RVZbOoJFRrhL/kYN6IvEoERI5CA
         YTlbNQx9+IpCf6J/n0+/r3wrleRE86gSER/4dqDdDMvxdLfW5bkulia/VchryNMHWuE3
         gEH8SG3USSVAh5RILGCboBeyWAEwJzE+Zvn5acZgYBCPrUZL5XS047zc5NLjBQjS1lid
         w8jhqApH10IvePQwXORrCI/CY/pp2C6wawhpt6c82RvPd7jPoio/Qwt74AOpz51P418v
         No7c6db3z/T5iV7r7iLigjmm5HKQeNB2CpHAChZjqm0amtgd5ADKwQuIpuPr3S8iulJT
         S89w==
X-Gm-Message-State: APjAAAX4Utup1p045csnEd6dzjC8hYaVt6wrpfh0kdJ0vqjq+bYKeG7N
        KwsJOurTO3pf+a8ucQggXig/cHWxoTSS0g==
X-Google-Smtp-Source: APXvYqzx2/SW5cdYxkOE11d0csS9uEiR+ls/v7KBaRrPQgU/QgJwY/eMEMzQoBnNvdsVXO3ySYUZng==
X-Received: by 2002:a50:fc08:: with SMTP id i8mr873843edr.285.1567490999554;
        Mon, 02 Sep 2019 23:09:59 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id o10sm2237603ejn.73.2019.09.02.23.09.58
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2019 23:09:58 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id c10so4730740wmc.0
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 23:09:58 -0700 (PDT)
X-Received: by 2002:a05:600c:240a:: with SMTP id 10mr15215625wmp.113.1567490998184;
 Mon, 02 Sep 2019 23:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUYX6AuNedON5queZLNy__uw0h3ae1TWXtOudFPk6EASA@mail.gmail.com>
 <1567410147.32008.1.camel@mtksdaap41> <CAMpxmJXeWxB4vYdZxWf60Hi2a9RQi30KkLOaKn6W_0PtvPDqMg@mail.gmail.com>
In-Reply-To: <CAMpxmJXeWxB4vYdZxWf60Hi2a9RQi30KkLOaKn6W_0PtvPDqMg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 3 Sep 2019 15:09:46 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BTjcvQ4Cu_tftD4uYf0QAJvHyg5qhkFmZX1JmqiiDuHQ@mail.gmail.com>
Message-ID: <CAAFQd5BTjcvQ4Cu_tftD4uYf0QAJvHyg5qhkFmZX1JmqiiDuHQ@mail.gmail.com>
Subject: Re: [PATCH v1] misc: eeprom: at24: support pm_runtime control
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 2, 2019 at 5:11 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> pon., 2 wrz 2019 o 09:42 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
> >
> > On Mon, 2019-09-02 at 09:23 +0200, Bartosz Golaszewski wrote:
> > > pon., 2 wrz 2019 o 05:32 Bibby Hsieh <bibby.hsieh@mediatek.com> napis=
a=C5=82(a):
> > > >
> > > > Although in the most platforms, the power of eeprom and i2c
> > > > are alway on, some platforms disable the eeprom and i2c power
> > > > in order to meet low power request.
> > > > This patch add the pm_runtime ops to control power to support
> > > > all platforms.
> > > >
> > > > Changes since v1:
> > > >  - remove redundant code
> > > >  - fixup coding style
> > > >
> > >
> > > The subject tag should be v2. Patches start at (implicit) version 1.
> > > It's even more confusing since you're saying "Changes since v1" here
> > > but the subject says v1 too.
> > >
> > Ok, I will fix up it and resent version 2.
> >
>
> Please do it after v5.4-rc1 is tagged though.

Thanks Bart for reviewing.

By the way, I think we also need the DT bindings to be updated, right?

Best regards,
Tomasz

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D198BA61F0
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 08:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfICGyy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 02:54:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35756 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfICGyt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 02:54:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id 100so15709965otn.2
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WETl6ClfbH+XK1NTSp1ikpiHY4Ed8Yqrjm8OFNMQswc=;
        b=By4UFg1CDaRWTiYduI11jMARPjCs6kizcOsy532PlMScAMfDA625e2LVaZkJhtRDqq
         TqLWU2Vin5jg0rc3AnKFsPxX8Z13j9ivXB0iFmMJc6XF4aK6rZoQrY4x0kbBJfdIz93n
         I/YqnxrBgyRzOo0yqNkVaA9xvPbVrv6DrcOJEvJyuNeJ1Ev5x4sqxjJn6s+ZvKqV8PMz
         owOM0cC60ZM3nrdnm554bDU8n/gGlgsEb5wHP+wn1GBicFPW3BJKcDbmKRnUPpvgem2/
         raTvOqnbC0VBDKOEXeu3jP/2mS2/1WkDBkfEYKGg6MtsFu8U1Pyrawkr7ZTkTr8NyG0u
         Xsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WETl6ClfbH+XK1NTSp1ikpiHY4Ed8Yqrjm8OFNMQswc=;
        b=AyPYiFfnQHvWwS1oOJo3hen2ja0rwvm70sQySZTu+NX8pKbAGZz8svOkEmIIVtrg3C
         H8PgdaPWtfN/QCcB71Na4Jqt9jUaC/Dbrlg0RBIEeWFsNSjsw/S+rZw6cGUghaCqYTWj
         bi7SdOrAd+gCD8HF821bFDvVVpUk3Gr7KPhgkcZneOo79z5/H9H5vMzmrJp66qlcdyIa
         6JWOQ52ujaueW41t7NsyTNjtyOqEJVRZ8tzP7363giMVcj0a7h02r6oNxxxsl2Cr9okP
         L3onSxHyn4ZybMyfjuzxFhuNLUUkWJR9yk6a11pfswGxwJWxBSTdrNM7UQZ1n4ls0OL1
         ZSDg==
X-Gm-Message-State: APjAAAWmyqliGLB8b8pHMdQ4RF8/OMvOKPadyiS4JjLiVS8dNkn9IesE
        pXtIIC8Dx7Pj0kRIjnGU7t3IGSsix9ax96uLyhgGlg==
X-Google-Smtp-Source: APXvYqyCbn/pUqmcT14te8wDQkdYdSYG0hn/ST6IZB87bbSC6AfS2p8vA/DjiZOuTGy1RHLsdOmqJgxMr2/pH1RU4rs=
X-Received: by 2002:a05:6830:1d4e:: with SMTP id p14mr11629742oth.292.1567493688642;
 Mon, 02 Sep 2019 23:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUYX6AuNedON5queZLNy__uw0h3ae1TWXtOudFPk6EASA@mail.gmail.com>
 <1567410147.32008.1.camel@mtksdaap41> <CAMpxmJXeWxB4vYdZxWf60Hi2a9RQi30KkLOaKn6W_0PtvPDqMg@mail.gmail.com>
 <CAAFQd5BTjcvQ4Cu_tftD4uYf0QAJvHyg5qhkFmZX1JmqiiDuHQ@mail.gmail.com>
In-Reply-To: <CAAFQd5BTjcvQ4Cu_tftD4uYf0QAJvHyg5qhkFmZX1JmqiiDuHQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 3 Sep 2019 08:54:37 +0200
Message-ID: <CAMpxmJX7Gq7pZqWx_--efjuNFCyAGq3=z84k5uGuAWvu2kwzOg@mail.gmail.com>
Subject: Re: [PATCH v1] misc: eeprom: at24: support pm_runtime control
To:     Tomasz Figa <tfiga@chromium.org>
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

wt., 3 wrz 2019 o 08:10 Tomasz Figa <tfiga@chromium.org> napisa=C5=82(a):
>
> On Mon, Sep 2, 2019 at 5:11 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > pon., 2 wrz 2019 o 09:42 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=
=C5=82(a):
> > >
> > > On Mon, 2019-09-02 at 09:23 +0200, Bartosz Golaszewski wrote:
> > > > pon., 2 wrz 2019 o 05:32 Bibby Hsieh <bibby.hsieh@mediatek.com> nap=
isa=C5=82(a):
> > > > >
> > > > > Although in the most platforms, the power of eeprom and i2c
> > > > > are alway on, some platforms disable the eeprom and i2c power
> > > > > in order to meet low power request.
> > > > > This patch add the pm_runtime ops to control power to support
> > > > > all platforms.
> > > > >
> > > > > Changes since v1:
> > > > >  - remove redundant code
> > > > >  - fixup coding style
> > > > >
> > > >
> > > > The subject tag should be v2. Patches start at (implicit) version 1=
.
> > > > It's even more confusing since you're saying "Changes since v1" her=
e
> > > > but the subject says v1 too.
> > > >
> > > Ok, I will fix up it and resent version 2.
> > >
> >
> > Please do it after v5.4-rc1 is tagged though.
>
> Thanks Bart for reviewing.
>
> By the way, I think we also need the DT bindings to be updated, right?
>
> Best regards,
> Tomasz

Yes, definitely, thanks for pointing that out.

Bibby: the DT updates should come in a separate patch and please Cc
the device-tree maintainers.

Bart

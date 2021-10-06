Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B0A4239BD
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 10:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237411AbhJFIbI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 04:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhJFIbI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Oct 2021 04:31:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF4BC061749
        for <linux-i2c@vger.kernel.org>; Wed,  6 Oct 2021 01:29:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b20so7178168lfv.3
        for <linux-i2c@vger.kernel.org>; Wed, 06 Oct 2021 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Cs32oKjPY880HhRcpboK0pON5dPQmpZCrv3AmYoudi4=;
        b=Y7jduTBLBpq47YNLGK+8Fs1peBjDqtnqaIvJ71rnYHl2LKlBGz14YVXsbSX59h/7Y1
         Mpy86aVzDlMC7vyhQDY0ggy1MsBXlPo/Ri//HkNUdIFfOGLV40yK1Trpb03j940CkDcv
         aAi/bqPh8x4BcyfK9LhFAKp78v/GNsJe/AjNjzTLXl5ez3JblOovjZ2YaxpfDaASzd7K
         kimrxEauFPfupzQ6Nknzw562FDT0tk6D8TVLUU5SA23Moj0PXlw0yo3uP2eWMEzUUkHm
         GFjDlEiJHZj48oW2v7cLjvTKto/78fzY5Td0AE8ohTmVRtoxxTZux0z8S0solecVTL/f
         UYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Cs32oKjPY880HhRcpboK0pON5dPQmpZCrv3AmYoudi4=;
        b=WSJmOyjq4z/PRGMM0dv7+vBp1Os//xTCiWQCjMcKyqKK0E+8TPROtg0N6iH6egcosL
         9RiMQNMddYUvBFZzh3fhlVDzffg98ZknKXB+2LF80TMsB9Ea/7jhEwJcoc6XsGbT4Nyw
         +anSf7SYE2PmJ4meiY6/PLfV7vBloZYXmD6yH+SY+SNbFjVqcqffbB+dDkVfRPk6zDJe
         nb/qu/iszuRQxaIteibjS7To9yw/ajbPSiODzhRL2C3ANpCWGe34fxe5Maz7IG1fISYK
         OiQiJYY277XIlMee9J+Zg0c8tGRPf0E+SmatUOJA62kbvnTGXxP/smfsm+g4HrWbhwLk
         HJgw==
X-Gm-Message-State: AOAM5300cggp1prIo7HAjxjUpm6ju4J4SPMkojdYGV7mkkXDgdkeufjO
        p8Od5rraPW0fIhgk7kFY3dcMW4LvP3utwAYnlw89uQ==
X-Google-Smtp-Source: ABdhPJwgbKRqUWndz/R/ob0yYOvX+zmWUkoW3ELAssaKrTJCToZ4rmrps0L8dLDx2abTjB7pRmhWDo7HUxDlivZuBuU=
X-Received: by 2002:a05:6512:21cb:: with SMTP id d11mr8276307lft.579.1633508954553;
 Wed, 06 Oct 2021 01:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com> <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com> <YVx9IMk7cJSCK79/@piout.net>
In-Reply-To: <YVx9IMk7cJSCK79/@piout.net>
From:   =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date:   Wed, 6 Oct 2021 11:29:03 +0200
Message-ID: <CAF9_jYT7_9Oz-HFSy5z7uiieoHtujUD_En9MTi68PxGb7gxphw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, jarkko.nikula@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Konrad Adamczyk <ka@semihalf.com>,
        Tomasz Nowicki <tn@semihalf.com>,
        Jacek Majkowski <jam@semihalf.com>,
        Alexandru Stan <amstan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 5, 2021 at 6:28 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 05/10/2021 18:22:12+0200, Arnd Bergmann wrote:
> > On Tue, Oct 5, 2021 at 4:37 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wr=
ote:
> > >
> > > On SoCFPGA systems, it's desireable to have fixed numbering for
> > > i2c busses, while being able to enable/disable them (e.g. have i2c1
> > > be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> > > be achieved using devicetree aliases (see i2c_add_adapter). However,
> > > having the driver be self-contained without relying on aliases is mor=
e
> > > robust.
> > >
> > > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> >
> > I don't see how adding a nonstandard property in one of the i2c bus
> > drivers helps at all. How do you expect this to work when there are
> > multiple i2c controllers in the system using different drivers? What
> > should happen if both an alias and the busno property are set?
> >
>
> What happens when two nodes have the same busno property because e.g.
> one is in a dtsi and the other one is in a dts?
>

If busno is set, the alias is ignored (the code that checks aliases
is never reached). If two nodes have the same busno property, we get
a WARN in drivers/i2c/i2c-core-base.c:1637, and only on of them
gets attached.

What is a better way of doing this then? Is adding aliases to the
devicetree like this okay?

aliases {
...
i2c0 =3D &i2c0;
i2c1 =3D &i2c1;
};

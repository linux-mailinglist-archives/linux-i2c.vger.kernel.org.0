Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12CB13AD14
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 16:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbgANPGK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jan 2020 10:06:10 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40748 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbgANPGK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jan 2020 10:06:10 -0500
Received: by mail-qt1-f195.google.com with SMTP id v25so12705602qto.7
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2020 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hG/77GxvunOSI8YW5THsJSlnBGvFxXbdDmptWBr5SD0=;
        b=N6mHiyV6eoZw07syH/QFAGLQCob29tWC3bWYJntBg7Fwk4caieH6rUR5uik11ISsC8
         JE8M6Y1hmnFKDooA5iGz5t52+Czb03pUToS+duHyS/suRwYBNnC3uIWUYI8oM3f/r/6k
         s27UD7W/41Ci/W8OPhVObyStVWxeyJoBvtvPiQroko53bu3AvYeYGjC9FbS546NE8/hM
         M1chhPRqXQY6PRZuWrhIEWnTULFi05hn5TAxOSvTgPPFIvpd7zxqWg23QUb3j8hDD37V
         tCaxJmBg+Qb5B9JzG46etyRkvEgyVravi7Hr3/dVOetD/tnkMCVo1LlQ20vPE/Xd7W5U
         qdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hG/77GxvunOSI8YW5THsJSlnBGvFxXbdDmptWBr5SD0=;
        b=n3HUp/zu4DUf+RjUBDwRIN4Wqmmu9i6GmXz90KNfC0luPeYoAYcS/b44eS/xhPPldu
         QmRjb0Z6AZL8ZWfrywU3S/Pos2nzOgVtwOI8h6DzIfBBFWvA00AbNk7L/0zkPzDlPhou
         qhhBmYNqp2mc/vgZccV9pl+YLAUxD4/aGQFXnl+LmHdS+Aet2ae20F/TNy34cvNekdwk
         Rn7/Xg+1rNZbPsWirbja7K5Pz4VF3hecjurfqo1I+UfkYrN5l1H1zNfYIOrYMuFWjeAV
         gQPtz3mq/WHEkvVczjKqPI0s1N+dfKvyXIZcvnJiPPKbwKH+4bNGquer9ZgtPbPsJQdV
         cZJA==
X-Gm-Message-State: APjAAAV1qydWBZJsL7mpBhdXFsW7ZHuDOyMxUW8fXzf5vN2T1w/gyRu4
        RRrAHIo000wYGnqi5HXTRUupXqpMLwFxpHZIdYxRGw==
X-Google-Smtp-Source: APXvYqyf/27+jnNcvaqjSCP+utuwjxx/iZBpThAVSG3EWNIUHVsrc1r3oe+sZn1Tl911eWYzrDbqSIAajn/zP9bjvqs=
X-Received: by 2002:ac8:3703:: with SMTP id o3mr3962163qtb.208.1579014368945;
 Tue, 14 Jan 2020 07:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-5-ktouil@baylibre.com>
 <20200108205447.GA16981@bogus> <CAMpxmJXffr-S51udNmUyMHz687jAoBKrYspNypfUUqjOD45zxQ@mail.gmail.com>
 <20200114144214.GA1898224@kroah.com>
In-Reply-To: <20200114144214.GA1898224@kroah.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 14 Jan 2020 16:05:57 +0100
Message-ID: <CAMpxmJW8edEZw81iQkwDr-Umdb1ibb85s=EshQs4yXRFh5LP=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: at25: add reference for the wp-gpios property
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        baylibre-upstreaming@groups.io,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 14 sty 2020 o 15:42 Greg KH <gregkh@linuxfoundation.org> napisa=C5=82(=
a):
>
> On Thu, Jan 09, 2020 at 10:47:56AM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 8 sty 2020 o 21:54 Rob Herring <robh@kernel.org> napisa=C5=82=
(a):
> > >
> > > On Tue,  7 Jan 2020 10:29:21 +0100, Khouloud Touil wrote:
> > > > As the at25 uses the NVMEM subsystem, and the property is now being
> > > > handled, adding reference for it in the device tree binding documen=
t,
> > > > which allows to specify the GPIO line to which the write-protect pi=
n
> > > > is connected.
> > > >
> > > > Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/eeprom/at25.txt | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Hi Greg,
> >
> > AT25 patches usually go through the char-misc tree. In this case
> > however, the change depends on the other patches in this series. Can
> > you ack this and I'll take it through the AT24 tree exceptionally?
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Patch applied with Greg's Ack.

Bart

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC975344E3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 22:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240217AbiEYUdX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 16:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiEYUdW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 16:33:22 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7242C38D90;
        Wed, 25 May 2022 13:33:21 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2ff155c239bso227366037b3.2;
        Wed, 25 May 2022 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3T4DsH4UCoUl5R2RgjZ0yHyhWI60p4wfKuM4SeQhx6U=;
        b=dv+OwxdrL+sTwl6GkMW0xyou2Th5dhgob+dZcJHyS8VFrz38UPPQm1cJMpqRohU5dM
         xVKct417ND39qmmbTR+c7JGQ6oMq1QK9cniugpXz4Pcz/vHg4eFwHOuPTdCu6Lu/AlfF
         yd5IJKNdSZhHO+/ZhtdgBDcqcQgo2o/0PyJ1q6RX3GG/TsBIH/i9CuQK5urHzZBK0W5B
         UsrfQ/oZFOGSmYXQHS6MOSKcA6yeClY73k2g1AOYVanujLpnrxbRVbC1Gjg6Z/TyOn0F
         56d7AM88fzWCpcYg2N6Ymyu5SphtaOjSbvf+MLuUw8zsacUSgsKe1693C9IHnh729sn3
         0atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3T4DsH4UCoUl5R2RgjZ0yHyhWI60p4wfKuM4SeQhx6U=;
        b=ob3GxNoc3b+erIyuEhx7qUj4vsBZa6QD8QcvhKCVwJE7H4QeuoDAMkmulU982nokPS
         uXBhTCofc/6ZwrgduvubVDR4Pd80C07RKZt/tVlX4B/CRoAgv5Nnp8HwZjb5mtW2RB0J
         DTYFcytrcyHYyCXFR0s73ZVPmuRQp/fBbPXeGxsaFplP2galqG7UhgPzTVJ3lnHtnTz2
         eT18GKAVf5ZZTuVyTcHaq9rx20W/ynFGRtspu/5PlvM0ZRdM7ot42npvHHycpcsfnk5s
         pds4nfnhkPjEa2iBRvEya5Y6OkXgKbIekmwyQX0FTXwNzjfB1DqrZe7LyNNeVwaMsjtn
         jiGQ==
X-Gm-Message-State: AOAM533gj9ykjzwGIK4vX4iLbKAvZFNGw7gvhj/QN1A3B1Duey0Qxg/a
        o9rhv2SuwjSp1aeHtttGotnwZqeJmffG/zW0E3Y=
X-Google-Smtp-Source: ABdhPJyTYx51ktptJDJOGC/Q7m0DwpTiRnsv3pKLVHymqaP7oCcgTlkoZFHS5omkRIwD539RV9Ftn7Q7lgHzHuB6UBI=
X-Received: by 2002:a0d:df4a:0:b0:2ff:29c7:124e with SMTP id
 i71-20020a0ddf4a000000b002ff29c7124emr35843404ywe.346.1653510800738; Wed, 25
 May 2022 13:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220525074757.7519-1-michael.zaidman@gmail.com>
 <20220525074757.7519-4-michael.zaidman@gmail.com> <CAHSN6OfdHfiZRXjnqvnpcbwS0nt0vBuLiwMHcbpsd_AWiJ3i1g@mail.gmail.com>
 <20220525194242.GA13454@michael-VirtualBox>
In-Reply-To: <20220525194242.GA13454@michael-VirtualBox>
From:   Guillaume Champagne <champagne.guillaume.c@gmail.com>
Date:   Wed, 25 May 2022 16:33:09 -0400
Message-ID: <CAHSN6Ocr538DZCkP9-RL7V7ALc6G_e4rWQz56qRg4o-GVd7=hg@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] HID: ft260: support i2c writes larger than HID
 report size
To:     Michael Zaidman <michael.zaidman@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mathieu Gallichand <mathieu.gallichand@sonatest.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le mer. 25 mai 2022 =C3=A0 15:42, Michael Zaidman
<michael.zaidman@gmail.com> a =C3=A9crit :
>
> On Wed, May 25, 2022 at 11:44:09AM -0400, Guillaume Champagne wrote:
> > Le mer. 25 mai 2022 =C3=A0 03:48, Michael Zaidman
> > <michael.zaidman@gmail.com> a =C3=A9crit :
> > >
> > > To support longer than one HID report size write, the driver splits a=
 single
> > > i2c message data payload into multiple i2c messages of HID report siz=
e.
> > > However, it does not replicate the offset bytes within the EEPROM chi=
p in
> > > every consequent HID report because it is not and should not be aware=
 of
> > > the EEPROM type. It breaks the i2c write message integrity and causes=
 the
> > > EEPROM device not to acknowledge the second HID report keeping the i2=
c bus
> > > busy until the ft260 controller reports failure.
> > >
> >
> > I tested this whole patchset and it resolves the issue I raised
> > https://patchwork.kernel.org/project/linux-input/patch/20220524192422.1=
3967-1-champagne.guillaume.c@gmail.com/,
> > thanks.
>
> Much appreciated!
> I will add your tested-by in the second version of the patchset.
>
> >
> > > This patch preserves the i2c write message integrity by manipulating =
the
> > > i2c flag bits across multiple HID reports to be seen by the EEPROM de=
vice
> > > as a single i2c write transfer.
> > >
> > > Before:
> > >
> > > $ sudo ./i2cperf -f 2 -o 2 -s 64 -r 0-0xff 13 0x51 -S
> > > Error: Sending messages failed: Input/output error
> > >
> > > [  +3.667741] ft260_i2c_write: rep 0xde addr 0x51 off 0 len 60 d[0] 0=
x0
> > > [  +0.007330] ft260_hid_output_report_check_status: wait 6400 usec, l=
en 64
> > > [  +0.000203] ft260_xfer_status: bus_status 0x40, clock 100
> > > [  +0.000001] ft260_i2c_write: rep 0xd1 addr 0x51 off 60 len 6 d[0] 0=
x0
> > > [  +0.002337] ft260_hid_output_report_check_status: wait 1000 usec, l=
en 10
> > > [  +0.000157] ft260_xfer_status: bus_status 0x2e, clock 100
> > > [  +0.000241] ft260_i2c_reset: done
> > > [  +0.000003] ft260 0003:0403:6030.000E: ft260_i2c_write: failed to s=
tart transfer, ret -5
> > >
> > > After:
> > >
> > > $ sudo ./i2cperf -f 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S
> > >
> > >   Fill block with increment via i2ctransfer by chunks
> > >   -------------------------------------------------------------------
> > >   data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
> > >   -------------------------------------------------------------------
> > >   58986           86             256           2           128
> > >
> > > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > > ---
> > >  drivers/hid/hid-ft260.c | 45 ++++++++++++++++++++++++---------------=
--
> > >  1 file changed, 27 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > > index 44106cadd746..bfda5b191a3a 100644
> > > --- a/drivers/hid/hid-ft260.c
> > > +++ b/drivers/hid/hid-ft260.c
> > > @@ -378,41 +378,50 @@ static int ft260_hid_output_report_check_status=
(struct ft260_device *dev,
> > >  }
> > >
> > >  static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *da=
ta,
> > > -                          int data_len, u8 flag)
> > > +                          int len, u8 flag)
> > >  {
> > > -       int len, ret, idx =3D 0;
> > > +       int ret, wr_len, idx =3D 0;
> > > +       bool first =3D true;
> > >         struct hid_device *hdev =3D dev->hdev;
> > >         struct ft260_i2c_write_request_report *rep =3D
> > >                 (struct ft260_i2c_write_request_report *)dev->write_b=
uf;
> > >
> > >         do {
> > > -               if (data_len <=3D FT260_WR_DATA_MAX)
> > > -                       len =3D data_len;
> > > -               else
> > > -                       len =3D FT260_WR_DATA_MAX;
> > > +               rep->flag =3D 0;
> > > +               if (first) {
> > > +                       rep->flag =3D FT260_FLAG_START;
> >
> > I feel like multi packet transactions must still honor flag sent to
> > ft20_i2c_write. This adds a START even if ft260_i2c_write is called
> > with FT260_FLAG_START_REPEATED or FT260_FLAG_NONE.
>
> We use the FT260_FLAG_START_REPEATED to precede the Read message followin=
g
> the Write message in the i2c combined transaction. Am I missing any i2c
> protocol case using the Repeated Start in the Write path?
>

None that I know of. My point was that software wise it may be less
surprising to the programmer if "flag" is replicated as is when
calling ft260_i2c_write. For example, calling it with FT260_FLAG_STOP
only sends a START, no STOP. I agree that it isn't currently called
that way and that it may never be.

> The FT260_FLAG_NONE should not be passed into the ft20_i2c_write as well.
>
> So, we can keep it simple.

Agreed.

>

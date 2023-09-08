Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0693579883E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Sep 2023 16:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241897AbjIHOED (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Sep 2023 10:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbjIHOEC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Sep 2023 10:04:02 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E3D1BF5
        for <linux-i2c@vger.kernel.org>; Fri,  8 Sep 2023 07:03:58 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-26f3975ddd4so1636053a91.1
        for <linux-i2c@vger.kernel.org>; Fri, 08 Sep 2023 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1694181838; x=1694786638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2jvztty3xt2xqRdD6cfGGolwNPuHAE+YuTfrjsOWm8=;
        b=k/ayXSOt+KDeq9unA2uzfzRbj+UTbtlf25/kwk3ZiLn6+pcjRVzkw0twErt2bwE2QL
         vwZCFnKGNKwdcUu37O3sa8VNo1IC99N8CZqH+PX9C9n10EoEYxCJkCVIYcKNeY+1Yetn
         ia3hZSSwvG7kaLCkyD2q0jvsMVaDeBOuCiZiDiwSLx/kLDtddgfboXO9L61T4C22/6Xd
         F/Fw5vHAGQ2GXtF9UbmG/DMF/IYv0sAHYefL+GhHeDWLKlaF6lQ8cuYYSZ11BPTQnRCv
         1tj0MptX869YToix7JiUXO5wfRYg6g0QBi15OrAw+YzwiqWU6SqKLoRPmu1APxq73mwM
         vJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694181838; x=1694786638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2jvztty3xt2xqRdD6cfGGolwNPuHAE+YuTfrjsOWm8=;
        b=M1xL/zp3Cu6JAOI1p3je0WBflHGC1gKKodD/Te1rA2f20wPMl6IUZbmy9fiBJuczq+
         NQuem5A8E/1OCOt3LFvXEjyZaNF/hd2WIBSEYZgoK/eTaTmwV3sIx7YeOMDzvmNh/wzP
         CURloU0Dho3nhvLqhdEm9xquNY4o4KNPhGuUq88aAWnBc7snau3aDRavSJwzBhoEdr1i
         GDOqcdwrwTa5eVNi4ffpZjvoC9dlpfS6kSzFD8fKCFgks1kfRVxXIQy9fXbLmSHU7QUd
         Rdr2CZcSiFDrNv+YC/5s3b+lEYRTrFC9/OoyySswDXhunhgX/74MXLkl1bIl6tABX+C2
         WvVw==
X-Gm-Message-State: AOJu0YyH1FIPS23i27LNlb71//aEcnDdrIOx+iwsViKYXcMvC2eBmsSF
        7aaRemBl5Woziufy0PQxOgKtVc9wD753rU0By7qA2neWxMkpfjoA8hYwaewU5v1AoPVu0RnbAIf
        9tdc3D4N3asir+R1I84LcN/a/wsDtwA==
X-Google-Smtp-Source: AGHT+IFubqKICpsm4d0x1yCcLZWU0qkze1b5oT/J2zmu/5mc/iRlrnTk0M1kh+WZEoNCX34AwFqGsl3UdlU+a9TtVQA=
X-Received: by 2002:a17:90b:4a10:b0:26d:1a46:1646 with SMTP id
 kk16-20020a17090b4a1000b0026d1a461646mr2389383pjb.48.1694181837747; Fri, 08
 Sep 2023 07:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230904090005.52622-1-jonas.gorski@bisdn.de> <20230905225338.g76dqf3a26dnnzxx@zenone.zhora.eu>
In-Reply-To: <20230905225338.g76dqf3a26dnnzxx@zenone.zhora.eu>
From:   Jonas Gorski <jonas.gorski@bisdn.de>
Date:   Fri, 8 Sep 2023 16:03:46 +0200
Message-ID: <CAJpXRYR+yUe4jGgNMOjbK3YALwkJp8vr9=1hH04FHWW-TcRGtA@mail.gmail.com>
Subject: Re: [PATCH] i2c: iproc: reset bus after timeout if START_BUSY is stuck
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>,
        Kevin Cernekee <cernekee@chromium.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Am Mi., 6. Sept. 2023 um 00:53 Uhr schrieb Andi Shyti <andi.shyti@kernel.or=
g>:
>
> Hi Jonas,
>
> On Mon, Sep 04, 2023 at 11:00:04AM +0200, Jonas Gorski wrote:
> > If a transaction times out, the START_BUSY signal may have gotten stuck=
,
> > and subsequent transactaction attempts will fail as the bus is still
> > considered busy.
> >
> > To work around this, check if the START_BUSY bit is still asserted, and
> > reset the controller in case it is.
> >
> > This is also done by the alternative, non-upstream iproc-smbus driver
> > implementation [1].
> >
> > Works around situations like:
> >
> >     bcm-iproc-2c 1803b000.i2c: transaction timed out
> >     bcm-iproc-2c 1803b000.i2c: bus is busy
> >     bcm-iproc-2c 1803b000.i2c: bus is busy
> >     bcm-iproc-2c 1803b000.i2c: bus is busy
> >     bcm-iproc-2c 1803b000.i2c: bus is busy
> >     bcm-iproc-2c 1803b000.i2c: bus is busy
> >     ...
> >
> > where the bus never recovers after a timeout.
> >
> > [1] https://github.com/opencomputeproject/onie/blob/master/patches/kern=
el/3.2.69/driver-iproc-smbus.patch
> >
> > Fixes: e6e5dd3566e0 ("i2c: iproc: Add Broadcom iProc I2C Driver")
> > Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
>
> I think the right Fixes tag should be:
>
> Fixes: 3f98ad45e585 ("i2c: iproc: add polling support")

That was the last change that part of the code, but the "issue" was
not introduced there. The code before that already did a timeout check
and flush in that case, without the reset.

Obviously the fix wouldn't apply without changes to a version without
that commit, but the version would be nevertheless affected by the
issue. That's why I chose the commit introducing the timeout handling.

> Cc: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> Cc: <stable@vger.kernel.org> # v5.2+
>
> > ---
> > The iproc-smbus driver does some additional checks/mitigations, but
> > since my I2C understanding is only very rudimentary, I didn't add them,
> > also the reset was enough to fix the issue I was seeing.
> >
> > I was a bit conflicted about the Fixes tag, but since it fixes/work
> > around misbehaviour seen I decided to add one.
> >
> > The issue was happening only in production, and only once per boot (so
> > far), but with 100% probability within a few hours.
> >
> >  drivers/i2c/busses/i2c-bcm-iproc.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2=
c-bcm-iproc.c
> > index 05c80680dff4..69f9c199fa3b 100644
> > --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> > +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> > @@ -796,6 +796,15 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_ipro=
c_i2c_dev *iproc_i2c,
> >       if (!time_left && !iproc_i2c->xfer_is_done) {
> >               dev_err(iproc_i2c->device, "transaction timed out\n");
> >
> > +             /* check if START_BUSY did not clear */
>
> as Ray asked, can you please expand this comment?

Will do, thanks for the reviews!

Best Regards,
Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=C2=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=C3=B6psel


Commercial register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=C2=A0DE283257294


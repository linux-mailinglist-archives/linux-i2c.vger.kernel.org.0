Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1BB79E7E8
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 14:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236266AbjIMM21 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 08:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236105AbjIMM20 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 08:28:26 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38EC19A8;
        Wed, 13 Sep 2023 05:28:22 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-59b8f5b6c0aso30735007b3.0;
        Wed, 13 Sep 2023 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694608102; x=1695212902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsxchjZb9NNdx19raBfkRm04KA1FW7IMdO9X4io4lsQ=;
        b=c0YyYKWt49IFIBKetzSZ2+ouiBufu/NbEwZoQqvqT6rBoONHJxcuI6HBEKAQah2kpX
         6doSzw0ia9i5YorIGqsv3PgNKD8oXis203Qve9Fpnyg4RvG286GKYvcgKhj6vd4H7cim
         URq0D1ixVqeD6RV5qi+R+vVrJFxbrv0XuKeSD0PBtAsvPgEOKopzO0ix2F9oFbiZ+Pby
         JwzriuKyQRaO2GktJoqHR8TOf6wUDJKBuTdFDzUVmDVVJLoRz35agZO5trVNdazhpqwd
         sF/rx0e9bPPzrfBWh8+XVKhlVT3fR6kjsJsHkTYIlNz3U7AHlMo4FfNP4GRyXe5oK5/2
         2aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694608102; x=1695212902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsxchjZb9NNdx19raBfkRm04KA1FW7IMdO9X4io4lsQ=;
        b=l+tziPMb1tK2+NR6BkP/k35imBVFrkTQ4PBYuixFZR/O8U9qi4+kSLbk2IsXXEhqX4
         IrBFm8mX3PUlzin2IWNBdJ+opU33r9Rh2rYj7WH+12JhkWMoppV7AnIsqkNYaoAJ/fnL
         78t68osvHr3JviweazRmuBY4NVMBNv31wCqQ05JpwbWw7zTqb/bnQdR1uOPrZBxt5qxQ
         a90wLSHFV01vGBOn//17NdpWEomAH+P1hDtai1LeYt6pBM3MbX2/kwSHqP69Kdx1YP1V
         u72I2+2STOVJwTMwJ9i3z3zmRNDlhPsORyzXyhStxv2q3yHYORAZE/reuaCAa65aNsib
         uxZw==
X-Gm-Message-State: AOJu0YxA7jvMXUohEWyWTVve/2Nlhy/vZMfihWC9sdYR6fTVYxNYTZWg
        oC9SVzSK+Pc/r9g7G8VxwM+cI4jyumeyF7Ke6N7trKDgxBg5qw==
X-Google-Smtp-Source: AGHT+IEZxoVncmpz3MSXz1k/Pe8qJBp9BUC6zXN7lW8/W03OLdYA3lRmETrBUW+BiMAIzxTokSDrhm+ldgNdaO9r9Ro=
X-Received: by 2002:a0d:ca97:0:b0:59b:d351:60cd with SMTP id
 m145-20020a0dca97000000b0059bd35160cdmr1087422ywd.38.1694608101993; Wed, 13
 Sep 2023 05:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-4-Huangzheng.Lai@unisoc.com> <20230902210513.3xelrcdtynz45p4o@zenone.zhora.eu>
In-Reply-To: <20230902210513.3xelrcdtynz45p4o@zenone.zhora.eu>
From:   huangzheng lai <laihuangzheng@gmail.com>
Date:   Wed, 13 Sep 2023 20:28:11 +0800
Message-ID: <CAAA1NbZOctfNqtnRRMVwk_ZONPnExVum4+R2xhFN_ezsfpzk0A@mail.gmail.com>
Subject: Re: [PATCH 3/8] i2c: sprd: Use global variables to record IIC
 ack/nack status instead of local variables
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

On Sun, Sep 3, 2023 at 5:05=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Huangzheng,
>
> On Thu, Aug 17, 2023 at 05:45:15PM +0800, Huangzheng Lai wrote:
> > We found that when the interrupt bit of the IIC controller is cleared,
> > the ack/nack bit is also cleared at the same time. After clearing the
> > interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
> > obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
> > when nack cannot be recognized. To solve this problem, we used a global
> > variable to record ack/nack information before clearing the interrupt
> > bit instead of a local variable.
> >
> > Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
>
> Is this a fix? Then please consider adding
>
> Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> Cc: <stable@vger.kernel.org> # v4.14+

Thank you for your prompt. In the next version of the patch, I will
add the fixes tag.

>
> > ---
> >  drivers/i2c/busses/i2c-sprd.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-spr=
d.c
> > index 066b3a9c30c8..549b60dd3273 100644
> > --- a/drivers/i2c/busses/i2c-sprd.c
> > +++ b/drivers/i2c/busses/i2c-sprd.c
> > @@ -85,6 +85,7 @@ struct sprd_i2c {
> >       struct clk *clk;
> >       u32 src_clk;
> >       u32 bus_freq;
> > +     bool ack_flag;
>
> smells a bit racy... however we are in the same interrupt cycle.
>
> Do you think we might need a spinlock around here?

The fifo empty and full interrupt enable will be turned off in
sprd_i2c_isr(), and will not be reset until sprd_i2c_isr_thread()
finishes processing, depending on the situation. Apart from these two
interrupt types, there are only two types left: transmission
completion and transmission failure. Both interrupts need to be re
initiated for transmission to occur, and transmission will not be re
initiated until the current data processing is completed.

Thanks,
Huangzheng

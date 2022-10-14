Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3EB75FED19
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Oct 2022 13:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiJNLRy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 14 Oct 2022 07:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJNLRx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Oct 2022 07:17:53 -0400
Received: from mail.sch.bme.hu (mail.sch.bme.hu [152.66.208.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70551C77C6;
        Fri, 14 Oct 2022 04:17:50 -0700 (PDT)
Received: from mail-pg1-f170.google.com (209.85.215.170) by
 Exchange2016-1.sch.bme.hu (152.66.208.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 14 Oct 2022 13:17:45 +0200
Received: by mail-pg1-f170.google.com with SMTP id r18so4016516pgr.12;
        Fri, 14 Oct 2022 04:17:45 -0700 (PDT)
X-Gm-Message-State: ACrzQf0KEAndE7x7wEJcJUKMaGomUNJB7oS0dyNFVaK0YOnx3mdvg9Ms
        AAPJbwAERPAqKzsOvpqkEf8K6iaShXWp/pltEII=
X-Google-Smtp-Source: AMsMyM4sCbxIE8RZ1qkjuTj82mK/q7nbkZ7vt38OOrdGMgpdKHVLuGrFqGJPMhW8VFRmArpPZj0ri9Nr8t8/yknUmQ0=
X-Received: by 2002:a65:590f:0:b0:46b:1a7b:a7d3 with SMTP id
 f15-20020a65590f000000b0046b1a7ba7d3mr4300985pgu.136.1665746263788; Fri, 14
 Oct 2022 04:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <Y0bUdt73moVmaajb@kili> <CACCVKEEWr-ko9yuZZnzW6icnDesdhajKbb+KWOaVyGDPy9D4Cg@mail.gmail.com>
 <Y0kJrSozgFotrWVt@kadam>
In-Reply-To: <Y0kJrSozgFotrWVt@kadam>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Fri, 14 Oct 2022 13:17:32 +0200
X-Gmail-Original-Message-ID: <CACCVKEFxFmJBKwrq_wjEbh0tqxUyT9KuSU6RQk+rGqqTvRvmNw@mail.gmail.com>
Message-ID: <CACCVKEFxFmJBKwrq_wjEbh0tqxUyT9KuSU6RQk+rGqqTvRvmNw@mail.gmail.com>
Subject: Re: [PATCH] i2c: cp2615: prevent buffer overflow in cp2615_i2c_master_xfer()
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.215.170]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.208.194) To
 Exchange2016-1.sch.bme.hu (152.66.208.194)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> ezt írta (időpont: 2022. okt.
14., P, 9:03):
> > >  drivers/i2c/busses/i2c-cp2615.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> > > index 3ded28632e4c..ad1d6e548503 100644
> > > --- a/drivers/i2c/busses/i2c-cp2615.c
> > > +++ b/drivers/i2c/busses/i2c-cp2615.c
> > > @@ -231,6 +231,8 @@ cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > >                 } else {
> > >                         i2c_w.read_len = 0;
> > >                         i2c_w.write_len = msg->len;
> > > +                       if (msg->len > sizeof(i2c_w.data))
> > > +                               return -EINVAL;
> >
> > Please move this up to line 225, as an invalid `read_len` is also an
> > error and should bail out accordingly.
> >
>
> I don't see the bug.  Is that something that requires knowledge of the
> hardware?

No, what I mean is that you put the check in the else clause of
> if (msg->flags & I2C_M_RD) {
But a `msg->len > MAX_I2C_SIZE` is invalid, regardless of `msg->flags`.
So the check should be outside if the `if`.

> regards,
> dan carpenter

Bence

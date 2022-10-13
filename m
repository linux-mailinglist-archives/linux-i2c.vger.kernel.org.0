Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB2E5FE22C
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Oct 2022 20:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiJMSzo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 13 Oct 2022 14:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiJMSzR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Oct 2022 14:55:17 -0400
X-Greylist: delayed 1228 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 13 Oct 2022 11:53:49 PDT
Received: from mail.sch.bme.hu (mail.sch.bme.hu [152.66.208.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B05184993;
        Thu, 13 Oct 2022 11:53:49 -0700 (PDT)
Received: from mail-pl1-f171.google.com (209.85.214.171) by
 Exchange2016-1.sch.bme.hu (152.66.208.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 20:02:17 +0200
Received: by mail-pl1-f171.google.com with SMTP id i6so2472778pli.12;
        Thu, 13 Oct 2022 11:02:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf3kS01zibwA4g/5vMjvm7HUErvX3f1eclDuSZ5JmC+dDVDV5Nb4
        U7gjRLY1fhj0KRtlwJj986SFapVHTSzxC/7KfFI=
X-Google-Smtp-Source: AMsMyM44IgBxVIajuVuN849vBOtaQTtRi9JI5pBn/lbVCXgzz0gHtRN2pSQdW4FIsugzgIVVbOg6hYuJirO3NLbtl2A=
X-Received: by 2002:a17:902:d58c:b0:17f:998a:76cd with SMTP id
 k12-20020a170902d58c00b0017f998a76cdmr1123771plh.155.1665684135865; Thu, 13
 Oct 2022 11:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <Y0bUdt73moVmaajb@kili>
In-Reply-To: <Y0bUdt73moVmaajb@kili>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Thu, 13 Oct 2022 20:02:04 +0200
X-Gmail-Original-Message-ID: <CACCVKEEWr-ko9yuZZnzW6icnDesdhajKbb+KWOaVyGDPy9D4Cg@mail.gmail.com>
Message-ID: <CACCVKEEWr-ko9yuZZnzW6icnDesdhajKbb+KWOaVyGDPy9D4Cg@mail.gmail.com>
Subject: Re: [PATCH] i2c: cp2615: prevent buffer overflow in cp2615_i2c_master_xfer()
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.214.171]
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
12., Sze, 16:52):
>
> The "msg->len" can be controlled by the user via the ioctl.  We need to
> ensure that it is not too large.

Does the I2C core not check that submitted msgs do not exceed maximums
specified in `i2c_adapter_quirks`? @WSA?
If not, other drivers may also have this issue.

> Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/i2c/busses/i2c-cp2615.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> index 3ded28632e4c..ad1d6e548503 100644
> --- a/drivers/i2c/busses/i2c-cp2615.c
> +++ b/drivers/i2c/busses/i2c-cp2615.c
> @@ -231,6 +231,8 @@ cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>                 } else {
>                         i2c_w.read_len = 0;
>                         i2c_w.write_len = msg->len;
> +                       if (msg->len > sizeof(i2c_w.data))
> +                               return -EINVAL;

Please move this up to line 225, as an invalid `read_len` is also an
error and should bail out accordingly.

>                         memcpy(&i2c_w.data, msg->buf, i2c_w.write_len);
>                 }
>                 ret = cp2615_i2c_send(usbif, &i2c_w);
> --
> 2.35.1
>
>

Bence

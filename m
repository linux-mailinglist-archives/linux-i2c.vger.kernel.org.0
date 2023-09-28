Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4F6C7B205A
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 17:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjI1PEr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 11:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjI1PEr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 11:04:47 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED93B1B4
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 08:04:24 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-577fb90bb76so7123504a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695913464; x=1696518264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy+mCITxqUKHaf6v9YLMzBge8DV4xA0bJDOMHOLkflo=;
        b=YIZqZylNoOOKp2ilggVieH/kQo3Yv3Lak4IBKNCKTQaWliGoKgoSEKYbKLhHdTfq89
         ckiZd1SPUqXikVgjDqcaenz8jK3oOreXiblrKqw1KeN0mQtWbRLEPtaHfMw9UuYAQupP
         pZj5ZAKAQ6j5I1qoxz3lFLaP7YQu1k6EnGD80b8e7rMhvtTkHWxSMAfpDB5SpCOv8IhY
         hTj5f8vUuLsdXQlK8mqgrU/APIjBBiMe3EeCwVP5Bvnw3SAS00vsQKBm49Tb+oAHpi9B
         omaTUtSj9R1yaKFm3Ht6CW0r0WDJxYpmAsoPr346nTW5XRXRL5z7wF6hWKhND0j6LU+f
         IEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913464; x=1696518264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hy+mCITxqUKHaf6v9YLMzBge8DV4xA0bJDOMHOLkflo=;
        b=GC5YigKJrD7G9KKyUwCddAuimtyx57vvrsDKYbtrej5ok+A0VR7baskrnMt6wQd1y+
         9gaASN6sNYYjnLOeQPzTusp13RkKiD6Ad1WAuW87Rmir5Y42pbA1M2ifHZDntUmSl3lX
         qqOeNuieBbwEOdGSiZQM8q04yNm2h52IUh5RjL73+RvLR1jZEgQGiWU/b+5H441qU5Wr
         UJz6yMS4SJq1Mim9HhLGJu+FnAcMnJXOTjudwlV6OEBpUagEo7V7D/GLBfILKZwUDr6V
         j8I5CGzAOi4TpfcyFW8GUpUVKrwusCS2FtFGK3jGlf2hI/xuXX7ctOPu8rcUl79u1Up9
         u+nQ==
X-Gm-Message-State: AOJu0YyEDpRZzUwQ9fP/o0QtlLLFuzxP6UDQ3zN06JUmPLBZarBlWGC5
        RdUyRQ+LOwMcvgrvrstxUZYboGAWJJLGj8mzijlzGg==
X-Google-Smtp-Source: AGHT+IGHZkvDaSolxNVreDEYNnlm23eWGgLmXan2kef32Ucxd9qRSqygmSfVuYx7BSqrMRHdwnd8QSHBn0FnGfA1Tg4=
X-Received: by 2002:a17:90a:b28b:b0:273:ed60:ad52 with SMTP id
 c11-20020a17090ab28b00b00273ed60ad52mr1367512pjr.37.1695913464408; Thu, 28
 Sep 2023 08:04:24 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 28 Sep 2023 11:04:23 -0400
From:   Jian Zhang <zhangjian.3032@bytedance.com>
Mime-Version: 1.0
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com> <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
In-Reply-To: <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
Date:   Thu, 28 Sep 2023 11:04:23 -0400
Message-ID: <CA+J-oUsgZuFmKor_thfehf2T8Y9T4NHcDp713YHyZC=fQvvZgA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, zhangjian3032@gmail.com,
        yulei.sh@bytedance.com, xiexinnan@bytedance.com,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: "Andi Shyti"<andi.shyti@kernel.org>
> Date:=C2=A0 Thu, Sep 28, 2023, 22:51
> Subject:=C2=A0 [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in=
 slave read
> To: "Jian Zhang"<zhangjian.3032@bytedance.com>
> Cc: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id=
.au>, <andrew@aj.id.au>, <zhangjian3032@gmail.com>, <yulei.sh@bytedance.com=
>, <xiexinnan@bytedance.com>, "Tommy Huang"<tommy_huang@aspeedtech.com>, "W=
olfram Sang"<wsa@kernel.org>, "open list:ARM/ASPEED I2C DRIVER"<linux-i2c@v=
ger.kernel.org>, "moderated list:ARM/ASPEED I2C DRIVER"<openbmc@lists.ozlab=
s.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-arm-kernel@lists.=
infradead.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-aspeed@li=
sts.ozlabs.org>, "open list"<linux-kernel@vger.kernel.org>
> Hi Jian,
>
> On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> > as a slave, a situation arises where the master sends a START signal
> > without the accompanying STOP signal. This action results in a
> > persistent I2C bus timeout. The core issue stems from the fact that
> > the i2c controller remains in a slave read state without a timeout
> > mechanism. As a consequence, the bus perpetually experiences timeouts.
> >
> > In this case, the i2c bus will be reset, but the slave_state reset is
> > missing.
> >
> > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeou=
t occurs")
> > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
>
> Why I'm failing to find your v1 patch? And where is the
> changelog?
Sorry, something was missing,
v2:
* remove the i2c slave reset and only move the `bus->slave_state =3D
ASPEED_I2C_SLAVE_INACTIVE` to the aspeed_i2c_init

[0]: https://lore.kernel.org/linux-arm-kernel/20230810072155.3726352-1-zhan=
gjian.3032@bytedance.com/T/
Jian
>
> Andi

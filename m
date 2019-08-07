Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA882855AB
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 00:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfHGWUd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 18:20:33 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39740 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGWUd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 18:20:33 -0400
Received: by mail-lf1-f67.google.com with SMTP id x3so11447343lfn.6
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 15:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SBas5C6K2wvpH1RMwY0wvuuflbAh2zb/7wCgyFHudbs=;
        b=kJCvGDatyESaq23pVjLfNIrQGZaJME1Kg9mVxXDIqUKWizs0yVYhjV3e8MlNMHAlDl
         hNkfZhv9+N5J1LkTyPoZpZHIO5kxQOoH677qGx/pAZRLlYQaIqunyfBxwD7Tr7lljwgt
         1epM4dJRoBObYZHth9ULubrKPn9EAudT0ZyC+JhElKQX9LqFdBhAQZxJhXuylqLpVlUr
         F8JlMWA/8OmSLbgGRCwBckwD4lNAwOAy//gmOMl+4hYXcMlZKEUV46fD43eeWgcnZrM4
         gUu/tOTf6HQh9adyCYcKH9qDDgvgHaCaZ17jXIArYAj62TGK2kx+5PkF7IZx9D+LNO8Z
         VjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBas5C6K2wvpH1RMwY0wvuuflbAh2zb/7wCgyFHudbs=;
        b=PRBOM7FwYsLe8RUWjO6Ugp+sOvRZisUuYCGTHo/WrAcAcPbKEkG+Lsk55DLngi6Owa
         vWE0Z1TqeuMhkf8xXyf1t6Cn8+gceNtVHBKU+ACNIsO8sOKsr2R+i/Wf3AI/aqaHsngH
         VWdQ2CjQgEHec4EaScclF8RUiD+KdrcTXZFeEBvTRfRszy8bi9EncdO1Wntfh54P/csG
         IsswosU+tvMsT7CrvjwKZXQBuDibswOb23rbIPcTkSX3QwvNV0KGJNaRfWvjuJer7Jyg
         nWIn/PnG7DUCDRoIcN5eUuY8CHDXfmIw/Z3CEtBV13UEpmXZ0pyesMi3sl+4TdsAgBX3
         zOyA==
X-Gm-Message-State: APjAAAVzlDK8J3ZB8k4jQyx2GnSrowMM8T6rZkxSCfcvenNouRr5DPJv
        TuqFjf+g/BgIogPQRqQUD8nVsJZLugiA4Hd6+Rc=
X-Google-Smtp-Source: APXvYqx0Mwtqhw9087hyBEe2GuTKtihTMAm6GXslkU54Jw5h7GCtfANrpe8NZL5I4XUVntm1VmGlhc1n0daCobGGSIs=
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr7103136lfq.44.1565216431572;
 Wed, 07 Aug 2019 15:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190807203153.11778-1-festevam@gmail.com> <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <20190807211317.GA5193@shell.armlinux.org.uk> <CAOMZO5BtVL8NZJmAfWhKkmA_xXyut_nHBL8mS7_7f41S=mYkkQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BtVL8NZJmAfWhKkmA_xXyut_nHBL8mS7_7f41S=mYkkQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 7 Aug 2019 19:20:55 -0300
Message-ID: <CAOMZO5Ck-c7nvXX0yR4sgpg=HF26G0f1P-krVFNfLBJUYbDPaQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 7, 2019 at 7:15 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Russell,
>
> On Wed, Aug 7, 2019 at 6:13 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
>
> > Well, the question is what behaviour do we want.  The driver's original
> > behaviour prior to it breaking was to ignore DMA if it wasn't found
> > (e.g. when the DMA driver is a module.)
> >
> > Your patch restores that behaviour, which is the safest approach.
>
> Thanks for the feedback.
>
> > Audrey's patch has the effect that none of the I2C buses will be
> > registered if the DMA driver is a module, until the DMA driver is
> > loaded.  Since an I2C bus _may_ have the systems RTC on it, not
> > probing the I2C bus will cause the RTC not to be read by the kernel
> > at boot, leading to the system booting with a unixtime of 0.
>
> That's a very good point.
>
> > I haven't checked what the situation is wrt RTCs on the ZII boards,
> > whether they do indeed have external I2C RTCs on them.
>
> Yes, they do have external I2C RTCs. Please check this commit for example:
> 09fc0dacc ("ARM: dts: imx6qdl-zii-rdu2: Disable the internal RTC")

And here is another one for the vf610-zii:
8da0af5d6d39 ("ARM: dts: vf610-zii: Disable SNVS RTC")



> If Wolfram agrees, I think we can go with my patch then.
>
> Thanks

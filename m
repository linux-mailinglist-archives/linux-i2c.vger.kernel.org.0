Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C22F6B9A23
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 16:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjCNPpO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 11:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbjCNPpA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 11:45:00 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DDE85376;
        Tue, 14 Mar 2023 08:44:32 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id a3so14517511vsi.0;
        Tue, 14 Mar 2023 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678808657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XjAizo6lZUkrKoo1AleuRbkD07Hz+ftiai9aBhNYDyo=;
        b=Xx3ZmdWa/dEajEQVIpjvQpkMvUoVsK9M+ZJUaGja1E2NM60gLHMVynLeqJxN7rH7YB
         QySo97htVoiQyddy/GjgQqYFPryWNatVu68deOQY+tJnHgsDoAg4Znfhk5feGPB1nFIR
         H8gAtmgChYIfQvFK5CVZUbEU+MsMqcsC1nxv1SjsU/gwBs1BndLjSjOCdGSOFR7mAXlO
         6TyW7Vhhj/+aeFKc2/+NMgjwn/27hiNBIBdkm0BJPdp4Byc/r84xDK3Uvv/hJB5Y6zZ2
         G4xN7va1MIAOsN251XuYk/ISZxfG74I4uNzsPQ63ug7Su5MQ8Bn/LfR4ICqSveP4skUx
         gR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjAizo6lZUkrKoo1AleuRbkD07Hz+ftiai9aBhNYDyo=;
        b=RGmux8kr/bCcfzCgNgNvIXWbYrimzu7Zvd/4I2zKN94lPRcF3bfH8cR9gfHUYz8/6A
         nrieH60pnL2hFJCsEzTVSuO04cYcCz5lSjjO0wuEsWn0z1GpvX6cy++bfITNzzGzmMf/
         LcHTxjbPzU0c65A5d2yfi0jmrrN01p0JzIeHN5Hs44tWKEjmjg651tmtYce7I6flXzSe
         uKklCB0jfR0+mdeIkUJJjPUse8uJtAA1+Zq8Hnd3uE7Dq/o4iPnkK4O3jELKKrPzJQdl
         pyJkP34oqKaEwNCtyMTMaglDfAAIv+WrA+Rd7OOH+POHL+AALYH1yKZkJebtJT0Y9siO
         j1Jg==
X-Gm-Message-State: AO0yUKX7ls6jE/mdhI6qS7+CP88R3OYADO/GFon3ot+UVKZtgueuhckG
        IwsOsDxlgGGkAbyI5KU5M47oJv4zoZzNnibjfOs=
X-Google-Smtp-Source: AK7set+F61pGThwrBCmvVZuXcEvwg8zbPZNIAN3DDrNHCypA5dVyniah7usKkWwe2UeznUVXLbq0q+aPvrrGgYq/w8w=
X-Received: by 2002:a67:7302:0:b0:414:2d02:6c96 with SMTP id
 o2-20020a677302000000b004142d026c96mr24116710vsc.7.1678808657403; Tue, 14 Mar
 2023 08:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230314135734.2792944-1-harperchen1110@gmail.com> <20230314141036.lnwvpputzfcyeiyz@intel.intel>
In-Reply-To: <20230314141036.lnwvpputzfcyeiyz@intel.intel>
From:   Wei Chen <harperchen1110@gmail.com>
Date:   Tue, 14 Mar 2023 23:43:41 +0800
Message-ID: <CAO4mrfefBKL2exRrCOzVXXzzNXFhJhHOfciJZpiAdyyC_0msxQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The data->block[0] variable comes from user and is a number between
0-255. Without a proper check, the variable may be very large to cause
an out-of-bounds when performing memcpy in slimpro_i2c_blkwr.

Fix this bug by checking the value of writelen.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
---
Changes in v2:
 - Put length check inside slimpro_i2c_blkwr

drivers/i2c/busses/i2c-xgene-slimpro.c | 3 +++
1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c
b/drivers/i2c/busses/i2c-xgene-slimpro.c
index bc9a3e7e0c96..0f7263e2276a 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -308,6 +308,9 @@ static int slimpro_i2c_blkwr(struct
slimpro_i2c_dev *ctx, u32 chip,
u32 msg[3];
int rc;
+ if (writelen > I2C_SMBUS_BLOCK_MAX)
+ return -EINVAL;
+
memcpy(ctx->dma_buffer, data, writelen);
paddr = dma_map_single(ctx->dev, ctx->dma_buffer, writelen,
DMA_TO_DEVICE);
-- 
2.25.1


On Tue, 14 Mar 2023 at 22:10, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Hi Wei,
>
> On Tue, Mar 14, 2023 at 01:57:34PM +0000, Wei Chen wrote:
> > The data->block[0] variable comes from user and is a number between
> > 0-255. Without proper check, the variable may be very large to cause
> > an out-of-bounds when performing memcpy in slimpro_i2c_blkwr.
> >
> > Fix this bug by checking the value of data->block[0].
> >
> > Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-xgene-slimpro.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
> > index 63259b3ea5ab..bc9a3e7e0c96 100644
> > --- a/drivers/i2c/busses/i2c-xgene-slimpro.c
> > +++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
> > @@ -391,6 +391,10 @@ static int xgene_slimpro_i2c_xfer(struct i2c_adapter *adap, u16 addr,
> >                                               &data->block[0]);
> >
> >               } else {
> > +
> > +                     if (data->block[0] + 1 > I2C_SMBUS_BLOCK_MAX)
> > +                             return -EINVAL;
> > +
> >                       ret = slimpro_i2c_blkwr(ctx, addr, command,
> >                                               SMBUS_CMD_LEN,
> >                                               SLIMPRO_IIC_SMB_PROTOCOL,
> > @@ -408,6 +412,10 @@ static int xgene_slimpro_i2c_xfer(struct i2c_adapter *adap, u16 addr,
> >                                               IIC_SMB_WITHOUT_DATA_LEN,
> >                                               &data->block[1]);
> >               } else {
> > +
> > +                     if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
> > +                             return -EINVAL;
> > +
>
> you could eventually put this check inside slimpro_i2c_blkwr() so
> that you have it once and for all, for everyone.
>
> Andi
>
> >                       ret = slimpro_i2c_blkwr(ctx, addr, command,
> >                                               SMBUS_CMD_LEN,
> >                                               SLIMPRO_IIC_I2C_PROTOCOL,
> > --
> > 2.25.1
> >

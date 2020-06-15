Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4991F944F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 12:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgFOKH1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 06:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgFOKH0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 06:07:26 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E049DC061A0E;
        Mon, 15 Jun 2020 03:07:26 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id g3so14663084ilq.10;
        Mon, 15 Jun 2020 03:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hg8K4xTSSuNaBtkl8lh9GNzZaKJC219hVqXlhKOASyc=;
        b=tgUlV/Hv+7gZqovKdUdduJ5DosmZ6W3ZgvLcam1sO+NfBlQkeL/R6Ll1hPEE2lvKe1
         Q9Q8r9+UwTYuIzIICqSKXIRi1m83v3jpiLa9EK6FSl2CzvfLDwdp/D/QlP1lrzqnUk5M
         K1M4ONzrcHZlTTZLMf4fM0XKl5fPHTxUOnuCB80lW/7POoQNRMcbiea5BnbvaGlGg+i9
         U9qeD0ozbnZcyiYa8rnMcJe6oNU0+1g0YzAWmgMjm3AQANEKH7o2We9t5YAKaSDrTMgT
         LKHBnER4Pqe4WQyyrf5LmbFUyrfoeNO6VQ422e0u9I6Uwl4PX1SjzVwCj0dIrZoL57q1
         ApHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hg8K4xTSSuNaBtkl8lh9GNzZaKJC219hVqXlhKOASyc=;
        b=Rn1gzVY70AvlX1zU2J5hIaj4nf20pfmrDsxFW/km8w2wccjUZwVAUDrOMcV9guApsq
         BUPVRfWt0DH4ar00ufHvZiC4bDH41ir4p2BacrSHSXVDvVtkJd9NF7or2yej0ZNilKrp
         7Qi5e0Tb7vryHBqn0CGb56br/GKBxQga6B1ehvK42+vEscsGxclTSxhY/Dlm5Mkxl4RG
         Hit5nad2bO0DOBNHr/bfiSjAAa6O9XGXHbxU3YYET+hoIONmuPUPNF0Ch1rh8BQ59pEw
         WSfzja72RC6YMGowg2b7+6dpQCWH7KIiJErZbwrASTiTqsNlMZPtcQjAaNzj9laugqpn
         XGzQ==
X-Gm-Message-State: AOAM530wT2xNcsovcK/XfpecbHaG/02U8oaU+OD0bt7YE+dQusZxAZPr
        QmDD8dzudo6ldcuYL+1evfNFdQOzPVqe7Mq1Jkc=
X-Google-Smtp-Source: ABdhPJwTRoOir1kIpAowgJbUvDY6mcvoOvZBCRgHGJW796+SC2pR32+7lvI/4r+L3ywnisFym7QRUoEMdKMTueb6e/w=
X-Received: by 2002:a92:b69b:: with SMTP id m27mr25709568ill.271.1592215646234;
 Mon, 15 Jun 2020 03:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com> <618d3fea-aa9f-dbf6-04a1-e9db621a6cd5@st.com>
In-Reply-To: <618d3fea-aa9f-dbf6-04a1-e9db621a6cd5@st.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Mon, 15 Jun 2020 18:06:50 +0800
Message-ID: <CAL9mu0JsCOrnt=ROr-0_GByKeb6yeq5YwygzS+S9i=SMjgL6kQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Enable stmpe811 touch screen on stm32f429-disco board
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        p.zabel@pengutronix.de, pierre-yves.mordret@st.com,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 15, 2020 at 5:08 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Hi Dillon
>
> On 6/9/20 3:26 PM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patchset is intend to enable stmpe811 touch screen on stm32f429-disco
> > board with three dts and one i2c driver changes.
> >
> > has been validated by ts_print tool
> >
> > Changes log:
> > V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
> >
> > V3: just add change log in [PATCH V3 3/4] below ---
> >
> > V2: remove id, blocks, irq-trigger from stmpe811 dts
> >
> > V1:
> > ARM: dts: stm32: add I2C3 support on STM32F429 SoC
> > ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
> > ARM: dts: stm32: enable stmpe811 on stm32429-disco board
> > i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
> >
> > dillon min (4):
> >    ARM: dts: stm32: add I2C3 support on STM32F429 SoC
> >    ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
> >    ARM: dts: stm32: enable stmpe811 on stm32429-disco board
> >    i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
> >
> >   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 +++++++++
> >   arch/arm/boot/dts/stm32f429-disco.dts  | 47 ++++++++++++++++++++++++++++++++++
> >   arch/arm/boot/dts/stm32f429.dtsi       | 12 +++++++++
> >   drivers/i2c/busses/i2c-stm32f4.c       | 12 ++++++---
> >   4 files changed, 80 insertions(+), 3 deletions(-)
> >
>
> DT patches applied on stm32-next. I changed node ordering in patch 3.
Okay, thanks.

Regards,
Dillon,
>
> Thanks
> Alex

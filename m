Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B5F38DF3A
	for <lists+linux-i2c@lfdr.de>; Mon, 24 May 2021 04:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhEXCg3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 May 2021 22:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbhEXCg3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 May 2021 22:36:29 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3556CC061574;
        Sun, 23 May 2021 19:35:01 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id j189so4924467qkf.2;
        Sun, 23 May 2021 19:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jJuutPWSYZAO28hQHvByxbn0puUm3ID8Bjg9Q7zuB7I=;
        b=gyn3CX5lKh7USWncJLEqq50UPHkDuQtOOqqvL9MqVnZjhmT5Y7orqLXwlWHS8bWlbm
         u49FBbUwu3mSCq+sY/aDG8zv7KOpP/YNiBdr8myFB86xFTR2RRblZiWODTK8z0x2CASk
         9gvfahTH8t+zsivcrREBshWk/QZhFbE7BZCEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJuutPWSYZAO28hQHvByxbn0puUm3ID8Bjg9Q7zuB7I=;
        b=FD6+aYGAoNcdvKgYGNhu093/53lqpRyv0Nd0lC/QFZ/HMmZN4XOm7XsTeIPJSF6q6a
         aVMa8abomaJDsPn00BO0SNYWybEZ+sa0EA6xTpll/eVBizf+1tUJ2PeFON6HYSqa2LA1
         Zo7EsU7/ga/pXJ9OwuuOdd0sfDpptNLHgFNDD6WuleDVPMYlFp9UZmAC/HMdSMmJfgCQ
         +jvq+65UjncfpDz6w9TrdGmxVhUsexwUoX1hTzIzHWt3fIYc7o4NSxqe9cuhfKGeFast
         vCd4io9jj0hAHfOXmPfqKM+UoeL3J/muWiKDb/HeFnoxdgD/Bdkaef6dozqKvEdo7sHR
         gLcw==
X-Gm-Message-State: AOAM533tkFH8ZcDoqzNcLoZ9RGejBr1PdbmWqbfP3jk1CVk0V/y9FXEd
        32FQ4zAtT3Ccst/qR2v2u05II2o6ZCdMBPVkgCY=
X-Google-Smtp-Source: ABdhPJxlXMLLdn72u71hp/PqNVkvxZeVT04/cLpqvway+mxqT+thSozVVCebxD5BCKvPl0m1TBVjHyy5U+KsEdKwvf4=
X-Received: by 2002:ae9:e105:: with SMTP id g5mr28234682qkm.55.1621823699912;
 Sun, 23 May 2021 19:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com> <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
 <20210520033140.GA3656@aspeedtech.com> <20210521020033.GB19153@taoren-ubuntu-R90MNF91>
 <20210524015310.GA2591@aspeedtech.com>
In-Reply-To: <20210524015310.GA2591@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 24 May 2021 02:34:47 +0000
Message-ID: <CACPK8Xd5HTNAR8MpQPWGp+-t9ixz2r3JYDjr6jUS+9ExyB94zg@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Tao Ren <rentao.bupt@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        Steven Lee <steven_lee@aspeedtech.com>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 24 May 2021 at 01:53, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> The 05/21/2021 02:00, Tao Ren wrote:
> > Hi Jamin,
> >
> > On Thu, May 20, 2021 at 11:31:41AM +0800, Jamin Lin wrote:
> > > The 05/19/2021 22:59, Joel Stanley wrote:
> > > > On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> > > > >
> > > > > The register definition between AST2600 A2 and A3 is different.
> > > > > This patch avoid new registers definition of AST2600 to use
> > > > > this driver. We will submit the path for the new registers
> > > > > definition of AST2600.
> > > >
> > > > The AST2600 v9 datasheet says that bit 2 selects between old and new
> > > > register sets, and that the old register set is the default.
> > > >
> > > > Has the default changed for the A3?, and the datasheet is incorrect?
> > > >
> > > > Does the A3 still support the old register set?
> > > >
> > > We suggest user to use the new i2c driver for AST2600 and we will sumbit
> > > it. This driver is used to AST2500 and AST2400 SOCs. Change this
> > > driver to check global register of i2c to avoid user build the wrong driver.
> >
> > If I understand correctly, the answer implies old register set is still
> > supported in A3 although aspeed suggest people using the new driver/mode?
> >
> > Can you please share more context behind the suggestion? Such as new
> > register mode has better performance? Or some known issues that were
> > deteted in old mode are fixed in new register mode?
> >
> Yes, AST2600 A1, A2 and A3 support both old and new register set. The difference
> between old and new register set are the register address and supported registers.
> User can choose to use both old and new register set. However, ASPEED would like to
> change new register set by default for AST2600.

We can certainly make the driver for the new register set the default
for AST2600 when the new driver is merged.

I disagree that we should introduce a run time check to fail to probe
the old driver. Please do not merge this patch.

Please focus your effort on getting the new driver merged instead.

Cheers,

Joel

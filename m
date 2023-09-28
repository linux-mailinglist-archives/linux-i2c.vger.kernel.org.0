Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB8C17B26E9
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 22:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbjI1U4I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 16:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjI1U4H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 16:56:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8704D19D
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 13:56:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6225BC433C8;
        Thu, 28 Sep 2023 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695934566;
        bh=Ssl64U3szMDZnlDAWwkbSz7vum0ZazFciuUMkTMfuiw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=furece/PNJPM08kfecLhZ0a1P2Iil91XMzte9vP/YjJoICW6YQfDvpChVYgFN2IuQ
         ia89YAMqMfOF4LvEjt3pBWAZUivPO98jg4Bd6HrPk7NwhzDGJZLv16F5I2OTIPwoI6
         MExO8rH/LtOFDdqNNzHAHTxAClxzXDL04TMQxHo6yyeFx9t+ODI7yxKBwyZFid2rSW
         WJFjMvr5BVj1HPMxaaZl5tQ91Z5NPu0nXZdTwqGyxwgkPAhrNdA48ISRcOnh3W9VKT
         e8be5lRfotNSzsTsgarewUrwidMrtEXPVz3skOIq9gU70Tt9gxNk7HC5pa+VhhTe5X
         dH6/5H7OU/Ivg==
Date:   Thu, 28 Sep 2023 22:56:01 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20230928205601.kxiycglur6i2qbqw@zenone.zhora.eu>
References: <20230928101655.47d3dd2a@endymion.delvare>
 <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
 <CAKwvOdkw-13grHe6NXrPpyxtH1VxHshVo3rY31iY=V8kk93fMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkw-13grHe6NXrPpyxtH1VxHshVo3rY31iY=V8kk93fMg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Nick,

> > > The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> > > written at a time when the i2c core did not support muxing. They are
> > > essentially board-specific hacks. If we had to add support for these
> > > boards today, we would implement it in a completely different way.
> > >
> > > These Tyan server boards are 18 years old by now, so I very much doubt
> > > any of these is still running today. So let's just drop this clumsy
> > > code. If anyone really still needs this support and complains, I'll
> > > rewrite it in a proper way on top of i2c-mux.
> > >
> > > This also fixes the following warnings:
> > > drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
> > > drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?
> > >
> > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Cc: Andi Shyti <andi.shyti@kernel.org>
> >
> > I think I commented here that I had double thoughts on this. I
> 
> Please consider using an explicit NACK if you feel strongly.  My
> reading of your comment was that you did not feel strongly.

I'm not strong...

> > said that on one hand I like the cleanup, but on the other what's
> > wrong keeping them here?
> 
> We can always resurrect the driver if someone complains, which I
> believe there's prior art for.  Nothing is ever truly dead with git.
> "That is not dead which can eternal lie, and with strange aeons even
> death may die" or something.
> 
> >
> > Maybe someone is still using these devices.
> >
> > BTW, do you really have them?
> 
> I think Wolfram wrote the drivers.  If he's the sole author and stuck
> with maintaining these, I can totally see a maintainer saying "it's
> time to put this old dog down."

... for this reason. The maintainer/author of the driver might
feel this being a bit of a heavy burden to carry around.

I personally prefer the drivers to stay, but I'm not going to
nack this patch and I'm not going to ack it either. In any case
I'm not blocking it.

Thanks,
Andi

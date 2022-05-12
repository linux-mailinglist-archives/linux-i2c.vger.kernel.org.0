Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE7B5251F0
	for <lists+linux-i2c@lfdr.de>; Thu, 12 May 2022 18:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356212AbiELQFF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 May 2022 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348811AbiELQFA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 May 2022 12:05:00 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777EE62A10
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 09:04:58 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q23so7922029wra.1
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QbECvT15E4W7/wFT2xYXuo6yIOKSonMrztm7bwUstF8=;
        b=y7TbWI505OM9r4QfmR1oa5OPuJvJCNXquu4pD895WX47HdmQJ8IL2M/cW7jnJ3jBnq
         P4Vck7ywqn770X1j/baz1uFJOP8Wr6kYUS/wb+Gv3ob2EOUQIpeawZ6oq+qHqmpObCoH
         hHTTJPKw6l8dyZyBkdSbxMrfLOG6MoJgSBqN4sR8hTtWuAKZnTCwQ+iWd2nHFF6G6JFw
         451wpxPzihUEiS+TzfEWI/OuYHh56S7h+DceZWt5Z9qd4SOLQpBsTjSdR1/SzWQU1V2t
         rPcgblASh/QjGx5unRKwLgOfforgTLvvC0BDqZgo4XIOTlsPPWF85MmnLs8WRhAYw+iG
         M1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QbECvT15E4W7/wFT2xYXuo6yIOKSonMrztm7bwUstF8=;
        b=KXKeLnzbXd/xGjpx48c7CK9C+cgcRB499/S89yvMdWVZwvLhvJ1GTRqgqxUy8nC2Ok
         jLxWUQZkIz7T73w5mJgsaVrDiKDaLq/gyXwXub8BYgIUODMkIFAYrSD/kPrjaesGraR/
         gP9Ecs0UGQhn+M1qEKaDFtOloqZz3tJYnbh9b0PKH6Z5mrc5/zqoBMfbjXaI57NxgICb
         1sUHdSh2xHKvr11ZARE72QeKcXAR+Y/c6HqAmHjN73Z79WqladnvfLi9JZ2RLOTAk5IK
         YWxzNuxGZ9eL7TtSjtfLA9eyWlta19MmXabNhE98ZbsK48Vh2wS1IXdBzCN5LVC8NTLf
         4jSQ==
X-Gm-Message-State: AOAM530P/R0J3rkNyMQTqB0gA7aH2VXrbY4ioVuuMa/OP/8bhN41ynwO
        PonBzaBFAZpfE4labUo4+AUIXA==
X-Google-Smtp-Source: ABdhPJy7zRqEJRjSEEuUjB7/oBw3OPRyfUzDhJc1bOY5V5/KbwB+hySji3cZvBHbaUBiOzIvC5igeA==
X-Received: by 2002:adf:e891:0:b0:20a:d653:7cd2 with SMTP id d17-20020adfe891000000b0020ad6537cd2mr314620wrm.195.1652371496851;
        Thu, 12 May 2022 09:04:56 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id i3-20020adff303000000b0020c5253d923sm4135881wro.111.2022.05.12.09.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 09:04:55 -0700 (PDT)
Date:   Thu, 12 May 2022 17:04:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v5 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <Yn0wJba+u2C3LSw2@google.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
 <eff9907f-e92b-9115-bea7-b1093d1dc28e@redhat.com>
 <CAHp75Vcnq=Ou6QNyPjwC+HR9wJ2BheonTqmkGvQU0qFtHO2BDw@mail.gmail.com>
 <YnzaxiNBU1awfLoG@google.com>
 <Ynzfl9u4v6/JjwLM@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ynzfl9u4v6/JjwLM@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 12 May 2022, Andy Shevchenko wrote:

> On Thu, May 12, 2022 at 11:00:38AM +0100, Lee Jones wrote:
> > On Wed, 11 May 2022, Andy Shevchenko wrote:
> > > On Wed, May 11, 2022 at 6:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > > On 5/10/22 17:14, Andy Shevchenko wrote:
> 
> ...
> 
> > > > I must admit I have lost track of all the Ack-s / Reviewed-by-s a bit.
> > > >
> > > > So from the above I take it that the Ack-s resp. Reviewed-by-s on the
> > > > other non drivers/platform/x86 bits also signal an Ack to merge the entire
> > > > series through the pdx86 tree?
> > > >
> > > > Lee, any chance you can take a look at patches 3-5 and give your Ack
> > > > for merging these through the pdx86 tree together with the rest?
> > > 
> > > Actually I misinterpreted Lee's different tags again. Acked-by is
> > > normal for routing MFD code via other subsystems, while
> > > Acked-for-MFD-by is for Lee (scripts?) to route the code via MFD tree.
> > > Lee, is it the correct interpretation now?
> > 
> > Yes, that is correct.
> 
> Thanks for clarification. I'm learning hard way :-)
> 
> > I just replied to your 0th patch (before I saw this, sorry).
> 
> Thanks for the tag.
> 
> So, it seems we all set to route this via MFD then. Do you think we can go?
> Or do need to postpone this to be after v5.19-rc1?

I think Hans is correct.

I would like to see this soak before submitting directly to Mainline.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

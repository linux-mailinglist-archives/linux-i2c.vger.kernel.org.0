Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08D23BB993
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 10:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhGEIsh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 04:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhGEIsg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 04:48:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546F9C061574;
        Mon,  5 Jul 2021 01:46:00 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h6so8745976plf.11;
        Mon, 05 Jul 2021 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6tzBQn21ISHfDplCImGeslYtqyN4YOQPVRToQhASUVY=;
        b=lsyuPfdJN1JWMUyysgrmTUfLuyr+r0n/yyXQm8uXA8jGs2fsp5d4/xg38840DuDWnP
         dNwFse8mYFi+94lzCONUh+VbsDypmP81Gh2xIx/jklcTzT0DJbocwiXiasCTWRv9h3Fs
         Qsu0ukBiK1gHvejWCW+J4KessUsdPdovGVfQSfGAW6fuAAl5ooVWYkpdMxDhNsAPl64E
         y3O0fJcB2t51hSu5/KJNeVRB7lEkDoV2AxlnEioAB4vJDsJ4d60MXfUfvtrsOIubi6tB
         0H2WFtDCmj/EQs/tc0f96x0/ZANR04KZEdWJCJdFipN2zFC98IzkhaGHGG02AbZ1Sqbm
         72WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6tzBQn21ISHfDplCImGeslYtqyN4YOQPVRToQhASUVY=;
        b=tos8wZw2+VvmdBCAvRikdl6bHecolUVIdIub4neJLORwH/lVxMyDzZRxplf1vv/UCJ
         JdWetHzEj+LnX5OXp8EET7MCq2ccgr7hIpc15lk6OwQM1CO39rezSv8xsBM6+ENqPD7q
         fGzHaUNofPXoxkwidLC/bePGKSPC7hsffumBFJmNBaGz2GE8g2zBxtQ/qFYAIW9nqghX
         Qko7s4mEKgdbqzWNF7YEXs9ZxWKVjJIkttrDOWlywFP2wJoGPmpOjU+D//1ortOVMHlr
         ICix8iuhuKfMC5sGg2ObBZtG/gK/Hci6ff3mRk8WZ8RyxGrq9StmfO8x0RNNFvEQEmy8
         Hmdw==
X-Gm-Message-State: AOAM5304LYofAsvsaGzTVLrjAP3ZhLKWG/ADh44KNcusW4TY9td49RJt
        In2AdTWIpQ/G5MNdNh2IHhwr5hMTR3iaudVskf4=
X-Google-Smtp-Source: ABdhPJxaGRHGr1fnUoBJYB2DuDcGdLzBdN2BoqqbsjtiY+qO7FtCAXUoJSviJ2x8m0W3QCYd0ctKBmkOnhJEbg53W+A=
X-Received: by 2002:a17:902:fe0a:b029:11d:81c9:3adf with SMTP id
 g10-20020a170902fe0ab029011d81c93adfmr11680070plj.0.1625474759804; Mon, 05
 Jul 2021 01:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <8908f35a741e25a630d521e1012494e67d31ea64.1625466616.git.jie.deng@intel.com>
 <20210705080245.yabjlrgje5l7vndt@vireshk-i7>
In-Reply-To: <20210705080245.yabjlrgje5l7vndt@vireshk-i7>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Jul 2021 11:45:23 +0300
Message-ID: <CAHp75Vf0_8+KW_cp2g0V1miMx1cegBdjLzBjTbtpmcmdCHQJxA@mail.gmail.com>
Subject: Re: [PATCH v13] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 5, 2021 at 11:03 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 05-07-21, 14:53, Jie Deng wrote:

> > +#include <linux/types.h>
> > +#include <linux/const.h>
>
> Both of these need to be the uapi headers as Andy said earlier

They are already since this header _is_ UAPI, what you are suggesting
is gonna not work, although it's correct for in-kernel users of UAPI
headers.

>  and they better
> be in alphabetical order.

I prefer that as well.

> #include <uapi/linux/const.h>
> #include <uapi/linux/types.h>

-- 
With Best Regards,
Andy Shevchenko

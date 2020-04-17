Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B23E1AE6F2
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Apr 2020 22:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgDQUqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Apr 2020 16:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgDQUqp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Apr 2020 16:46:45 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2278C061A0C;
        Fri, 17 Apr 2020 13:46:45 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id i19so3787821ioh.12;
        Fri, 17 Apr 2020 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3scn4y13wLoI5WBhFj1I+bDIPfOwf4pzORC604k1TDE=;
        b=jeMFdopTigupSSjS8K2W+HV8kQ3jE5BQ7stWCfadkHtwQ+ftyF9mA9nOS6FvIpeqNy
         byvQuWo8ldodVtqPAPenCEOtcrRKGvgwPI8HdKv6EFFniAqSEE40HexTG6XKTjRNpnaB
         +kPS6Wt/bDSJ+V7TWej75KQkRgln9LstZD/TUefAhw/o3xki+So697rlq81RUTIjQTBJ
         i3q4z/AP2V1xtJi7I5Rj6OjsciIswpg4hmsJuweobDG+Ttj37iqhVVnyBgSPcDHQWrI3
         MYyyCtrzVQifrApPQ+mjhNO2fjh72WtqODUcUUWEW6OYfvyU8OdCftcfyuo3BN4efTpo
         2ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3scn4y13wLoI5WBhFj1I+bDIPfOwf4pzORC604k1TDE=;
        b=Zp+4RLMmII5oKe5FLS0hwNyfiZfo4b7iulObu4cm7CAiv0gYxDfxvqJ0KyAfDCm133
         IkNyH00xeRidE/8UFX8WQGrnMsY4sPrukPEGyT8Kn8fsj7IhauJoXvfOz9eAhG4b4zFx
         ZAwmHco/+zXP/fcjdDmpNWSawRrXQcZUCEzBc6zPNsFPLo6Gqo00ZzJLnnzG2LupBVaj
         Opjn/sgjBn37Ep39M/SjJXN3k0JTfgGhxG6KnuISfP+0z09GAV/YpYmQMlc17G+mKDBi
         j8k0cOGLu3rZ7jjAmZKw9Np6dh5mPB0GAssBFLTnzx0d5QcB3xLT2nMXg5pQigjJFS1x
         3PaA==
X-Gm-Message-State: AGi0PubYLCkASKnSIVaMAeRwmWxOTpix6uYHP3o6vLi/hiEFJ/xFEv34
        SNDDWDJ3Z7UXFKD+zniPd7f0fhOnZ/7TuT5Gbhc=
X-Google-Smtp-Source: APiQypLC+N7N97fj9Ci4zOMWgwKnzAsuUQ9JPl5hGP1lQ66/AfoCY+xM0mLNf9qTMqQ0EAiw2Bgx/MWSINKtQSWGOts=
X-Received: by 2002:a02:211a:: with SMTP id e26mr5115830jaa.141.1587156405199;
 Fri, 17 Apr 2020 13:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200414134827.18674-1-zhengdejin5@gmail.com> <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5>
In-Reply-To: <20200415160757.GC17519@nuc8i5>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 23:46:33 +0300
Message-ID: <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Alain Volmat <alain.volmat@st.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 16, 2020 at 3:19 AM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> On Wed, Apr 15, 2020 at 12:21:58PM +0200, Wolfram Sang wrote:
> > On Tue, Apr 14, 2020 at 09:48:27PM +0800, Dejin Zheng wrote:
> > > use devm_platform_get_and_ioremap_resource() to simplify code, which
> > > contains platform_get_resource() and devm_ioremap_resource(), it also
> > > get the resource for use by the following code.
> > >
> > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> >
> > Applied to for-next, because it seems 'the new way' but...
> >
> > > -   r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > -   id->membase = devm_ioremap_resource(&pdev->dev, r_mem);
> > > +   id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
> >
> > ... guys, do you really think this one line reduction improves
> > readability? Oh well...
> >
> Wolfram, Thank you for accepting it. From my personal point of view,
> as long as the direction is correct, even small improvements are
> worth doing. Thanks again for your tolerance.

Do you have plans to move on from janitor work to something serious?

-- 
With Best Regards,
Andy Shevchenko

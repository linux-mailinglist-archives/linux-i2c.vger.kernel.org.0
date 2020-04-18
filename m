Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000A71AE9BA
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 06:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgDREHA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 00:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725747AbgDREHA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Apr 2020 00:07:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA5EC061A0C;
        Fri, 17 Apr 2020 21:06:59 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id z6so1712046plk.10;
        Fri, 17 Apr 2020 21:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=eH90KozuksShDLEA3UFs+8T8NeL3+L+gABGBzpWbZmo=;
        b=CGR92FnGZ4icoBWX8hfN+/b0UlO1ETKueJ2FFj79/OgReXHdyZWQRzuA7fLFZP4wjA
         y0bFX1tU7yThL+JSN6SKAmCbjz6oNAAvfEBTa5s6hZNVf8REkcHM9C/cnctYmeKI65sH
         J4VI1Qn8gd2JEpy91B6Y/f9gLQCn7tbKl5+axa8qw3PCl81jx2LOnjylPnO4uESXBq3y
         HqfHKSR6FtZiOlvWbhGhfUhpvBeK24/2kcszXi60AeCxskD+jIy2z8FOsrn5/pD9Tzit
         VHwkvQMwG035b5bOEsKb5ZtY9t8NLEpzPjWXyPWkx5u0xXGfmSqfIpUkzEHTu5WyoCwj
         MnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=eH90KozuksShDLEA3UFs+8T8NeL3+L+gABGBzpWbZmo=;
        b=E0JRFrTHPXT3PyEktJ6l0j75er4T0liMIidbVCWchIxu7mVgiRRR+1ZG/2JyIHe07t
         k2yCKWeNlHLFuSlHZYD5WipJBpvEEiIalT7H13xADofM5FCDAIvDypVJkXwVzRmaT6Pp
         6Xjl9HCig9TiBTeds4OHj5TTJErqncjY799nGe7ahVbVSHcPohtqlrzNdotUWsjR71r+
         I98SJUnHE1XprAbt8VxMPPHoACyt36+b7Wt0rGbxbGaOWF+iZX6Wj76kKgDX24ju79n2
         paIkLMnkOpHoVdl7XZhZ8qfcXV9sPEpsX3zwF8ERLZro9+9Gg3p3VTpBLkByvbzy/zLa
         mgsg==
X-Gm-Message-State: AGi0PuYlYTC6R4xd8jt49jn7FeB8c3TaxsFiS5fOBOtSCA6iJKlo9S5L
        pPtEwzOJ9TweqBTsdUW+3gv7dYp7
X-Google-Smtp-Source: APiQypKSBYrQRjdu2X1NmLdY3oJtKp1sd0lQ5J4NxA8PeOi1ghfo8fO35p13uhjCnrefQji+o08Wcg==
X-Received: by 2002:a17:90a:24ea:: with SMTP id i97mr8149595pje.189.1587182819249;
        Fri, 17 Apr 2020 21:06:59 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 13sm5903448pfv.95.2020.04.17.21.06.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 21:06:58 -0700 (PDT)
Date:   Sat, 18 Apr 2020 12:06:53 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Alain Volmat <alain.volmat@st.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200418040653.GA7120@nuc8i5>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
 <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5>
 <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 17, 2020 at 11:46:33PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 16, 2020 at 3:19 AM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> >
> > On Wed, Apr 15, 2020 at 12:21:58PM +0200, Wolfram Sang wrote:
> > > On Tue, Apr 14, 2020 at 09:48:27PM +0800, Dejin Zheng wrote:
> > > > use devm_platform_get_and_ioremap_resource() to simplify code, which
> > > > contains platform_get_resource() and devm_ioremap_resource(), it also
> > > > get the resource for use by the following code.
> > > >
> > > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > >
> > > Applied to for-next, because it seems 'the new way' but...
> > >
> > > > -   r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > -   id->membase = devm_ioremap_resource(&pdev->dev, r_mem);
> > > > +   id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
> > >
> > > ... guys, do you really think this one line reduction improves
> > > readability? Oh well...
> > >
> > Wolfram, Thank you for accepting it. From my personal point of view,
> > as long as the direction is correct, even small improvements are
> > worth doing. Thanks again for your tolerance.
> 
> Do you have plans to move on from janitor work to something serious?
>
Andy, I want to do��but I don��t know where to start, Could you give me
some suggestions? Thanks very much!

BR,
Dejin
> -- 
> With Best Regards,
> Andy Shevchenko

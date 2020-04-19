Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873DF1AFC0D
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Apr 2020 18:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgDSQgE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Apr 2020 12:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgDSQgD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Apr 2020 12:36:03 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF059C061A0C
        for <linux-i2c@vger.kernel.org>; Sun, 19 Apr 2020 09:36:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y25so3744187pfn.5
        for <linux-i2c@vger.kernel.org>; Sun, 19 Apr 2020 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=i7GqUrKLFwo10/MfIRdFmE2O5BZFp4XagJUV0R44w8I=;
        b=ZA/UxaupKjXFf/E93WbtKjBRuPERYlUkwBSJi4GbCyaDg+xnKnAIn9M4WUdiK60CTx
         RwPGjK7jv2YRljCbu4ouoDRHwPRBbPSFtUnUzSpgtudSzysSP5M13ChXF5snnTU5CnUE
         c/t3/Mmoyra90/ojaIu5NXluOUdy8wjYkkZMbqYrymOct+p3auJ43tWKH+iuvOyOs9on
         34NJaLIbFoo7swniwSd7XAW7hhPaVPQoCBjrYwi4LRS9dwzZ44/wHuCsp5dIiLTjXXN7
         Jmlx0ajxweNVZnLYm6heevhZL579U3ro2rvZGBDykvvVaI/COobPG6e7XuuROUOX5MIk
         ILTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=i7GqUrKLFwo10/MfIRdFmE2O5BZFp4XagJUV0R44w8I=;
        b=mzM1Ughy3z4mRUKnd48szknCjB/GWKxM/YILD973qffXTdP9gF0dUGmODVKYrO3sZf
         149cUBhaADhE+c8ZflCBbnlqwa/MeTJCj4VUhEw1wDde7309H+fUZ7ktlIfWcQ+V1pue
         pzNbFrgnp0GY9ZlhgG3UFvayQF73XKpEamQ+LpdUPo2K9oyPigbYabM9uSO/MPyJcsBj
         E9CsSDTPyU9O0NrQDvY5q3XwX14M/PcLhOq1LkAU6ls4VIKh/LM1SBjXfEXKhv4TNf2h
         YSQvm9mpscUNDjI8rK/vm3WUo7AkExqIFsizsDaPfyaJMmZLkas/Wgdx6dNllniAjK8F
         HiuQ==
X-Gm-Message-State: AGi0PuaUtqjBaF7WLiR2LcPkszeaZzLR7c5eOI4euSg7wieKrEmY9gI0
        9ENsE3m3Cy2rZm0f9x9EFhrXGUaL
X-Google-Smtp-Source: APiQypLxPH7kMsJY1e1rtZfSv23hsvtA3e5vQcPDhzEk0zHXOBpjysoAJgI5OO61UvFfYY8gs1Bbqg==
X-Received: by 2002:a63:7d19:: with SMTP id y25mr12203926pgc.78.1587314163245;
        Sun, 19 Apr 2020 09:36:03 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id b7sm1601803pft.147.2020.04.19.09.36.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 09:36:02 -0700 (PDT)
Date:   Mon, 20 Apr 2020 00:36:00 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200419163600.GA19772@nuc8i5>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
 <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5>
 <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
 <20200418040653.GA7120@nuc8i5>
 <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 18, 2020 at 04:00:03PM +0300, Andy Shevchenko wrote:
> On Sat, Apr 18, 2020 at 7:07 AM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> 
> Leave only you and i2c ML to avoid spamming people.
> 
> > > > Wolfram, Thank you for accepting it. From my personal point of view,
> > > > as long as the direction is correct, even small improvements are
> > > > worth doing. Thanks again for your tolerance.
> > >
> > > Do you have plans to move on from janitor work to something serious?
> > >
> > Andy, I want to do��but I don��t know where to start, Could you give me
> > some suggestions? Thanks very much!
> 
> I have been collecting some items on my Gist page [1], where anybody
> (depending on the skills) can find affordable tasks. Tell me if you
> need elaboration.
> 
> [1]: https://gist.github.com/andy-shev/a2cb1ee4767d6d2f5d20db53ecb9aabc
>
Andy, your Gist page is really very suitable for me, I think I should be
able to start with the following two cases:

5. Run `codespell` across drivers and subsystems
6. Fix ioremap(..., 0) [size = 0] across architectures, now some return NULL,
   some return address, some may even have leaks

If I have any related commits, I will CC with you. Thanks!

BR,
Dejin

> -- 
> With Best Regards,
> Andy Shevchenko

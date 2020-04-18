Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47EA51AF278
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 19:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgDRRFM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 13:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgDRRFM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Apr 2020 13:05:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556C9C061A0C
        for <linux-i2c@vger.kernel.org>; Sat, 18 Apr 2020 10:05:12 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g2so2254947plo.3
        for <linux-i2c@vger.kernel.org>; Sat, 18 Apr 2020 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=33pFNJsyrCMJQzdkfD1rVsaET/u8o1OThEpqEXab7iI=;
        b=TlN4s4VcwZdPvSWRyReIB5LCK+KBfcqmJHtCOGGaJKoqeYcR8dMbmO+gfq4pdNF0+N
         l19AyIXCyK/8EBl2e6BEpQSu9ZKfNozKFJA16hrvIwdCeDcj1a3nFVSP8xasar7A7Fgo
         NBFUHWRwDPy8pRsPxwZDwBOYAos5NEmUBwouHZZR6nZXmWe/3XJVJIfI8zoiWucKm+iq
         QunCcSmMGMGrMD1PQZ5X6K5PIaAD5y2nJKQ/X7CakblDm1C3rzgiycWSIfvId4E+8s4I
         93lXYaxnRRvWjfSZHktTu/Q+OsFRXUl4iDpmE0UU+mGlrbqljhZYvpD2BqonKgFf8pMh
         6+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=33pFNJsyrCMJQzdkfD1rVsaET/u8o1OThEpqEXab7iI=;
        b=MfFsUMES8Szzrl1tk8pvOmZkahJxjPyUVxmDj3+lntfqvVcP9iGPtiP7rryGVO+RvS
         jsNN2Xoelk4So03AF0mbADNtatgYqVhksdnAgjZzrvUppwWP4Dy9rMqUiSo/uzFw2f5o
         219Z3QlTTt960i8O++bKrBhUo6atUk+JwZ58yDmnb7FDvRVDrem1EVCSHCslNJmEYCAS
         t1raRkYfXvCE6Xr1XLNYI3crk79iD+v3I9zk/Co1bavaYG7UhR0RCRBY8JE4o/pZWEQZ
         D3Hyx8ej56DJ+tYmtyMMK5MT9Uc6IcVcO7csAx0qTMojQEFTSytEscATtJajPYmqxd0s
         JQbA==
X-Gm-Message-State: AGi0PuZdiGbRStmQoXnuGLy6BPtw9I1r7d02ZofMHas4dItqlzJgYiV6
        g4cnsZUqk5QMFlU+WM3ICEnMlwAS
X-Google-Smtp-Source: APiQypI63Ob/USEgfVkbUnigp0hkQIt12pwOIXEHw+KwnOv4j4/Y2TlHXKt3HzGoYqXt3G8Ckvt5og==
X-Received: by 2002:a17:902:8c88:: with SMTP id t8mr8884665plo.176.1587229511581;
        Sat, 18 Apr 2020 10:05:11 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id v26sm22537041pfn.51.2020.04.18.10.05.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Apr 2020 10:05:11 -0700 (PDT)
Date:   Sun, 19 Apr 2020 01:05:06 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200418170506.GA9959@nuc8i5>
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
Andy, thank you very much for your suggestion. I will study your Gist page
first. If there is something I don't understand, I will consult you again.
Thanks again for your help!

BR,
Dejin

> -- 
> With Best Regards,
> Andy Shevchenko

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AF91B05E5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 11:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgDTJrZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 05:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTJrY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 05:47:24 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC830C061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 20 Apr 2020 02:47:24 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g6so4773050pgs.9
        for <linux-i2c@vger.kernel.org>; Mon, 20 Apr 2020 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E2BfKAyHqCfZlJIEpzngPX34M32pPJ3/lkLU59hGNUs=;
        b=IdFEuQKydloZLob6bnfkVWNQQW1mbIfqMxiINUwfjGXG5nzkF0npRYSMgS9g0mfMRf
         gJr4SaoU/HNlR/PK3bH4i+Z4prPVTUpTyklRuWEothxSR1iMZy+KOnMlRj1CSGpkaFWW
         zHR2cY385/ndjLktQ9h3+8XUhI9FWeSnyJuA2RE4zmlgU82UabKHee9MdCBvieP5DXSZ
         MgzPuPipnVrMhOU26o8rHBRlqev8pz5xdYyjT74Y324yhxbiV6Vyfe0AAFEZA35cqM22
         HVPnXIrkBdD5bTz9ry6j4BseoS4Q7Yv4YAfSwdtUE+JQ49Mx5jhgUZzHU4G54zsRgidK
         oZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2BfKAyHqCfZlJIEpzngPX34M32pPJ3/lkLU59hGNUs=;
        b=PG4xpfex134oaVu5tefQ+xxZK+xflbw4tN2zd7Nvvzw1DmLV3KymHnwa6pqjWeoxk9
         qI7TkoQjzAzY5H5PfYZcC0TAPkOmqCxzOF+CZHHiRQMHDQ4H/UHtZkhfS2EBeIevVM9e
         Oj3E9zA64JUZBzgO85IHeXQCNm/pdHTyrGocvv2wo6FXjxlIz78Ws39nKCWwP12Y8/Rc
         e2M+3mEjfXb41psb+OOhMTe3cfCjriIcn1O1+PxKZwLmBStVGvxgDsQ/L7TOKwlO+0T8
         /z7QTCjgMn8AqKJbywEHcSUy0fohhyEipPJwyXxq3yyUL1iKbByROpxcrasESDfZvEzz
         bK7g==
X-Gm-Message-State: AGi0Pua1ypTBCSs+PNwWAQdXQRS8N6QlL6kWfZWiuEMTZDGw4qgDMb5Q
        Ymx+LwoBgcMaAYF1zcmAnbBtkhdzD83MZL/p90Y=
X-Google-Smtp-Source: APiQypL3qOpKM/c6DvU4sXCKQM96F6gLaOQhr+h3pclfKPlhWch9eEobJFAOeItJVE9JYACSygKNTgEYb5ZaFW8oIOQ=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr16496917pgb.203.1587376044266;
 Mon, 20 Apr 2020 02:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200414134827.18674-1-zhengdejin5@gmail.com> <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5> <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
 <20200418040653.GA7120@nuc8i5> <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
 <20200419163600.GA19772@nuc8i5> <20200420094319.GA2094@ninjato>
In-Reply-To: <20200420094319.GA2094@ninjato>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Apr 2020 12:47:12 +0300
Message-ID: <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
To:     Wolfram Sang <wsa@the-dreams.de>, kbuild test robot <lkp@intel.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>, lkp@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 20, 2020 at 12:43 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > 5. Run `codespell` across drivers and subsystems
>
> I think Colin King is already working on that. I regularly get patches
> from him doing that.
>

I think CI should integrate it in their workflow,

LKP guys, what do you think?

> > 6. Fix ioremap(..., 0) [size = 0] across architectures, now some return NULL,
> >    some return address, some may even have leaks
>
> This sounds more useful to me. Would be great if you have interest.

But it much more advanced :-) Complete dive into the kernel guts.


-- 
With Best Regards,
Andy Shevchenko

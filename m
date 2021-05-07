Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EEB376824
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 17:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbhEGPiP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 11:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhEGPiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 11:38:13 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D10C061574;
        Fri,  7 May 2021 08:37:13 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b21so780108pft.10;
        Fri, 07 May 2021 08:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=arEMVevpyfNHH/qKMg3yLIl1/YDAxyNNmu5V8KzMUSk=;
        b=GWEq3bdFqNNhtl5fHbSPpJ7yFRro9yFokHjw4eJm4xLLJazOMoKDaraWO1ULYGc0m7
         GjM80DiZd0zibt2JnV9oOudaFUhpl/Qs1vbzyzShMcBBn9N+AjzT4Yr+PmpmhaM4kwvF
         UHlPujwPbbQhCMHspQlGKDKAna0MuFJ4Zgqo7gaOxdo02ulwh02ojHGoeQqZBAb9rtUc
         q0sFvqD8Gn40aegbJJKFgliebJPJg0n6w8SRV6+B8bFN9Row/4f5uLhCKGy3aGg4OpmA
         wo59/4o1iPvfDpx6Q0POE9t56dGdgB4LDSW9xkknfPBEBha3CKrpADZW9SL087XOwrE8
         f/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=arEMVevpyfNHH/qKMg3yLIl1/YDAxyNNmu5V8KzMUSk=;
        b=D3MVHkkH6hf6Ls4NVgmfHgNKgVz2IGHnjTv7FG/bicmTWuQTIQjiuAYm0GkMSwBoMG
         6Us66x8BbdCMevJsiK851Tx6IhpoMtrwFkzu7Boaz6pPef2h3esrrPIQypEu0Qtgwx8w
         SSbqRywl1/kOctXz+Vb05HuFOC3hDqKyS9Wy1xbtS+JUUvWvRMm1AhXEombp7ltiQOQe
         FPNe+2w0DNnvaFnb9u4G6XWOPjZbLM+RfcwkSy6RLbhSgH/xMU+zrPlFPnKne3BrbO3P
         zZoVkGZeAdI6zHkfh/IyZku40ITnBmEdxJG7ohDuultlmyBGtEQBY8nLp7vOoffEn8ex
         WwiA==
X-Gm-Message-State: AOAM531Op7XgJDE0oEYgufajln2ex4n7Gumybh1p01Hd6SzuFRGeZflS
        RXlwbzsT8KKB0ZrcjdwWR90oDBok+goWVXcsU7l8dfve4kCEug==
X-Google-Smtp-Source: ABdhPJymffkPy/9Ej0f2meeRjcH9XIOQPO6hDH33U8Em3hMH2tQpFpejULIgrr6AUmXOnMKVfWzierHL1k3xkQJY2ss=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr10872897pff.73.1620401832435; Fri, 07
 May 2021 08:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-4-chris.packham@alliedtelesis.co.nz> <CAHp75VcEzgKjOD6WQ1=YAwK_hhZr=XtcmXZL8rK78gb7iXDbDg@mail.gmail.com>
 <c4fa78e8f2c43da240c932618b87b34ba2d1d046.camel@infinera.com>
In-Reply-To: <c4fa78e8f2c43da240c932618b87b34ba2d1d046.camel@infinera.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 7 May 2021 18:36:56 +0300
Message-ID: <CAHp75Vcu-k=uzY_JYhtMp=Oe7fph3jH=t41pStUGc+bpSZeA3w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: mpc: implement erratum A-004447 workaround
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "chris.packham@alliedtelesis.co.nz" 
        <chris.packham@alliedtelesis.co.nz>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 7, 2021 at 5:52 PM Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> On Fri, 2021-05-07 at 14:46 +0300, Andy Shevchenko wrote:
> > On Fri, May 7, 2021 at 3:40 AM Chris Packham
> > <chris.packham@alliedtelesis.co.nz> wrote:

...

> > So, now you may shrink it even further, i.e.
> >
> >        void __iomem *sr = i2c->base + MPC_I2C_SR;
> >        u8 val;
> >
> >        return readb_poll_timeout(sr, val, val & mask, 0, 100);
> >
>
> val looks uninitialised before use?

Nope.

Thinking about naming, perhaps

        void __iomem *addr = i2c->base + MPC_I2C_SR;
        u8 sr; // or leave as val?

        return readb_poll_timeout(addr, sr, sr & mask, 0, 100);

would be more clear.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F752689B6
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 13:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgINLCf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 07:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgINLBs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 07:01:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E595C06174A;
        Mon, 14 Sep 2020 04:01:48 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id v14so3856718pjd.4;
        Mon, 14 Sep 2020 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jAtN1p3ltYADxwt+uBfRSV8WaCZJNxIi3XR1HeuEaYs=;
        b=BAsOQEaMABVPyrLpODmuwwgpTUFqINU5vPnTue6tm6EK2ugt0+P56UpgmgK7l7biR0
         1LgmMkIpGrT3HFyyI/Q/iQARsiUF0sTZs0YkMkJEVw9asiVGOc84Qkbrmfq7U08nrB3T
         wD297k+/dFCIK2IlVHTXOqzQFZ2/RlzNPwZRYMxt/tYyWuStR0/xFsGNQ4yIFcTVH8Ud
         GwPugxElmOPhIsrrWlLBmSq/u5lBf52kw5uSnZ0z1BICeUyAzNXW92hBXesCwvgyYeFW
         HV3u3FXgWmQidSx0DLMVPnT/VgRJr5YBGl1BAumRhEQeEgZfP1ejJbS2jsYdPxjYIVTl
         VuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAtN1p3ltYADxwt+uBfRSV8WaCZJNxIi3XR1HeuEaYs=;
        b=n4prXeGTyKtugLzGwzoIP/OQaJ446MNaVnFkank1pfWYWaz9RmQqy+uSyelzXX/up1
         2p3KRC8cd7FNKIKARULPYppSC+wEbhR1DoIt5NsScXY8DGdYVIU0w2tJZcZE8jFbErGC
         StT7vJlm9R7CNNCatqJs1p2XSd6L0HxLvm/9YsIt5Ko4i4Ia6Bx4Jx5Pm7SJ3vVyE7wA
         ZHKZ9vGB1aFBczZ/bzpLU+c+sya/cZNFk10RVv2okSxpcEbcUGkKoAGCQPkP++fLvF9q
         0PIMtPVGalPJtJYl/F1r9V0hYmts29HY6ErANpLSLJ7CVYZ72wYQgeD8tjfUXAQnXEmL
         skVg==
X-Gm-Message-State: AOAM531iJesGxrN3ZvVtgP93I/knsaqKA5CED+P852kS/Esm5bm2RaO5
        sBfvI6Ekv2UyKPoYLVujjZ5h3ivP9kM43F1Kh8V2aKnWpXqKRjpD
X-Google-Smtp-Source: ABdhPJxqLPoNhi+MYQkiBVV7hd77BFNtY4sk5MkEniAvtRN1+bErFEVuF/CEuiaIDJxin/8R7Q11kkfmHizdsO4+dRs=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr13665121pjb.129.1600081308021;
 Mon, 14 Sep 2020 04:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato> <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
 <20200911194526.GB909@ninjato> <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
 <CAHp75VdtE_UBsNrSxbVPprmp7=-iVCrXv9x6Tu82b4q2ODfKQg@mail.gmail.com>
 <CAHp75Vf-1vqHjqNixXtnziCd6squwwj0sEArZ8C1YiDwafhk7Q@mail.gmail.com> <20200914204223.5a96f84d@canb.auug.org.au>
In-Reply-To: <20200914204223.5a96f84d@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 14:01:30 +0300
Message-ID: <CAHp75Ve-FkBAdc8NfQqVZ2ZMeAu6S7h11bJRPAdo2TjbHKFmeA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after reset
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Wolfram Sang <wsa@kernel.org>,
        Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 14, 2020 at 1:42 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Mon, 14 Sep 2020 11:51:04 +0300 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Sep 14, 2020 at 11:50 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Sep 14, 2020 at 12:27 AM Chris Packham
> > > <Chris.Packham@alliedtelesis.co.nz> wrote:
> > > > On 12/09/20 7:45 am, Wolfram Sang wrote:
> > >
> > > > I'm happy to route it to stable@ if you think it's worth it but I don't
> > > > think there's a specific Fixes: reference that can be used. The current
> > > > behavior appears to have been that way since before git (looks like we
> > > > noticed in 2014 but it's taken me 6 years to nag people into sending
> > > > their fixes upstream).
> > >
> > > JFYI: there is a history.git repository from History Group on
> > > kernel.org. You may dig till the very beginning of the kernel (yes,
> > > it's not properly formed Git history, but it will give you a hash
> > > commit as a reference.
> >
> > Stephen, btw, does your scripts that validate Fixes, take into
> > consideration references to history.git?
>
> I assuming you are referring to
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git

No.
I'm referring to
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

> I have found a few by hand in the past (I also missed a few), but I
> guess I could expend the checks.
>
> Maybe that tree could be put somewhere that appears more permanent if
> we are going to permanently refer to it? (Or has that happened already?)

See above. I assume that History Group is something bigger than just Thomas.

-- 
With Best Regards,
Andy Shevchenko

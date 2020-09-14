Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EEE268795
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 10:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgINIvY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 04:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgINIvV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 04:51:21 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F09BC06174A;
        Mon, 14 Sep 2020 01:51:21 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a9so5147966pjg.1;
        Mon, 14 Sep 2020 01:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lCYJOvBnmYQwjSsVW47kOt6RwIjtREyjTLgJLFKBKow=;
        b=Qd4HMQAcOI5GQbVfMeXt0PI72rUDwpQu+PrVBldm3vUjUxYAgE4Vc1juHXOXEQjnpC
         ph1qm1VmByNQmDTmyiaD5Z+0hZADB5DNqwXT+G2vn+odRSAOsrgQMdvZD6BoMokkW7Nq
         ltzITKDEfsrBIQdHXxrixsyT/pPcIXcOQL3ADcB/NomrlFYlcUcfi+KzyxXF0D0g1BeS
         v5/Q4Mk4SVHSfavh+ybjsuJq3R4DlpflHFLyPTW4kK2ihWJIlXnifOOUBh36V7G+f8Ue
         QixRB5/uHuBtorVpIS+DF4TEca7qHYRDWVfhdb9geV3K6vI0RjiBkQHeqZxFEp1R8cDG
         HX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lCYJOvBnmYQwjSsVW47kOt6RwIjtREyjTLgJLFKBKow=;
        b=d+nOgMtjSGzXzNedmZ84mk7AhbmcBOCqHiT7ZoOzvMhCSVV54HKYmJOFS1rL9Vp5L5
         deDE2GJQTs2jyT6+D30PyLX9alyQB3BBlaQi0v6iUwkoO0sDO6iI34xm4EdEfwIVCUWf
         3y8fZlOrKTve68yq1SoR0gP7Ybw8PH/eC//5J4bG+fu4V/yI3v9WYCD9bLYntT+WzKSv
         gqdooNt/TDAvETzDAlom1PIwmP9O6j7Rc+BsHpCHIZK1wDnXfphR25ds3iSCXj8khtad
         e65kXSF5iWk3YNMuuMB5JF6k9ZBLbvfHWgDfMuICUB5moEJfSkk3HCPKJ7os1mVCiNsi
         pYuA==
X-Gm-Message-State: AOAM532eQCXnxnpsYE3p+FTuTdXGJ80v5I0xHkXXEPHL4Y4VV8kPb8M5
        nK92HiG8wuJ5sHMHMpTbXiy30LTRwgrZJHybSqU=
X-Google-Smtp-Source: ABdhPJxX/OoYtokGwKj/MNnDohvbRGjeeiLArPWnKTtOLIMoZQYRL+4pu03zj/AMiRQRPX9M0UjzHuD4qAZ4nM0++8M=
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr12467343pjb.181.1600073480979;
 Mon, 14 Sep 2020 01:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato> <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
 <20200911194526.GB909@ninjato> <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
 <CAHp75VdtE_UBsNrSxbVPprmp7=-iVCrXv9x6Tu82b4q2ODfKQg@mail.gmail.com>
In-Reply-To: <CAHp75VdtE_UBsNrSxbVPprmp7=-iVCrXv9x6Tu82b4q2ODfKQg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 11:51:04 +0300
Message-ID: <CAHp75Vf-1vqHjqNixXtnziCd6squwwj0sEArZ8C1YiDwafhk7Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after reset
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 14, 2020 at 11:50 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 14, 2020 at 12:27 AM Chris Packham
> <Chris.Packham@alliedtelesis.co.nz> wrote:
> > On 12/09/20 7:45 am, Wolfram Sang wrote:
>
> > I'm happy to route it to stable@ if you think it's worth it but I don't
> > think there's a specific Fixes: reference that can be used. The current
> > behavior appears to have been that way since before git (looks like we
> > noticed in 2014 but it's taken me 6 years to nag people into sending
> > their fixes upstream).
>
> JFYI: there is a history.git repository from History Group on
> kernel.org. You may dig till the very beginning of the kernel (yes,
> it's not properly formed Git history, but it will give you a hash
> commit as a reference.

Stephen, btw, does your scripts that validate Fixes, take into
consideration references to history.git?

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC681EDFD5
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jun 2020 10:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgFDIcg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Jun 2020 04:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgFDIcg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Jun 2020 04:32:36 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4763C05BD1E;
        Thu,  4 Jun 2020 01:32:35 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id mb16so5142102ejb.4;
        Thu, 04 Jun 2020 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1AuRE0AuSz1Dcafc63dQERov0niyM7+8vmaBb8F6Fzc=;
        b=fGkqeUca0o35s+UryeUeoBdAohiaNg3kfMd+bxQWJyNHWhpzLy1Cr1ZcAjKHF8+WnL
         QA+DS5hlfW9VNepBJ+oGxqr+ac8FDcs1OIPBlQl52vV/mW34uykJiE5ZJT3mW7lhSYZL
         N4vom68WUkZGhqUpfeFd2DUOEWyFbBMFDByyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1AuRE0AuSz1Dcafc63dQERov0niyM7+8vmaBb8F6Fzc=;
        b=mvbqjNy8mfgcqtalAaC1wRCH3MLbEgpIp84sGm3Je0T30bDRDgVPh12wvlYcS+NR0j
         2PJhs2dMNupSX64R8vJ2z5CrsBP2EE3CbWNhTeuFOc1z8rKRA+EpGkD6RbB3yiEXRSm0
         CXlKOAU6phLt7gtFuPuUCkfvUdmBhlfrRslDMnHjsQSFDAuzRL+5bwm4If+HCqLceoB0
         sNSKz12unPFB+GTf6P/P/4PapGAZpl1BjcpcdzEtZP/DRzeZNUrX5BhA+aiS3OkXHUpO
         spB4WhKbaxB4b5sarhIgZWE75pEj61Y+GfcrR4wsmccdgsVdGK+U+vgjv381WKb02oO7
         8vDA==
X-Gm-Message-State: AOAM530uTY4ylxG64MbcG0MPHMfb9B74kqtibWCO5+6csS7vT+0r4A0s
        S0+mi1XjswQS6jYVSng1FKnxgPZW21mml+xY9ao=
X-Google-Smtp-Source: ABdhPJy5ctc5383qKNluaPDwm98VmrQIOXT9qbgA+PmD3daSJjnvtPCKWdZ3etbzj/j/2E6sMLG804CjxluMDKg+46Q=
X-Received: by 2002:a17:906:3603:: with SMTP id q3mr2981318ejb.477.1591259554440;
 Thu, 04 Jun 2020 01:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200527200820.47359-1-tali.perry1@gmail.com> <20200603202553.GB7684@kunai>
In-Reply-To: <20200603202553.GB7684@kunai>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 4 Jun 2020 08:32:22 +0000
Message-ID: <CACPK8Xe=66y+MkfogP4Gh6A9X7UDhOyAdUDwp=iqe7zitdxA8g@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] i2c: npcm7xx: add NPCM i2c controller driver
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Nancy Yuen <yuenn@google.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Brendan Higgins <brendanhiggins@google.com>, ofery@google.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kfting@nuvoton.com, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, kbuild test robot <lkp@intel.com>,
        andriy.shevchenko@linux.intel.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 3 Jun 2020 at 20:26, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Wed, May 27, 2020 at 11:08:17PM +0300, Tali Perry wrote:
> > This patch set adds i2c controller support
> > for the Nuvoton NPCM Baseboard Management Controller (BMC).
> >
> > NPCM7xx includes 16 I2C controllers. This driver operates the controller.
> > This module also includes a slave mode.
> >
> > ---
> > v14 -> v13:
> >       - Fix yaml example: add missing include.
> >       - Replace all udelay to usleep_range, except one which is called from
> >         irq.
> >       - Fix compilation error (module_platfrom_init conflict).
> >       - debugfs counters always updated. Counting till max value,
> >         then stop counting.
> >       - Rename bus-frequency to clock-frequency.
> >       - Remove unused variables.
>
> I don't have time for a deeper review, but from what I can tell this
> driver is good to go and we can fix things incrementally from now on.
>
> Applied to for-next (will go into 5.8), thanks!

Thanks Wolfram. I encourage this approach to working with patches, and
especially for our vendors who are trying to do the correct thing in
mainlining their code.

Congrats Tali on getting the driver in the tree. This has a been a long journey!

Cheers,

Joel

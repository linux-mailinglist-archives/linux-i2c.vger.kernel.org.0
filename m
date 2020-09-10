Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2EB26538A
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 23:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgIJVg5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 17:36:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730893AbgIJNft (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 09:35:49 -0400
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7D3820C09;
        Thu, 10 Sep 2020 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599744948;
        bh=V1wKpfnBNnmhv6G3q9IsWvZn9GlN18uZFdJxqnq2jxk=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=Iu/QQeP8BdkkjmC//fxdEnzC5MvdHm2RGo1WAcNBcr9EVzPC8+MLBZHSXIf7rWBF2
         6D9BONK2qf/U6VezTnMLux6qXZPOwqeNdD92RjA6BNJVqI/TkLyqvz2cckdmfoQW66
         Vq3lhpyM3TycBna9MohQUjs1xHctxsM4+qg8bjx8=
Received: by mail-ej1-f46.google.com with SMTP id i26so8707663ejb.12;
        Thu, 10 Sep 2020 06:35:47 -0700 (PDT)
X-Gm-Message-State: AOAM531UjY0Sa1EcdyjuLmI8tZcHa0SK6ZafU30/tzZksHhQ+8x8KRJY
        +iyhr2h7wZqKhdwleuhYs0eSY0aagglUl+wPI3Y=
X-Google-Smtp-Source: ABdhPJwINmV5bI33FlqWtuSmo9zSXfn21SyT8mGvBNJyprgovPHUzJONmLEebsWy015sjIsWUjJzxmOGWX+E8h1VP8s=
X-Received: by 2002:a17:906:82d1:: with SMTP id a17mr8613075ejy.385.1599744946434;
 Thu, 10 Sep 2020 06:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
 <20200910100607.GJ1031@ninjato> <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
In-Reply-To: <20200910122739.GA5093@gnbcxd0016.gnb.st.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 10 Sep 2020 15:35:34 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcx1tL93KJAvVT3rAgHX-r3bxri9GwHMSgDSAhALi2aFA@mail.gmail.com>
Message-ID: <CAJKOXPcx1tL93KJAvVT3rAgHX-r3bxri9GwHMSgDSAhALi2aFA@mail.gmail.com>
Subject: Re: [PATCH] i2c: stm32: do not display error when DMA is not requested
To:     Wolfram Sang <wsa@kernel.org>, pierre-yves.mordret@st.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        fabrice.gasnier@st.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Holger Assmann <h.assmann@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 10 Sep 2020 at 14:27, Alain Volmat <alain.volmat@st.com> wrote:
>
> On Thu, Sep 10, 2020 at 12:06:07PM +0200, Wolfram Sang wrote:
> > On Thu, Sep 10, 2020 at 11:32:29AM +0200, Alain Volmat wrote:
> > > DMA usage is optional for the I2C driver. check for the -ENODEV
> > > error in order to avoid displaying an error when no DMA
> > > has been requested.
> > >
> > > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> > > ---
> > > This patch should be applied on top of the patch [i2c: stm32: Simplify with dev_err_probe()]
> >
> > We can do it in this order, it just makes backporting to stable kernels
> > (if that is desired) a bit harder than a self-contained patch. I am fine
> > with both approaches, but just wanted to point it out.
>
> Indeed, that's a good point. I'll rework it then, to avoid the dependency
> on dev_err_probe change. If that is ok, I propose to push a two patches serie
> with both this fix (updated) followed by a rebased version of the
> dev_err_probe patch from Krzysztof for dev_err_probe change.

I can rebase mine on top of yours. Indeed such cleanups as mine should
be rather later in the queue.

Best regards,
Krzysztof

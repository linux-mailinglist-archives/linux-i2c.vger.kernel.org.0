Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A50494835
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 08:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238308AbiATHWt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 02:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238266AbiATHWq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 02:22:46 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCDDC06173F
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 23:22:46 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id e8so4463050plh.8
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 23:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ZRxwcVlpApYNja35uESlyHh+Aq0A/JBcPYglQHnpxW4=;
        b=hKAqSGG+nMmYSnqifUNG35XVscjwBWBm8zbL8UdAf7cOMNI4zeFluBknagzTUO+EN7
         cjpRTSKxvNZpfQ+e6ypqnlNTBDQi+LYMRHEN86A1VfKyvrxcUcgGhOYkmMy+KxjGX5W6
         agsqGGZTrUvo6YdDtWSaDObutt3aQxTzzIbSRPd4IFTTYKap3PL6BnhzAeMMtCPxTwOp
         SGwAEiFPCKoqLIHLV1JQa+KNHXw/i8JFIrjGkc5i22lyeo5xmviZzDZBK0QTnB4Iugeh
         NwDDG5fAyfxSq2bhCjtofAPFE9OsqIKi+H7Youho96WadoLWC9IWaAbFnHO6S0UrBLqG
         zkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ZRxwcVlpApYNja35uESlyHh+Aq0A/JBcPYglQHnpxW4=;
        b=nPNRSsw+Ojd3HE+Sm8cxI9wPy3iSM52b7nAodQSimu7S3BRuJF/wDhM0GkQJp39Z1H
         A2VVx5csNg5M7yfWJq8165JXbXfuq+D10IilhxVEl3IJS8ZF9lv8kz+JLxw43Ny0KzFH
         l1VWFZY4lmEqkhHb/vZ5CL3oG/uUdFru8nDcSbGmcq6h+cuQC3daSqzWtA4y4A35vz7H
         Nvs+nTM7dUKfqLsmPNZoWLSLfkFAwN9fGoDX8MCprGd+/+t2jTXR/GmUZ/jxsM+/r+FW
         c7bJasFDSj65JMa5lProrT9J6/EJu6iGCHzbh/rB+FWdXaE54BypX/1r5b2Pt75gerN4
         hCXA==
X-Gm-Message-State: AOAM531FWOHV1TzkFcAtcyok9GFCbMiJ8F8J+5D7dpGFQp8Al0j/4QXV
        pEvkOa+hrSKVqDIxP5Hamt7f5v7Mgua82jAxva+/Eg==
X-Google-Smtp-Source: ABdhPJzHuZU7pMvBOJ7wvcK2N+adNzki3KH18IGdHn9Y4cLIsBdVsayINev5TxA/m10DTJPgtlzfR/THz0V+8TIxs7I=
X-Received: by 2002:a17:902:c9d2:b0:14a:3335:accd with SMTP id
 q18-20020a170902c9d200b0014a3335accdmr36148352pld.94.1642663365804; Wed, 19
 Jan 2022 23:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
 <20220108185759.2086347-5-patrick.rudolph@9elements.com> <Yd6f8kQ59kcY7JH6@ninjato>
In-Reply-To: <Yd6f8kQ59kcY7JH6@ninjato>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Thu, 20 Jan 2022 08:22:34 +0100
Message-ID: <CALNFmy2H2hQX5iLQdJj1pd8_eN5Ohs14NcAhhcTeRssmuUZ3iw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] i2c: muxes: pca954x: Add regulator support
To:     Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,
I don't think that it's possible to use the generic vbus-supply.
In my case the complete chip, not only the bus, is powered by a regulator.
In addition it looks like this works only for platform drivers where
you can set the bus_regulator
before the i2c core probe function is invoked.

Regards,
Patrick Rudolph



On Wed, Jan 12, 2022 at 10:31 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Sat, Jan 08, 2022 at 07:57:58PM +0100, Patrick Rudolph wrote:
> > Add an optional vdd regulator and enable it when found for devices
> > that are powered off by default.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>
> regulator support was recently added to the I2C core but had to be
> reverted because of side effects [1]. I think you could make use of it
> if it gets readded?
>
> [1] a19f75de73c2 ("Revert "i2c: core: support bus regulator controlling in adapter"")
>

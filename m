Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EEE22E9BA
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 12:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgG0KE7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 06:04:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49443 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726763AbgG0KE7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 06:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595844298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Zd7gW2T0uFlHq9x6vMbNVLs/E/Qaml2tIBgYDjU4eu4=;
        b=iXiajYH5Qtlq16cxlgYwKxk9FS25z31uHYWxa73+eUKnC7ngHD4QI7Tkw7D5GZW3lKoodj
        k2BHqLMLgSw8hKt2En3RolVI79yib1LW/2qC4qj1KrX1IWAbEot+unIkkbsgR0YOSYV+Rz
        s0hoZdxbHwzKZOTeMbxXjuxEst37TRY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-NT31Pvv6NCCcCFI5jg5Wcg-1; Mon, 27 Jul 2020 06:04:56 -0400
X-MC-Unique: NT31Pvv6NCCcCFI5jg5Wcg-1
Received: by mail-qt1-f200.google.com with SMTP id q19so1593682qtp.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 03:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zd7gW2T0uFlHq9x6vMbNVLs/E/Qaml2tIBgYDjU4eu4=;
        b=cOQWPnbKSzA1bTqgt7l6HrpuILszVn6tcsLWa9CO+RA6bag73BHdxI4oNF1mhORocG
         snIkuEYLmxWW3oig1dn8/OqBU+bZFy3VqwJEK+SIaRrHU/+TuNjrMo588bGuHRu42Rq9
         wro+Tm9PanfzvvPVDJgumdT4dlEgIR9LIpw+c6wlihb4OM2R8BU4vYA+PlA2lhJFmVSd
         n69g1TCMPQDxBGMMlw2/cRSr8Gcb8QApx4nuO4dEz0SnfmrYWcb4UlyYiAsJkiB20uRU
         v6Bn7MR0DpeUkC1fqRCz4EzFNcrHxXOX7ARKztXlsn5/jptS+KYfhvSm9rvsAjcM5ueQ
         wS/w==
X-Gm-Message-State: AOAM533Mh8vSFErSOOFy3KGy1f1FmhiRsbH++hGN5G7K25fX4DawNJL9
        AMPVmUhxmqqWfUT/kDt+dWGPyMnHyTKYjRjGmyrYsdOYIN00mW5t1jnBm4klh2uwKnJvatuy6o+
        Ozz6gl6Lg3gLWUMoZFQXIB7mCzUlXRVVkURIi
X-Received: by 2002:ad4:4503:: with SMTP id k3mr1021517qvu.43.1595844295833;
        Mon, 27 Jul 2020 03:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy123BsYyCBf5EGcFgJoS6Nge8Gnn+C9moRUPZS4RLem12odgkBKyqq3J2QnVf0Hg2RglPsRLyt/KjnAi03PUM=
X-Received: by 2002:ad4:4503:: with SMTP id k3mr1021498qvu.43.1595844295594;
 Mon, 27 Jul 2020 03:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200701082318.11174-1-wsa+renesas@sang-engineering.com> <20200724194719.GF1227@ninjato>
In-Reply-To: <20200724194719.GF1227@ninjato>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 27 Jul 2020 12:04:44 +0200
Message-ID: <CAO-hwJ+VwOZ5Wcn2-5452ZQP8buFyuAZFsUpcidZV0VtzSFSBQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: do not use logical device when creating irq domain
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 24, 2020 at 9:54 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Jul 01, 2020 at 10:23:18AM +0200, Wolfram Sang wrote:
> > Let's rather use its physical parent device to give proper namings and
> > connections in debugfs.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > This turns the name from "unknown-1" to ":soc:i2c@e6540000" in debugfs
> > for my use case.
> >
> > @Benjamin: I am not aware of any other side effects or regression
> > possibilites. Do you see any?
>
> Last call for opinions before I apply it ;)

Sorry for the late reply.

AFAICT, there should not be any side effects. This is internal API and
I don't think the callers need to walk through the tree anywhere. So
if that gives a vetter debugfs, why not.

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>
> >
> >  drivers/i2c/i2c-core-base.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index dc43242a85ba..69217d2193da 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -1227,7 +1227,7 @@ static int i2c_setup_host_notify_irq_domain(struct i2c_adapter *adap)
> >       if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_HOST_NOTIFY))
> >               return 0;
> >
> > -     domain = irq_domain_create_linear(adap->dev.fwnode,
> > +     domain = irq_domain_create_linear(adap->dev.parent->fwnode,
> >                                         I2C_ADDR_7BITS_COUNT,
> >                                         &i2c_host_notify_irq_ops, adap);
> >       if (!domain)
> > --
> > 2.20.1
> >


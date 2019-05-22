Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC5F25D10
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 06:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbfEVEwE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 00:52:04 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:39674 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfEVEwA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 00:52:00 -0400
Received: by mail-vs1-f48.google.com with SMTP id m1so619393vsr.6
        for <linux-i2c@vger.kernel.org>; Tue, 21 May 2019 21:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zM2tRxvUf7NSwKdxRr5bB44PMs0jXxiNemDXs7iz74s=;
        b=EHT9JbHp1/Wa9RK9jVA4OK5kq2Umqvo7DXotXmfDEtVX21PiUHOUZ7autAocu1Z3DI
         6ZRzqyXAzb53gUg4yp/9LcfDmApaECzDSf9bA/g+e11hacYU5wNPzj15Auf5iJplAEtJ
         wZeJSYFMKDpxZEjRnn6nJNQ1Slzdsq0eQQ8ufZoihNbert9VvIhORIZzgty3g3W+bE25
         T3DmsGv84wTy2AsU5rwySyDsgDziJjHHyl+mkLCG9iem3r/ql3ytMZslrTQPrdotdQ7p
         RY9dGGRkvsixSFKzdHePNcTAiXJOMlQXS6jGUd0Y6QcTaO76OQ0naSFaKcI1KonGInxP
         csKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zM2tRxvUf7NSwKdxRr5bB44PMs0jXxiNemDXs7iz74s=;
        b=o7HVh8mjTgnpCXYpikdi/6ApkdSGktjJ6uvLivoM+1JnRb+qZyG4trPdrPLVii3QBh
         s65EQ/sTX5ju13HUeST5Ruh76atE4Ww4Ub3QUBZdEh2DZAFr2ytW8PKLo5xegI+T4078
         3bYjmOlMpPioRQsiWM6qiVCpFChrGUll6Q8H8mFI3YmunCkW6tuaSkqzNBaHvnCLIbT7
         KiiR2rir1sN3pgsivFvU92FrQhXaxMme2I1Yvj9wuVyqCNks2KS+V6FszNnVTsALpdxI
         MmShrqAwORinva4ocKZ/9+zy+nGTCoTk0v+9i4K1PZhq5yvcyrNqXDs6jm1B+DbXqmsQ
         8hEg==
X-Gm-Message-State: APjAAAV89uWuzmcS7gcPD807IfkpjR5XV/n/dy/TzwuamhNGn4UcjuQq
        56hVpy0iXi0Ynewol45+Rgaoef5xVzc9M+haoMmyGQ==
X-Google-Smtp-Source: APXvYqzzpsKJ4iLQ7BqaYnxLEeUZsLQq9FfHMG3CB4djAfIFwCnnOLRgOAk2mwGbLwgnxYcQMlY4DKeohWMasNEvt+c=
X-Received: by 2002:a05:6102:247:: with SMTP id a7mr16894374vsq.229.1558500719859;
 Tue, 21 May 2019 21:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
 <1558445574-16471-2-git-send-email-sagar.kadam@sifive.com> <20190521135625.GN22024@lunn.ch>
In-Reply-To: <20190521135625.GN22024@lunn.ch>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Wed, 22 May 2019 10:21:47 +0530
Message-ID: <CAARK3HmAYjnBH6Aa_R_uKQPs5JAdBAEt1=dvPz1mLmGaKKpP9w@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: i2c: extend existing opencore bindings.
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andrew,

On Tue, May 21, 2019 at 7:26 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  Required properties:
> > -- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> > +- compatible      : "opencores,i2c-ocores",
> > +                 "aeroflexgaisler,i2cmst",
> > +                    "sifive,fu540-c000-i2c","sifive,i2c0".
> > +                 For Opencore based I2C IP block reimplemented in
>
> It looks like there are some tabs vs space issues here.

Ohh. It was not catched in checkpatch.pl. I will update it.

Thanks,
Sagar Kadam


>    Andrew

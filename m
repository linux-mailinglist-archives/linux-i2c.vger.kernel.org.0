Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171CB35E01B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 15:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhDMNcg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 09:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhDMNcg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 09:32:36 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA61C061574;
        Tue, 13 Apr 2021 06:32:16 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id e2so3910928plh.8;
        Tue, 13 Apr 2021 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=BRJXLO8poW2+Afqxfd+wn1GfbWg+f861I9NfV6uRC2I=;
        b=SU3n5Xcje/8fSGhQEq78cTsvro6IDx66O5cgMG5rqjvYi1gWl7KuwFl288ru49tIcF
         1L2KxRwXK/HW+vcnNIho7PFp2dIQF2c6xIU+Dos6A+V+hu/8vKbI3eo9b3+5pSzn3psw
         9casLd110vfEuQdkoggoMI+u7FUGQglYBz8ExgMxu332Q1ojaLaMbgGqpDhto3dn2czG
         1cXhW20OHvqRnsQFF01XHI4GPu/k3sBqade+I/7djCpTFyURYxp6LelgFCfU2++XlCp+
         aUbcw8zSX1sbYnbL+RQCEG2/CLeT+z5vaVXBgNvva2Q3xvINZ+S2jo2chXjHZHwpq8+w
         695A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=BRJXLO8poW2+Afqxfd+wn1GfbWg+f861I9NfV6uRC2I=;
        b=bUhQEdM76AIbE4/D703K+YZQxzBRlenB/vRr4id+9VIGU4uqRP3ZGawMDRi2ip5ScR
         kEu+ioJlSqbW6BddWVORQv8aMfx1ZsJqpt7OTUerHOTN2WjXMy1k6HVt6jaqfbjhos8B
         ExkLX4bDNyguYYfCxMKYDNMJqB52dgJEQLe8fwmlZEgYb6qgcWd7jt0JHUKwV82U4bVt
         zHJpI11p5Qa5RWprpX0u9g2LCE2S/bv3RKzBWTsbvG+Hm/boH4h6q+8Y2HESywd3S3Q5
         v6tnMdEYnxFlr6/ilUPmGPQ4qkcP/2lwyY++Xw0wGOs6bbu48FkgBO/m3A4KXCIF7Ak+
         jL3Q==
X-Gm-Message-State: AOAM5313+v9bgJ7lV3whMdcDI3ikt6uyJ/XlUTlXEIAZXeDXgKqNoU/9
        B0MaWvA+T2suDz7r05jYSFt3QcGPRZXAMG/173/5d3l8qLslqQ==
X-Google-Smtp-Source: ABdhPJy5dFCPqnj4YHQBiJj2nDjn2CyhLS63GT0F+BNDE9oGuKW42/RzCLRR5HUDk0EktMU+o+/acvYH7+KoJrc7SC4=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr31562792plq.17.1618320736143; Tue, 13
 Apr 2021 06:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-2-chris.packham@alliedtelesis.co.nz>
 <20210413122113.GB1553@kunai> <CAHp75Vc0F7zm47h94Pnh-dZJXG770UwR9za+GQP0eCr78qPgtg@mail.gmail.com>
In-Reply-To: <CAHp75Vc0F7zm47h94Pnh-dZJXG770UwR9za+GQP0eCr78qPgtg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 16:31:59 +0300
Message-ID: <CAHp75VfTS8E3Rw-0c66KS5_OBeLMaxUph+d70FYVVmYkerUYhQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] i2c: mpc: use device managed APIs
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 4:31 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 13, 2021 at 3:21 PM Wolfram Sang <wsa@kernel.org> wrote:
> >
> >
> > >       Yongjun[1] into the original patch. If Wei's patch is applied on top
> > >       of whats already in i2c/for-next then this patch can be ignored.
> >
> > I applied Wei's patch instead. It was easier.
>
> Where is it? i2c/for-next shows the v2 of this series being applied.

Ah, I see it's a follow up.
I thought it was a replacement.


-- 
With Best Regards,
Andy Shevchenko

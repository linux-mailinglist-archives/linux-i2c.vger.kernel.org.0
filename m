Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C302435D391
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 00:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238138AbhDLW6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 18:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236485AbhDLW6d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 18:58:33 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6F3C061574;
        Mon, 12 Apr 2021 15:58:14 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id b26so5019745pfr.3;
        Mon, 12 Apr 2021 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=vlE5aDFgqgMcsQqlh2ZHX4ihklVwx8oRdyTN4QegRGo=;
        b=b5au25wKKskWzPty1ySlsXauJ6wbkGSKLBrI7q/Wt07LUgA6nW4Q6MSX3HAmEj/TW/
         IPFA1MaR1s7IueSBwSgtGZhf5QD+bYkGer84qJER9h8mLd/CdjAR8qdS319DUHSHNVdZ
         1pLVXlbCVR15kNRBXkR47YN47U7AJl5REpf/IoEG6FzgeYi94C0NxzuwmMtGbSJdkSmJ
         NaZrD2DMC7Un/ZuvTPmWyHA/RCegZogT/VeblDO4LbxBZHgA+RFpCF3Jo0Sc3VLLgtEC
         eUzJZsyPPM4F3Ym6ojDfIrOvtczlIEVIBADaQIpK1VWraJ+52rqwvBtz1R6pTJU53wcc
         +Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=vlE5aDFgqgMcsQqlh2ZHX4ihklVwx8oRdyTN4QegRGo=;
        b=nfqavmhCw4QTs2Q43dWKw+9xUnMi95Gwz9/uwONMHSkJkc0aQ8gzaSgFny+dNqLeQc
         rAl9bvP0Rga/ghjLRr9oXRmCGkdUJ0OiEM7R4BYOz6nhrIdgxx3M6RFgweqDvIfBaD9r
         v9A3POHCJ3xEzHdVfndSlhtngNIUFberclUHo6Iyvv8G13gKbz4882ue3GXhebvFDrqz
         vFmVz8emX/dxhDmDRvh7Jxnd+Xzhsjjrw0yhdnOB+JEDpZzTV4HNp4kBLgtzEUvo/AAi
         TF93P07oAumcGwsjB7tGvhlTdqmq6JRiaSThcD2X5k8GLTLNZPtTlMRlluMs6zhb/dmp
         HwFQ==
X-Gm-Message-State: AOAM531w9J3O39N3k6l7gEyOFonVZdB2XpRgtO65JshcYUnjkaBFMA9H
        ZX1ZEFeR38AIxmaFivRUG8TUZZMHBnK6eY/l570Aczkx+Ec=
X-Google-Smtp-Source: ABdhPJzs/QkhxjMpWrpUyimFo2z6ioHUlCdT5P+qIkzHmzvLyBpQ2oFna7kQmmf3Bc+WOMxCN2Aysi+PNYsmjyIljOA=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr26303424pfb.7.1618268294266; Mon, 12
 Apr 2021 15:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-7-chris.packham@alliedtelesis.co.nz> <20210410201302.GC2471@kunai>
In-Reply-To: <20210410201302.GC2471@kunai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 01:57:58 +0300
Message-ID: <CAHp75VcB6sBxVRaJiER96_XGkDuN2sbJDhoPQW1=4NeVCE=8EA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] i2c: mpc: Interrupt driven transfer
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 10, 2021 at 11:15 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Mon, Mar 29, 2021 at 02:52:06PM +1300, Chris Packham wrote:
> > The fsl-i2c controller will generate an interrupt after every byte
> > transferred. Make use of this interrupt to drive a state machine which
> > allows the next part of a transfer to happen as soon as the interrupt is
> > received. This is particularly helpful with SMBUS devices like the LM81
> > which will timeout if we take too long between bytes in a transfer.
> >
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> Okay, this change is too large and HW specific for a detailed review.
> But I trust you and hope you will be around to fix regressions if I
> apply it for 5.13? That kind of leads to the question if you want to
> step up as the maintainer for this driver?
>
> Only thing I noticed was a "BUG" and "BUG_ON" and wonder if we really
> need to halt the kernel in that case. Maybe WARN is enough?
>
> I'll apply the first five patches now, they look good to me.

And now is the time to revert the fifth one (at least, I don't know
the state of the rest).
It's obviously the series has not been tested (to some extent).

-- 
With Best Regards,
Andy Shevchenko

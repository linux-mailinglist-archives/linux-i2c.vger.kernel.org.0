Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5C0563A1D
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 21:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbiGATtx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 15:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbiGATtx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 15:49:53 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1639E21E12
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 12:49:52 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c137so2586611qkg.5
        for <linux-i2c@vger.kernel.org>; Fri, 01 Jul 2022 12:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6fPAgM8gi/RJI8YuKyRjChuGCO5jCSEWC0CBzNffV0=;
        b=ByfbfV2q6QbOnkjD39rDX3vW30bOrecwJhGvEHJzy5JQ/s934vXaj9cLQ9w0HT7ewk
         dvx4xjT5TlZTxJ8LWAUp5DJ3HZnM6sYHf/Q5nRt5bv2Uf8SiSx9odeglVNB6rjCs7cgX
         4UD6GljcU0u+QNeS8Sz4D281+08LbQJ8iUPe8a0e0GHMW+MnvDyP5SUppa9qndiB+nt2
         M/GHSOqGlEBUZYAYrT2cIuovkV/rBEI0RQ7SlQsOY6ogtJt6ygSXnsNBVLKkfVTq/gT4
         oPTL4dGhrujdy7vKT7Q07GIz5K76g7AKv/I0weag9+QqzgJeqs85YQYWu5qqAN6tIdU1
         MTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6fPAgM8gi/RJI8YuKyRjChuGCO5jCSEWC0CBzNffV0=;
        b=Z6pVl0yLpv+/01m217m0gjcwfoW7L+UUDeo7hMftcH4GEO+5oPkX7aZtGx6+mHUfVK
         nAftqrlY5a5tBjnPIpT4oo0Y3ZagZvxc4dOdOUIHBZxhUoc6q1AafDpvDBKlDCvOmq8P
         VTjyjYI42zcyheuzgpaeJt5VIyqsILSHziDtftjPcRgUh3jgkMx+0SRBhWXITkZ0doOl
         kM+iAkQ7C5CrUD0J4md0VlK8MjHr45dVIXB6yozcrduPqSh7mcrDpFZkHxz3nxMOakx6
         sGZjqBh/ppRM2E+OuWPe+HwRER7hseFtmfkM7mczS6fL1zt1POzOleuTyyjD8gRaTqP4
         Q8vQ==
X-Gm-Message-State: AJIora9Qjgtxgh8VfaxbmvYfWfnicY/0uV3A5PQ5miqm+ZmzuqBIm/vz
        8+4+jqhrZVHT9gaaciY/failrndWE6cdv+RJHtE4iA==
X-Google-Smtp-Source: AGRyM1s1AY7XBEABePvu0AwdCbeRlv4PSrgMczV/kpgOfIvJvzVm2yQHPAjRjjG9DAkpsWyd7uKVstLy75J/STwM7js=
X-Received: by 2002:a05:620a:46ab:b0:6b1:6550:9062 with SMTP id
 bq43-20020a05620a46ab00b006b165509062mr10580150qkb.80.1656704991257; Fri, 01
 Jul 2022 12:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
 <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
In-Reply-To: <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
From:   Atul Khare <atulkhare@rivosinc.com>
Date:   Fri, 1 Jul 2022 12:49:40 -0700
Message-ID: <CABMhjYrDyOoDusE4-y4VzM87Vg=NhPbow_dQ+1C4EcX50LrMHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
To:     Conor Dooley <Conor.Dooley@microchip.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Conor,

Apologies for the delay, but my laptop died a couple of weeks ago, and
I have been scrambling to get things up and running on the
replacement. I will try and get back to it ASAP.

On Sat, Jun 18, 2022 at 5:40 AM <Conor.Dooley@microchip.com> wrote:
>
> On 09/06/2022 00:39, Atul Khare wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > The patch series fixes dt-schema validation errors that can be reproduced
> > using the following: make ARCH=riscv defconfig; make ARCH=riscv
> > dt_binding_check dtbs_check
> >
> > This is a rebased version of https://tinyurl.com/yvdvmsjd, and excludes
> > two patches that are now redundant.
>
> Hey Atul,
> Any word on (an applicable) v3? Would like to get rid of this last
> couple of warnings.
> Thanks,
> Conor.
>
> >
> > Atul Khare (2):
> >   dt-bindings: sifive: add cache-set value of 2048
> >   dt-bindings: sifive: add gpio-line-names
> >
> >  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml      | 3 +++
> >  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > --
> > 2.34.1
>

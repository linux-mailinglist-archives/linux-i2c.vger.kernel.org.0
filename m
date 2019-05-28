Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19162BF0C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 08:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfE1GH4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 02:07:56 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38151 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfE1GH4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 02:07:56 -0400
Received: by mail-lj1-f193.google.com with SMTP id 14so16489974ljj.5
        for <linux-i2c@vger.kernel.org>; Mon, 27 May 2019 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yLqbUKbLLtCgeEdyd+tut3JLmPpRW2lTZh5vqsf0Jxg=;
        b=b8N/umau2moIR1U8mr3bhDI48bfxmneIdqwvKwjyriG26pnmFTag7UOQxUW+0hO0oN
         cxujfVIHHmrbeXT57yAOwYT6hTmL1j2Haz7bxwQOPgZH5Yfo6b8EpPwEjTOxx4Kyk12O
         rYPoTfbJMMGiNLkc8wF3pTREMFx4CaTvai0xnSplNj0ZIii8dL2uUF7I4CoiKFE4hoES
         D9KbZN6nzJ72gPTSNBM0HZy/dKRrVbgT5bFKOhXv9+hzZp+IsBdD+QAXedBl5EKn+qUy
         BEqZ0lc2lhznQZu3kN0V9YM7+2FSC9E224AidNZpV72PspOmTTbPjtJlfGI3HMw+k4Bx
         0Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yLqbUKbLLtCgeEdyd+tut3JLmPpRW2lTZh5vqsf0Jxg=;
        b=HLNqw1mcnVu6FVAcCBsOB4BCCR+xMKgQyswJOtXygIhrzwDtnjcQb6N/+KXly+y4s5
         WNfNd0+J9VE9DlnTNVChym0MGZLvIDze2wFnhobD84C3KOPgHLex+3lZA46rISQsJhmN
         KL2nDU1s48Ha6C1yfdDx3PdrhPra/Tar7xacMo/MYTTdIfTyBD8g7v/auH48t4TlSVjZ
         8TcnyiXYLh4iXz0zWGbXZlLdsuEtHKX5QQOeL1Oh912NiAgx3f859sj2MMFlHhcdBmT9
         ff2xuXRTwBT4fzmCgSX3AIO82hhqrtaKG7zDO0euLH77tDIug6asdK8fG2JIej7cZBFi
         3mVg==
X-Gm-Message-State: APjAAAXbKWueraiAaGfoocqhjNzJzLk1EKDF3KrSuvTnMJjZjDFVjcDE
        8J1T+BQZ1qdI6D+ih93kNX5SJmp0ne+rVk6hmXgH0w==
X-Google-Smtp-Source: APXvYqz7sUfnBMPcg+Es7HPN18jTtH96mpypHAzieC54F6UgAfk6xAAbv7azr6bEWAybTB275FUx6Gg7gh2cXhV6AAg=
X-Received: by 2002:a2e:9581:: with SMTP id w1mr4925293ljh.88.1559023674648;
 Mon, 27 May 2019 23:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190521013350.8426-1-masahisa.kojima@linaro.org>
 <20190527193418.GI8808@kunai> <CADQ0-X8s8=bDBY+OiytNbEtf_cZV7Mf7U9NQKb+arMk8WhUcjQ@mail.gmail.com>
 <20190528054811.GA2250@kunai>
In-Reply-To: <20190528054811.GA2250@kunai>
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
Date:   Tue, 28 May 2019 15:07:43 +0900
Message-ID: <CADQ0-X9ZTcyt8ePzrvgz=a9WWpB0Y-P9qfTqctkDfx0nF_UV2w@mail.gmail.com>
Subject: Re: [PATCH] i2c: synquacer: fix synquacer_i2c_doxfer() return value
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Satoru Okamoto <okamoto.satoru@socionext.com>,
        Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, 28 May 2019 at 14:48, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi Masahisa,
>
> > > I just noticed you have an open coded loop in synquacer_i2c_xfer() which
> > > should not be needed because the I2C core does that?
> >
> > I'm not sure I correctly understand the meaning of "open coded loop",
>
> It means the driver has the same loop which is already present in the
> I2C core.
>
> > > Your code does a HW
> > > reset, though, but is it really needed for a lost arbitration?
> >
> > Other than handling lost arbitration, this loop also handles following errors.
> >  - transfer fails(expected size and actual transferred size is not matched)
> >  - transfer timeout
> > I think it is reasonable to reset the I2C controller before xfer() retries.
>
> Resetting may be OK, but retrying is not correct. Retrying is only for
> lost arbitration. For the above errors, we return the error without
> retrying and let the upper layers decide what to do.

Thank you for your reply, I understand.
I will consider to update the current xfer() function.

> Kind regards,
>
>    Wolfram

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119AFA7266
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729537AbfICSQH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:16:07 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35722 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfICSQH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 14:16:07 -0400
Received: by mail-wm1-f68.google.com with SMTP id n10so568831wmj.0
        for <linux-i2c@vger.kernel.org>; Tue, 03 Sep 2019 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lm0uLgm0sTY2e8a3kUTy9x6w1xISeqzO6bBqfSQBWSY=;
        b=XX431p7sFQGD86hrtElkrjwgp9ArCYPd1jzUktmFFAol7dEHPMcJtHj6yMLUoDFD4z
         NgwIrennT98+72g9P2fLG+qLoLtuJPlRIZ+iPjXbkGvwlhZBiyHfS/+93kRzTp4642Za
         zNFZZU85EWYrMNmiQ/eB6W2yflZ81Zoz+95cMWYiLeUXaLOtyuhDKuor5JBvQ2Mj1b8X
         E6KgqnHeX4LgdqKGe/89OlR6CIrxwJ0HRBWb6ZsixwHxVNVmBkkmObxkTjERDxlr8zjG
         MjvpO9QEtepBwE7FkZUKjuCvpePpRygMj2jFrdR+yBKl83pkt574wJiUE51KavEP5EIg
         zFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lm0uLgm0sTY2e8a3kUTy9x6w1xISeqzO6bBqfSQBWSY=;
        b=ESu5TywbQI54tGm9R7zhJEoxGtb0xbPpKLb9DvydvASN91cd4K7fCb/OOPxMTF4ggv
         E2xMTRyKzwbI2/TKJsyxbv2Zy1kjcQ3xQSKnQpxcbWPcoZNU0Aqnpx3/jdh9R6Rzwi1n
         VW0SNjXf2KkFlg0/IDhZNFb0JPsWl4nPb9XdqHRRlzU+Bxoh4fvAwGGjL/BZL32hvE35
         SkK1EzASZPLV9klowKaQgG4qGQ2/o4ilmQy4ifKxiKuIku0jXlGAVziN5pzKopqXPj2c
         3juT2Lmt0Q5d8mnbLk7rjDytwnmjDxn20QR1hD+5ZXqCr8Xe8hVtFuGZaYRxnY+1F4dI
         cqiQ==
X-Gm-Message-State: APjAAAWHdwf8iFtA/byH2GJ0J+x86+bjAl/xHOBS1juG0FPl4aoMQfch
        umJENAFWNglPZsJuCkRxOo1VGuhLNYxv7l8ERmLH5g==
X-Google-Smtp-Source: APXvYqy8kf8LON+8RQxPSkWPjPNRTZIFYC1nHmDFhz/wBhVu/N2hZpP99qq2w40MtvPZE3r6jffmTBZ7x+tvlg43qXE=
X-Received: by 2002:a1c:3cc3:: with SMTP id j186mr702986wma.119.1567534565532;
 Tue, 03 Sep 2019 11:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190819075854.1960-1-nishkadg.linux@gmail.com> <20190903180514.GH2171@ninjato>
In-Reply-To: <20190903180514.GH2171@ninjato>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 3 Sep 2019 11:15:54 -0700
Message-ID: <CAKv+Gu92ktMUq7aZ0cXuRcbMvQQgE=6CfNYwtLNP+rALyFezJg@mail.gmail.com>
Subject: Re: [PATCH] i2c: synquacer: Make synquacer_i2c_ops constant
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 3 Sep 2019 at 11:05, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Mon, Aug 19, 2019 at 01:28:54PM +0530, Nishka Dasgupta wrote:
> > Static structure synquacer_i2c_ops, of type i2c_adapter, is only used
> > when it is copied into a field of another structure. It is not itself
> > modified. Hence make it const to protect it from unintended
> > modification.
> > Issue found with Coccinelle.
> >
> > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > ---
>
> Ard, are you okay with this patch?
>

Yes, absolutely.

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> >  drivers/i2c/busses/i2c-synquacer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> > index f724c8e6b360..39762f0611b1 100644
> > --- a/drivers/i2c/busses/i2c-synquacer.c
> > +++ b/drivers/i2c/busses/i2c-synquacer.c
> > @@ -526,7 +526,7 @@ static const struct i2c_algorithm synquacer_i2c_algo = {
> >       .functionality  = synquacer_i2c_functionality,
> >  };
> >
> > -static struct i2c_adapter synquacer_i2c_ops = {
> > +static const struct i2c_adapter synquacer_i2c_ops = {
> >       .owner          = THIS_MODULE,
> >       .name           = "synquacer_i2c-adapter",
> >       .algo           = &synquacer_i2c_algo,
> > --
> > 2.19.1
> >

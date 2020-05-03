Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBD21C2DF3
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 18:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbgECQ2U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 12:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbgECQ2T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 May 2020 12:28:19 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7514C061A0E;
        Sun,  3 May 2020 09:28:19 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y25so4335949pfn.5;
        Sun, 03 May 2020 09:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iZTD9lcM0rAIpS9Q2/unRVD2X5uHHoJ1vWLTkD3cRHU=;
        b=BUSL5yczeY4itv53cb6Mv1bbJIFySaRaAroSQkMAs7JozqBqxGi+f1O4arCgeWUT5d
         s9uH+GhrvdJZ5V+pJrTmicCT0NXMFNeULIcyEi1oF8rP6cWKsvEiBY9o6oRDd6Fm9w6I
         43whgA2Kk2ZEbjd07tR4LUNN9mDVoAM3EGNWbJDXChCT9nHyboWSSjP4wAv//1A9Acy1
         A9uuKLJXyeqpRM+OL4Rc5HgNbQ16hGG1y0HIWJUFRY9WY2NLXYy6DLaGS6h0PoB3jQbq
         5kqag/RUY8zkiMTEg792r10fwSpUBzIydDCB4utO9GSDnjsxz4JIDUz/APD23bxg2zQG
         6QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iZTD9lcM0rAIpS9Q2/unRVD2X5uHHoJ1vWLTkD3cRHU=;
        b=IgzAA24sygSgWySweT3aGnFIKzUR4rVLqz8NaXm+zkm7ftfiHrCcvz9AOD+BRxsnOd
         +ZIR87/FP6DkHzRwPPE+ZNad7NvzWB6wP4AOGRlq/Qt9ohOaxzJGihx6/cSPeFVgcT0Y
         E0HTefw5/GfwAjGTN76gwpGK/p9aQf/jigcLR2oGZz64XuJJBHsjZrU2dfxhUsV47aGu
         MVAm5HarLTvzwtKL/rGx2zfDtLPNhmn/TCdX0sKGrTND5G7BjCpPPff3jiV2LWlKLQI6
         r9b0zfKHPxZfB8jPeVNTk5QHtRy/P5UEhv/PcWgV1CE0x8ttjKZ+uiAZboS6nsuDHPov
         9+Bw==
X-Gm-Message-State: AGi0PubODyf4F13f11Gh2M7s6de0mPNtsD75xcZ3iPCxlPubQdbCxz8W
        9DoeVfXjetCXohJgO7VPdwzQ3+VPcRBFv3ZaennuiLak
X-Google-Smtp-Source: APiQypLcFDt5DTmLgLhTFDcPLPahZiS49HetGZ61ophSEz7v1q7YnAGANTtNEFhbChUG8y4Y9VDTtysRp1NKnV4Y/B0=
X-Received: by 2002:a62:5ec7:: with SMTP id s190mr13164523pfb.130.1588523299414;
 Sun, 03 May 2020 09:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200503131021.16575-1-aishwaryarj100@gmail.com>
In-Reply-To: <20200503131021.16575-1-aishwaryarj100@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 3 May 2020 19:28:07 +0300
Message-ID: <CAHp75VcShqK2B4UdQXfi1nYa4fKkvdZE=d1O=w4QmrFk5Rb=+w@mail.gmail.com>
Subject: Re: [PATCH] i2c: img-scb: Use devm_platform_ioremap_resource and
 remove superfluous error message.
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 3, 2020 at 4:13 PM Aishwarya Ramakrishnan
<aishwaryarj100@gmail.com> wrote:
>
> Use the helper function that wraps the calls to
> platform_get_resource() and devm_ioremap_resource()
> together.
>
> The function platform_get_irq can log an error by itself.
> Omit a redundant message for exception handling in the
> calling function.
>
> Suggested by coccinelle.

Should be two patches, each of which with an explanation given. (And
of course you have to mention after cutter line '---' what kind of
tests you performed?)

-- 
With Best Regards,
Andy Shevchenko

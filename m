Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B5228F531
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 16:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbgJOOtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Oct 2020 10:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729327AbgJOOtN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Oct 2020 10:49:13 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69B7C061755;
        Thu, 15 Oct 2020 07:49:12 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a3so3984531ejy.11;
        Thu, 15 Oct 2020 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=bC6Nl9n/zHgP1uI3o+7xI4KbkfFL+8Ry+Pfph2DVdA4=;
        b=O4M9tXzaT6OTcXbp3RGumZRRBkKLagSkr9ylWhmM2HX5xzYkjELZJbAEJAXiCPpWMk
         qT2ss3NXSn2uoj1L0HYV+yniDK1h8k41/mwYbO2t5ljw8H6V7ZJHx53nHHQzVm5PwtRg
         rniEZobRWrtQ4aN1RMEacxfYStEanHAly/fvPlXahpriGaWSGlF2X4uX09pUPgXrPmJa
         cTG6jU8+UrL9ibJCd0eqGjQWsRwrusL2jWDVv9aVDT7Q5b8FK5cHl+Cd3BXWDUXvwqpd
         hTTM5EAIH2Qbsi5YYgGycKzjww5pwUAXrLfgi/5BrV38a9gCvfBnM5i29Sl2ZKjvFE1a
         dyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=bC6Nl9n/zHgP1uI3o+7xI4KbkfFL+8Ry+Pfph2DVdA4=;
        b=JfitWT6DIaSrJDM1L8cSDAg8UF3/JaiPHXPtQOtFX5AT5dhaogSWBQ9W9j1kofkLN8
         ge8nawZsvSm78oFaG5L25Wj7aXTOR2VGRC/Is1Z5rBxKDX/BDDLlsnFvTDAB38JKAQDC
         WPCOsn0HRsDsKJpI8Z7nBj+XszoEcGUJGguKJ0N5dq9zRWvwp7p/KlZoGlAMAdiv6TN3
         ojSqccMmLyFqXum02nz3QaVPE8+KXNo/7dbn2qgvspHIBW7pQXQBm14rAzcBchjYEB+C
         4fZuyjw/IX+4qvSAYWwaN8+8cZcjDtZfJSgtrsM4mIX4QssnjDh0GLRFwV9W20DPY+u3
         RIPg==
X-Gm-Message-State: AOAM531UFRujGq9bVG/B8reUvmo9eK4gwXsE4OGe1+VLhGvSBIITbkzY
        QCzF9M8TBN8rVxie08NUJDo=
X-Google-Smtp-Source: ABdhPJxr0HXg+w6OMU/X8WM2yd7oj6YKVweugY0BRAkBqIGztsdcTDwYdmEKLsXKjPgdz8FGo8S6QA==
X-Received: by 2002:a17:906:c315:: with SMTP id s21mr4644832ejz.296.1602773351336;
        Thu, 15 Oct 2020 07:49:11 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id j18sm1676259ejc.111.2020.10.15.07.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:49:06 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1kT4Z0-0000j3-2J; Thu, 15 Oct 2020 16:49:06 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, andrew@lunn.ch,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v3 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
References: <1602770907-61852-1-git-send-email-sagar.kadam@sifive.com>
        <1602770907-61852-2-git-send-email-sagar.kadam@sifive.com>
Date:   Thu, 15 Oct 2020 16:49:06 +0200
In-Reply-To: <1602770907-61852-2-git-send-email-sagar.kadam@sifive.com> (Sagar
        Shrikant Kadam's message of "Thu, 15 Oct 2020 07:08:27 -0700")
Message-ID: <87mu0nr1ct.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Sagar" == Sagar Shrikant Kadam <sagar.kadam@sifive.com> writes:

 > The FU540-C000 has a broken IRQ and support was added earlier
 > so that it will operate in polling mode, but seems to work only
 > in case interrupts property is missing from the i2c0 dt-node.
 > This should not be the case and the driver should handle polling
 > mode with the interrupt property present in i2c0 node of the
 > device tree.
 > So check if it's the FU540-C000 soc and enable polling mode master
 > xfers, as the IRQ for this chip is broken.

 > Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
 > for Sifive FU540-C000 SoC")

 > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
 > ---
 >  drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
 >  1 file changed, 13 insertions(+), 9 deletions(-)

 > diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
 > index f5fc75b..1dab02d 100644
 > --- a/drivers/i2c/busses/i2c-ocores.c
 > +++ b/drivers/i2c/busses/i2c-ocores.c
 > @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 >  	init_waitqueue_head(&i2c->wait);
 
 > +	/*
 > +	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
 > +	 * FU540-C000 SoC in polling mode.
 > +	 * Since the SoC does have interrupt its dt has the interrupt
 > +	 * defined but it should be bypassed in driver as this SoC has

NIT: Looks like there some commas missing and the wording sounds a bit
odd to me. What about E.G.:

     /*
      * Since the SoC does have an interrupt, its DT has an interrupt
      * property - But this should be bypassed as the IRQ logic in this
      * SoC is broken.
      */

 > +	 * a broken IRQ, hence update the master_xfer to use polling
 > +	 * transfers.
 > +	 */
 > +	if (of_device_is_compatible(pdev->dev.of_node,
 > +				    "sifive,fu540-c000-i2c"))
 > +		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 > +
 >  	irq = platform_get_irq(pdev, 0);
 > -	if (irq == -ENXIO) {
 > +	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {


Alternatively you can move it after the irq = platform_get_irq(pdev, 0)
line and just clear irq, E.G.:

irq = platform_get_irq(pdev, 0);

if (of_device_is_compatible(..)) {
   i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
   irq = -ENXIO;
}

if (irq == -ENXIO) {
..

-- 
Bye, Peter Korsgaard

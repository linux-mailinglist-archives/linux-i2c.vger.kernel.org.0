Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784F0285E50
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 13:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgJGLkc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Oct 2020 07:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgJGLkb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Oct 2020 07:40:31 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B9FC061755;
        Wed,  7 Oct 2020 04:40:29 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t21so1799365eds.6;
        Wed, 07 Oct 2020 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=k0aeJ1aYDeTbfQgHa1bFP6cUwbAIO3u/WkE2x9DvX8Y=;
        b=lL6tR969hOKqmM8s5zNN//ayAtdv7Ochna4uq6PZS54QF5l4MU+t4smAXv2EhtFOqi
         0nBsyOoRstNSS4yzZ0OpGMCmjhoDIJprstf5+YlImipSM6XjE3oqFGtuX/iLdMrQ/heO
         zAm7Vec+A9T6Dl9ep+/AgFwyns8sTn5gRSSp62jRC/It1TbFyx+Mm+gkpEK0kMY3k1hX
         acrMmRVLwp7XiIzJ8ADtFKlnpsGI1Lkqv8/5bm5xPO6d5h7uosjpQcP/5RLaC7pMcQMC
         uzBZofb6QC1JUw3n/1DJJ90EGnn2ZXzGMfR6Yxzk9H9S0EPphVCovR8pf9hEisWrqtIV
         PxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=k0aeJ1aYDeTbfQgHa1bFP6cUwbAIO3u/WkE2x9DvX8Y=;
        b=fjB8B/clBY5Qt7Fw6Rd9AGKdSP/tpIgDMX6HUYD6ClIEifjeiuqwhDL8ybgiGBVQgO
         PspXnkjVaxUXJZScNfRd6O2eVBEEonPrWKj/TXQ8GSjqnr780ILpcTm4u695z3ZElO8I
         dQDX8cO9jya/GMxLLc0VY4khyUCd76ivBSJDjP5OTVhEvCK/EHd+d/61yS4csbZ0WKXf
         TDMCo3i4JL5US+WBI98EnIY1dLzGI7PTeuKu46fni+u6V4BPYMganje8Bt6YZw5NHl+s
         ZwFuMA70VXCLomFSgcv+xy7TtgeqSKM9cdjcgKkN+2c93fHuLi7Cw39ZV/BDQP54vzhw
         Cigg==
X-Gm-Message-State: AOAM530vV8jOvREi+vo9nXLvg9/DMH767RnOlXRGnyhYDTjf6v3P9wLZ
        4KATQVsDO/EM172BcqBvzzA=
X-Google-Smtp-Source: ABdhPJwJ9X8Pq8LdGx1IPQXF6Ck6Bt3s9OPFOqe1bc1uSKlyPS0JUsrgQKWA19ob02V6jsPNKYXNvg==
X-Received: by 2002:aa7:dbc5:: with SMTP id v5mr3195373edt.54.1602070828096;
        Wed, 07 Oct 2020 04:40:28 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id r21sm1319295eda.3.2020.10.07.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 04:40:26 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1kQ7o2-0002tm-0t; Wed, 07 Oct 2020 13:40:26 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, andrew@lunn.ch,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
References: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
        <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
Date:   Wed, 07 Oct 2020 13:40:26 +0200
In-Reply-To: <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
        (Sagar Shrikant Kadam's message of "Tue, 6 Oct 2020 10:53:16 -0700")
Message-ID: <87imbm4639.fsf@dell.be.48ers.dk>
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
 > index f5fc75b..4405244 100644
 > --- a/drivers/i2c/busses/i2c-ocores.c
 > +++ b/drivers/i2c/busses/i2c-ocores.c
 > @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 >  	init_waitqueue_head(&i2c->wait);
 
 > +	/*
 > +	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
 > +	 * FU540-C000 SoC in polling mode.
 > +	 * Since the SoC does have interrupt it's dt has the interrupt
 > +	 * defined but it should be bypassed in driver as this SoC has
 > +	 * a broken IRQ, hence update the master_xfer to use polling
 > +	 * transfers.
 > +	 */
 > +	match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
 > +	if (match && (long)match->data == TYPE_SIFIVE_REV0)
 > +		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 > +
 >  	irq = platform_get_irq(pdev, 0);
 > -	if (irq == -ENXIO) {
 > +	if (i2c->flags == OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {

NIT: flags is a bitmask, so i2c->flags & OCORES_FLAG_BROKEN_IRQ would be
better, even if there currently doesn't exist any other flags.

TYPE_SIFIVE_REV0 is also set for two compatibles:

        {
                .compatible = "sifive,fu540-c000-i2c",
                .data = (void *)TYPE_SIFIVE_REV0,
        },
        {
                .compatible = "sifive,i2c0",
                .data = (void *)TYPE_SIFIVE_REV0,
        },

Are both affected by this issue? if not, we will need to extend the code
to handle them differently.

Other than that, it looks OK to me.

-- 
Bye, Peter Korsgaard

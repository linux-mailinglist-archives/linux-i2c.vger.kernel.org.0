Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E586235E9
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 14:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390727AbfETMlT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 08:41:19 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:40167 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390361AbfETMlS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 May 2019 08:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=nBnRj/EK3sEUMzbkUvHuqcjTW3RRt/lB/8667Tiwik0=; b=PIxO99nwMHUosViOpBy5S6+McG
        ntWcm8Dksr3pquMWAWjk9qa209ixnC3c1CT3RDC6L5i3oOI50Mnw3LqOhXldniCOjNl4xM5RR/yon
        ZufQiR/rE0WR96qFsheL83jH77gJjfvhDVA19cEmP+Jja4plYPVovfuxOX1XIVQKHQsY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hShbH-0006pg-IA; Mon, 20 May 2019 14:41:07 +0200
Date:   Mon, 20 May 2019 14:41:07 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC
Message-ID: <20190520124107.GA25785@lunn.ch>
References: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
 <1558354817-12034-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558354817-12034-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> @@ -406,7 +416,7 @@ static int ocores_xfer(struct i2c_adapter *adap,
>  {
>  	struct ocores_i2c *i2c = i2c_get_adapdata(adap);
>  
> -	if (i2c->flags & OCORES_FLAG_POLL)
> +	if ((i2c->flags & (OCORES_FLAG_POLL | OCORES_FLAG_BROKEN_IRQ)))
>  		return ocores_xfer_polling(adap, msgs, num);
>  	return ocores_xfer_core(i2c, msgs, num, false);
>  }

You are not listening to what i said. All you need to know here is
that you must poll. It does not matter if the IRQ is broken or not.

>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -ENXIO) {
> -		i2c->flags |= OCORES_FLAG_POLL;

If there is no interrupt, you need to poll. So keep this line.

> +		/*
> +		 * Set a OCORES_FLAG_BROKEN_IRQ to enable workaround for
> +		 * FU540-C000 SoC in polling mode interface of i2c-ocore driver.
> +		 * Else enable default polling mode interface for SIFIVE/OCORE
> +		 * device types.
> +		 */
> +		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> +		if (match && (long)match->data == TYPE_SIFIVE_REV0)
> +			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;

If it is a OCORE, IRQ is broken, so OR in OCORES_FLAG_BROKEN_IRQ.

>  
> -	if (!(i2c->flags & OCORES_FLAG_POLL)) {
> +	if (!(i2c->flags & (OCORES_FLAG_POLL | OCORES_FLAG_BROKEN_IRQ))) {
>  		ret = devm_request_irq(&pdev->dev, irq, ocores_isr, 0,
>  				       pdev->name, i2c);

Here you just need to know if you are polling. Broken IRQ does not
matter.

	Andrew

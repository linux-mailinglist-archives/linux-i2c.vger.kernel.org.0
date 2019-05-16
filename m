Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6991A206F1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 14:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfEPMbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 08:31:33 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37204 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726955AbfEPMbd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 May 2019 08:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=8xq/AtLnhhHzaEV7B7DQtMaLbospcYCiDyDYIDbl+EM=; b=2FkCg+QJQNemfvntMoY/Sg2hMR
        Es9XwCnKNwndQo+A6WrRG5rz/xlK+Qsws4mgav7Mjtd6IqnpBtwer1SzXie7pUP3pIl9icMIJRfM4
        rjVfOUlzl6zwAErRc6zFfEeUB3JWyORiOyLHCnNeLrMqPtFZMAFuEqcrxOXG2F5eZ22A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hRFXc-0002lz-VF; Thu, 16 May 2019 14:31:21 +0200
Date:   Thu, 16 May 2019 14:31:20 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC
Message-ID: <20190516123120.GB14298@lunn.ch>
References: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
 <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> @@ -682,13 +693,24 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -ENXIO) {
> -		i2c->flags |= OCORES_FLAG_POLL;
> +		/*
> +		 * Set a OCORES_FLAG_BROKEN_IRQ to enable workaround for
> +		 * FU540-C000 SoC in polling mode interface of i2c-ocore driver.
> +		 * Else enable default polling mode interface for SIFIVE/OCORE
> +		 * device types.
> +		 */
> +		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> +		if (match && (long)match->data ==
> +				(TYPE_SIFIVE_REV0 | OCORES_FLAG_BROKEN_IRQ))

This looks wrong. You added:

+       {
+               .compatible = "sifive,fu540-c000-i2c",
+               .data = (void *)TYPE_SIFIVE_REV0,
+       },
+       {
+               .compatible = "sifive,i2c0",
+               .data = (void *)TYPE_SIFIVE_REV0,
+       },

So match->data just has TYPE_SIFIVE_REV0.

> +			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
> +		else
> +			i2c->flags |= OCORES_FLAG_POLL;

These two don't need to be exclusive. It makes more sense to say
SIFIVE needs to poll and it its IRQ is broken. A lot of your other
changes then go away.

       Andrew

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096B22512F
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 15:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfEUNyx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 09:54:53 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:41934 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728104AbfEUNyx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 09:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=UGCJIN4YC7PwWtW6V8R3e7Y9bx1SazYljWZoygW/HSE=; b=Xyy6tae4c0JF3FPYCIWZ95xYPI
        y+wPD3IVVm4BuYuiroMjJGK0gP/J651/FZFvksMVM1VicCjpHsC44CnpwS6nnuaJFONG+p6WPmSwI
        nclb+1LdtMwCRql6rvzzj2DA5e6fLTjAqXu5QzcVeKoo3t5hZ3dOEAi2AMwgglSYthbE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hT5Dz-0002yK-JF; Tue, 21 May 2019 15:54:39 +0200
Date:   Tue, 21 May 2019 15:54:39 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
Message-ID: <20190521135439.GM22024@lunn.ch>
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
 <1558445574-16471-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558445574-16471-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>  static void ocores_process_polling(struct ocores_i2c *i2c)
>  {
> +	const struct of_device_id *match;
> +
> +	match = of_match_node(ocores_i2c_match, i2c->adap.dev.of_node);
> +
>  	while (1) {
>  		irqreturn_t ret;
>  		int err;

Please keep with the idea of i2c->flags, which is set during probe.
Just because it was removed because it was no longer needed does not
stop you from putting it back again if it is needed.

       Andrew

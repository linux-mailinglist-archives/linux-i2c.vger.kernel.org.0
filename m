Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 125EA2E1B3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 17:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfE2Px4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 11:53:56 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:39404 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727132AbfE2Pxz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 May 2019 11:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=im4MQHdQK9abJhFH96Zbr5c+k47agNl/ENbT8u/aulo=; b=h6PS64mrTgGbG4Ret1T5AIq1SJ
        qHzYF0KVZCnABwd26ouHy3ZvILTLsxHkVtScmLehUBNV89GfAYMmnYIN31/q+rAaVxVxch1BfhByN
        2UvZUV41MEuFMLA4xnOneyoI72Z27dGowbwwN8RN8JF+KYyuRRSvsvVVft/pw0UQz79U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hW0te-0000n6-6j; Wed, 29 May 2019 17:53:46 +0200
Date:   Wed, 29 May 2019 17:53:46 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
Message-ID: <20190529155346.GA18059@lunn.ch>
References: <1559104047-13920-1-git-send-email-sagar.kadam@sifive.com>
 <1559104047-13920-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559104047-13920-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 29, 2019 at 09:57:27AM +0530, Sagar Shrikant Kadam wrote:
> The i2c-ocore driver already has a polling mode interface.But it needs
> a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> There is an erratum in FU540 chip that prevents interrupt driven i2c
> transfers from working, and also the I2C controller's interrupt bit
> cannot be cleared if set, due to this the existing i2c polling mode
> interface added in mainline earlier doesn't work, and CPU stall's
> infinitely, when-ever i2c transfer is initiated.
> 
> Ref:
> 	commit dd7dbf0eb090 ("i2c: ocores: refactor setup for polling")
> 
> The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> FU540-COOO SoC.
> 
> The polling function identifies a SiFive device based on the device node
> and enables the workaround.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Hi Sagar

When you repost, you are supposed to add any reviewed-by, or acked-by
tags you received.

     Andrew

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1B66E39D2
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Apr 2023 17:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjDPPda (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Apr 2023 11:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjDPPd2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Apr 2023 11:33:28 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B764C2130;
        Sun, 16 Apr 2023 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=CwVfLHJ6BrHQq1wrP7gbBlF9u1FTFNbWwQPTdQvEmpM=; b=opagxVVFDY3vzkOFWWUQFuxXt8
        OOqIF8zpJR8iBrhvxTQ3WNrD2WxTlfny62yVmD+2HpuoZoqXbsKV+DhHMhCoGFFVP8582yNnBFOXs
        jnnIEx9vTkOhFEvZjc/kr/uDytIgEsiJEjnbJkJW7G2u0AHg8K3pKxd46xwUgCFXY/tY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1po4NT-00AQxK-MU; Sun, 16 Apr 2023 17:33:19 +0200
Date:   Sun, 16 Apr 2023 17:33:19 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: add missing unwind goto in
 `ocores_i2c_probe`
Message-ID: <843fab4d-0fdd-4610-91ed-1d8e9accbd25@lunn.ch>
References: <20230416072040.58373-1-silver_code@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416072040.58373-1-silver_code@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Apr 16, 2023 at 03:20:40PM +0800, Wang Zhang wrote:
> platform_get_irq_optional is a function used to obtain an IRQ
> number for a device on a platform. The function returns the IRQ number
> associated with the specified device, or a negative error code if it fails.
> 
> The error handling code after the err_clk label should be executed to
> release any resources that were allocated for the clock if a negative
> error code returned.
> 
> Fix this by assigning irq to ret and changing the direct return to err_clk.

The clock is got in ocores_i2c_of_probe(). That function is not always
called. So you need to be careful in the error handling that you are
not disabling a clock which does not exist....

But i think a better fix is to change ocores_i2c_of_probe() to use
devm_clk_get_enabled(), rather than devm_clk_get() so that the driver
core will disable to clock if the probe fails, or when the driver is
unloaded.

     Andrew

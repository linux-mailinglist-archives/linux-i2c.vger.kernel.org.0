Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9BD06EE17D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 13:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbjDYL55 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 07:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbjDYL5q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 07:57:46 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C66B11F;
        Tue, 25 Apr 2023 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=WhgvyZf4PUh+HmrqM1Eb5netODiCMB/+LSe2XskQNYE=; b=Qh8k5GdbB3t+G8IacoH7Gl8vRw
        8FfSvtw16hG1BTdx0IghtscGleQrUdyNG+n0MX2V1rgKe46aeAGTZXLUqni7Kfg5l+XMsTp5haOUc
        cn23Vk7O600FRkfGkD4ZnrCAdTtu+VaOWXrkWllhUgCTJshLKP5AU8C+hYRhWP5LpqKc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1prHIU-00BBLe-DS; Tue, 25 Apr 2023 13:57:26 +0200
Date:   Tue, 25 Apr 2023 13:57:26 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
Message-ID: <cf543f92-af0d-4862-bea6-53a358ee9a31@lunn.ch>
References: <fc8ed989-68e6-4fd4-a818-ae077bf5e6aa@lunn.ch>
 <20230422123253.137368-1-silver_code@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422123253.137368-1-silver_code@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 22, 2023 at 08:32:53PM +0800, Wang Zhang wrote:
> If any wrong occurs in ocores_i2c_of_probe, the i2c->clk needs to be
> released. But the function returns directly in line 701 without freeing
> the clock. Even though we can fix it by freeing the clock manually if
> platform_get_irq_optional fails, it may not be following the best practice.
> The original code for this driver contains if (IS_ERR()) checks
> throughout, explicitly allowing the driver to continue loading even if
> devm_clk_get() fails.
> 
> While it is not entirely clear why the original author implemented this
> behavior, there may have been certain circumstances or issues that were not
> apparent to us. It's possible that they were trying to work around a bug by
> employing an unconventional solution.Using `devm_clk_get_enabled()` rather
> than devm_clk_get() can automatically track the usage of clocks and free
> them when they are no longer needed or an error occurs.
> 
> fixing it by changing `ocores_i2c_of_probe` to use
> `devm_clk_get_optional_enabled()` rather than `devm_clk_get()`, changing
> `goto err_clk' to direct return and removing `err_clk`.
> 
> Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

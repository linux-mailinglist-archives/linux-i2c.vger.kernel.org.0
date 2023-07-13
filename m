Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87787751DD9
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jul 2023 11:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbjGMJyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jul 2023 05:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234436AbjGMJxW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jul 2023 05:53:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECCD2698;
        Thu, 13 Jul 2023 02:53:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C7E261A08;
        Thu, 13 Jul 2023 09:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8292DC433C7;
        Thu, 13 Jul 2023 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689242000;
        bh=klBkFqf3WWVIxTzQAmBLevppMzRmR9bTdaJ+8Xn2iA4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kOTOwakPg1sK5nA1JPCkRLlEhOHqnewpcIZ0wcYDHn/G2AKECvt2Du9i/cz2g2QjZ
         eq2C2uL8Lu5q8w65m4LxPt/yhXDcehreEPrYeTAaBMh7On7d2JRHggwPe2WENCAcpe
         EoJWvlmYTAuBv3CcT9P7uwmzlYurgWx5tBYuNY/8EjDt8N+hqj47iPhBlIYy6fMoeU
         Uo6aYXBKkUBgODDtmDNsGNLxVxXGvHla66CN0mLI5ireKCvwzRoHttqAWFD9Ogk4X8
         n9uCSLPdZa9EyLuIBZnu9A5LLnWv1EtWNfLSLJqTbqFKJ21XJVFNoKf2IMvlo/hXp8
         6Gf988mT7GD3w==
Date:   Thu, 13 Jul 2023 11:53:10 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Minjie Du <duminjie@vivo.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        opensource.kernel@vivo.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: busses: fix parameter check in
 i2c_gpio_fault_injector_init()
Message-ID: <20230713095310.mafkoqrjwhm5r4mf@intel.intel>
References: <20230713020517.614-1-duminjie@vivo.com>
 <d6d04803-0dc1-9565-23b4-740425066a01@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d04803-0dc1-9565-23b4-740425066a01@web.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Markus,

> > +++ b/drivers/i2c/busses/i2c-gpio.c
> > @@ -265,7 +265,7 @@ static void i2c_gpio_fault_injector_init(struct platform_device *pdev)
> >  	 */
> >  	if (!i2c_gpio_debug_dir) {
> >  		i2c_gpio_debug_dir = debugfs_create_dir("i2c-fault-injector", NULL);
> > -		if (!i2c_gpio_debug_dir)
> > +		if (IS_ERR(i2c_gpio_debug_dir))
> >  			return;
> >  	}
> 
> Will the development attention grow also for the exception handling
> which is missing here so far?

Well, it depends why you need to handle the error return. I think
it's not important if this fails... the only reason I would
handle the error here is to print a warning in dmesg.

Thank you,
Andi

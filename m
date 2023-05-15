Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B506C70286A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 11:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237870AbjEOJ0x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 05:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjEOJ02 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 05:26:28 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3F32715
        for <linux-i2c@vger.kernel.org>; Mon, 15 May 2023 02:25:11 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 4bbf4fb4-f302-11ed-b972-005056bdfda7;
        Mon, 15 May 2023 12:24:32 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Mon, 15 May 2023 12:24:30 +0300
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v8 2/9] i2c: designware: Add driver support for
 Wangxun 10Gb NIC
Message-ID: <ZGH6TmeiR0icT6Tc@surfacebook>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
 <20230515063200.301026-3-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515063200.301026-3-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mon, May 15, 2023 at 02:31:53PM +0800, Jiawen Wu kirjoitti:
> Wangxun 10Gb ethernet chip is connected to Designware I2C, to communicate
> with SFP.
> 
> Introduce the property "snps,i2c-platform" to match device data for Wangxun
> in software node case. Since IO resource was mapped on the ethernet driver,
> add a model quirk to get regmap from parent device.
> 
> The exists IP limitations are dealt as workarounds:
> - IP does not support interrupt mode, it works on polling mode.
> - Additionally set FIFO depth address the chip issue.

...

>  	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
> +	if (device_property_present(&pdev->dev, "snps,i2c-platform"))
> +		dev->flags |= MODEL_WANGXUN_SP;

What I meant here is to use device_property_present() _iff_ you have decided to
go with the _vendor-specific_ property name.

Otherwise it should be handled differently, i.e. with reading the actual value
of that property. Hence it should correspond the model enum, which you need to
declare in the Device Tree bindings before use.

So, either

	if (device_property_present(&pdev->dev, "wx,..."))
		dev->flags |= MODEL_WANGXUN_SP;

or

	if ((dev->flags & MODEL_MASK) == MODEL_NONE) {
	// you now have to distinguish that there is no model set in driver data
		u32 model;

		ret = device_property_read_u32(dev, "snps,i2c-platform");
		if (ret) {
			...handle error...
		}
		dev->flags |= model

-- 
With Best Regards,
Andy Shevchenko



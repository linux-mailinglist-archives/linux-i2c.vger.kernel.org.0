Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C694B6F88E6
	for <lists+linux-i2c@lfdr.de>; Fri,  5 May 2023 20:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbjEESsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 14:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjEESsI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 14:48:08 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74561D97E
        for <linux-i2c@vger.kernel.org>; Fri,  5 May 2023 11:48:06 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 5c84b558-eb75-11ed-abf4-005056bdd08f;
        Fri, 05 May 2023 21:48:03 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 5 May 2023 21:48:01 +0300
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Subject: Re: [RFC PATCH net-next v6 2/9] i2c: designware: Add driver support
 for Wangxun 10Gb NIC
Message-ID: <ZFVPYSKfvQq3WeeO@surfacebook>
References: <20230505074228.84679-1-jiawenwu@trustnetic.com>
 <20230505074228.84679-3-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505074228.84679-3-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fri, May 05, 2023 at 03:42:21PM +0800, Jiawen Wu kirjoitti:
> Wangxun 10Gb ethernet chip is connected to Designware I2C, to communicate
> with SFP.
> 
> Introduce the property "wx,i2c-snps-model" to match device data for Wangxun
> in software node case. Since IO resource was mapped on the ethernet driver,
> add a model quirk to get regmap from parent device.
> 
> The exists IP limitations are dealt as workarounds:
> - IP does not support interrupt mode, it works on polling mode.
> - Additionally set FIFO depth address the chip issue.

Thank you, almost there!

...

> +static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
> +{

> +	struct platform_device *pdev = to_platform_device(dev->dev);
> +
> +	dev->map = dev_get_regmap(pdev->dev.parent, NULL);

No need to jump to a platform device.

	dev->map = dev_get_regmap(dev->dev.parent, NULL);

should suffice.

> +	if (!dev->map)
> +		return -ENODEV;
> +
> +	return 0;
> +}

...

>  	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
> +	device_property_read_u32(&pdev->dev, "wx,i2c-snps-model", &dev->flags);

I believe in your case it should be named something like
"linux,i2c-synopsys-platform". But in any case this I leave
to the more experienced people.

Also I'm not sure this proprty should have a proority over
driver data.


-- 
With Best Regards,
Andy Shevchenko



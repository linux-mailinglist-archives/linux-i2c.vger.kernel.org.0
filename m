Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF98454D989
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 07:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiFPFJq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 01:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiFPFJp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 01:09:45 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8385E56B35;
        Wed, 15 Jun 2022 22:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=8mZ1bXeHffFC/kHmIXWI5Muej2f+NxPZdpt2fFJLCPg=; b=pwLr72dcqADpqWELJCQtWR6StY
        fuboEy9QOQJ/IPzSuw2Mjmq9P95HaWH/L+Gl7M+ZJ43parY5YaQQMmS2FWsxQfso5RDLoLVsujWFt
        HZIkOnTrJ76lQxPhS1gs/J95YzxEXr8Vbdv+w8YyfVM+ffGs7qWvpI04jcuME70RoQBgMGKnun4J8
        IIZ41IPOjTu7Yb8uWhimoxa9ICjR3sU3X7TcSFf2YzcMpEM4gurASEm5mDBBU2m8g61Hse2WfLC52
        C3xW4LM3pX8Q8LQlWftdVdqykqCTZ8D5mui0YOoIL64wYNycVGcJIHkLx8Y5Lzft2nc0v4ben4wkv
        qFH6n6Fw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o1hlC-008KMC-CQ; Thu, 16 Jun 2022 05:09:39 +0000
Message-ID: <e04450b6-822e-ca66-484b-a48856e94a9e@infradead.org>
Date:   Wed, 15 Jun 2022 22:09:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 3/4] i2c: ch341: add I2C MFD cell driver for the CH341
Content-Language: en-US
To:     frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220616013747.126051-1-frank@zago.net>
 <20220616013747.126051-4-frank@zago.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220616013747.126051-4-frank@zago.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi--

On 6/15/22 18:37, frank zago wrote:
> The I2C interface can run at 4 different speeds. This driver currently
> only offer 100kHz. Tested with a variety of I2C sensors, and the IIO
> subsystem.
> 
> Signed-off-by: frank zago <frank@zago.net>
> ---
>  MAINTAINERS                    |   1 +
>  drivers/i2c/busses/Kconfig     |  10 +
>  drivers/i2c/busses/Makefile    |   1 +
>  drivers/i2c/busses/i2c-ch341.c | 377 +++++++++++++++++++++++++++++++++
>  4 files changed, 389 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ch341.c
> 

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a1bae59208e3..db9797345ad5 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1199,6 +1199,16 @@ config I2C_RCAR
>  
>  comment "External I2C/SMBus adapter drivers"
>  
> +config I2C_CH341
> +	tristate "CH341 USB to I2C support"
> +	select MFD_CH341
> +	help
> +	  If you say yes to this option, I2C support will be included for the
> +	  WCH CH341, a USB to I2C/SPI/GPIO interface.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-ch341.

I haven't tested it, but just from reading, it looks like
this one needs a "depends on USB" since it selects MFD_CH341, which
depends on USB, and since 'select' ignores dependency chains.

The GPIO driver (patch 2/4) already depends on USB.

-- 
~Randy

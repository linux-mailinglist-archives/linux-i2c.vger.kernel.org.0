Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDA55312DC
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 18:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238682AbiEWQQ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 12:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238634AbiEWQQq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 12:16:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4872A6543B;
        Mon, 23 May 2022 09:16:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1955B8101B;
        Mon, 23 May 2022 16:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CECFC385A9;
        Mon, 23 May 2022 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653322602;
        bh=xfepUKvQ7sCLevxiv5+hN7CvEb5owQ3Fs6hC8vUBBNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sjICK09wvrS1+7OIscEQWeasa141fB+xn3ZgGjGq7lUEPFtbGf2/8kbaCYO4QAPsP
         J/wlOnhuvQFwBRVV+SDgmt2EhDY/IxYbLgq/YTbhIUjI7d6XRi18JIF3xCAESh7diQ
         vOzs4nJG9aNxPoJEATOHDjnHJbtPd38iGWldzc1lO1wZUZPwG/Z49Teh3ck4EQYMlD
         iav0fx1iHPoFQLBKlKc+kAHsWKqi8Z7W7syVEWaCzD+7Ju8KzDAPmztKYepllWagLs
         YH++IXRao9IagEoMO68hUikYn6OmcWvmCZEosWDRzjBGJyup4xdHXU9c32Dq7ke+EM
         3guKsdcHoe8dQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ntAjY-00083G-ND; Mon, 23 May 2022 18:16:40 +0200
Date:   Mon, 23 May 2022 18:16:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 2/3] gpio: ch341: add GPIO MFD cell driver for the
 CH341
Message-ID: <YouzaO6ogxYj40Bp@hovoldconsulting.com>
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-3-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401023306.79532-3-frank@zago.net>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 31, 2022 at 09:33:05PM -0500, frank zago wrote:
> The GPIO interface offers 16 GPIOs. 6 are read/write, and 10 are
> read-only.
> 
> Signed-off-by: frank zago <frank@zago.net>
> ---

> +struct ch341_gpio {
> +	struct gpio_chip gpio;
> +	struct mutex gpio_lock;
> +	u16 gpio_dir;		/* 1 bit per pin, 0=IN, 1=OUT. */
> +	u16 gpio_last_read;	/* last GPIO values read */
> +	u16 gpio_last_written;	/* last GPIO values written */
> +	union {
> +		u8 gpio_buf[SEG_SIZE];
> +		__le16 gpio_buf_status;
> +	};
> +
> +	struct urb *irq_urb;
> +	struct usb_anchor irq_urb_out;
> +	u8 irq_buf[CH341_USB_MAX_INTR_SIZE];
> +	struct irq_chip irq_chip;
> +
> +	struct ch341_device *ch341;
> +};

> +static void ch341_complete_intr_urb(struct urb *urb)
> +{
> +	struct ch341_gpio *dev = urb->context;
> +	int rc;
> +
> +	if (urb->status) {
> +		usb_unanchor_urb(dev->irq_urb);

URBs are unanchored by USB core on completion.

> +	} else {
> +		/*
> +		 * Data is 8 bytes. Byte 0 might be the length of
> +		 * significant data, which is 3 more bytes. Bytes 1
> +		 * and 2, and possibly 3, are the pin status. The byte
> +		 * order is different than for the GET_STATUS
> +		 * command. Byte 1 is GPIOs 8 to 15, and byte 2 is
> +		 * GPIOs 0 to 7.
> +		 */
> +
> +		handle_nested_irq(irq_find_mapping(dev->gpio.irq.domain,
> +						   CH341_GPIO_INT_LINE));
> +
> +		rc = usb_submit_urb(dev->irq_urb, GFP_ATOMIC);
> +		if (rc)
> +			usb_unanchor_urb(dev->irq_urb);
> +	}
> +}

> +static void ch341_gpio_irq_enable(struct irq_data *data)
> +{
> +	struct ch341_gpio *dev = irq_data_get_irq_chip_data(data);
> +	int rc;
> +
> +	/*
> +	 * The URB might have just been unlinked in
> +	 * ch341_gpio_irq_disable, but the completion handler hasn't
> +	 * been called yet.
> +	 */
> +	if (!usb_wait_anchor_empty_timeout(&dev->irq_urb_out, 5000))
> +		usb_kill_anchored_urbs(&dev->irq_urb_out);
> +
> +	usb_anchor_urb(dev->irq_urb, &dev->irq_urb_out);
> +	rc = usb_submit_urb(dev->irq_urb, GFP_ATOMIC);
> +	if (rc)
> +		usb_unanchor_urb(dev->irq_urb);

This looks confused and broken.

usb_kill_anchored_urbs() can sleep so either calling it is broken or
using GFP_ATOMIC is unnecessary.

And isn't this function called multiple times when enabling more than
one irq?!

> +}
> +
> +static void ch341_gpio_irq_disable(struct irq_data *data)
> +{
> +	struct ch341_gpio *dev = irq_data_get_irq_chip_data(data);
> +
> +	usb_unlink_urb(dev->irq_urb);

Same here...

> +}
> +
> +static int ch341_gpio_remove(struct platform_device *pdev)
> +{
> +	struct ch341_gpio *dev = platform_get_drvdata(pdev);
> +
> +	usb_kill_anchored_urbs(&dev->irq_urb_out);

You only have one URB...

And what prevents it from being resubmitted here?

> +	gpiochip_remove(&dev->gpio);
> +	usb_free_urb(dev->irq_urb);
> +
> +	return 0;
> +}
> +
> +static int ch341_gpio_probe(struct platform_device *pdev)
> +{
> +	struct ch341_device *ch341 = dev_get_drvdata(pdev->dev.parent);
> +	struct gpio_irq_chip *girq;
> +	struct ch341_gpio *dev;
> +	struct gpio_chip *gpio;
> +	int rc;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (dev == NULL)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dev);
> +	dev->ch341 = ch341;
> +	mutex_init(&dev->gpio_lock);
> +
> +	gpio = &dev->gpio;
> +	gpio->label = dev_name(&pdev->dev);
> +	gpio->parent = &pdev->dev;
> +	gpio->owner = THIS_MODULE;
> +	gpio->get_direction = ch341_gpio_get_direction;
> +	gpio->direction_input = ch341_gpio_direction_input;
> +	gpio->direction_output = ch341_gpio_direction_output;
> +	gpio->get = ch341_gpio_get;
> +	gpio->get_multiple = ch341_gpio_get_multiple;
> +	gpio->set = ch341_gpio_set;
> +	gpio->set_multiple = ch341_gpio_set_multiple;
> +	gpio->base = -1;
> +	gpio->ngpio = CH341_GPIO_NUM_PINS;
> +	gpio->can_sleep = true;
> +
> +	dev->irq_chip.name = dev_name(&pdev->dev);
> +	dev->irq_chip.irq_set_type = ch341_gpio_irq_set_type;
> +	dev->irq_chip.irq_enable = ch341_gpio_irq_enable;
> +	dev->irq_chip.irq_disable = ch341_gpio_irq_disable;
> +
> +	girq = &gpio->irq;
> +	girq->chip = &dev->irq_chip;
> +	girq->handler = handle_simple_irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +
> +	/* Create an URB for handling interrupt */
> +	dev->irq_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!dev->irq_urb)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Cannot allocate the int URB\n");
> +
> +	usb_fill_int_urb(dev->irq_urb, ch341->usb_dev,
> +			 usb_rcvintpipe(ch341->usb_dev, ch341->ep_intr),
> +			 dev->irq_buf, CH341_USB_MAX_INTR_SIZE,
> +			 ch341_complete_intr_urb, dev, ch341->ep_intr_interval);
> +
> +	init_usb_anchor(&dev->irq_urb_out);
> +
> +	rc = gpiochip_add_data(gpio, dev);
> +	if (rc) {
> +		rc = dev_err_probe(&pdev->dev, rc, "Could not add GPIO\n");
> +		goto release_urb;
> +	}
> +
> +	return 0;
> +
> +release_urb:
> +	usb_free_urb(dev->irq_urb);
> +
> +	return rc;
> +}

Johan

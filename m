Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19AED531289
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 18:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238276AbiEWP4K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 11:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238371AbiEWP4I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 11:56:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8A4DF20;
        Mon, 23 May 2022 08:56:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C2FE461355;
        Mon, 23 May 2022 15:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F8BC385A9;
        Mon, 23 May 2022 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653321365;
        bh=E8znbfnYp3hj4yVUa36i9d31HFMgOoy/ZnyA7xRjy6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bz2lnVk1HYUjbGFYGkq0ZM/0tYV7dJ4EfjXajHtUYiKcsLg8BpuMFtRp3lmTHz0j3
         /2FEFKq7aBjBuDWJsQjD0YLsjQFb+qwUxtfoIE9NQR5/s3g/B1skRQmtR7HeJGmkLK
         XTRy2oc2E0nlMQOFWLJ268HLsLeyFEyLPgV3aSRjsk8+9qAg0OYL2+XKsaGdAaRT6a
         VddQD8F57du5qq9yXcxrEnVvu85cF5r5itTF1wgAVpltPds7W/Xn6Ox2OPMeW4N2X+
         6TXu0BIYwvvBnocSJ40KMwbpTcI+e9nPwayEqGNfAchnNrmgD5+Hg0e+r5+AKMepDR
         xSDJBI/4QoF0g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ntAPb-0007k4-4K; Mon, 23 May 2022 17:56:03 +0200
Date:   Mon, 23 May 2022 17:56:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 1/3] mfd: ch341: add core driver for the WCH CH341 in
 I2C/SPI/GPIO mode
Message-ID: <Youukx+7oieeDVCE@hovoldconsulting.com>
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-2-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401023306.79532-2-frank@zago.net>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 31, 2022 at 09:33:04PM -0500, frank zago wrote:
> The CH341 is a multifunction chip, presenting 3 different USB PID. One
> of these functions is for I2C/SPI/GPIO. This new set of drivers will
> manage I2C and GPIO.
> 
> Signed-off-by: frank zago <frank@zago.net>
> ---

> +static int ch341_usb_probe(struct usb_interface *iface,
> +			   const struct usb_device_id *usb_id)
> +{
> +	struct usb_host_endpoint *endpoints;
> +	struct ch341_device *dev;
> +	int rc;
> +
> +	dev = devm_kzalloc(&iface->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->usb_dev = usb_get_dev(interface_to_usbdev(iface));

No need to grab a reference unless you're going to hold on to it past
disconnect().

> +	dev->iface = iface;
> +	mutex_init(&dev->usb_lock);
> +
> +	if (iface->cur_altsetting->desc.bNumEndpoints != 3) {
> +		rc = -ENODEV;
> +		goto free_dev;
> +	}
> +
> +	endpoints = iface->cur_altsetting->endpoint;
> +	if (!usb_endpoint_is_bulk_in(&endpoints[0].desc) ||
> +	    !usb_endpoint_is_bulk_out(&endpoints[1].desc) ||
> +	    !usb_endpoint_xfer_int(&endpoints[2].desc)) {
> +		rc = -ENODEV;
> +		goto free_dev;
> +	}

Please use usb_find_common_endpoints() for the above.

> +
> +	dev->ep_in = endpoints[0].desc.bEndpointAddress;
> +	dev->ep_out = endpoints[1].desc.bEndpointAddress;
> +	dev->ep_intr = endpoints[2].desc.bEndpointAddress;
> +	dev->ep_intr_interval = endpoints[2].desc.bInterval;
> +
> +	usb_set_intfdata(iface, dev);
> +
> +	rc = mfd_add_hotplug_devices(&iface->dev, ch341_devs,
> +				     ARRAY_SIZE(ch341_devs));
> +	if (rc) {
> +		rc = dev_err_probe(&iface->dev, rc,
> +				   "Failed to add mfd devices to core\n");
> +		goto free_dev;
> +	}
> +
> +	return 0;
> +
> +free_dev:
> +	usb_put_dev(dev->usb_dev);
> +
> +	return rc;
> +}
> +
> +static void ch341_usb_disconnect(struct usb_interface *usb_if)
> +{
> +	struct ch341_device *dev = usb_get_intfdata(usb_if);
> +
> +	mfd_remove_devices(&usb_if->dev);
> +	usb_put_dev(dev->usb_dev);
> +}

Johan

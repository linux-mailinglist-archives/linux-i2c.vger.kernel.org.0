Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9C56B7D53
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 17:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjCMQVw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 12:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjCMQVv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 12:21:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1186F4A9;
        Mon, 13 Mar 2023 09:21:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 22ED76132A;
        Mon, 13 Mar 2023 16:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FEBC433EF;
        Mon, 13 Mar 2023 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678724509;
        bh=cue9QvwsImcv6UUL81tuuFLV5LdqK4geTRiYyrIUYZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G06mdbhJwW/k+9rd5EZlDYKJ+sR+2soOIpp+F/8O43q+1jFQsny6IWDnGJa+yBE8e
         zeAbxwE2Teq3zNu/70veSmcq9+GFd0ScZn+tEmmumE2DNtwRykAvfC30aCbvvXJGs6
         zvgIDijaxbruoLOxhaqL/aMzWMUfLg/KA1y6Xmx8xTVv+Qsp2yQet8hHQMsfpzWO2/
         G1SrpDMENEI+jUbczvQ7ED6CabHhn/jeAg8Oyi9zEN+YyR426QShmcjCtU9n5kWC8L
         ySNegOosVNKO+i/+/X3YosCWkYGjgG/7urHQZyxahevxALZ4/VSHLgP/VlZX8gHYEF
         LOSUZF6bpaLMw==
Date:   Mon, 13 Mar 2023 17:21:46 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <20230313162146.eag5z6micbpczbt2@intel.intel>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312190435.3568212-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

On top of what Greg has already said, few things from my side
through the lines.

[...]

> +static int ljca_mng_link(struct ljca_dev *dev, struct ljca_stub *stub)
> +{
> +	int ret;
> +
> +	ret = ljca_mng_reset_handshake(stub);
> +	if (ret)
> +		return ret;
> +
> +	/* try to enum all the stubs */
> +	ljca_mng_enum_gpio(stub);
> +	ljca_mng_enum_i2c(stub);
> +	ljca_mng_enum_spi(stub);

We are ignoring here the return value. So either make the
whole function call chain to be void or please check the return
values here.

[...]

> +static ssize_t ljca_enable_dfu_store(struct device *dev, struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct usb_interface *intf = to_usb_interface(dev);
> +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> +	struct ljca_stub *mng_stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	if (enable) {
> +		ret = ljca_mng_set_dfu_mode(mng_stub);
> +		if (ret)
> +			return ret;
> +	}

What is the DFU mode?
Is it an operational mode?
Do we enter and exit from it?
Does the device leave this mode on its own?
What if I write twice in a raw enable?
Can I check if I am in DFU mode or not?

Would you mind adding some comments here?

> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(ljca_enable_dfu);
> +
> +static ssize_t ljca_trace_level_store(struct device *dev, struct device_attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	struct usb_interface *intf = to_usb_interface(dev);
> +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> +	struct ljca_stub *diag_stub = ljca_stub_find(ljca_dev, LJCA_DIAG_STUB);
> +	u8 level;
> +	int ret;
> +
> +	if (kstrtou8(buf, 0, &level))
> +		return -EINVAL;
> +
> +	ret = ljca_diag_set_trace_level(diag_stub, level);
> +	if (ret)
> +		return ret;

do we need any range check for the levels? What happens if I do:

echo "I am too cool" > /sys/.../ljca_trace_level

As there were questions here, would you mind adding some comments
so that the next reader won't make the same questions?

> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(ljca_trace_level);

[...]

> +static int ljca_probe(struct usb_interface *intf, const struct usb_device_id *id)
> +{
> +	struct ljca_dev *dev;
> +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +	int ret;
> +
> +	/* allocate memory for our device state and initialize it */
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);

devm_kzalloc()

Thanks,
Andi

> +	if (!dev)
> +		return -ENOMEM;

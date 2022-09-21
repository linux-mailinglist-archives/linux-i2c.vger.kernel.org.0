Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72655BF893
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 10:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiIUIFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 04:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiIUIFK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 04:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976D43ECDD
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 01:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663747508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HnY+1lvfj8xHoPaa5HzewzJmcN9dGQ94wGZa8thXkCk=;
        b=O1cGXI+F6z0kytxuMqjsMqHWYAQDlVqqcE0ymVFdfGWyksXVcJqg5eHEsMTTGzDk5kUfRn
        qNlFM3Z94r41s8B0eIroQEf3efgv9Tat1MmZp7n/py+e3IDQ5ozUUD9uZPV1hTbbydE7/6
        dbVCnxWaTlilG+29DCgbY5W1EzZHx7w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-u0BpkkqeMUqhj1Pg90-OwQ-1; Wed, 21 Sep 2022 04:05:03 -0400
X-MC-Unique: u0BpkkqeMUqhj1Pg90-OwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AF5538164D5;
        Wed, 21 Sep 2022 08:05:02 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.39.194.185])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9618F40C2064;
        Wed, 21 Sep 2022 08:05:00 +0000 (UTC)
Date:   Wed, 21 Sep 2022 10:04:58 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     gupt21@gmail.com, jic23@kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        benjamin.tissoires@redhat.com, Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v4 4/5] HID: mcp2221: switch i2c registration to devm
 functions
Message-ID: <20220921080458.3uue5ooc3svcbmxp@mail.corp.redhat.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
 <20220921063026.89619-5-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921063026.89619-5-matt.ranostay@konsulko.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[foreword: please keep Jiri and myself (the HID maintainers) CC-ed to
the series, as you will need ack from us and we don't necessarily monitor
every single message on linux-input]

On Sep 20 2022, Matt Ranostay wrote:
> Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
> for matching rest of driver initialization, and more concise code.
> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  drivers/hid/hid-mcp2221.c | 45 +++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index de52e9f7bb8c..7ba63bcd66de 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -824,6 +824,14 @@ static int mcp2221_raw_event(struct hid_device *hdev,
>  	return 1;
>  }
>  
> +static void mcp2221_hid_remove(void *ptr)
> +{
> +	struct hid_device *hdev = ptr;
> +
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);

By default, if you remove the .remove() callback, hid_hw_stop() will get
automatically called by hid-core.c. So we are now calling it twice,
which, in a way is not a big deal but it might be an issue in the long
run.

Generally speaking, in the HID subsystem, that situation doesn't happen
a lot because hid_hw_start() is usually the last command of probe, and
we don't need to open the device in the driver itself.

Here, I guess as soon as you add the i2c adapter, you might want to have
the communication channels ready, and thus you need to have it open
*before* i2c_add_adapter.

I would suggest the following if you want to keep the devm release of
stop and close: please put a big fat warning before mcp2221_hid_remove()
explaining that this is called in devm management, *and* add a function
that would just return 0 as the .remove() callback with another big fat
warning explaining that we don't want hid-core.c to call hid_hw_stop()
because we are doing it ourself through devres.

Last, in the HID subsystem, we often interleave non devres with devres
for resource allocation, given that .remove() will be called before any
devres release. But that is assuming this ordering is OK, which doesn't
seem to be the case here. We first need to unregister the i2c adapter
and then close/stop the HID device.

> +}
> +
>  static int mcp2221_probe(struct hid_device *hdev,
>  					const struct hid_device_id *id)
>  {
> @@ -849,7 +857,8 @@ static int mcp2221_probe(struct hid_device *hdev,
>  	ret = hid_hw_open(hdev);
>  	if (ret) {
>  		hid_err(hdev, "can't open device\n");
> -		goto err_hstop;
> +		hid_hw_stop(hdev);
> +		return ret;
>  	}
>  
>  	mutex_init(&mcp->lock);
> @@ -857,6 +866,10 @@ static int mcp2221_probe(struct hid_device *hdev,
>  	hid_set_drvdata(hdev, mcp);
>  	mcp->hdev = hdev;
>  
> +	ret = devm_add_action_or_reset(&hdev->dev, mcp2221_hid_remove, hdev);
> +	if (ret)
> +		return ret;
> +
>  	/* Set I2C bus clock diviser */
>  	if (i2c_clk_freq > 400)
>  		i2c_clk_freq = 400;
> @@ -873,19 +886,17 @@ static int mcp2221_probe(struct hid_device *hdev,
>  			"MCP2221 usb-i2c bridge on hidraw%d",
>  			((struct hidraw *)hdev->hidraw)->minor);
>  
> -	ret = i2c_add_adapter(&mcp->adapter);
> +	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
>  	if (ret) {
>  		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
> -		goto err_i2c;
> +		return ret;
>  	}
>  	i2c_set_adapdata(&mcp->adapter, mcp);
>  
>  	/* Setup GPIO chip */
>  	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
> -	if (!mcp->gc) {
> -		ret = -ENOMEM;
> -		goto err_gc;
> -	}
> +	if (!mcp->gc)
> +		return -ENOMEM;
>  
>  	mcp->gc->label = "mcp2221_gpio";
>  	mcp->gc->direction_input = mcp_gpio_direction_input;
> @@ -900,26 +911,9 @@ static int mcp2221_probe(struct hid_device *hdev,
>  
>  	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
>  	if (ret)
> -		goto err_gc;
> +		return ret;
>  
>  	return 0;
> -
> -err_gc:
> -	i2c_del_adapter(&mcp->adapter);
> -err_i2c:
> -	hid_hw_close(mcp->hdev);
> -err_hstop:
> -	hid_hw_stop(mcp->hdev);
> -	return ret;
> -}
> -
> -static void mcp2221_remove(struct hid_device *hdev)
> -{
> -	struct mcp2221 *mcp = hid_get_drvdata(hdev);
> -
> -	i2c_del_adapter(&mcp->adapter);
> -	hid_hw_close(mcp->hdev);
> -	hid_hw_stop(mcp->hdev);
>  }
>  
>  static const struct hid_device_id mcp2221_devices[] = {
> @@ -932,7 +926,6 @@ static struct hid_driver mcp2221_driver = {
>  	.name		= "mcp2221",
>  	.id_table	= mcp2221_devices,
>  	.probe		= mcp2221_probe,
> -	.remove		= mcp2221_remove,
>  	.raw_event	= mcp2221_raw_event,
>  };
>  
> -- 
> 2.37.2
> 

Cheers,
Benjamin


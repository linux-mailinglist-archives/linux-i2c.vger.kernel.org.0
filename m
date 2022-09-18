Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE15F5BBEB6
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Sep 2022 17:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiIRPjd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Sep 2022 11:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiIRPjc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Sep 2022 11:39:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE07D9C;
        Sun, 18 Sep 2022 08:39:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A76A61579;
        Sun, 18 Sep 2022 15:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCBBC433D6;
        Sun, 18 Sep 2022 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663515569;
        bh=eoh5wKV0bhC+uVW0zG39LMfRVLlky4WPRI9zCyibDdk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XzWY4GGAQw3LFp9z4JxPO8Vi9FpfEvM8Q18dJzeaFBlnYDxyY9J2yc9qWeiM8J/oc
         A/TqEeSSW8LjT/4/ilci23/H+mmQUSEJQ1KdkLiphyoozm3UIVfDt0xVPa6vxjL1qH
         7f1bAH0A04i1aWha84zHwlkykUIimL4LizDlzdbKMsV3qeeAG65qwaiwjmq+iKs6Ls
         CxqK92fBojx4u0LnXNrxaX49E0GHcacVw7GIkj6LyoZ6/UukcicsLccSfeKbefZdmF
         uAGzgyqxKTIDMM2hzCRgMYJY/zrkIBFEihKQt0ecXg5XYw7DORtzVVtzN300ESHHz/
         7H407cZpLV/KQ==
Date:   Sun, 18 Sep 2022 16:39:33 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     gupt21@gmail.com, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 4/5] HID: mcp2221: switch i2c registration to devm
 functions
Message-ID: <20220918163933.0e52b581@jic23-huawei>
In-Reply-To: <20220912173202.16723-5-matt.ranostay@konsulko.com>
References: <20220912173202.16723-1-matt.ranostay@konsulko.com>
        <20220912173202.16723-5-matt.ranostay@konsulko.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 12 Sep 2022 10:32:01 -0700
Matt Ranostay <matt.ranostay@konsulko.com> wrote:

> Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
> for matching rest of driver initialization, and more concise code.
> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>

This doesn't necessarily make things worse, but I'm not keen on the
potential ordering issues that result form mixed devm / non-devm
in this function.  It's too hard too think about!

Easiest way to avoid people staring at the code to figure out if
there are nasty issues would be to take the whole thing devm
with a couple of devm_add_action_or_reset() to handle the
hid_hw_stop()/hid_hw_close() at right points in the error / remove
flows.

Jonathan


> ---
>  drivers/hid/hid-mcp2221.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index de52e9f7bb8c..29e69576c3d4 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -873,7 +873,7 @@ static int mcp2221_probe(struct hid_device *hdev,
>  			"MCP2221 usb-i2c bridge on hidraw%d",
>  			((struct hidraw *)hdev->hidraw)->minor);
>  
> -	ret = i2c_add_adapter(&mcp->adapter);
> +	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
>  	if (ret) {
>  		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
>  		goto err_i2c;
> @@ -884,7 +884,7 @@ static int mcp2221_probe(struct hid_device *hdev,
>  	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
>  	if (!mcp->gc) {
>  		ret = -ENOMEM;
> -		goto err_gc;
> +		goto err_i2c;
>  	}
>  
>  	mcp->gc->label = "mcp2221_gpio";
> @@ -900,12 +900,10 @@ static int mcp2221_probe(struct hid_device *hdev,
>  
>  	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
>  	if (ret)
> -		goto err_gc;
> +		goto err_i2c;
>  
>  	return 0;
>  
> -err_gc:
> -	i2c_del_adapter(&mcp->adapter);
>  err_i2c:
>  	hid_hw_close(mcp->hdev);
>  err_hstop:
> @@ -917,7 +915,6 @@ static void mcp2221_remove(struct hid_device *hdev)
>  {
>  	struct mcp2221 *mcp = hid_get_drvdata(hdev);
>  
> -	i2c_del_adapter(&mcp->adapter);
>  	hid_hw_close(mcp->hdev);
>  	hid_hw_stop(mcp->hdev);
>  }


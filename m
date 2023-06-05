Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C4E7231A8
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 22:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjFEUoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 16:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjFEUon (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 16:44:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D641A7;
        Mon,  5 Jun 2023 13:44:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE0AA62ABD;
        Mon,  5 Jun 2023 20:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD57C433EF;
        Mon,  5 Jun 2023 20:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685997881;
        bh=rWefc/ANOkPtVL5TDKN6PcHHH/l7CvZ6hNvzZ/IQc6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kljRR52hpUJJrXaUy0nT5D97KbHxhD7F+8w9vJyDHFqc6UslXjgCuL8MS56Un9I1U
         epWdbHY1tyvU9wuWoVa7WotVVplRn/8hEWqjF6NiNozsFhfTiURMDFxdXE1gLpKzmY
         0L8A52Jecg2pcbTjUgQ4hgBiRewqcBiTwATffZni0ZZSlhRE+hDF9p4Vx34hSrQ18k
         1TBOGK7o+a9Rc/A1NTLpq+Ly8M8AqlL8VypB37VERBPv16zjffYG0v9e0CQhc7uNlc
         YxD3VboSgUIZIY4KtW7BaPG5bJBOwPhqao1xDEXY1lV7zB5fCpUHf6W3NB9zB0GPEa
         PqmbYiyqlu41A==
Date:   Mon, 5 Jun 2023 22:44:38 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     David Wu <david.wu@rock-chips.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhang aihui <zah@rock-chips.com>
Subject: Re: [PATCH] i2c: Devices which have some i2c addr can work in same
 i2c bus
Message-ID: <20230605204438.dopx6qvmpdou6xwu@intel.intel>
References: <20230601033423.172021-1-david.wu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601033423.172021-1-david.wu@rock-chips.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi David,

On Thu, Jun 01, 2023 at 11:34:23AM +0800, David Wu wrote:
> From: Zhang aihui <zah@rock-chips.com>
> 
> If i2c slave devices don't work at the same time, which have
> the same i2c addr, it would register two devices, can make them
> working.

can you please rephrase this?

I understand you want to register multiple devices, how is this
going to work in hardware?

> Change-Id: I1bfb7783924b08bdc6e12bf47c2de01bdac7c2e2

please drop the Change-Id

> Signed-off-by: Zhang aihui <zah@rock-chips.com>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> ---
>  drivers/i2c/i2c-core-base.c | 51 +++++++++++++++++++++++++++++--------
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ae3af738b03f..53a8141e6238 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -62,6 +62,7 @@
>  static DEFINE_MUTEX(core_lock);
>  static DEFINE_IDR(i2c_adapter_idr);
>  
> +static int i2c_check_addr_ex(struct i2c_adapter *adapter, int addr);
>  static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver);
>  
>  static DEFINE_STATIC_KEY_FALSE(i2c_trace_msg_key);
> @@ -849,7 +850,8 @@ static void i2c_adapter_unlock_bus(struct i2c_adapter *adapter,
>  
>  static void i2c_dev_set_name(struct i2c_adapter *adap,
>  			     struct i2c_client *client,
> -			     struct i2c_board_info const *info)
> +			     struct i2c_board_info const *info,
> +			     int status)

what exactly is status, is it a counter? If so, please call it
count or similar.

>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  
> @@ -863,8 +865,12 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
>  		return;
>  	}
>  
> -	dev_set_name(&client->dev, "%d-%04x", i2c_adapter_id(adap),
> -		     i2c_encode_flags_to_addr(client));
> +	if (status == 0)
> +		dev_set_name(&client->dev, "%d-%04x", i2c_adapter_id(adap),
> +			i2c_encode_flags_to_addr(client));
> +	else
> +		dev_set_name(&client->dev, "%d-%04x-%01x", i2c_adapter_id(adap),
> +			i2c_encode_flags_to_addr(client), status);
>  }
>  
>  int i2c_dev_irq_from_resources(const struct resource *resources,
> @@ -940,9 +946,11 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>  	}
>  
>  	/* Check for address business */
> -	status = i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
> +	status = i2c_check_addr_ex(adap, i2c_encode_flags_to_addr(client));

"status" as such was indicating that the device is busy, i.e. the
device exists. If you want to use it as a counter, then make
another variable, u8, possibly.

>  	if (status)
> -		goto out_err;
> +		dev_err(&adap->dev,
> +			"%d i2c clients have been registered at 0x%02x",

I think rather than dev_err() it should be a dev_warn() (or
dev_info() as the message doesn't sound very threatening).

dev_err() should be normally followed by a failure. Perhaps to
make it sound more as a warning the message should be:

	"client %d is already registere in 0x%02x\n"

Andi

> +			status, client->addr);

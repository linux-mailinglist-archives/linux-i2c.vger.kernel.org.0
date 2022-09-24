Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975F05E8E73
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Sep 2022 18:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiIXQZY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Sep 2022 12:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiIXQZW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Sep 2022 12:25:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE361BCB7;
        Sat, 24 Sep 2022 09:25:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70410B8094F;
        Sat, 24 Sep 2022 16:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E740AC433C1;
        Sat, 24 Sep 2022 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664036718;
        bh=IABSAfDOB7bySjgixAr3OpImNc/FNR3Nhzr3L3Ft4/4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dpSZFi+UQFwXKNkW8VnmxaQF4oPZqT2akYZt1NM0Ap+JMVqgT7ue868W9dqm1V6Ky
         W3ugmO+jP9P2Ad2hLRF8E6qrG5TWvXlvVwIN0V/dPOo0Y73MCKzbiiijI3Gw3J/5TM
         rlqzMfu8Ut6beU6g4dZANf73p8VjW/BQuYTqyYRKgXsKBJGxF9futagKNTEoofAZSY
         BSaLAyjEHhYtbIXVYaVtV5bOx8qK323UyGe/mPCc1X05/VocFnKNnVbo0Uifq9RRiI
         IqRDBSuERGarnCkcnL7OL2WGJNMLRkgZPbROkXBCuynJOllEDWbzVqIpatafCp5mMl
         m9n/Abi4Vaf/w==
Date:   Sat, 24 Sep 2022 17:25:25 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     gupt21@gmail.com, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 5/5] HID: mcp2221: add ADC/DAC support via iio
 subsystem
Message-ID: <20220924172525.3940df72@jic23-huawei>
In-Reply-To: <20220921063026.89619-6-matt.ranostay@konsulko.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
        <20220921063026.89619-6-matt.ranostay@konsulko.com>
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

On Tue, 20 Sep 2022 23:30:26 -0700
Matt Ranostay <matt.ranostay@konsulko.com> wrote:

> Add support for 3x 10-bit ADC and 1x DAC channels registered via the iio
> subsystem.
> 
> To prevent breakage and unexpected dependencies this support only is
> only built if CONFIG_IIO is enabled, and is only weakly referenced by
> 'imply IIO' within the respective Kconfig.
> 
> Additionally the iio device only gets registered if at least one channel
> is enabled in the power-on configuration read from SRAM.
> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
A few comments inline.
> +
> +	case MCP2221_READ_FLASH_DATA:
> +		switch (data[1]) {
> +		case MCP2221_SUCCESS:
> +			mcp->status = 0;
> +
> +			/* Only handles CHIP SETTINGS subpage currently */
> +			if (mcp->txbuf[1] != 0) {
> +				mcp->status = -EIO;
> +				break;
> +			}
> +
> +			/* DAC scale value */
> +			tmp = (data[6] >> 6) & 0x3;

Perhaps use FIELD_GET() and a suitably defined mask?

> +			if ((data[6] & BIT(5)) && tmp)
> +				mcp->dac_scale = tmp + 4;
> +			else
> +				mcp->dac_scale = 5;
> +
> +			/* ADC scale value */
> +			tmp = (data[7] >> 3) & 0x3;
> +			if ((data[7] & BIT(2)) && tmp)
> +				mcp->adc_scale = tmp - 1;
> +			else
> +				mcp->adc_scale = 0;
> +
> +			break;
> +		default:
> +			mcp->status = -EAGAIN;
> +		}
> +		complete(&mcp->wait_in_report);
> +		break;
> +
>

...

> +
> +static void mcp_init_work(struct work_struct *work)
> +{
> +	struct iio_dev *indio_dev;
> +	struct mcp2221 *mcp = container_of(work, struct mcp2221, init_work.work);
> +	struct mcp2221_iio *data;
> +	int ret, num_channels;
> +
> +	hid_hw_power(mcp->hdev, PM_HINT_FULLON);
> +	mutex_lock(&mcp->lock);
> +
> +	mcp->txbuf[0] = MCP2221_GET_SRAM_SETTINGS;
> +	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
> +

No blank line between a call and it's error handlers. Better
to visually group them together.

> +	if (ret == -EAGAIN)
> +		goto reschedule_task;
> +
> +	num_channels = mcp_iio_channels(mcp);
> +	if (!num_channels)
> +		goto unlock;
> +
> +	mcp->txbuf[0] = MCP2221_READ_FLASH_DATA;
> +	mcp->txbuf[1] = 0;
> +	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 2);
> +
> +	if (ret == -EAGAIN)
> +		goto reschedule_task;
> +
> +	indio_dev = devm_iio_device_alloc(&mcp->hdev->dev, sizeof(*data));
> +	if (!indio_dev)
> +		goto unlock;
> +
> +	data = iio_priv(indio_dev);
> +	data->mcp = mcp;
> +
> +	indio_dev->name = "mcp2221";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &mcp2221_info;
> +	indio_dev->channels = mcp->iio_channels;
> +	indio_dev->num_channels = num_channels;
> +
> +	devm_iio_device_register(&mcp->hdev->dev, indio_dev);

If you aren't going full devm, I'd keep this as an iio_device_alloc() and
release it by hand in remove.

> +
> +unlock:
> +	mutex_unlock(&mcp->lock);
> +	hid_hw_power(mcp->hdev, PM_HINT_NORMAL);
> +
> +	return;
> +
> +reschedule_task:
> +	mutex_unlock(&mcp->lock);
> +	hid_hw_power(mcp->hdev, PM_HINT_NORMAL);
> +
> +	/* Device is not ready to read SRAM or FLASH data, try again */
> +	schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(100));
Add a count.  If we end up here lots of times, probably want to give up!

> +}
> +#endif
> +
>  static int mcp2221_probe(struct hid_device *hdev,
>  					const struct hid_device_id *id)
>  {
> @@ -913,6 +1158,11 @@ static int mcp2221_probe(struct hid_device *hdev,
>  	if (ret)
>  		return ret;
>  
> +#if IS_REACHABLE(CONFIG_IIO)
> +	INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
> +	schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(100));
> +#endif
> +
>  	return 0;
>  }
>  


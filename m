Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26BA45BBEBE
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Sep 2022 17:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiIRPtT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Sep 2022 11:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiIRPtR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Sep 2022 11:49:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36332B1D5;
        Sun, 18 Sep 2022 08:49:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C74FE61566;
        Sun, 18 Sep 2022 15:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5621C433C1;
        Sun, 18 Sep 2022 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663516156;
        bh=pJud3qKsYxicay9vgu36X7qGjWRS53yM1kHO4cSzgP4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JLhiMLxmIKkfOj7iKolvLbQTmhrxOmbTeaCPmESmVXNN4NtKvO89C8W/qOPraPMVm
         Q04tnXpsY84uTkIijT9aBpJ/q72tLAzxc4HqYIUpcKAWCQpGQ+tv3ikRFPmsm1cWML
         wM4JfUx3T2Lz3N7S7NZ7AcAQ5UbvXA1yF+hnqR1aKmhVSCQhnqiH87Rae30EAyhAQA
         6heb/oGKiqifiEvKVA9XZCBXlH/TOWgxCeFikxfyYBa8OQbgGur3oK0FDGrkFVZ7Tm
         GN3otFdGwj4XQSkzEVn+TwiNmfrf/9IbuZeeFIOudzJLaFZ838pWVFUSxEySgsqtY3
         mSWTFNZ43FIVA==
Date:   Sun, 18 Sep 2022 16:49:20 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     gupt21@gmail.com, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 5/5] HID: mcp2221: add ADC/DAC support via iio
 subsystem
Message-ID: <20220918164920.5bc2bc87@jic23-huawei>
In-Reply-To: <20220912173202.16723-6-matt.ranostay@konsulko.com>
References: <20220912173202.16723-1-matt.ranostay@konsulko.com>
        <20220912173202.16723-6-matt.ranostay@konsulko.com>
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

On Mon, 12 Sep 2022 10:32:02 -0700
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

Hi Matt,

Can we not provide a _scale?
Whilst not technically required in all IIO Drivers, a bare _raw interface
is rarely that much use and here the ADC and DAC clearly have very different
scales.

Otherwise, as seen below, I'd like a comment on why the registration
is kicked off in a delayed work item. Right now that looks like a hack
to ensure something else has happened first.  That's fine, but there
doesn't seem to be rescheduling if whatever that 'thing' is hasn't happened yet.
To use this sort of delayed trick, I'd definitely expect a backoff again
to be implemented...

> ---
>  drivers/hid/Kconfig       |   1 +
>  drivers/hid/hid-mcp2221.c | 187 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 188 insertions(+)


...

>  static int mcp2221_probe(struct hid_device *hdev,
>  					const struct hid_device_id *id)
>  {
> @@ -902,6 +1084,11 @@ static int mcp2221_probe(struct hid_device *hdev,
>  	if (ret)
>  		goto err_i2c;
>  
> +#if IS_REACHABLE(CONFIG_IIO)
> +	INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
> +	schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(500));

Good to have a comment here to say why you are kicking the registration of the
IIO device onto a delayed work path.

> +#endif
> +
>  	return 0;
>  
>  err_i2c:


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F294C5AF94A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 03:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiIGBAp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 21:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiIGBAm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 21:00:42 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6953D79680;
        Tue,  6 Sep 2022 18:00:41 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso16701957pjk.0;
        Tue, 06 Sep 2022 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1nSTp4E3mi2wz0ql5vPCuvT6LWbk4nHn2IQwIl/fIHc=;
        b=iUR/Ipryz8WFSNwOTrGIqS+AAl9Ll1Xdf1FsLkMFEL2f4fy3daI3hsS0Eb7WgEf/nE
         Kn8TaK7I1q4kyto2nTxvAr4BffG1yhwDuPMkD915+qCANZgqZ+J13qfCe/AGg1eDsoMb
         9qBV9fblrWN9tCEjou9J4guQq16Tlc7R0LsdVwyvn7iWHCvQE12T/m+G7togrvYvRLMY
         Q4Po69KAh0QxaIfZRDLq9HfokVg4lnQdeiJ8c+4+YWeac70eCVIAQoCj080K0Gv0yn//
         2EiYC7eRuhzs3q+uUoQe93X+AS9u0yZRaQQZxmAnVAeHFbiS0blaMtL06wUPUCCfDZnW
         1j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1nSTp4E3mi2wz0ql5vPCuvT6LWbk4nHn2IQwIl/fIHc=;
        b=I/dlEE0Z3ybZccb79fL7q3QCbRfTJitHgeGaeV+khNMSnKUxkOy/2DPsjZKXadPqw/
         sZEoUl9ipB61mexqqvfF1AAydE4eRN7n9FqrA2Qy9o7U4vg/UBSdlM2GjHnxyFxYjg16
         eeeJQ6mG/gwT3c8SF9CbXZiibZTt9s+SOthr+W42nTr7EgoC+0MRN8XnnLl52aCiXnF5
         wr9TYum9jpO3ChzO7LAmdO8zuJgJ0GGEUiMTriAyTYFptKX22IRb8VlwmCPcovihKFqe
         717DpEjq1HTQdp/bMzD73xcKRP6lAgnjuNSytlI+d90s9gTmz1i7Iv2IIWgBR79jbj0l
         Bnaw==
X-Gm-Message-State: ACgBeo1LxI+l499lVefFEPQI3TprY7WfQQMR2/Uae+j5lGbpgdGON9jj
        isoF3ZbDCBcTWtTD6gvMTk4=
X-Google-Smtp-Source: AA6agR5bs5pkGR/0dZS08ULONZJi0XyeXnEthfPjvQKOdz1J5FtNixVd0SWODroRDPRdt0PNN94TJA==
X-Received: by 2002:a17:902:f782:b0:173:1206:cee0 with SMTP id q2-20020a170902f78200b001731206cee0mr1020667pln.130.1662512440757;
        Tue, 06 Sep 2022 18:00:40 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:abc4:5d24:5a73:a96b])
        by smtp.gmail.com with ESMTPSA id q13-20020aa7982d000000b005251f4596f0sm10853002pfl.107.2022.09.06.18.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 18:00:40 -0700 (PDT)
Date:   Tue, 6 Sep 2022 18:00:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        hdegoede@redhat.com, mario.limonciello@amd.com, timvp@google.com,
        rafael@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] i2c: acpi: Use ACPI GPIO wake capability bit to set
 wake_irq
Message-ID: <YxftNQrRx3fwsobk@google.com>
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 30, 2022 at 05:15:37PM -0600, Raul E Rangel wrote:
> Device tree already has a mechanism to pass the wake_irq. It does this
> by looking for the wakeup-source property and setting the
> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses at the
> ACPI GpioInt wake flag to determine if the interrupt can be used to wake
> the system. Previously the i2c drivers had to make assumptions and
> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> If there is a device with an Active Low interrupt and the device gets
> powered off while suspending, the interrupt line will go low since it's
> no longer powered and wake the system. For this reason we should respect
> the board designers wishes and honor the wake bit defined on the
> GpioInt.
> 
> This change does not cover the ACPI Interrupt or IRQ resources.
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> 
>  drivers/i2c/i2c-core-acpi.c |  8 ++++++--
>  drivers/i2c/i2c-core-base.c | 17 +++++++++++------
>  drivers/i2c/i2c-core.h      |  4 ++--
>  3 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index c762a879c4cc6b..cfe82a6ba3ef28 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -182,12 +182,13 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>  /**
>   * i2c_acpi_get_irq - get device IRQ number from ACPI
>   * @client: Pointer to the I2C client device
> + * @wake_capable: Set to 1 if the IRQ is wake capable
>   *
>   * Find the IRQ number used by a specific client device.
>   *
>   * Return: The IRQ number or an error code.
>   */
> -int i2c_acpi_get_irq(struct i2c_client *client)
> +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  	struct list_head resource_list;
> @@ -196,6 +197,9 @@ int i2c_acpi_get_irq(struct i2c_client *client)
>  
>  	INIT_LIST_HEAD(&resource_list);
>  
> +	if (wake_capable)
> +		*wake_capable = 0;
> +
>  	ret = acpi_dev_get_resources(adev, &resource_list,
>  				     i2c_acpi_add_resource, &irq);

You also need to handle "Interrupt(..., ...AndWake)" case here. I would
look into maybe defining

#define IORESOURCE_IRQ_WAKECAPABLE	(1<<6)

in include/linux/ioport.h and plumbing it through from ACPI layer.

Thanks.

-- 
Dmitry

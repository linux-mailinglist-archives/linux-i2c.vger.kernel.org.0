Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FBC79127E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 09:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348433AbjIDHqM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 03:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245561AbjIDHqM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 03:46:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A83DED
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 00:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693813528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H0KNRkpNLdMUGviSPwLoMIe8Qf6mkROFOcLoqWk+sew=;
        b=bn/nyMzOK+ruQIoth0cMKL8P5dXRDQEXD2KcoX1Lk2TrAlQdY22YWJUji6Rwp4OsQhkDIP
        lSNdLyhFOrXsjv3h/ZTiiJwUaHu4XN35xfIoU3dylsGsz6JhKeb1utNTz31qPrgqLk41YE
        rv2VaZB0i2mSII9pyJPJEbMkpUbRgF0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-8vzS-PngMheWJyhHuJVMJQ-1; Mon, 04 Sep 2023 03:45:27 -0400
X-MC-Unique: 8vzS-PngMheWJyhHuJVMJQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a5944adecbso83787466b.0
        for <linux-i2c@vger.kernel.org>; Mon, 04 Sep 2023 00:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693813526; x=1694418326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0KNRkpNLdMUGviSPwLoMIe8Qf6mkROFOcLoqWk+sew=;
        b=SMK0gVC6e1myXf1aC135YKUmF3C64wFTi9fTpj0ozwozcagjKOhgnOGNJS1v78Kuwd
         RcSbnxSajMjUIbDw4diBAB/PBSocbNNNapybRS0p+5v7U9uyhYGUQFGjD/0cIsSJK/nL
         O0TYg1ywK+t/yk3hl9+ynCQ+ehKCejleYIOm72botUx3ZqHWlaUxGn40M+EUzRmkzBho
         gPLI43JJiC9Sml0TKSNNRTS1tFXt6NGA36PDLlUkrElabbHgl6rRltMHmafFRaqgk0qf
         2Ypc92ga6Hz6GBcD6TYMJj6C10xu9gLWAECr59pMg9Q9QVXnz8J6gJCagGHWYJ6GRR23
         y2yQ==
X-Gm-Message-State: AOJu0YwKbIY8IyIdNM9Vv9a10AXRUktlK/sAnzBnHHYOemQy1UOyDYBa
        bIGN6mZOKDSpxKwEz8PTwqLog+FC/ke2k1xHUj1Q8gqK6x0s1E6r+tIgsA3iy32kQhu0J2NBgvo
        oIcAFQVAsWiFmqKVb4Yph
X-Received: by 2002:a17:907:77d3:b0:9a1:d2ef:3e3c with SMTP id kz19-20020a17090777d300b009a1d2ef3e3cmr7148417ejc.44.1693813526039;
        Mon, 04 Sep 2023 00:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXjpl5iR2bluEEd2f0BvjmwMXmKYsjVJb5ovkGvOPG/PcjWd/K4oqQi/LwADvlnpZRAtvA1A==
X-Received: by 2002:a17:907:77d3:b0:9a1:d2ef:3e3c with SMTP id kz19-20020a17090777d300b009a1d2ef3e3cmr7148380ejc.44.1693813525714;
        Mon, 04 Sep 2023 00:45:25 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gj17-20020a170906e11100b00982be08a9besm5854238ejb.172.2023.09.04.00.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:45:24 -0700 (PDT)
Message-ID: <e1da8a5d-ec73-7ff4-d147-c50aa44f1039@redhat.com>
Date:   Mon, 4 Sep 2023 09:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Content-Language: en-US
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/4/23 07:44, Wentong Wu wrote:
> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA).
> 
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. Three modules (
> I2C, GPIO, and SPI) are supported currently.
> 
> Each sub-module of LJCA device is identified by type field within
> the LJCA message header.
> 
> The sub-modules of LJCA can use ljca_transfer() to issue a transfer
> between host and hardware. And ljca_register_event_cb is exported
> to LJCA sub-module drivers for hardware event subscription.
> 
> The minimum code in ASL that covers this board is
> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>     {
>         Device (GPIO)
>         {
>             Name (_ADR, Zero)
>             Name (_STA, 0x0F)
>         }
> 
>         Device (I2C)
>         {
>             Name (_ADR, One)
>             Name (_STA, 0x0F)
>         }
> 
>         Device (SPI)
>         {
>             Name (_ADR, 0x02)
>             Name (_STA, 0x0F)
>         }
>     }
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> ---

<snip>

> +#ifdef CONFIG_ACPI
> +struct ljca_match_ids_walk_data {
> +	const struct acpi_device_id *ids;
> +	const char *uid;
> +	struct acpi_device *adev;
> +};
> +
> +static const struct acpi_device_id ljca_gpio_hids[] = {
> +	{ "INTC1074" },
> +	{ "INTC1096" },
> +	{ "INTC100B" },
> +	{ "INTC10D1" },
> +	{},
> +};
> +
> +static const struct acpi_device_id ljca_i2c_hids[] = {
> +	{ "INTC1075" },
> +	{ "INTC1097" },
> +	{ "INTC100C" },
> +	{ "INTC10D2" },
> +	{},
> +};
> +
> +static const struct acpi_device_id ljca_spi_hids[] = {
> +	{ "INTC1091" },
> +	{ "INTC1098" },
> +	{ "INTC100D" },
> +	{ "INTC10D3" },
> +	{},
> +};
> +
> +static int ljca_match_device_ids(struct acpi_device *adev, void *data)
> +{
> +	struct ljca_match_ids_walk_data *wd = data;
> +	const char *uid = acpi_device_uid(adev);
> +
> +	if (acpi_match_device_ids(adev, wd->ids))
> +		return 0;
> +
> +	if (!wd->uid)
> +		goto match;
> +
> +	if (!uid)
> +		uid = "0";
> +	else
> +		uid = memchr(uid, wd->uid[0], strlen(uid));

Note this line can be simplified to:

		uid = strchr(uid, wd->uid[0]);

Regards,

Hans


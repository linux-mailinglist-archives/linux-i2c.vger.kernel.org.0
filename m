Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E1339BAB8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 16:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhFDOMH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 10:12:07 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:42979 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbhFDOMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 10:12:07 -0400
Received: by mail-wm1-f44.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso5710536wmq.1;
        Fri, 04 Jun 2021 07:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MYbOHTjKAIubB26NWy6blCn6jMexjYelF/SCF4KLYBM=;
        b=NnchJqNSeEqijUeniIVorUZChIr8whszcRfqCmiLBNGPVl0S1YfS3y1q6HCu43oLRe
         /7fPueHOA6y833aDNjkfwwN+6CggiT5ViFI9AKufKs2gjLrj/wwBvNX3KOQfVoa67NkH
         QJ5/Mr/lriaJlx4bOk2J0AElKoaVF7cZ5ZJZycCPR0DhA0VbEUICCeR3Zz83/OqGaHvs
         lRE3H+98+vAO7gfNb30V6LAZ2p/IlLg4Z3xzUSsv4BT1fvlBqmSk34lwU6yX2XSeC9jF
         WmrLGVkoqPfnjnYYA70Z3NZw/7EPclgZmY8AGho1QzophphwX18CywCl6TT3vaaZNLOf
         FJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MYbOHTjKAIubB26NWy6blCn6jMexjYelF/SCF4KLYBM=;
        b=U79D27SNrnC6CYuoSD+SY9Fcl0gsAsnqTv7WTQPkKihyLRgdJM+j9xxi0kP3wjdQEa
         mtFvDIsRv4pIcqFCIlqV3WiKfaTvI4JkgG6jWn21egsgtCdRznGj3wAIz1nwE8cGfioH
         qz2cdAQYFU44+tJ4xNxa3vfVjn6yxyGvEk8Yt2kh8h0Ott4HnwJnYnUV56EnFWI15nrq
         YkV5tTSnXIdelZnIcfky6sstfaXqPuO2dud4CFdiM+8ke2BDqawAE99/wLXTZTPySIOM
         B5sMmDjgyUSeiA7wKgJ8m1b6AHRzlt+HFSyByBYl9NGmys9jR1D1Opyk7ZgeSGlYAw2c
         3nUA==
X-Gm-Message-State: AOAM530AzrJTEdIEmj0GX458zxVU89kG8frzBwiy4Cp8luRg1K+ut2aV
        R/5cNKXZ7cMQp1tciVv+8mg=
X-Google-Smtp-Source: ABdhPJwp4iUyQA0gJMy7m2YEEOSu8/w15silx0ciWQYwyyo+fqOsulsICwzmNa/aG6DRCiptYCvQzw==
X-Received: by 2002:a1c:a484:: with SMTP id n126mr3950601wme.34.1622815759578;
        Fri, 04 Jun 2021 07:09:19 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.84])
        by smtp.gmail.com with ESMTPSA id i16sm5912553wmm.9.2021.06.04.07.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 07:09:19 -0700 (PDT)
Subject: Re: [PATCH v5 3/6] gpiolib: acpi: Export acpi_get_gpiod()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210603224007.120560-1-djrscally@gmail.com>
 <20210603224007.120560-4-djrscally@gmail.com>
 <YLojymirRB5HpFQY@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <d8eb43b6-c842-6b1f-5840-f558d54f1498@gmail.com>
Date:   Fri, 4 Jun 2021 15:09:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLojymirRB5HpFQY@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 04/06/2021 13:59, Andy Shevchenko wrote:
> On Thu, Jun 03, 2021 at 11:40:04PM +0100, Daniel Scally wrote:
>> We need to be able to translate GPIO resources in an ACPI device's _CRS
>> into GPIO descriptor array. Those are represented in _CRS as a pathname
>> to a GPIO device plus the pin's index number: the acpi_get_gpiod()
>> function is perfect for that purpose.
>>
>> As it's currently only used internally within the GPIO layer, provide and
>> export a wrapper function that additionally holds a reference to the GPIO
>> device.
> The subject is wrong, it should be "Introduce acpi_get_and_request_gpiod()
> helper" or so. I can fix when applying.


Ah! That was sloppy, sorry.

> Btw, do I understand correctly that I may push GPIO ACPI patches independently
> (of the ACPI changes)?


They're independent yes.

>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since v4:
>> 	- None
>>
>>  drivers/gpio/gpiolib-acpi.c   | 28 ++++++++++++++++++++++++++++
>>  include/linux/gpio/consumer.h |  2 ++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>> index 5b4111e4be3f..684ddb35d83b 100644
>> --- a/drivers/gpio/gpiolib-acpi.c
>> +++ b/drivers/gpio/gpiolib-acpi.c
>> @@ -128,6 +128,34 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
>>  	return gpiochip_get_desc(chip, pin);
>>  }
>>  
>> +/**
>> + * acpi_get_and_request_gpiod() - Translate ACPI GPIO pin to GPIO descriptor
>> + *                               and hold a refcount to the GPIO device.
>> + * @path:      ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
>> + * @pin:       ACPI GPIO pin number (0-based, controller-relative)
>> + * @label:     Label to pass to gpiod_request()
>> + *
>> + * This function is a simple pass-through to acpi_get_gpiod(), except that
>> + * as it is intended for use outside of the GPIO layer (in a similar fashion to
>> + * gpiod_get_index() for example) it also holds a reference to the GPIO device.
>> + */
>> +struct gpio_desc *acpi_get_and_request_gpiod(char *path, int pin, char *label)
>> +{
>> +	struct gpio_desc *gpio;
>> +	int ret;
>> +
>> +	gpio = acpi_get_gpiod(path, pin);
>> +	if (IS_ERR(gpio))
>> +		return gpio;
>> +
>> +	ret = gpiod_request(gpio, label);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return gpio;
>> +}
>> +EXPORT_SYMBOL_GPL(acpi_get_and_request_gpiod);
>> +
>>  static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
>>  {
>>  	struct acpi_gpio_event *event = data;
>> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
>> index c73b25bc9213..566feb56601f 100644
>> --- a/include/linux/gpio/consumer.h
>> +++ b/include/linux/gpio/consumer.h
>> @@ -692,6 +692,8 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,
>>  				   const struct acpi_gpio_mapping *gpios);
>>  void devm_acpi_dev_remove_driver_gpios(struct device *dev);
>>  
>> +struct gpio_desc *acpi_get_and_request_gpiod(char *path, int pin, char *label);
>> +
>>  #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
>>  
>>  struct acpi_device;
>> -- 
>> 2.25.1
>>

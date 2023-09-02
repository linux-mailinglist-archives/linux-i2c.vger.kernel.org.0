Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927EB790945
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 21:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjIBTBx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 15:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbjIBTBw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 15:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19CC1B0
        for <linux-i2c@vger.kernel.org>; Sat,  2 Sep 2023 12:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693681264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DKaRuEfV1JYhGjZOMUwjpitc5IwOb3LiJf+iW+acoug=;
        b=Wri+oRgpo74TfBfM6lWu4eOT365W7HGRX2/dc0OOVNULjyubAxUT+uPEoxcyV8z/rqXmXx
        eiHNAxC8AnVAUkx4SXDdDOpJHvBBdSlKJhmHlw22bGpOX4Op6vmCp6L5nVcu+cE6qh5wsv
        fnPZ3R1em27g69q+saDvVy3kCzSl2KY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-BUtNhSaTO3eWiB3N8RtUFA-1; Sat, 02 Sep 2023 15:01:02 -0400
X-MC-Unique: BUtNhSaTO3eWiB3N8RtUFA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99cc32f2ec5so10445466b.1
        for <linux-i2c@vger.kernel.org>; Sat, 02 Sep 2023 12:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693681261; x=1694286061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKaRuEfV1JYhGjZOMUwjpitc5IwOb3LiJf+iW+acoug=;
        b=NMuWRHxcSbH2fhLoHrt83TfxnhFFS+M/vGfNc/prvBAlRTIGuJJIhwrFc7kjhzXBFV
         t6ir/F/KDCll1Lz/n4sksYfcjqn2MvvZPRYV7p20zZptKMl1NPsPfJV/LcZeD07k8yhE
         BUL9ne+j2wVyzhJ0bZPt/Jurty/LB5kGlJW3BiscbVSTC0HqoXxUOy92ryc06XZgzvNG
         fVgoMnUMa+0adHDinAdDNV9Kn3E/1aumpsFgIjotCgCqLoGXIs7oPovwanupcuJkfmmJ
         kuxB7o3tUka+Q5L7Imo326R0Z4lLOFdaIozzC076+TvDRES4Jq0nd8YNLXZ/p+XmuP4Y
         En2A==
X-Gm-Message-State: AOJu0YzqfFF9HLqRXu7Z+0Lm8FsjnfgGTk5EcV1uI1SCqmY+suVQvHYv
        4AeQk/d7HPu53zNgKcrWeBW3gIXjXDyaIjv1tmA0lxgC7cdWa4OCoUuXYoitZHNm+rBHAYok58p
        Lo7H2O47Aj06KdRM/4IOe
X-Received: by 2002:a17:906:212:b0:9a1:f6e0:12f4 with SMTP id 18-20020a170906021200b009a1f6e012f4mr4428476ejd.15.1693681261663;
        Sat, 02 Sep 2023 12:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8GFt3+eoTfDu3gXsGjHFp0ClwCoKO6h75CT4DwLBVqlg9+yLOGjZrUR+4L2+1WRnyXTibnA==
X-Received: by 2002:a17:906:212:b0:9a1:f6e0:12f4 with SMTP id 18-20020a170906021200b009a1f6e012f4mr4428466ejd.15.1693681261322;
        Sat, 02 Sep 2023 12:01:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l23-20020a1709060e1700b0098963eb0c3dsm3718244eji.26.2023.09.02.12.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 12:01:00 -0700 (PDT)
Message-ID: <185f2f8a-e2ba-e198-79a2-6c01081f035e@redhat.com>
Date:   Sat, 2 Sep 2023 21:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 0/4] Add Intel LJCA device driver
Content-Language: en-US, nl
To:     "Wu, Wentong" <wentong.wu@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "Wang, Zhifeng" <zhifeng.wang@intel.com>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <7fc37bb5-2121-4174-fb1d-9edf49213a6c@redhat.com>
 <DM6PR11MB4316D9C6026B6672872939DE8DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM6PR11MB4316D9C6026B6672872939DE8DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 9/2/23 19:15, Wu, Wentong wrote:
> Hi Hans,
> 
> Thanks
> 
>> From: Hans de Goede <hdegoede@redhat.com>
>>
>> Hi,
>>
>> On 9/1/23 07:36, Wentong Wu wrote:
>>> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This is a
>>> USB-GPIO, USB-I2C and USB-SPI device. We add 4 drivers to support this
>>> device: a USB driver, a GPIO chip driver, a I2C controller driver and
>>> a SPI controller driver.
>>
>> Thanks. I've been testing this on a Lenovo X1 ThinkPad Yoga gen 8 with an
>> ov2740 sensor connected to the LJCA device.
> 
> Thanks, and I don’t have this laptop, could you please share your DSDT
> so that I can understand it more?

I have send you an acpidump by private email.

> And I will update this patch set after understand your DSDT and have the
> patches tested on my setup.

Ok. Note that the out of tree ivsc driver already does uid matching
in the i2c-driver to fixup the wrong ACPI companion being assigned
by the MFD driver, see:

https://github.com/intel/ivsc-driver/blob/main/drivers/i2c/busses/i2c-ljca.c#L346

For upstream it seemed cleaner to me to directly pick
the correct ACPI companion at aux-device instantiation,
something which was not possible with the MFD approach
but is possible with the auxilary bus approach.

And the other change which I'm proposing has already
been merged into the out of tree version of the LJCA
i2c driver:

https://github.com/intel/ivsc-driver/commit/70d95269169cf9e452580b0c15471829df4a6d59

Regards,

Hans






>> I needed 2 small(ish) fixes to make everything work there.
>> I have attached the 2 fixes here.
>>
>> With these 2 fixes this series is:
>>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks a lot
> 
> BR,
> Wentong
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>> ---
>>> v12:
>>>  - switch dev_err to dev_dbg for i2c-ljca driver
>>>  - avoid err printing because of calling usb_kill_urb when attempts to
>>> resubmit the rx urb
>>>
>>> v11:
>>>  - switch dev_err to dev_dbg for i2c-ljca driver
>>>  - remove message length check because of defined quirk structure
>>>  - remove I2C_FUNC_SMBUS_EMUL support
>>>
>>> v10:
>>>  - remove ljca_i2c_format_slave_addr
>>>  - remove memset before write write w_packet
>>>  - make ljca_i2c_stop void and print err message in case failure
>>>  - use dev_err_probe in ljca_i2c_probe function
>>>
>>> v9:
>>>  - overhaul usb-ljca driver to make it more structured and easy
>>> understand
>>>  - fix memory leak issue for usb-ljca driver
>>>  - add spinlock to protect tx_buf and ex_buf
>>>  - change exported APIs for usb-ljca driver
>>>  - unify prefix for structures and functions for i2c-ljca driver
>>>  - unify prefix for structures and functions for spi-ljca driver
>>>  - unify prefix for structures and functions for gpio-ljca driver
>>>  - update gpio-ljca, i2c-ljca and spi-ljca drivers according to
>>> usb-ljca's changes
>>>
>>> Wentong Wu (4):
>>>   usb: Add support for Intel LJCA device
>>>   i2c: Add support for Intel LJCA USB I2C driver
>>>   spi: Add support for Intel LJCA USB SPI driver
>>>   gpio: update Intel LJCA USB GPIO driver
>>>
>>>  drivers/gpio/Kconfig          |   4 +-
>>>  drivers/gpio/gpio-ljca.c      | 246 +++++++------
>>>  drivers/i2c/busses/Kconfig    |  11 +
>>>  drivers/i2c/busses/Makefile   |   1 +
>>>  drivers/i2c/busses/i2c-ljca.c | 326 +++++++++++++++++
>>>  drivers/spi/Kconfig           |  11 +
>>>  drivers/spi/Makefile          |   1 +
>>>  drivers/spi/spi-ljca.c        | 297 +++++++++++++++
>>>  drivers/usb/misc/Kconfig      |  14 +
>>>  drivers/usb/misc/Makefile     |   1 +
>>>  drivers/usb/misc/usb-ljca.c   | 817
>> ++++++++++++++++++++++++++++++++++++++++++
>>>  include/linux/usb/ljca.h      | 113 ++++++
>>>  12 files changed, 1737 insertions(+), 105 deletions(-)  create mode
>>> 100644 drivers/i2c/busses/i2c-ljca.c  create mode 100644
>>> drivers/spi/spi-ljca.c  create mode 100644 drivers/usb/misc/usb-ljca.c
>>> create mode 100644 include/linux/usb/ljca.h
>>>


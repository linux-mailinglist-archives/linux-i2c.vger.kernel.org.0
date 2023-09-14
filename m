Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A00D79FE2E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 10:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236253AbjINIWE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 04:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236185AbjINIWD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 04:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EE2E1BF9
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694679671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gORgBWCz3hCk/bsvpm1Zfcrjb1Hz/L3M1pTUN8fqGWo=;
        b=FrbIcTd2PwRN+LUPdKPp17Ebta46Svgd9tlSkn314tUuOpEAOOnfLU7l5z7kJSqCLNQx64
        5YjrHttfbe+/22Hilu7HWP3w1QIm4q5zKzWVVnQpCpGNjci2GL4pjd1mR06ryR8aKBtjtk
        4G8gkBj5Z3yuTPNFMDhjQZw03uuL21o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-8VlnfIqRPruiO5vlFIcQvQ-1; Thu, 14 Sep 2023 04:21:09 -0400
X-MC-Unique: 8VlnfIqRPruiO5vlFIcQvQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a348facbbso56715066b.1
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 01:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679668; x=1695284468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gORgBWCz3hCk/bsvpm1Zfcrjb1Hz/L3M1pTUN8fqGWo=;
        b=DGT+dFoqfSUFYrpo7hbqEpVzFxbmqL3B4YdRO1DAzLf5DJpJM0N6LXtFjWXNc1qBiR
         CAVfTXPqRu4eElndeC5mMQnJyyWMEnEsErdLugFY7XypABHEXd1GksvCCoj1JsJHzqh7
         priCv9VgbYSG3e36qr04748hbm7hM9AFnSjA9PZDSoSZqwECQgcRQ2Lahj8wEJSqTt6A
         bHMzRG4ePq1uoKS+X42fX3S43DGj9IV0WVf4jB2llzjiXie59GE1MEIrXHelJFjL+sLw
         7CagVh5p4Y+9NQ6b9ZWO/BXFVwovc5VqgVl9CTIWW47H3LiTo+Utx5SwyAq/lk34a7kJ
         gbog==
X-Gm-Message-State: AOJu0Ywux6zzDCvqsch0M7KKkI8VLEKLGhkc2UBuTFkOGF5AhE0hKhC9
        2milnYtRzgk4lq4oZ1j20Ff8/Lr4fIkKOoHZKp1pUxkBOz5hBdZOm9xi7vNEwAgiPrZIxuo/ICf
        pKDCbOn0HWw3d5zdwUpur
X-Received: by 2002:a17:906:3297:b0:9a5:ceab:f496 with SMTP id 23-20020a170906329700b009a5ceabf496mr4081138ejw.58.1694679668723;
        Thu, 14 Sep 2023 01:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIHVU/Fju08DmHRKzYeSJRU9Ob1ijnlRZaI7gxrw6vRuFB2bAZhoQPlpyfvbxJKGQRPZ+NXA==
X-Received: by 2002:a17:906:3297:b0:9a5:ceab:f496 with SMTP id 23-20020a170906329700b009a5ceabf496mr4081120ejw.58.1694679668430;
        Thu, 14 Sep 2023 01:21:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709065ac500b00993664a9987sm647322ejs.103.2023.09.14.01.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:21:07 -0700 (PDT)
Message-ID: <05b9b252-653c-7cf7-9b96-59d9f662b81e@redhat.com>
Date:   Thu, 14 Sep 2023 10:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Content-Language: en-US, nl
To:     "Wu, Wentong" <wentong.wu@intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
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
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
References: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
 <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
 <a3b75e11-9cf0-4ee3-be90-fba73bd5df3d@suse.com>
 <DM6PR11MB43162A9B2AC68B2686BBE2598DF7A@DM6PR11MB4316.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM6PR11MB43162A9B2AC68B2686BBE2598DF7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/14/23 03:05, Wu, Wentong wrote:
>> From: Oliver Neukum <oneukum@suse.com>
>>
>> On 13.09.23 03:40, Wentong Wu wrote:
>>
>>> +struct ljca_bank_descriptor {
>>> +	u8 bank_id;
>>> +	u8 pin_num;
>>> +
>>> +	/* 1 bit for each gpio, 1 means valid */
>>> +	u32 valid_pins;
>>
>> No endianness?
> 
> On both sides, the endianness is same.

Right, but normally USB drivers are also written so that they can work on big-endian CPUs.

I realize that this driver will likely never be used with a big-endian CPU but still it is good practice to make the driver work on big-endian CPUs too. Even if it is just to set a good example when other drivers copy the code.

So this should be:

struct ljca_bank_descriptor {
	u8 bank_id;
	u8 pin_num;

	/* 1 bit for each gpio, 1 means valid */
	__le32 valid_pins;
} __packed;

And then when reading valid_pins you should use:

	u32 valid_pins = get_unaligned_le32(&ljca_bank_descriptor.valid_pins);

On x86_64 the compiler should optimize all of this away to
just a regular read.

Regards,

Hans



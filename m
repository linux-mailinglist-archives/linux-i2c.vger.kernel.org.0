Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485B27CA0B4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 09:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbjJPHgU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 03:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjJPHgU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 03:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF525E1
        for <linux-i2c@vger.kernel.org>; Mon, 16 Oct 2023 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697441730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W5sTI1b2MESB7gMCaMCVhRQAJarvVq2SnKhZxnWdEek=;
        b=TCSR9afmr824sCZ9+ktqorcXf9K7JHX1uXYH2xgSki94U10tdIcA8y1FfOqm4ZcsL9j3vU
        lcoYZ8/9PZw47cXowi2hJhYjRJGk/ex8sRO8nB4JS06oFPu6mTm0bALUH+++ymrOZRHq7R
        gnMU7NoSEGuLpwHc7O6RuO7i+6Hj7kw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-fKxSrf_dMq6oJgauKTfS1Q-1; Mon, 16 Oct 2023 03:35:29 -0400
X-MC-Unique: fKxSrf_dMq6oJgauKTfS1Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9b98bbf130cso281306666b.2
        for <linux-i2c@vger.kernel.org>; Mon, 16 Oct 2023 00:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441728; x=1698046528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5sTI1b2MESB7gMCaMCVhRQAJarvVq2SnKhZxnWdEek=;
        b=gYykBDaP6CFSGAm4rw1yOA75nsRUz9z/w3UUIOTpax9BcdyhwYVVOhWo0fcKBK4Ppq
         y0dIrF5Z4Zm9gxtzylf8xD3MIll6uxAPCvVc/LJhZFVo01Zu6PBNy0qJKVm7nsa09TBp
         ZmB0eMoZxD9QmmIaCOvAJt9eWXTmteexHrfAX/x94CRaU5jFiw6KZeS3VJtyDjG8EpOh
         IpQ39pfGfulwlw2QNoqL5X/02ty275/G6/Mv9utPyd2MNuTsFwlejDcXC3dKNmageh8C
         RC8ZbIcBnXDQ9a9gHuzqPuAszIdTahZJU9M9YlSxRgVF2WnRGY/Lkx212GQeRxTQZPGR
         G2nw==
X-Gm-Message-State: AOJu0YwQxiLk57gYfVHZ4Gyl3Dwi0JWOvmhHymRpMWKdRH+lS4FyOdvT
        TU9sWRBToB+EjClKQSlTzKtDWkQwBCYeFh/whS/4Trq9YPGZAHuQzeS9zI4rU0lzPjGJ7pY/xbt
        INYqlVgrAI8O32GOzx2XP
X-Received: by 2002:a17:907:608e:b0:9be:ef46:6b9c with SMTP id ht14-20020a170907608e00b009beef466b9cmr5011485ejc.70.1697441728140;
        Mon, 16 Oct 2023 00:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPHQgkWUS0nO8Kux/hwaHjzzpGovdcAU2gG2lS6RZujLr93I17prloU1tE+4cFr6DLZW5kGw==
X-Received: by 2002:a17:907:608e:b0:9be:ef46:6b9c with SMTP id ht14-20020a170907608e00b009beef466b9cmr5011469ejc.70.1697441727791;
        Mon, 16 Oct 2023 00:35:27 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906529600b0099c53c4407dsm3490401ejm.78.2023.10.16.00.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:35:26 -0700 (PDT)
Message-ID: <9810930b-dd76-9b1d-fb63-87a7a6059d0b@redhat.com>
Date:   Mon, 16 Oct 2023 09:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
To:     "Wu, Wentong" <wentong.wu@intel.com>,
        "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/16/23 07:52, Wu, Wentong wrote:
>> From: Hans de Goede <hdegoede>
>>
>> Hi Andy,
>>
>> On 10/13/23 22:05, Shevchenko, Andriy wrote:
>>> On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:
>>
>> <snip>
>>
>>>> Ah ok, I see. So the code:
>>>>
>>>> 1. First tries to find the matching child acpi_device for the auxdev
>>>> by ADR
>>>>
>>>> 2. If 1. fails then falls back to HID + UID matching
>>>>
>>>> And there are DSDTs which use either:
>>>>
>>>> 1. Only use _ADR to identify which child device is which, like the example
>>>>    DSDT snippet from the commit msg.
>>>>
>>>> 2. Only use _HID + _UID like the 2 example DSDT snippets from me
>>>> email
>>>>
>>>> But there never is a case where both _ADR and _HID are used at the
>>>> same time (which would be an ACPI spec violation as Andy said).
>>>>
>>>> So AFAICT there is no issue here since  _ADR and _HID are never user
>>>> at the same time and the commit message correctly describes scenario
>>>> 1. from above, so the commit message is fine too.
>>>>
>>>> So I believe that we can continue with this patch series in its
>>>> current v20 form, which has already been staged for going into -next
>>>> by Greg.
>>>>
>>>> Andy can you confirm that moving ahead with the current version is ok
>>>> ?
>>>
>>> Yes as we have a few weeks to fix corner cases.
>>>
>>> What I'm worrying is that opening door for _ADR that seems never used
>>> is kinda an overkill here (resolving non-existing problem).
>>
>> I assume that there actually some DSDTs using the _ADR approach and that this
>> support is not there just for fun.
> 
> right, it's not for fun, we use _ADR here is to reduce the maintain effort because
> currently it defines _HID for every new platform and the drivers have to be updated
> accordingly, while _ADR doesn't have that problem.

Hmm, this sounds to me like _ADR is currently not actually being used in any
shipping DSDTs ?

Adding support for it to the driver seems a bit premature then IMHO ?

Also HIDs can perfectly be re-used for compatible hardware in
a newer generation so that is really not a good argument to use _ADR
instead.

Regards,

Hans



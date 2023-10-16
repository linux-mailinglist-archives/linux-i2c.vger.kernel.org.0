Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD3D7CB140
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 19:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbjJPRVM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 13:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbjJPRVF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 13:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBBEA7
        for <linux-i2c@vger.kernel.org>; Mon, 16 Oct 2023 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697476822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IB8ijEdDwJemoPTssoo1rbFdLIyoQawFS03Tg5RD9fQ=;
        b=HZc/JTankE+lWC8WPpMmNGtvpnI5USQJZ5JLRSZ/X5LEYnuhQy39GjlpBmPxw3EZ6eLZAd
        lGpR/OrCfWT0DXftNrVxnMvRWh5u88wNyXZNeHEaPeeed9J+oAn9hKI2qNlMUowW9gzXvW
        p6mhZgGBLQvj8KO5760q+wtjJc8/MnU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-NSIJd-HRMVa0pjQEzVjQYQ-1; Mon, 16 Oct 2023 13:20:20 -0400
X-MC-Unique: NSIJd-HRMVa0pjQEzVjQYQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9adc78b386cso64796966b.0
        for <linux-i2c@vger.kernel.org>; Mon, 16 Oct 2023 10:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476819; x=1698081619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IB8ijEdDwJemoPTssoo1rbFdLIyoQawFS03Tg5RD9fQ=;
        b=UY2Bb+aiVTnLDeIy02xOiuHcJh3FY6BDbrMwC635BbqyI/wPUiO7fIeUcW4b+8c6vO
         D+TzIFl6Blu/kMvu6KvkEN09ARqweLj903LZz2ayWNuHcYtFWkjtUKCkMmVLBrsR8Yg4
         tVHPgk7e8PHJlogVjk8INEISQkWe+adMrRT567+HIQDSi3soCXyR3ZMGhsvhF9fX7sLx
         dUbF1fPgsHCPM2xsDgJrefD0SuouvVKV1w6eR+ezaa1wBtHbEq/7eFuod7y4A3ACMvhd
         xN/6JDbtLfkPXAsXfAtHDcCESJXunxmYSoU7Rg0Y95T07r4gBx2nIfZIsXIl9AFgHLrL
         VmAw==
X-Gm-Message-State: AOJu0Yyt4TZQCsSofP6LRcDem2OWferwWOtqadovv9Ad2B3j2rv8ajS/
        Iw9/HUw8Dw8yJAdh6kr+8mayRljQRW/gXJmdTjPEjOcUCdgYl/uwM+oKol7lEsKMKgcvAdN10TX
        hzNanYhnZ+ijcJI0VAwdM
X-Received: by 2002:a17:906:4fc7:b0:9be:dce3:6e07 with SMTP id i7-20020a1709064fc700b009bedce36e07mr5538508ejw.32.1697476819511;
        Mon, 16 Oct 2023 10:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyQXWWwAP/eW5eefiiR9ndnCb91EORwxQ3opyiCWlj496ZaVbyT5HGgZWO9aC83VCWTOXj4A==
X-Received: by 2002:a17:906:4fc7:b0:9be:dce3:6e07 with SMTP id i7-20020a1709064fc700b009bedce36e07mr5538478ejw.32.1697476819117;
        Mon, 16 Oct 2023 10:20:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r20-20020a1709062cd400b009ad8084e08asm4363084ejr.0.2023.10.16.10.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 10:20:18 -0700 (PDT)
Message-ID: <5747b78e-1956-8249-8f5e-85426b3efd01@redhat.com>
Date:   Mon, 16 Oct 2023 19:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
To:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>,
        "Wu, Wentong" <wentong.wu@intel.com>
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
References: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
 <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023101653-shiftless-scorebook-19e3@gregkh>
 <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZS1fSPhfREVlELLD@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZS1fSPhfREVlELLD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/16/23 18:05, Shevchenko, Andriy wrote:
> On Mon, Oct 16, 2023 at 06:44:21PM +0300, Wu, Wentong wrote:
>>> From: gregkh@linuxfoundation.org
>>> On Mon, Oct 16, 2023 at 03:05:09PM +0000, Wu, Wentong wrote:
>>>>> From: Shevchenko, Andriy
>>>>> On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:
> 
> ...
> 
>>>>> But this does not confirm if you have such devices. Moreover, My
>>>>> question about _CID per function stays the same. Why firmware is not using
>>> it?
>>>>
>>>> Yes, both _ADR and _CID can stop growing list in the driver. And for
>>>> _ADR, it also only require one ID per function. I don't know why BIOS
>>>> team doesn't select _CID, but I have suggested use _ADR internally,
>>>> and , to make things moving forward, the driver adds support for _ADR here
>>> first.
>>>>
>>>> But you're right, _CID is another solution as well, we will discuss it
>>>> with firmware team more.
>>>
>>> Should I revert this series now until this gets sorted out?
>>
>> Current _ADR support is a solution, I don't think _CID is better than _ADR to both
>> stop growing list in driver and support the shipped hardware at the same time.
>>
>> Andy, what's your idea? 
> 
> In my opinion if _CID can be made, it's better than _ADR. As using _ADR like
> you do is a bit of grey area in the ACPI specification. I.o.w. can you get
> a confirmation, let's say, from Microsoft, that they will go your way for other
> similar devices?
> 
> Btw, Microsoft has their own solution actually using _ADR for the so called
> "wired" USB devices. Is it your case? If so, I'm not sure why _HID has been
> used from day 1...
> 
> Also I suggest to wait for Hans' opinion on the topic.

I definitely don't think we should revert the entire series since this
supports actual hw which has already been shipping for years.

But if the _ADR support is only there to support future hw and
it is not even certain yet that that future hw is actually going
to be using _ADR support then I believe that a follow-up patch
to drop _ADR support for now is in order. We can then re-introduce
it (revert the follow up patch) if future hw actually starts
using _ADR support.

Specifically what I'm suggesting is something like the following:

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c9decd0396d4..e1bbaf964786 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -457,8 +457,8 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
 				  u64 adr, u8 id)
 {
 	struct ljca_match_ids_walk_data wd = { 0 };
-	struct acpi_device *parent, *adev;
 	struct device *dev = adap->dev;
+	struct acpi_device *parent;
 	char uid[4];
 
 	parent = ACPI_COMPANION(dev);
@@ -466,17 +466,7 @@ static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
 		return;
 
 	/*
-	 * get auxdev ACPI handle from the ACPI device directly
-	 * under the parent that matches _ADR.
-	 */
-	adev = acpi_find_child_device(parent, adr, false);
-	if (adev) {
-		ACPI_COMPANION_SET(&auxdev->dev, adev);
-		return;
-	}
-
-	/*
-	 * _ADR is a grey area in the ACPI specification, some
+	 * Currently LJCA hw does not use _ADR instead current
 	 * platforms use _HID to distinguish children devices.
 	 */
 	switch (adr) {

As a follow-up patch to the existing series.

Regards,

Hans



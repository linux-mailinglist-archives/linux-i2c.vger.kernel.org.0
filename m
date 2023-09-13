Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF51C79E0CE
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 09:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbjIMH1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 03:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238595AbjIMH1Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 03:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE2E31982
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 00:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694589994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y+z/VJVoCY4LZ35ZR0Mzw7V+/Zr+JLFHRkK2GVRV/EU=;
        b=H6G2hxDhPZ+V42FIiik7O5Do1+sUM56OT2gXPhFn74B7mMpzCxMOcvaI0hOvx6Wq3tNxWf
        wG5LbC2BVykx3pYSJdqPulAfR8lbL3SLl4Eu3Acj8VsfluJokY/ftYrcrm5hnCXo6y2eXv
        Kid1hjgrp8J1N0O6zdt5ivhySyDqQCM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-QDEQixXMPV6xlUXOvLY2LQ-1; Wed, 13 Sep 2023 03:26:32 -0400
X-MC-Unique: QDEQixXMPV6xlUXOvLY2LQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a9e12a3093so95962966b.0
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 00:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694589991; x=1695194791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+z/VJVoCY4LZ35ZR0Mzw7V+/Zr+JLFHRkK2GVRV/EU=;
        b=pvp2hn7pGgo/bdBcWJJ+5c4S19an4SY/X2fxqhPlhRvgg4z8wi+fcyrQPs4wULQkUS
         TkKu/+HGC6q3xGVGsUCu98zSn7oCGDe46VyM3jp5WMwhoKPaKikQa3howHz7CowKOPym
         ynVGpSjXdHk5SlUg47FBonO5UM9uogcV3hejLvt1ljxdBeF1JKaGoDbToAy18nBOJL9Z
         LcNg/Hy9wNV8N/cPrMcoTRNnUSHgszIPz8GXmdWUptSEv6esM7XCx3JQlMX5Gco3pxBO
         pPIRBkIHYA61kZAKwTXmvYhdgjuljPRfHG6aHXI5GdOrjbrYjN8lNpfy0UPSAgKP5GKD
         02ZA==
X-Gm-Message-State: AOJu0YwzcL0Y8jVjba6tS9uL1NMJDLeW126+TbRkkDQvqorlLjnmO53q
        o1/hnS6a+Sytxm6TT+Uq6FsADAvaAlf9Fdzw9yyXXIE/8beFF1msr7kISfUTwvM7XQmXXBUuLdV
        TCWlNrci5WJPGHbz9BzhS4QUnurbW
X-Received: by 2002:a17:906:3150:b0:9ad:a46c:66a2 with SMTP id e16-20020a170906315000b009ada46c66a2mr892530eje.11.1694589991111;
        Wed, 13 Sep 2023 00:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFZiNOK2Yzq5Yl/6Ha26/Um8kT7PCaxJDRjRJvq8ELbAzF48q+8/IwCFhaHoaB1/6hRAFoIw==
X-Received: by 2002:a17:906:3150:b0:9ad:a46c:66a2 with SMTP id e16-20020a170906315000b009ada46c66a2mr892499eje.11.1694589990725;
        Wed, 13 Sep 2023 00:26:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v14-20020a17090690ce00b0099c53c44083sm7923202ejw.79.2023.09.13.00.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:26:30 -0700 (PDT)
Message-ID: <764de5af-d589-9c43-be02-a9934eb9044b@redhat.com>
Date:   Wed, 13 Sep 2023 09:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 1/4] usb: Add support for Intel LJCA device
To:     kernel test robot <lkp@intel.com>,
        Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     oe-kbuild-all@lists.linux.dev, zhifeng.wang@intel.com
References: <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
 <202309131427.AUBwVNBm-lkp@intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202309131427.AUBwVNBm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/13/23 08:12, kernel test robot wrote:
> Hi Wentong,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on wsa/i2c/for-next]
> [also build test WARNING on broonie-spi/for-next linus/master v6.6-rc1 next-20230912]
> [cannot apply to usb/usb-testing usb/usb-next usb/usb-linus]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/usb-Add-support-for-Intel-LJCA-device/20230913-094239
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
> patch link:    https://lore.kernel.org/r/1694569212-10080-2-git-send-email-wentong.wu%40intel.com
> patch subject: [PATCH v16 1/4] usb: Add support for Intel LJCA device
> config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309131427.AUBwVNBm-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131427.AUBwVNBm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309131427.AUBwVNBm-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/usb/misc/usb-ljca.c: In function 'ljca_match_device_ids':
>    drivers/usb/misc/usb-ljca.c:389:27: error: implicit declaration of function 'acpi_device_uid'; did you mean 'dmi_device_id'? [-Werror=implicit-function-declaration]
>      389 |         const char *uid = acpi_device_uid(adev);
>          |                           ^~~~~~~~~~~~~~~
>          |                           dmi_device_id
>>> drivers/usb/misc/usb-ljca.c:389:27: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    drivers/usb/misc/usb-ljca.c:391:13: error: implicit declaration of function 'acpi_match_device_ids'; did you mean 'ljca_match_device_ids'? [-Werror=implicit-function-declaration]
>      391 |         if (acpi_match_device_ids(adev, wd->ids))
>          |             ^~~~~~~~~~~~~~~~~~~~~
>          |             ljca_match_device_ids
>    drivers/usb/misc/usb-ljca.c: In function 'ljca_auxdev_acpi_bind':
>    drivers/usb/misc/usb-ljca.c:429:16: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
>      429 |         adev = acpi_find_child_device(parent, adr, false);
>          |                ^~~~~~~~~~~~~~~~~~~~~~
>          |                acpi_match_device
>>> drivers/usb/misc/usb-ljca.c:429:14: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      429 |         adev = acpi_find_child_device(parent, adr, false);
>          |              ^
>    drivers/usb/misc/usb-ljca.c:458:9: error: implicit declaration of function 'acpi_dev_for_each_child'; did you mean 'device_for_each_child'? [-Werror=implicit-function-declaration]
>      458 |         acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>          |         device_for_each_child
>    cc1: some warnings being treated as errors

Ok, so this need to have a "depends on ACPI" added to its Kconfig
entry. There are other ways to fix it, but this driver will not
be functional without ACPI anyways so "depends on ACPI" seems
to be the best solution for this.

Regards,

Hans





> vim +389 drivers/usb/misc/usb-ljca.c
> 
>    385	
>    386	static int ljca_match_device_ids(struct acpi_device *adev, void *data)
>    387	{
>    388		struct ljca_match_ids_walk_data *wd = data;
>  > 389		const char *uid = acpi_device_uid(adev);
>    390	
>    391		if (acpi_match_device_ids(adev, wd->ids))
>    392			return 0;
>    393	
>    394		if (!wd->uid)
>    395			goto match;
>    396	
>    397		if (!uid)
>    398			uid = "0";
>    399		else
>    400			uid = strchr(uid, wd->uid[0]);
>    401	
>    402		if (!uid || strcmp(uid, wd->uid))
>    403			return 0;
>    404	
>    405	match:
>    406		wd->adev = adev;
>    407	
>    408		return 1;
>    409	}
>    410	
>    411	/* bind auxiliary device to acpi device */
>    412	static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
>    413					  struct auxiliary_device *auxdev,
>    414					  u64 adr, u8 id)
>    415	{
>    416		struct ljca_match_ids_walk_data wd = { 0 };
>    417		struct acpi_device *parent, *adev;
>    418		struct device *dev = adap->dev;
>    419		char uid[4];
>    420	
>    421		parent = ACPI_COMPANION(dev);
>    422		if (!parent)
>    423			return;
>    424	
>    425		/*
>    426		 * get auxdev ACPI handle from the ACPI device directly
>    427		 * under the parent that matches _ADR.
>    428		 */
>  > 429		adev = acpi_find_child_device(parent, adr, false);
>    430		if (adev) {
>    431			ACPI_COMPANION_SET(&auxdev->dev, adev);
>    432			return;
>    433		}
>    434	
>    435		/*
>    436		 * _ADR is a grey area in the ACPI specification, some
>    437		 * platforms use _HID to distinguish children devices.
>    438		 */
>    439		switch (adr) {
>    440		case LJCA_GPIO_ACPI_ADR:
>    441			wd.ids = ljca_gpio_hids;
>    442			break;
>    443		case LJCA_I2C1_ACPI_ADR:
>    444		case LJCA_I2C2_ACPI_ADR:
>    445			snprintf(uid, sizeof(uid), "%d", id);
>    446			wd.uid = uid;
>    447			wd.ids = ljca_i2c_hids;
>    448			break;
>    449		case LJCA_SPI1_ACPI_ADR:
>    450		case LJCA_SPI2_ACPI_ADR:
>    451			wd.ids = ljca_spi_hids;
>    452			break;
>    453		default:
>    454			dev_warn(dev, "unsupported _ADR\n");
>    455			return;
>    456		}
>    457	
>    458		acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
>    459		if (wd.adev) {
>    460			ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
>    461			return;
>    462		}
>    463	
>    464		parent = ACPI_COMPANION(dev->parent->parent);
>    465		if (!parent)
>    466			return;
>    467	
>    468		acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
>    469		if (wd.adev)
>    470			ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
>    471	}
>    472	
> 


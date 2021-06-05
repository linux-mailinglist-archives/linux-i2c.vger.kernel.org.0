Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3AAD39CB9F
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 01:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhFEXJx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Jun 2021 19:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhFEXJw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Jun 2021 19:09:52 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BA5C061766;
        Sat,  5 Jun 2021 16:08:04 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f17so7541328wmf.2;
        Sat, 05 Jun 2021 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XWQOeDNetl8UqnHPJUQjjvOHA7LNu8Ic6TyUbdOorqs=;
        b=oUDh7JiDO9mrLvD61KvsDx0GFNTAXwpE+Ch5LrxM86ifXgveP3JG94hrc+fldZUAQC
         hJfu8LGpFHLffvN2fHZA1toSHHzPlFRw+SKq45jrBI+1v3wLXp0reM9l4G4ZzxLua1qP
         81hyKfbsyFcMRgWnE/bJr0fTa9c3Ze3/Fczg0tg9KBh42O5baQ55OG0K3u88NS85OQbq
         wYEXupbbKfQWHEgcyiCZxq3ZXYFs9/D1TPHOg4JZ5iGplwLhDNshek6FAh3sahfe9eNH
         11SUZIenfH+NWWoPScGa/+ht1jysI0nkOv7MvIypdzxrrK2vPY+7P3+QhOR+yl8WVU1z
         OV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XWQOeDNetl8UqnHPJUQjjvOHA7LNu8Ic6TyUbdOorqs=;
        b=BHU2FOK2b0anLKxhK11ents7rTWAoZe1JouggSTEIiQWWPdtMy66sXa7ooAtPNpqtT
         iARxRQ4JkXzjTkb2C4ADtdrb/wHzOQhmaRIKpuwT92UgB1Aa3DWYTn52tpVWUI61pAvD
         zO+e/Qgkd/p30Cm/qm8baTGDBhg2KhKQ8tQpverlO/po4aKdFkFvphTGpQHi1i+tjSg2
         1eNs4TKekenFDGedcgq886CyzfoOEoSE+yt/QaXQXeO0vFqtVv1xOHxNHycS2P6EOcW0
         koF72Gq3JH2lzitviXzfvdU8zV7xfgE6mZdDxaNlLDapEMH9boom2LoeCe/V1LOPqZMK
         pQhQ==
X-Gm-Message-State: AOAM5323r4Q69MpNYkn6w3/CtECQiTUcGJ9q8Jw/NgEoKDNLzLtHOFY6
        jdBIE2Al/yqwms5ZqpiBG6c=
X-Google-Smtp-Source: ABdhPJw6+lZPeYszBUn8aMQkKy6foGfI99/ILAywZKofFSvRh4OwezEb5re6agR0nLf9aArqwNBvEg==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr10019551wmf.182.1622934478325;
        Sat, 05 Jun 2021 16:07:58 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.84])
        by smtp.gmail.com with ESMTPSA id q11sm9561009wmq.1.2021.06.05.16.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 16:07:57 -0700 (PDT)
Subject: Re: [PATCH v5 5/6] platform/x86: Add intel_skl_int3472 driver
To:     kernel test robot <lkp@intel.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     kbuild-all@lists.01.org
References: <20210603224007.120560-6-djrscally@gmail.com>
 <202106040951.xabRueHQ-lkp@intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <68dcb60a-be0b-9bb6-b661-03a629e52f70@gmail.com>
Date:   Sun, 6 Jun 2021 00:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <202106040951.xabRueHQ-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ah - forgot to make the function static, let me sent another of this patch.

On 04/06/2021 02:31, kernel test robot wrote:
> Hi Daniel,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on pm/linux-next]
> [also build test WARNING on lee-mfd/for-mfd-next linus/master v5.13-rc4 next-20210603]
> [cannot apply to gpio/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-intel_skl_int3472-module/20210604-064345
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/3edcad8c200f211063a35d125e9fd350a2efeb40
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Daniel-Scally/Introduce-intel_skl_int3472-module/20210604-064345
>         git checkout 3edcad8c200f211063a35d125e9fd350a2efeb40
>         # save the attached .config to linux build tree
>         make W=1 ARCH=x86_64 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c:76:5: warning: no previous prototype for 'skl_int3472_tps68470_calc_type' [-Wmissing-prototypes]
>       76 | int skl_int3472_tps68470_calc_type(struct acpi_device *adev)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/skl_int3472_tps68470_calc_type +76 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
>
>     52	
>     53	/** skl_int3472_tps68470_calc_type: Check what platform a device is designed for
>     54	 * @adev: A pointer to a &struct acpi_device
>     55	 *
>     56	 * Check CLDB buffer against the PMIC's adev. If present, then we check
>     57	 * the value of control_logic_type field and follow one of the
>     58	 * following scenarios:
>     59	 *
>     60	 *	1. No CLDB - likely ACPI tables designed for ChromeOS. We
>     61	 *	create platform devices for the GPIOs and OpRegion drivers.
>     62	 *
>     63	 *	2. CLDB, with control_logic_type = 2 - probably ACPI tables
>     64	 *	made for Windows 2-in-1 platforms. Register pdevs for GPIO,
>     65	 *	Clock and Regulator drivers to bind to.
>     66	 *
>     67	 *	3. Any other value in control_logic_type, we should never have
>     68	 *	gotten to this point; fail probe and return.
>     69	 *
>     70	 * Return:
>     71	 * * 1		Device intended for ChromeOS
>     72	 * * 2		Device intended for Windows
>     73	 * * -EINVAL	Where @adev has an object named CLDB but it does not conform to
>     74	 *		our expectations
>     75	 */
>   > 76	int skl_int3472_tps68470_calc_type(struct acpi_device *adev)
>     77	{
>     78		struct int3472_cldb cldb = { 0 };
>     79		int ret;
>     80	
>     81		/*
>     82		 * A CLDB buffer that exists, but which does not match our expectations
>     83		 * should trigger an error so we don't blindly continue.
>     84		 */
>     85		ret = skl_int3472_fill_cldb(adev, &cldb);
>     86		if (ret && ret != -ENODEV)
>     87			return ret;
>     88	
>     89		if (ret)
>     90			return DESIGNED_FOR_CHROMEOS;
>     91	
>     92		if (cldb.control_logic_type != 2)
>     93			return -EINVAL;
>     94	
>     95		return DESIGNED_FOR_WINDOWS;
>     96	}
>     97	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

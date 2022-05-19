Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD64552D2B0
	for <lists+linux-i2c@lfdr.de>; Thu, 19 May 2022 14:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237954AbiESMlQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 May 2022 08:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236881AbiESMlP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 May 2022 08:41:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B8E3B2A3;
        Thu, 19 May 2022 05:41:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 73A89B82434;
        Thu, 19 May 2022 12:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57723C385AA;
        Thu, 19 May 2022 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652964071;
        bh=IC7k35yTUbFsK9sQWyeactLranscV3EhpTyayySJUts=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=L3/PXWIYGaPIiGuzwK6IzFr9ckd905FCP9DocqZRGsgyMg0lYBCNlUiOV5Jetht/T
         N04qqc6uyrDt1Je1fZBl2v6NcwAVJc31f28YX63HP6WXLyHCMqhfe1o2yToAXAyMWX
         lNUwDbv4raPxdnpb+bB47w7DRXgpDCnW5suK0ju6ccMTkWTNNCvWmnMcTveVDLpiVN
         fmwbZyW5b20a0io9+lUE6m4tlu9OYdrvS4APhHBHuMIAgT9BAsVu2l7+m1KeOfUpCc
         gH/KpaIByoXdwRsiIEnAHtctfhGiMOMcbRxji9cjTsaL+bJAAoAkKWiFgE3APa3huD
         tnZueCK3cLwYQ==
Message-ID: <d9b6a240-3af2-e921-6c59-40bf169f423f@kernel.org>
Date:   Thu, 19 May 2022 07:41:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] i2c: designware: introduce a custom scl recovery for
 SoCFPGA platforms
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220518202217.85803-1-dinguyen@kernel.org>
 <YoYaA5iTin3rzuob@smile.fi.intel.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <YoYaA5iTin3rzuob@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/19/22 05:20, Andy Shevchenko wrote:
> On Wed, May 18, 2022 at 03:22:16PM -0500, Dinh Nguyen wrote:
>> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
>> thus cannot be recovered by the default method of by doing a GPIO access.
>> Only a reset of the I2C IP block can a recovery be successful.
> 
> ...
> 
>>   #define MODEL_BAIKAL_BT1	BIT(9)
>>   #define MODEL_AMD_NAVI_GPU	BIT(10)
>> +#define MODEL_SOCFPGA		BIT(11)
> 
> ...
> 
>> -#define MODEL_MASK		GENMASK(11, 8)
> 
>> +#define MODEL_MASK		GENMASK(12, 8)
> 
> Why this change is made?

Sorry, mistake here..will remove.

> 
> ...
> 
>> +	switch (dev->flags & MODEL_MASK) {
>> +	case MODEL_SOCFPGA:
>> +		rinfo->recover_bus = i2c_custom_scl_recovery;
> 
> _custom_ is too broad, use exact name, i.e.
> 
> 	i2c_socfpga_scl_recovery
> 

Ok

>> +		break;
>> +	default:
>> +		rinfo->recover_bus = i2c_generic_scl_recovery;
>> +		break;
>> +	}
> 
> ...
> 
>> +	{ .compatible = "intel,socfpga-i2c", .data = (void *)MODEL_SOCFPGA },
> 
>> +
> 
> Stray change.

Will fix...

Thanks for the review!

Dinh
> 

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E282C99DD
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 09:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbgLAIrC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 03:47:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgLAIrC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 03:47:02 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0837BC0613CF;
        Tue,  1 Dec 2020 00:46:22 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r3so1371088wrt.2;
        Tue, 01 Dec 2020 00:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=a9Yz4EamC4dgi6fKIVTGyhZQWgOK381EdypTSdD0mPY=;
        b=OJY69vaIsojTi7SIOQM7tMldgXhjzktFjtr/RsqN3AFlhmoglWbyYC470YrVRYB/7o
         9t1+G9Qv9P7CtY88qLGwqEhRpoG4PzRT3rkgghNnsW7wbUNjnsJ/15KCajFQ3+tKeKL1
         2sqP93Rc1LcSYR3+MStRMBeNCpHMZyrB7M4J+gkzJnja362WPxS+AtP67hA5Yr1P3Zji
         Nue+Pl7F7j7h0VKh9I/YZhCMe8SczaVDEbq4IFeCAFhVNe0Gngqrl27PEK5qJlFpD+Iv
         03JG+qjLBkouZ2tF/ATaF8f0p6KwUlRExT5f9CCy4/kGx9lSE+s2liKy/SBGpyVaiLMq
         VGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=a9Yz4EamC4dgi6fKIVTGyhZQWgOK381EdypTSdD0mPY=;
        b=NIdvb2J4WRYVELREE1o8alv24CzI/fEheeyv1qsVyWSYFN8iHEwJP8HuOqiciKpJA/
         OVw1PILKNj1wS6+USF0afKdiNGyI1yHzbVwr7QtA+2xg87hP4olMMrY05I8DHFVse9Py
         ORa5F0DdWemgu3DYcRn2aWyEUUYldi7PMnV7K0T82lxWRwu2TluJu5VvvHHMta9JAGXb
         6L0E53TTIoXEwtiYSlK8uLBVURsTgotJ16zeZmSccv2gFOVufCdF7ZmYMGkazhf0T2LL
         Y8eIrup/B/Y2LvoCr9uotK0tE0NC7NTwnzB3ktBPZG2qrQcrqA0zX2KMJYbNhEt5L7XK
         Lh/w==
X-Gm-Message-State: AOAM5318fT8bEbapCBEH5wCSaoZH5IPAZPRaJB+3vnmsT4PpuXN0dIb4
        z70j3sf/j1oj91ordVO+nIk=
X-Google-Smtp-Source: ABdhPJyKMVTe84MZnEwR1mkSqgxzXmZV+8YQVqAYMRkyJc+fP59HhFEnaoWqUhGv6WWr93SPt0UrSg==
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr2390087wrr.69.1606812380608;
        Tue, 01 Dec 2020 00:46:20 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id m4sm1587855wmi.41.2020.12.01.00.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 00:46:19 -0800 (PST)
Subject: Re: [PATCH 01/18] property: Return true in fwnode_device_is_available
 for node types that do not implement this operation
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-2-djrscally@gmail.com>
 <7da1d242-b32a-58f5-e50b-15441730aa0f@linux.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <b1909613-38ac-7a5b-aced-c8090d645af8@gmail.com>
Date:   Tue, 1 Dec 2020 08:46:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7da1d242-b32a-58f5-e50b-15441730aa0f@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bingbu

On 01/12/2020 03:12, Bingbu Cao wrote:
> Daniel, thanks for your patch.
>
> On 11/30/20 9:31 PM, Daniel Scally wrote:
>> Some types of fwnode_handle do not implement the device_is_available()
>> check, such as those created by software_nodes. There isn't really a
>> meaningful way to check for the availability of a device that doesn't
>> actually exist, so if the check isn't implemented just assume that the
>> "device" is present.
>>
>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since RFC v3:
>>
>> 	patch introduced
>>
>>  drivers/base/property.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/base/property.c b/drivers/base/property.c
>> index 4c43d30145c6..a5ca2306796f 100644
>> --- a/drivers/base/property.c
>> +++ b/drivers/base/property.c
>> @@ -785,9 +785,14 @@ EXPORT_SYMBOL_GPL(fwnode_handle_put);
>>  /**
>>   * fwnode_device_is_available - check if a device is available for use
>>   * @fwnode: Pointer to the fwnode of the device.
>> + *
>> + * For fwnode node types that don't implement the .device_is_available()
>> + * operation, this function returns true.
>>   */
>>  bool fwnode_device_is_available(const struct fwnode_handle *fwnode)
>>  {
>> +	if (!fwnode_has_op(fwnode, device_is_available))
>> +		return true;
> blank line here?
Sure thing - I'll add one in
>>  	return fwnode_call_bool_op(fwnode, device_is_available);
>>  }
>>  EXPORT_SYMBOL_GPL(fwnode_device_is_available);
>>

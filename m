Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2E62CC9D3
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 23:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgLBWpV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 17:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbgLBWpU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 17:45:20 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F56EC0617A7;
        Wed,  2 Dec 2020 14:44:40 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id o1so5817946wrx.7;
        Wed, 02 Dec 2020 14:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J1EYaKTOxHEPIJNJ7pibKYyR+9iMWnUn0M2uXnd5zzo=;
        b=QT4JNbL5dMABnK0DxvhV0va66rw5jV8k3EeRgjQ1HVoLTR6X1HsTOwmNkcYgRbJroe
         +KCGnP3znxQLN4hzTwFH90FO1hKncK20mUKcunVp/bPv8vb+BNcQtMuJEElM0OF9UUQe
         CMZJ9BLJhi/Efc6Hl1/46bksNUANPQ67SunLZxmodUju3x4Jw7opgoBGFFgR3Y6E4j3z
         Wt/IhPywWx6+seDsdv5optgY3Wg6DvRUw/MwZn2Z3gF7slvWs+/pckzbFb1Ui7+lxmSG
         QwWTafOo4At6RH5vYs628QHvfkW9Y3CoHV+uocq2BFkqsvrV03fxrtvxFvqCVMXEr186
         mpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J1EYaKTOxHEPIJNJ7pibKYyR+9iMWnUn0M2uXnd5zzo=;
        b=E3rk0EoqVoWYbpGvqh0318Z39bZ4EHRGzFhix70RT1xD83w2zg2EA3pTvObQrcHfah
         X47N7JgMq2LaUQTQDWzejBBblthzSuV0yElMn5FXgsecxPVqH/kXcvCI8RjHxsTWxzlN
         5nzaUEU0sfIJIp8/4IkfDYCVjXvxdQTtKcHlXruEAMFDmFFB7VwQLYzaqwzhfHacdkyo
         F50gYuiBLEAV7h31E7WXLLUPeSn0XNtSwa4b8aoNc6TUKD6ru33dN/PEv2QYfWWximWg
         zKXNMwmgi54oo7uXCDodyMpeL9sJS04HqbFcjgfCR/X17pVC1zO0TMOhJBu/12jdgLqY
         UDsA==
X-Gm-Message-State: AOAM530h1wWtjEDSVaJQXNWNTl9inyuoPiXziPeyJgWF9ucJMNmiDwQL
        gvz9+YJL6sOnxANNarjNXt0=
X-Google-Smtp-Source: ABdhPJwW3fv1tudIl8fd84zHTUgFFrnwMIWXPNXtiRLJVhsLCUjWtQ/KVVjWzzeucnimmPY6PdvhNg==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr353537wrs.100.1606949079256;
        Wed, 02 Dec 2020 14:44:39 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id o67sm258331wmo.31.2020.12.02.14.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 14:44:38 -0800 (PST)
Subject: Re: [PATCH 15/18] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
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
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-16-djrscally@gmail.com>
 <20201130171116.GO14465@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <30414f42-fdf4-c4f3-6a41-3da9f105a7a1@gmail.com>
Date:   Wed, 2 Dec 2020 22:44:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130171116.GO14465@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/11/2020 17:11, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Mon, Nov 30, 2020 at 01:31:26PM +0000, Daniel Scally wrote:
>> Some places in the kernel allow users to map resources to a device
>> using device name (for example, gpiod_lookup_table). Currently
>> this involves waiting for the i2c_client to have been registered so we
>> can use dev_name(&client->dev). Adding this function means that we can
>> achieve the same thing without having to wait to the i2c device.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since RFC v3:
>>
>> 	- Patch introduced
>>
>>  drivers/i2c/i2c-core-acpi.c | 14 ++++++++++++++
>>  include/linux/i2c.h         |  5 +++++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
>> index 37c510d9347a..d3a653eac79e 100644
>> --- a/drivers/i2c/i2c-core-acpi.c
>> +++ b/drivers/i2c/i2c-core-acpi.c
>> @@ -497,6 +497,20 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>>  }
>>  EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
>>  
>> +/**
>> + * i2c_acpi_dev_name - Construct i2c device name for devs sourced from ACPI
>> + * @adev:     ACPI device to construct the name for
>> + *
>> + * Prefixes "i2c-" to the ACPI device name, for use in i2c_dev_set_name() and
>> + * also anywhere else in the kernel that needs to refer to an i2c device by
>> + * name but before they have been instantiated.
> 
> The documentation should state that the caller must free the return
> value.

Updated to include that - thanks

>> + */
>> +char *i2c_acpi_dev_name(struct acpi_device *adev)
>> +{
>> +	return kasprintf(GFP_KERNEL, "i2c-%s", acpi_dev_name(adev));
>> +}
>> +EXPORT_SYMBOL_GPL(i2c_acpi_dev_name);
>> +
>>  #ifdef CONFIG_ACPI_I2C_OPREGION
>>  static int acpi_gsb_i2c_read_bytes(struct i2c_client *client,
>>  		u8 cmd, u8 *data, u8 data_len)
>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>> index 56622658b215..ab0e505b2ca6 100644
>> --- a/include/linux/i2c.h
>> +++ b/include/linux/i2c.h
>> @@ -995,6 +995,7 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>>  u32 i2c_acpi_find_bus_speed(struct device *dev);
>>  struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>>  				       struct i2c_board_info *info);
>> +char *i2c_acpi_dev_name(struct acpi_device *adev);
>>  struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
>>  #else
>>  static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>> @@ -1011,6 +1012,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>>  {
>>  	return ERR_PTR(-ENODEV);
>>  }
>> +static inline char *i2c_acpi_dev_name(struct acpi_device *adev)
>> +{
>> +	return NULL;
>> +}
>>  static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
>>  {
>>  	return NULL;
> 


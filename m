Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EFA2CB11A
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 00:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgLAXup (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 18:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgLAXuo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 18:50:44 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F1AC0613D4;
        Tue,  1 Dec 2020 15:50:03 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id k14so5714043wrn.1;
        Tue, 01 Dec 2020 15:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cejZv8dXO0K8s5BRzKgKRotoP/hMF8X1h5C7NM6FSLs=;
        b=TgqKWTWzp6r6GiMe1b8dCjPozIRCG4CqiLfxL6gBroITESHdmRjmIggkl2Ouglm6U7
         /Qp6NdvV8aB2TMsLB050OmABj3wK3xycwZCPyPDOfwy712deXRelyg38MFEDrJVSp75u
         /w4LE3uhBtZe1H6RJbePd5TiyOXfLHzvJhbnvlDD7PkfvGM+ooR0S1jhCZSJwwsCOfpu
         WugkV73JtCsW4jPQdjm/J9ky5jr6Y2elb91I/hAVzViaTqTB8CMLbrRMZYOB/T0qB1J3
         j5h8b8Ilu7UlUD3cAOSXh9OY+ZJaQcmltJwB7sT0ECZTDHcuD1MtDahUFjVNQNKgxeLi
         sQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cejZv8dXO0K8s5BRzKgKRotoP/hMF8X1h5C7NM6FSLs=;
        b=pYl+mUdyExNETZu/NOiB+UcZn5CVqZLD4vzkTYvZkpKdJ1+bCriCF82NmEQ+Pk5gw7
         Vi/OLACNpx866/EquBNA7nHs6TSx3Qrov+kYHadL24FA9+Dhnfa3lZx26Uaj2x2OfDq1
         fNT6TEo8E7G1e7NEaqDIpR3btr4stpwR+XF7NCTl3W+RlhgP/mQcE6HJzbC/VP1rf4F+
         mRMg5LBSrWYCmFNiHhriqnzFOMAPrVgwohoZ3iUlXuG2+QS93E6FglzH8vtD8tkJ+PS6
         mtTTHYY/dDtQR6760K0ZDQPgqOFEzNbBtyAsue+R7GvQg8GyEBjYNDH39NBwb4vnhWrv
         ZJuQ==
X-Gm-Message-State: AOAM533FVrFaibWHfS/oJNlHJXx45Zw5H56hRwiHi/kMusNfO353uesN
        wV3jcSE+31dDIcq1M8SK2SA=
X-Google-Smtp-Source: ABdhPJzpF6N/3c/AICdkU4bORXN9A9EuPbMMw346RlYRVLhomqOQgONCxH+RJmYctuTEUjn4Ui4yyA==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr6795614wre.135.1606866602623;
        Tue, 01 Dec 2020 15:50:02 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id f17sm72452wmh.10.2020.12.01.15.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 15:50:01 -0800 (PST)
Subject: Re: [PATCH 16/18] i2c: i2c-core-base: Use the new i2c_acpi_dev_name()
 in i2c_set_dev_name()
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
 <20201130133129.1024662-17-djrscally@gmail.com>
 <20201130171241.GP14465@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <b220ba01-893f-ef24-9a41-96af0c1abb20@gmail.com>
Date:   Tue, 1 Dec 2020 23:50:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130171241.GP14465@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/11/2020 17:12, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Mon, Nov 30, 2020 at 01:31:27PM +0000, Daniel Scally wrote:
>> From: Dan Scally <djrscally@gmail.com>
>>
>> To make sure the new i2c_acpi_dev_name() always reflects the name of i2c
>> devices sourced from ACPI, use it in i2c_set_dev_name().
>>
>> Signed-off-by: Dan Scally <djrscally@gmail.com>
> 
> I'd squash this with 15/18, which would make it clear there's a memory
> leak :-)

Ah - that was sloppy...switched from devm_ and forgot to go fix that.
I'll add the kfree into i2c_unregister_device() and squash to 15/18

>> ---
>> Changes since RFC v3:
>>
>> 	- Patch introduced
>>
>>  drivers/i2c/i2c-core-base.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 573b5da145d1..a6d4ceb01077 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -814,7 +814,7 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
>>  	}
>>  
>>  	if (adev) {
>> -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
>> +		dev_set_name(&client->dev, i2c_acpi_dev_name(adev));
>>  		return;
>>  	}
>>  
> 


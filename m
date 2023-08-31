Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA0778F4D8
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 23:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347628AbjHaVuK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 17:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjHaVuI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 17:50:08 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B00DB8
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 14:50:05 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9467686146;
        Thu, 31 Aug 2023 23:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693518603;
        bh=4rqIRrndNCunEEBLy0+2Moi41hZxBDmNeTRG5z0B7T4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OTUGy9D0jymkVkFFX3JDxWPewwU8ULR7Onw/sbFTNv7+UuuqziIeAooRYovBB7JIR
         kKqZsYXhiWuqYo5HKMoSZ6pMwvX4dRYTMpKjhyD2EDn+ClLGGqP4YMDo2vdXXmqjq+
         kj5Mk36vaCRK94az3XOlm/1BYNqIRAGlMRSaEK4Lb5B558Zr8/bBUT7WH93Dkk1IOQ
         JfKhh1nOcba6eaVf7MgEeGbMIINRbcJYWJsHuJXA5t2bmj9L3NQSrF/heX7hKkF8tW
         n7OXPoXyxskg2EUvHO+B9f7sgkLjBUJXdEC4tGkGB25oMY7J3gZbQYBO2/eK+lhhay
         MxYo4Bw4gpcvQ==
Message-ID: <8df4003e-41b8-0ec7-0706-77641bdcd6a5@denx.de>
Date:   Thu, 31 Aug 2023 23:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] i2c: mux: pca954x: Make sure the mux remains
 configured the same as before resume
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
References: <20230831181753.154787-1-marex@denx.de>
 <0d768c94-604e-7fa3-21b4-65598e30edf4@axentia.se>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <0d768c94-604e-7fa3-21b4-65598e30edf4@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/31/23 23:24, Peter Rosin wrote:
> Hi!

Hi,

> 2023-08-31 at 20:17, Marek Vasut wrote:
>> The current implementation of pca954x_init() rewrites content of data->last_chan
>> which is then populated into the mux select register. Skip this part, so that the
>> mux is populated with content of data->last_chan as it was set before suspend.
>> This way, the mux state is retained across suspend/resume cycle.
> 
> I fail to see in what situation this change makes a significant
> difference? For me, it's a nice conservative thing to initialize
> to the default state after something comparatively heavy such as
> a suspend/resume cycle. If there is a significant difference,
> then maybe it's not the usual access patterns after resume since
> there are probably other chips initializing as well, in which
> case this change might make things worse depending on what
> devices you do have and what idle-state you have configured.

Isn't it better to keep the hardware in the same state it was before it 
entered suspend ? For me, that's the behavior I would expect from 
suspend/resume .

>> Fixes: e65e228eb096 ("i2c: mux: pca954x: support property idle-state")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Peter Rosin <peda@axentia.se>
>> Cc: Wolfram Sang <wsa@kernel.org>
>> Cc: linux-i2c@vger.kernel.org
>> ---
>>   drivers/i2c/muxes/i2c-mux-pca954x.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
>> index 2219062104fbc..97cf475dde0f4 100644
>> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
>> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
>> @@ -620,9 +620,9 @@ static int pca954x_resume(struct device *dev)
>>   	struct pca954x *data = i2c_mux_priv(muxc);
>>   	int ret;
>>   
>> -	ret = pca954x_init(client, data);
>> +	ret = i2c_smbus_write_byte(client, data->last_chan);
>>   	if (ret < 0)
>> -		dev_err(&client->dev, "failed to verify mux presence\n");
>> +		dev_err(&client->dev, "failed to restore mux state\n");
> 
> data->last_chan is no longer cleared in case the write fails. Is that a
> problem?

If the write fails here, the hardware is in undefined state anyway .
Either the next attempt to flip the switch would help bring it back, or, 
the system is in undefined state.

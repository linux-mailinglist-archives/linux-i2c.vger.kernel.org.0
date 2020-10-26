Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BDC299FAA
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Oct 2020 01:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441451AbgJ0AXo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Oct 2020 20:23:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:59472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410303AbgJZXyF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Oct 2020 19:54:05 -0400
Received: from [192.168.0.244] (118-211-2-196.tpgi.com.au [118.211.2.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E972420B1F;
        Mon, 26 Oct 2020 23:54:01 +0000 (UTC)
Subject: Re: [PATCH 2/2] i2c: imx: remove id_table entry
To:     Krzysztof Kozlowski <krzk@kernel.org>, peng.fan@nxp.com
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
 <20201023152842.GA5227@kozik-lap>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <e9dd314f-8bb4-f5f5-3dae-9bd4574ff20d@linux-m68k.org>
Date:   Tue, 27 Oct 2020 09:53:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023152842.GA5227@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 24/10/20 1:28 am, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2020 at 04:18:23PM +0800, peng.fan@nxp.com wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> The legacy platform device code has been removed under arch/arm/mach-imx,
>> so we no need id_table entry here.
> 
> Cc: Greg, Geert, Angelo,
> 
> Aren't you breaking Coldfire platforms?

Well spotted Krzysztof. It is used by quite a few of the ColdFire parts.

Regards
Greg


> Best regards,
> Krzysztof
> 
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>   drivers/i2c/busses/i2c-imx.c | 14 --------------
>>   1 file changed, 14 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index ba9d639223ec..7ea36a78abb0 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -233,19 +233,6 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
>>   
>>   };
>>   
>> -static const struct platform_device_id imx_i2c_devtype[] = {
>> -	{
>> -		.name = "imx1-i2c",
>> -		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
>> -	}, {

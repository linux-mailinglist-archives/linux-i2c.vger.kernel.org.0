Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229DB1AB53F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 03:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgDPBKx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 21:10:53 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:10479 "EHLO
        cmccmta3.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgDPBKv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 21:10:51 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee95e97b0821fe-732a6; Thu, 16 Apr 2020 09:10:26 +0800 (CST)
X-RM-TRANSID: 2ee95e97b0821fe-732a6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.146.139] (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e97b08104b-9e65a;
        Thu, 16 Apr 2020 09:10:26 +0800 (CST)
X-RM-TRANSID: 2ee65e97b08104b-9e65a
Subject: Re: [PATCH] i2c: drivers: Omit superfluous error message
 inefm32_i2c_probe()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     wsa@the-dreams.de, o.rempel@pengutronix.de, ardb@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200415135734.14660-1-tangbin@cmss.chinamobile.com>
 <20200415142225.pxstqwyqvj7ayd6m@pengutronix.de>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <9948c5c2-fbdd-4782-8fae-1eccb03e5c85@cmss.chinamobile.com>
Date:   Thu, 16 Apr 2020 09:12:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415142225.pxstqwyqvj7ayd6m@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe:

On 2020/4/15 22:22, Uwe Kleine-König wrote:
> Hello,
>
> On Wed, Apr 15, 2020 at 09:57:34PM +0800, Tang Bin wrote:
>> In the function efm32_i2c_probe(),when get irq failed,the function
>> platform_get_irq() logs an error message,so remove redundant message
>> here.
> adding a space after each comma seems usual style.
Got it, I will notice. Whether should I submit v2 for this problems? Thanks.
>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
> Usually the Sign-off of the sender comes last. How is Shengju Zhang
> involved with this patch?
Got it, I will notice next time. Thanks.
>> diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
>> index a8c6323e7..4de31fae7 100644
>> --- a/drivers/i2c/busses/i2c-efm32.c
>> +++ b/drivers/i2c/busses/i2c-efm32.c
>> @@ -352,7 +352,6 @@ static int efm32_i2c_probe(struct platform_device *pdev)
>>   
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret <= 0) {
>> -		dev_err(&pdev->dev, "failed to get irq (%d)\n", ret);
> The change looks fine.

Thanks,

Tang Bin

>



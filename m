Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8341BBD40
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 14:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgD1MPw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 08:15:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60006 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgD1MPv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 08:15:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03SCFbpt072985;
        Tue, 28 Apr 2020 07:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588076137;
        bh=IuxjdxK7NasDcszeJelN8aR/wUlRIl8nDCnQAwJveeI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xbzojtDsYfeF8zrUaJvvzeetksYTpcJs3x2C6TBwT0506nGn+a3tmd1xI3BzE6gqz
         RurWcfwxPlEDG6SUWDwLbQ5vBRbppRPiP+udIOOx8chn3kwp6VUCj9Nc0LMCVknSa2
         4lha9/mAYOTqXhvfLN1jliMOtmpHYKzwhJU+a31o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03SCFahW034748
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Apr 2020 07:15:36 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 07:15:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 07:15:36 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03SCFVOQ078450;
        Tue, 28 Apr 2020 07:15:33 -0500
Subject: Re: [PATCH v14 2/2] i2c: core: support bus regulator controlling in
 adapter
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
 <20200428061813.27072-3-bibby.hsieh@mediatek.com>
 <e3583893-f49d-0e78-6414-ed565099af63@ti.com>
 <CAAFQd5DEuYWzZz=SeOTjJg_vxaYdYuf_vw-UFVMRYDBKxdtL0A@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <f6f59d2e-68cd-e51d-bf7f-d5665c56b61b@ti.com>
Date:   Tue, 28 Apr 2020 15:15:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DEuYWzZz=SeOTjJg_vxaYdYuf_vw-UFVMRYDBKxdtL0A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 28/04/2020 14:44, Tomasz Figa wrote:
> On Tue, Apr 28, 2020 at 1:25 PM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>>
>>
>>
>> On 28/04/2020 09:18, Bibby Hsieh wrote:
>>> Although in the most platforms, the bus power of i2c
>>> are alway on, some platforms disable the i2c bus power
>>> in order to meet low power request.
>>>
>>> We get and enable bulk regulator in i2c adapter device.
>>>
>>> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
>>> ---
>>>    drivers/i2c/i2c-core-base.c | 82 +++++++++++++++++++++++++++++++++++++
>>>    include/linux/i2c.h         |  2 +
>>>    2 files changed, 84 insertions(+)
>>>
>>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>>> index 5cc0b0ec5570..f81b42a4ed07 100644
>>> --- a/drivers/i2c/i2c-core-base.c
>>> +++ b/drivers/i2c/i2c-core-base.c
>>> @@ -313,6 +313,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>>>    static int i2c_device_probe(struct device *dev)
>>>    {
>>>        struct i2c_client       *client = i2c_verify_client(dev);
>>> +     struct i2c_adapter      *adap = client->adapter;
>>>        struct i2c_driver       *driver;
>>>        int status;
>>>
>>> @@ -378,6 +379,12 @@ static int i2c_device_probe(struct device *dev)
>>>
>>>        dev_dbg(dev, "probe\n");
>>>
>>> +     status = regulator_enable(adap->bus_regulator);
>>> +     if (status < 0) {
>>> +             dev_err(&adap->dev, "Failed to enable power regulator\n");
>>> +             goto err_clear_wakeup_irq;
>>> +     }
>>> +
>>
>> Sry, but this is confusing.
>> What if there is separate regulators for I2C device and bus/adapter?
>>
>> I2C bus is transaction based and usually I2C bus drivers ensures that i2c bus is
>> in proper state to perform transaction. While I2C devices can be enable, configured and
>> function without actually interacting with I2C bus unless required (irq for example).
>>
>> With you change any I2C device will enable and keep bus regulator on all the time it's active
>> even if there is no I2C interruptions.
> 
> The I2C SDA/SCL lines must stay high for all the time the bus is idle.
> The regulator in question here is exactly the regulator that drives
> the voltage rail the SDA/SCL lines are pulled up to and so it needs to
> be enabled all the time any slave device is active and expects the I2C
> bus to be in a valid state.
> 
>>
>> Following the problem description it seems
>>    - i2c bus driver should get regulator and ensure it's enabled for the duration of transaction(s)
> 
> That's not necessary given the point below, because the slave driver
> must not trigger any I2C transactions when the slave device is not
> active.
> 
>>    - i2c device should get its own regulator (or the same if shared)  ensure it's enabled for
>>      the period device is active.
> 
> This is a board design aspect and not specific to any particular I2C
> slave device, so slave drivers should not be aware of it. This patch
> exactly attempts to get this SDA/SCL regulator on behalf of the slave
> device.

Thank you for your explanation.



-- 
Best regards,
grygorii

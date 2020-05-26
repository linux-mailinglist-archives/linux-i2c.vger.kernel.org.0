Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E551C1E2993
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 20:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgEZSDo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 14:03:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40288 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgEZSDo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 14:03:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QI3R99037944;
        Tue, 26 May 2020 13:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590516207;
        bh=tWqL+sUPJTZ2h8BHQyEb5vjm1K8M7Eltv+SurxkGaOI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SScriLeCaWmFID1v89DUtFyhpICeE/polFmzw+1U6dkT4UqSQfpxI4h74jMkXQqQi
         VfpPqsD77EG17+kZq3lAUWgfUpzXSjXF/5G4y/9zNp8qDEhX4Mv5eKh4/1HYNf1Edn
         QChXE1YZr3FDPIEJK9FzKdZQAnHHyxF9G4977mh4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QI3RoX042692
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 13:03:27 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 13:03:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 13:03:26 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QI3NY3016763;
        Tue, 26 May 2020 13:03:24 -0500
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in
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
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com>
 <952995ec-0865-d8ff-e285-522705fa9709@ti.com>
 <CAAFQd5Bx=zgsUAg7fA2jfsV_yFyPmnotTWEBEr2V3Nn5HO8qQQ@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <543950fa-83c0-9d3d-e64a-068be2368717@ti.com>
Date:   Tue, 26 May 2020 21:03:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Bx=zgsUAg7fA2jfsV_yFyPmnotTWEBEr2V3Nn5HO8qQQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 25/05/2020 14:34, Tomasz Figa wrote:
> Hi Grygorii,
> 
> On Fri, May 22, 2020 at 7:59 PM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>>
>>
>>
>> On 19/05/2020 10:27, Bibby Hsieh wrote:
>>> Although in the most platforms, the bus power of i2c
>>> are alway on, some platforms disable the i2c bus power
>>> in order to meet low power request.
>>>
>>> We get and enable bulk regulator in i2c adapter device.
>>>
>>> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
>>> ---
>>>    drivers/i2c/i2c-core-base.c | 84 +++++++++++++++++++++++++++++++++++++
>>>    include/linux/i2c.h         |  2 +
>>>    2 files changed, 86 insertions(+)
>>>
>>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>>> index 5cc0b0ec5570..e1cc8d46bc51 100644
>>> --- a/drivers/i2c/i2c-core-base.c
>>> +++ b/drivers/i2c/i2c-core-base.c
>>> @@ -313,12 +313,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>>>    static int i2c_device_probe(struct device *dev)
>>>    {
>>>        struct i2c_client       *client = i2c_verify_client(dev);
>>> +     struct i2c_adapter      *adap;
>>>        struct i2c_driver       *driver;
>>>        int status;
>>>
>>>        if (!client)
>>>                return 0;
>>>
>>> +     adap = client->adapter;
>>>        driver = to_i2c_driver(dev->driver);
>>>
>>>        client->irq = client->init_irq;
>>> @@ -378,6 +380,12 @@ static int i2c_device_probe(struct device *dev)
>>>
>>>        dev_dbg(dev, "probe\n");
>>>
>>> +     status = regulator_enable(adap->bus_regulator);
>>> +     if (status < 0) {
>>> +             dev_err(&adap->dev, "Failed to enable power regulator\n");
>>> +             goto err_clear_wakeup_irq;
>>> +     }
>>> +
>>>        status = of_clk_set_defaults(dev->of_node, false);
>>>        if (status < 0)
>>>                goto err_clear_wakeup_irq;
>>> @@ -414,12 +422,14 @@ static int i2c_device_probe(struct device *dev)
>>>    static int i2c_device_remove(struct device *dev)
>>>    {
>>>        struct i2c_client       *client = i2c_verify_client(dev);
>>> +     struct i2c_adapter      *adap;
>>>        struct i2c_driver       *driver;
>>>        int status = 0;
>>>
>>>        if (!client || !dev->driver)
>>>                return 0;
>>>
>>> +     adap = client->adapter;
>>>        driver = to_i2c_driver(dev->driver);
>>>        if (driver->remove) {
>>>                dev_dbg(dev, "remove\n");
>>> @@ -427,6 +437,8 @@ static int i2c_device_remove(struct device *dev)
>>>        }
>>>
>>>        dev_pm_domain_detach(&client->dev, true);
>>> +     if (!pm_runtime_status_suspended(&client->dev))
>>> +             regulator_disable(adap->bus_regulator);
>>
>> Not sure this check is correct.
>>
>> i2c_device_probe()
>>    - regulator_enable - 1
>>
>> pm_runtime_get()
>>    - regulator_enable - 2
>>
> 
> I believe regulator_enable() wouldn't be called again, because the
> device was already active in probe. However, I've been having
> difficulties keeping track of runtime PM semantics under various
> circumstances (e.g. ACPI vs DT), so can't tell for sure anymore.

True.

I've found pretty useful:
  - CONFIG_PM_ADVANCED_DEBUG
  - bind/unbind
for such testing.

for regulators - num_users can be checked.


> 
>> i2c_device_remove()
>>    - pm_runtime_status_suspended() flase
>>      - regulator_disable() - 1 --> still active?
>>
>> Sorry, I probably missing smth.
>>
>>>
>>>        dev_pm_clear_wake_irq(&client->dev);
>>>        device_init_wakeup(&client->dev, false);
>>> @@ -438,6 +450,72 @@ static int i2c_device_remove(struct device *dev)
>>>        return status;
>>>    }
>>>
>>
>> [...]
>>
>> --
>> Best regards,
>> grygorii

-- 
Best regards,
grygorii

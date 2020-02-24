Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35EC716B3F5
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 23:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgBXW25 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 17:28:57 -0500
Received: from mga12.intel.com ([192.55.52.136]:35898 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgBXW25 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 17:28:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 14:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,481,1574150400"; 
   d="scan'208";a="437858293"
Received: from rjwysock-mobl1.ger.corp.intel.com (HELO [10.249.154.101]) ([10.249.154.101])
  by fmsmga006.fm.intel.com with ESMTP; 24 Feb 2020 14:28:53 -0800
Subject: Re: [PATCH v10 4/4] i2c: core: support bus regulator controlling in
 adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
 <20200116025637.3524-5-bibby.hsieh@mediatek.com>
 <CAAFQd5Bh9dUuu2fzxQSyuyRrEvN5o8PBqPCUTdrC5btN2Q1HVw@mail.gmail.com>
 <CAAFQd5DtnBhGV-VemTwudm7K-UtFsGg99YGuD-cyR93u0OAPuA@mail.gmail.com>
 <1582255353.19370.2.camel@mtksdaap41>
From:   "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Organization: Intel Technology Poland Sp. z o. o., KRS 101882, ul. Slowackiego
 173, 80-298 Gdansk
Message-ID: <b11d1b1a-5d00-3200-6779-e54a828915f9@intel.com>
Date:   Mon, 24 Feb 2020 23:28:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1582255353.19370.2.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/21/2020 4:22 AM, Bibby Hsieh wrote:
> Hi, Rafael,
>
> I'm Sorry to bother you.
>
> I'm not sure if you receive our email...
> So I re-sent this email to your another email.

I actually have not realized that there was a question directly for me 
in this thread.


> On Mon, 2020-02-17 at 18:45 +0900, Tomasz Figa wrote:
>> Hi Rafael,
>>
>> On Tue, Jan 28, 2020 at 4:31 PM Tomasz Figa <tfiga@chromium.org> wrote:
>>> Hi Rafael,
>>>
>>> On Thu, Jan 16, 2020 at 11:56 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>>>> Although in the most platforms, the bus power of i2c
>>>> are alway on, some platforms disable the i2c bus power
>>>> in order to meet low power request.
>>>>
>>>> We get and enable bulk regulator in i2c adapter device.
>>>>
>>>> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
>>>> ---
>>>>   drivers/i2c/i2c-core-base.c | 81 +++++++++++++++++++++++++++++++++++++
>>>>   include/linux/i2c.h         |  3 ++
>>>>   2 files changed, 84 insertions(+)
>>>>
>>> I posted some comments in a separate reply [1] and Wolfram confirmed
>>> that he's fine with the approach [2]. Would you have some time to take
>>> a look from the PM point of view? Thanks.
>>>
>>> [1] https://patchwork.ozlabs.org/patch/1223991/#2350984
>>> [2] https://patchwork.ozlabs.org/patch/1223991/#2351032
>>>
>>> Please let me know if you want me to CC you directly on any of those replies.
>> Would you have a few minutes to take a look at this?
>>
>> Thanks,
>> Tomasz
>>
>>> Best regards,
>>> Tomasz
>>>
>>>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>>>> index 9333c865d4a9..9b9e96b094ca 100644
>>>> --- a/drivers/i2c/i2c-core-base.c
>>>> +++ b/drivers/i2c/i2c-core-base.c
>>>> @@ -306,6 +306,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>>>>   static int i2c_device_probe(struct device *dev)
>>>>   {
>>>>          struct i2c_client       *client = i2c_verify_client(dev);
>>>> +       struct i2c_adapter      *adap = client->adapter;
>>>>          struct i2c_driver       *driver;
>>>>          int status;
>>>>
>>>> @@ -371,6 +372,12 @@ static int i2c_device_probe(struct device *dev)
>>>>
>>>>          dev_dbg(dev, "probe\n");
>>>>
>>>> +       status = regulator_enable(adap->bus_reg);
>>>> +       if (status != 0) {
>>>> +               dev_err(&adap->dev, "Failed to enable power regulator\n");
>>>> +               goto err_clear_wakeup_irq;
>>>> +       }
>>>> +
>>>>          status = of_clk_set_defaults(dev->of_node, false);
>>>>          if (status < 0)
>>>>                  goto err_clear_wakeup_irq;
>>>> @@ -407,6 +414,7 @@ static int i2c_device_probe(struct device *dev)
>>>>   static int i2c_device_remove(struct device *dev)
>>>>   {
>>>>          struct i2c_client       *client = i2c_verify_client(dev);
>>>> +       struct i2c_adapter      *adap = client->adapter;
>>>>          struct i2c_driver       *driver;
>>>>          int status = 0;
>>>>
>>>> @@ -420,6 +428,8 @@ static int i2c_device_remove(struct device *dev)
>>>>          }
>>>>
>>>>          dev_pm_domain_detach(&client->dev, true);
>>>> +       if (!pm_runtime_status_suspended(&adap->dev))
>>>> +               regulator_disable(adap->bus_reg);
>>>>
>>>>          dev_pm_clear_wake_irq(&client->dev);
>>>>          device_init_wakeup(&client->dev, false);
>>>> @@ -431,6 +441,71 @@ static int i2c_device_remove(struct device *dev)
>>>>          return status;
>>>>   }
>>>>
>>>> +#ifdef CONFIG_PM_SLEEP
>>>> +static int i2c_resume(struct device *dev)
>>>> +{
>>>> +       struct i2c_client *client = i2c_verify_client(dev);
>>>> +       struct i2c_adapter *adap = client->adapter;
>>>> +       int err;
>>>> +
>>>> +       if (pm_runtime_status_suspended(&adap->dev)) {

In general, this is racy, because the RPM status of the device may 
change while it is running unless there are specific reasons why that 
cannot happen.

It generally is better to do such checks at the "early resume" and 
(analogously) "late suspend" stages when RPM is disabled.

>>>> +               err = regulator_enable(adap->bus_reg);
>>>> +               if (err)
>>>> +                       return err;
>>>> +       }
>>>> +
>>>> +       return pm_generic_resume(dev);
>>>> +}
>>>> +
>>>> +static int i2c_suspend(struct device *dev)
>>>> +{
>>>> +       struct i2c_client *client = i2c_verify_client(dev);
>>>> +       struct i2c_adapter *adap = client->adapter;
>>>> +       int err;
>>>> +
>>>> +       if (!pm_runtime_status_suspended(&adap->dev)) {
>>>> +               err = regulator_disable(adap->bus_reg);
>>>> +               if (err)
>>>> +                       return err;
>>>> +       }
>>>> +
>>>> +       return pm_generic_suspend(dev);
>>>> +}
>>>> +#endif
>>>> +
>>>> +#ifdef CONFIG_PM
>>>> +static int i2c_runtime_resume(struct device *dev)
>>>> +{
>>>> +       struct i2c_client *client = i2c_verify_client(dev);
>>>> +       struct i2c_adapter *adap = client->adapter;
>>>> +       int err;
>>>> +
>>>> +       err = regulator_enable(adap->bus_reg);
>>>> +       if (err)
>>>> +               return err;
>>>> +
>>>> +       return pm_generic_runtime_resume(dev);
>>>> +}
>>>> +
>>>> +static int i2c_runtime_suspend(struct device *dev)
>>>> +{
>>>> +       struct i2c_client *client = i2c_verify_client(dev);
>>>> +       struct i2c_adapter *adap = client->adapter;
>>>> +       int err;
>>>> +
>>>> +       err = pm_generic_runtime_suspend(dev);
>>>> +       if (err)
>>>> +               return err;
>>>> +
>>>> +       return regulator_disable(adap->bus_reg);
>>>> +}
>>>> +#endif
>>>> +
>>>> +static const struct dev_pm_ops i2c_device_pm = {
>>>> +       SET_SYSTEM_SLEEP_PM_OPS(i2c_suspend, i2c_resume)
>>>> +       SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
>>>> +};
>>>> +
>>>>   static void i2c_device_shutdown(struct device *dev)
>>>>   {
>>>>          struct i2c_client *client = i2c_verify_client(dev);
>>>> @@ -488,6 +563,7 @@ struct bus_type i2c_bus_type = {
>>>>          .probe          = i2c_device_probe,
>>>>          .remove         = i2c_device_remove,
>>>>          .shutdown       = i2c_device_shutdown,
>>>> +       .pm             = &i2c_device_pm,
>>>>   };
>>>>   EXPORT_SYMBOL_GPL(i2c_bus_type);
>>>>
>>>> @@ -1351,6 +1427,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>>>>                  goto out_reg;
>>>>
>>>>          dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
>>>> +       adap->bus_reg = devm_regulator_get(&adap->dev, "bus");
>>>> +       if (IS_ERR(adap->bus_reg)) {
>>>> +               res = PTR_ERR(adap->bus_reg);
>>>> +               goto out_reg;
>>>> +       }
>>>>
>>>>          pm_runtime_no_callbacks(&adap->dev);
>>>>          pm_suspend_ignore_children(&adap->dev, true);
>>>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>>>> index d2f786706657..833b81a680da 100644
>>>> --- a/include/linux/i2c.h
>>>> +++ b/include/linux/i2c.h
>>>> @@ -15,6 +15,7 @@
>>>>   #include <linux/device.h>      /* for struct device */
>>>>   #include <linux/sched.h>       /* for completion */
>>>>   #include <linux/mutex.h>
>>>> +#include <linux/regulator/consumer.h>
>>>>   #include <linux/rtmutex.h>
>>>>   #include <linux/irqdomain.h>           /* for Host Notify IRQ */
>>>>   #include <linux/of.h>          /* for struct device_node */
>>>> @@ -330,6 +331,7 @@ struct i2c_client {
>>>>          int init_irq;                   /* irq set at initialization    */
>>>>          int irq;                        /* irq issued by device         */
>>>>          struct list_head detected;
>>>> +
>>>>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>>>>          i2c_slave_cb_t slave_cb;        /* callback for slave mode      */
>>>>   #endif
>>>> @@ -723,6 +725,7 @@ struct i2c_adapter {
>>>>          const struct i2c_adapter_quirks *quirks;
>>>>
>>>>          struct irq_domain *host_notify_domain;
>>>> +       struct regulator *bus_reg;
>>>>   };
>>>>   #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>>>>
>>>> --
>>>> 2.18.0



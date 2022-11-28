Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F101863A654
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 11:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbiK1KsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 05:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiK1KsD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 05:48:03 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 31CD67645;
        Mon, 28 Nov 2022 02:48:01 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8DE6D6E;
        Mon, 28 Nov 2022 02:48:07 -0800 (PST)
Received: from [192.168.99.12] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB7153F73B;
        Mon, 28 Nov 2022 02:47:59 -0800 (PST)
Message-ID: <15170a9f-c600-5700-95ba-4c424b1d2197@foss.arm.com>
Date:   Mon, 28 Nov 2022 10:47:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] i2c: cadence: Fix regression with bus recovery
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "shubhrajyoti.datta@xilinx.com" <shubhrajyoti.datta@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
References: <20221125115103.674756-1-carsten.haitzler@foss.arm.com>
 <BY5PR12MB49026A5C37C25915E6C8A86F81139@BY5PR12MB4902.namprd12.prod.outlook.com>
Content-Language: en-US
From:   Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <BY5PR12MB49026A5C37C25915E6C8A86F81139@BY5PR12MB4902.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 11/28/22 06:24, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
> 
> 
> Hi ,
> Thanks for the patch
> 
>> -----Original Message-----
>> From: carsten.haitzler@foss.arm.com <carsten.haitzler@foss.arm.com>
>> Sent: Friday, November 25, 2022 5:21 PM
>> To: michal.simek@xilinx.com; shubhrajyoti.datta@xilinx.com; linux-arm-
>> kernel@lists.infradead.org; linux-i2c@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Cc: torvalds@linux-foundation.org
>> Subject: [PATCH] i2c: cadence: Fix regression with bus recovery
>>
>> CAUTION: This message has originated from an External Source. Please use
>> proper judgment and caution when opening attachments, clicking links, or
>> responding to this email.
>>
>>
>> From: Carsten Haitzler <carsten.haitzler@arm.com>
>>
>> Commit "i2c: cadence: Add standard bus recovery support" breaks for i2c
>> devices that have no pinctrl defined. There is no requirement for this to exist
>> in the DT. This has worked perfectly well without this before in at least 1 real
>> usage case on hardware (Mali Komeda DPU, Cadence i2c to talk to a tda99xx
>> phy). Adding the requirement to have pinctrl set up in the device tree (or
>> otherwise be found) is a regression where the whole i2c device is lost
>> entirely (in this case dropping entire devices which then leads to the drm
>> display stack unable to find the phy for display output, thus having no drm
>> display device and so on down the chain).
>>
>> This converts the above commit to an enhancement if pinctrl can be found
>> for the i2c device, providing a timeout on read with recovery, but if not, do
>> what used to be done rather than a fatal loss of a device.
>>
>> This restores the mentioned display devices to their working state again.
>>
>> Fixes: 58b924241d0a ("i2c: cadence: Add standard bus recovery support")
>> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
>> ---
>> Note: This issue was discovered during the porting of the linux kernel on
>> Morello [1].
>>
>> [1]
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.
>> morello-
>> project.org%2Fmorello%2Fkernel%2Flinux&amp;data=05%7C01%7Cshubhraj
>> yoti.datta%40amd.com%7C651e141296fb497b6c2e08dacedb65ad%7C3dd896
>> 1fe4884e608e11a82d994e183d%7C0%7C0%7C638049738949855658%7CUnkn
>> own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
>> 1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ny08zTdgJKxXC
>> dwYaCWFS3mwd65LDqFAIYfjao6gO8Y%3D&amp;reserved=0
>> ---
>>   drivers/i2c/busses/i2c-cadence.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-
>> cadence.c
>> index fe0cd205502d..40d0cc6bb996 100644
>> --- a/drivers/i2c/busses/i2c-cadence.c
>> +++ b/drivers/i2c/busses/i2c-cadence.c
>> @@ -852,7 +852,8 @@ static int cdns_i2c_master_xfer(struct i2c_adapter
>> *adap, struct i2c_msg *msgs,
>>                                           CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
>>          if (ret) {
>>                  ret = -EAGAIN;
>> -               i2c_recover_bus(adap);
>> +               if (id->adap.bus_recovery_info)
>> +                       i2c_recover_bus(adap);
>>                  goto out;
>>          }
>>
>> @@ -1262,10 +1263,10 @@ static int cdns_i2c_probe(struct platform_device
>> *pdev)
>>          }
>>
>>          id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
>> -       if (IS_ERR(id->rinfo.pinctrl)) {
>> +       if (IS_ERR(id->rinfo.pinctrl))
>>                  dev_info(&pdev->dev, "can't get pinctrl, bus recovery not
>> supported\n");
>> -               return PTR_ERR(id->rinfo.pinctrl);
>> -       }
>> +       else
>> +               id->adap.bus_recovery_info = &id->rinfo;
> 
> May be we could differentiate between  ENODEV and  other errors.
> As we want to do this for the case when it is not provided.

We could, but just keep in mind this patch is essentially restoring 
behavior on any pinctrl error to previous behavior - so trying to undo 
the regression as strictly as possible.

Certainly checking specifically for ENODEV does fix it for me which is 
the case of no pinctrl. I'll send a v2.

>>          id->membase = devm_platform_get_and_ioremap_resource(pdev, 0,
>> &r_mem);
>>          if (IS_ERR(id->membase))
>> @@ -1283,7 +1284,6 @@ static int cdns_i2c_probe(struct platform_device
>> *pdev)
>>          id->adap.retries = 3;           /* Default retry value. */
>>          id->adap.algo_data = id;
>>          id->adap.dev.parent = &pdev->dev;
>> -       id->adap.bus_recovery_info = &id->rinfo;
>>          init_completion(&id->xfer_done);
>>          snprintf(id->adap.name, sizeof(id->adap.name),
>>                   "Cadence I2C at %08lx", (unsigned long)r_mem->start);
>> --
>> 2.32.0

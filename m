Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAFE55AF59E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 22:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiIFUQ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 16:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiIFUQK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 16:16:10 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E139C0BDE;
        Tue,  6 Sep 2022 13:11:47 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286JVRfp018479;
        Tue, 6 Sep 2022 20:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1i7MgwIWdV/WAsyCG1rmA8ChuPAKx5OiAJgRk23SnWI=;
 b=K6AtN4I8+Sf4NakdNRAd1ht9rKZHN6lhIVX51XxwULxX9j4wTG4N3TvgfViLPzNxug32
 W8QdIPXKu8OSbUJcBPx2S7SV+OfylsaIhR5ACzSvz/8gMU6copNMihCbtIX7seG1hb8j
 zOLWXf5mmfNYftwNuXMRuUrl0u86g3S3frM90wAR/tmwezPgZKfIoqb3qfgJJBcKtyuF
 cRFXg0kRb6BbSiS4VLJreMiz2iOyHhXLIiz2UIZj2uRjNIDhmsmDprKaqFNeIA7UZfLC
 +mEuce9yatXukhhS4NIdTj7u2+cuXJDCJAVd4GabYFGcagFLRDjBbisNdcy5Ek34I0An GA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jecek91fk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:10:51 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286K6Hst018033;
        Tue, 6 Sep 2022 20:10:51 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma05wdc.us.ibm.com with ESMTP id 3jbxj9wmvj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:10:50 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286KAoqm58655100
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 6 Sep 2022 20:10:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 82DA3AC059;
        Tue,  6 Sep 2022 20:10:50 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D18EFAC05B;
        Tue,  6 Sep 2022 20:10:49 +0000 (GMT)
Received: from [9.160.74.237] (unknown [9.160.74.237])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  6 Sep 2022 20:10:49 +0000 (GMT)
Message-ID: <6d777762-9c6e-93fd-5ef4-cb08fae3cab9@linux.ibm.com>
Date:   Tue, 6 Sep 2022 15:10:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] i2c: core: Add mux root adapter operations
Content-Language: en-US
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-iio@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Milton Miller II <miltonm@us.ibm.com>
References: <20220526205334.64114-1-eajames@linux.ibm.com>
 <20220526205334.64114-2-eajames@linux.ibm.com>
 <CACPK8XdVF0qMtkPsk5SEJycLfBVOnk3eo6FBk_75pP+itx2rkw@mail.gmail.com>
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8XdVF0qMtkPsk5SEJycLfBVOnk3eo6FBk_75pP+itx2rkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bPKw9Xzd2xkqB0oqhPIDCbE0h4Qs2aYc
X-Proofpoint-GUID: bPKw9Xzd2xkqB0oqhPIDCbE0h4Qs2aYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060093
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/3/22 03:01, Joel Stanley wrote:
> On Thu, 26 May 2022 at 20:53, Eddie James <eajames@linux.ibm.com> wrote:
>> Some I2C clients need the ability to control the root I2C bus even if the
>> endpoint device is behind a mux. For example, a driver for a chip that
>> can't handle any I2C traffic on the bus while coming out of reset
>> (including an I2C-driven mux switching channels) may need to lock the root
>> bus with the mux selection fixed for the entire time the device is in
>> reset.
>> For this purpose, add a new structure containing two function pointers to
>> the adapter structure. These functions pointers should be defined for
>> every adapter. The lock_select operation, for a mux adapter, locks the
>> parent adpaters up to the root and selects the adapter's channel. The
>> unlock_deselect operation deselects the mux channel and unlocks all the
>> adapters. For a non-mux adapter, the operations lock and unlock the
>> adapters up to the root. This scheme should work with multiple levels of
>> muxes and regular adapters in between.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> I think this looks okay. It was hard to understand at first, but makes
> more sense with the context of the existing bus locking code.
>
> There's a typo in one of your comments that the 0day bot found.
>
> Have you tested with CONFIG_DEBUG_MUTEXES?


Getting back around to this... Yes, I just tested with 
CONFIG_DEBUG_MUTEXES and didn't see any issues.

I will address the comment typo in v2 now.


Thanks,

Eddie


>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>> ---
>>   drivers/i2c/i2c-core-base.c | 38 ++++++++++++++++++++++++++++
>>   drivers/i2c/i2c-mux.c       | 50 +++++++++++++++++++++++++++++++++++++
>>   include/linux/i2c.h         | 42 +++++++++++++++++++++++++++++++
>>   3 files changed, 130 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index d43db2c3876e..e2c365348e1f 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -1357,6 +1357,41 @@ static const struct i2c_lock_operations i2c_adapter_lock_ops = {
>>          .unlock_bus =  i2c_adapter_unlock_bus,
>>   };
>>
>> +/*
>> + * For a non-mux adapter, the lock_select operation locks the chain of
>> + * adapters upwards, returning the root. If there's a mux above this adapter
>> + * somehow, it should also get locked and the desired channel selected.
>> + */
> Recursive lock the set of adaptors.
>
>> +static struct i2c_adapter *i2c_adapter_lock_select(struct i2c_adapter *adapter)
>> +{
>> +       struct i2c_adapter *ret = adapter;
>> +       struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
>> +
>> +       if (parent) {
>> +               ret = parent->mux_root_ops->lock_select(parent);
>> +               if (IS_ERR(ret))
>> +                       return ret;
>> +       }
>> +
>> +       adapter->lock_ops->lock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
>> +       return ret;
>> +}
>> +
>> +static void i2c_adapter_unlock_deselect(struct i2c_adapter *adapter)
>> +{
>> +       struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
>> +
>> +       adapter->lock_ops->unlock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
>> +
>> +       if (parent)
>> +               parent->mux_root_ops->unlock_deselect(parent);
>> +}
>> +
>> +static const struct i2c_mux_root_operations i2c_adapter_mux_root_ops = {
>> +       .lock_select = i2c_adapter_lock_select,
>> +       .unlock_deselect = i2c_adapter_unlock_deselect,
>> +};
>> +
>>   static void i2c_host_notify_irq_teardown(struct i2c_adapter *adap)
>>   {
>>          struct irq_domain *domain = adap->host_notify_domain;
>> @@ -1452,6 +1487,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>>          if (!adap->lock_ops)
>>                  adap->lock_ops = &i2c_adapter_lock_ops;
>>
>> +       if (!adap->mux_root_ops)
>> +               adap->mux_root_ops = &i2c_adapter_mux_root_ops;
>> +
>>          adap->locked_flags = 0;
>>          rt_mutex_init(&adap->bus_lock);
>>          rt_mutex_init(&adap->mux_lock);
>> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
>> index 774507b54b57..c7db770e4198 100644
>> --- a/drivers/i2c/i2c-mux.c
>> +++ b/drivers/i2c/i2c-mux.c
>> @@ -210,6 +210,49 @@ static void i2c_parent_unlock_bus(struct i2c_adapter *adapter,
>>          rt_mutex_unlock(&parent->mux_lock);
>>   }
>>
>> +/*
>> + * For a mux adapter, the lock_select operation first locks just like the
>> + * lock_bus operation. Then it selects the channel for this adapter and
>> + * returns the root adapter. If there is another mux above this one, calling
>> + * the parent lock_select should ensure that the channel is correctly
>> + * selected.
>> + */
>> +static struct i2c_adapter *i2c_mux_lock_select(struct i2c_adapter *adapter)
>> +{
>> +       int ret;
>> +       struct i2c_mux_priv *priv = adapter->algo_data;
>> +       struct i2c_mux_core *muxc = priv->muxc;
>> +       struct i2c_adapter *parent = muxc->parent;
>> +
>> +       rt_mutex_lock_nested(&parent->mux_lock, i2c_adapter_depth(adapter));
>> +
>> +       adapter = parent->mux_root_ops->lock_select(parent);
>> +       if (IS_ERR(adapter))
>> +               return adapter;
>> +
>> +       ret = muxc->select(muxc, priv->chan_id);
>> +       if (ret < 0) {
>> +               parent->mux_root_ops->unlock_deselect(parent);
>> +               rt_mutex_unlock(&parent->mux_lock);
>> +               return ERR_PTR(ret);
>> +       }
>> +
>> +       return adapter;
>> +}
>> +
>> +static void i2c_mux_unlock_deselect(struct i2c_adapter *adapter)
>> +{
>> +       struct i2c_mux_priv *priv = adapter->algo_data;
>> +       struct i2c_mux_core *muxc = priv->muxc;
>> +       struct i2c_adapter *parent = muxc->parent;
>> +
>> +       if (muxc->deselect)
>> +               muxc->deselect(muxc, priv->chan_id);
>> +
>> +       parent->mux_root_ops->unlock_deselect(parent);
>> +       rt_mutex_unlock(&parent->mux_lock);
>> +}
>> +
>>   struct i2c_adapter *i2c_root_adapter(struct device *dev)
>>   {
>>          struct device *i2c;
>> @@ -279,6 +322,11 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
>>          .unlock_bus =  i2c_parent_unlock_bus,
>>   };
>>
>> +static const struct i2c_mux_root_operations i2c_mux_root_ops = {
>> +       .lock_select = i2c_mux_lock_select,
>> +       .unlock_deselect = i2c_mux_unlock_deselect,
>> +};
>> +
>>   int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>                          u32 force_nr, u32 chan_id,
>>                          unsigned int class)
>> @@ -339,6 +387,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>          else
>>                  priv->adap.lock_ops = &i2c_parent_lock_ops;
>>
>> +       priv->adap.mux_root_ops = &i2c_mux_root_ops;
>> +
>>          /* Sanity check on class */
>>          if (i2c_mux_parent_classes(parent) & class)
>>                  dev_err(&parent->dev,
>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>> index fbda5ada2afc..a3596f61b417 100644
>> --- a/include/linux/i2c.h
>> +++ b/include/linux/i2c.h
>> @@ -583,6 +583,26 @@ struct i2c_lock_operations {
>>          void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
>>   };
>>
>> +/**
>> + * struct i2c_mux_root_operations - represent operations to lock and select
>> + * the adapter's mux channel (if a mux is present)
>> + * @lock_select: Get exclusive access to the root I2C bus adapter with the
>> + *   correct mux channel selected for the adapter
>> + * @unlock_deslect: Release exclusive access to the root I2C bus adapter and
>> + *   deselect the mux channel for the adapter
>> + *
>> + * Some I2C clients need the ability to control the root I2C bus even if the
>> + * endpoint device is behind a mux. For example, a driver for a chip that
>> + * can't handle any I2C traffic on the bus while coming out of reset (including
>> + * an I2C-driven mux switching channels) may need to lock the root bus with
>> + * the mux selection fixed for the entire time the device is in reset.
>> + * These operations are for such a purpose.
>> + */
>> +struct i2c_mux_root_operations {
>> +       struct i2c_adapter *(*lock_select)(struct i2c_adapter *adapter);
>> +       void (*unlock_deselect)(struct i2c_adapter *adapter);
>> +};
>> +
>>   /**
>>    * struct i2c_timings - I2C timing information
>>    * @bus_freq_hz: the bus frequency in Hz
>> @@ -725,6 +745,7 @@ struct i2c_adapter {
>>
>>          /* data fields that are valid for all devices   */
>>          const struct i2c_lock_operations *lock_ops;
>> +       const struct i2c_mux_root_operations *mux_root_ops;
>>          struct rt_mutex bus_lock;
>>          struct rt_mutex mux_lock;
>>
>> @@ -817,6 +838,27 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
>>          adapter->lock_ops->unlock_bus(adapter, flags);
>>   }
>>
>> +/**
>> + * i2c_lock_select_bus - Get exclusive access to the root I2C bus with the
>> + *   target's mux channel (if a mux is present) selected.
>> + * @adapter: Target I2C bus
>> + *
>> + * Return the root I2C bus if mux selection succeeds, an ERR_PTR otherwise
>> + */
>> +static inline struct i2c_adapter *i2c_lock_select_bus(struct i2c_adapter *adapter)
>> +{
>> +       return adapter->mux_root_ops->lock_select(adapter);
>> +}
>> +
>> +/**
>> + * i2c_unlock_deslect_bus - Release exclusive access to the root I2C bus
>> + * @adapter: Target I2C bus
>> + */
>> +static inline void i2c_unlock_deselect_bus(struct i2c_adapter *adapter)
>> +{
>> +       adapter->mux_root_ops->unlock_deselect(adapter);
>> +}
>> +
>>   /**
>>    * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
>>    * @adap: Adapter to mark as suspended
>> --
>> 2.27.0
>>

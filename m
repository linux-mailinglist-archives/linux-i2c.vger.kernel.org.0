Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8604D52BFA1
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 18:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239733AbiERPwQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 11:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239593AbiERPwP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 11:52:15 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A4F1C83EB;
        Wed, 18 May 2022 08:52:14 -0700 (PDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IFElLE013025;
        Wed, 18 May 2022 15:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AM2xQGtGTyOcD/kklWCco7altrVDggH1p+vQaapH7mo=;
 b=T2ePE/cKae/zGG6w7B//p2Yn8/83O8IzvH9b+/SMHSVBgtU/W2em6bWJnjDN+OvSdE22
 v49QGUfrleazDI8lm7x6JbzWynp2B7sxZGIpPNceAeC87ETuvzyLoiSM5jdNLAo3sik4
 aoPxdbnAd62H3u5XRRLFmWRTgeXxc47Vypv5IKhLr6ZLfPeCgi325IwHIBj4Pfq5PCgK
 g5LE95Evhazk8M2WPNV2bjqva1p2PY22IHOGMTw9coZLoet5vVXTAi4awlw+YkBn/hJ8
 XSTH2Ngy84eeW0uO+8uVztgoEm+dsPDFyVnQwzmrKqLau0ecoFBJE5cWSkQGXa7faacx /g== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5392rx8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 15:51:29 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IFnZUG003184;
        Wed, 18 May 2022 15:51:28 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma02wdc.us.ibm.com with ESMTP id 3g2429wger-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 15:51:28 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24IFpSlm12779816
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 May 2022 15:51:28 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 40BC3AE060;
        Wed, 18 May 2022 15:51:28 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 48FE9AE05F;
        Wed, 18 May 2022 15:51:27 +0000 (GMT)
Received: from [9.163.6.139] (unknown [9.163.6.139])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 18 May 2022 15:51:27 +0000 (GMT)
Message-ID: <6d517473-9ac4-8a58-64c5-1c27ecd6f95f@linux.ibm.com>
Date:   Wed, 18 May 2022 10:51:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/2] iio: humidity: si7020: Check device property for
 skipping reset in probe
Content-Language: en-US
From:   Eddie James <eajames@linux.ibm.com>
To:     Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        lars@metafoo.de, miltonm@us.ibm.com, linux-i2c@vger.kernel.org
References: <20220512162020.33450-1-eajames@linux.ibm.com>
 <20220512174859.000042b6@Huawei.com>
 <4fd44316-689e-1b72-d483-2c617d2a455d@linux.ibm.com>
 <20220513174531.00007b9b@Huawei.com>
 <b2761479-50fe-0dce-62a2-3beff5cdef9d@axentia.se>
 <20220514144318.309be1ec@jic23-huawei>
 <0569bb70-e2dc-de85-268d-30ee7c9491fb@axentia.se>
 <bbeaa4b6-1412-dfac-a6ef-dbcd9f1e3f5c@linux.ibm.com>
In-Reply-To: <bbeaa4b6-1412-dfac-a6ef-dbcd9f1e3f5c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kg_7SlHu9GjMAyDKOhMjl65LN9NYtQPe
X-Proofpoint-ORIG-GUID: Kg_7SlHu9GjMAyDKOhMjl65LN9NYtQPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_05,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205180092
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 5/18/22 10:28, Eddie James wrote:
>
> On 5/14/22 10:02, Peter Rosin wrote:
>> 2022-05-14 at 15:43, Jonathan Cameron wrote:
>>> On Sat, 14 May 2022 00:48:51 +0200
>>> Peter Rosin <peda@axentia.se> wrote:
>>>
>>>> Hi!
>>>>
>>>> 2022-05-13 at 18:45, Jonathan Cameron wrote:
>>>>> On Thu, 12 May 2022 12:08:07 -0500
>>>>> Eddie James <eajames@linux.ibm.com> wrote:
>>>>>> On 5/12/22 11:48, Jonathan Cameron wrote:
>>>>>>> On Thu, 12 May 2022 11:20:18 -0500
>>>>>>> Eddie James <eajames@linux.ibm.com> wrote:
>>>>>>>> I2C commands issued after the SI7020 is starting up or after reset
>>>>>>>> can potentially upset the startup sequence. Therefore, the host
>>>>>>>> needs to wait for the startup sequence to finish before issuing
>>>>>>>> further i2c commands. This is impractical in cases where the 
>>>>>>>> SI7020
>>>>>>>> is on a shared bus or behind a mux, which may switch channels at
>>>>>>>> any time (generating I2C traffic). Therefore, check for a device
>>>>>>>> property that indicates that the driver should skip resetting the
>>>>>>>> device when probing.
>>>>>>> Why not lock the bus?  It's not ideal, but then not resetting 
>>>>>>> and hence
>>>>>>> potentially ending up in an unknown state isn't great either.
>>>>>>
>>>>>> Agreed, but locking the bus doesn't work in the case where the 
>>>>>> chip is
>>>>>> behind a mux. The mux core driver deselects the mux immediately 
>>>>>> after
>>>>>> the transfer to reset the si7020, causing some i2c traffic, 
>>>>>> breaking the
>>>>>> si7020. So it would also be a requirement to configure the mux to 
>>>>>> idle
>>>>>> as-is... That's why I went with the optional skipping of the reset.
>>>>>> Maybe I should add the bus lock too?
>>>>> +Cc Peter and linux-i2c for advice as we should resolve any potential
>>>>> issue with the mux side of things rather than hiding it in the driver
>>>>> (if possible!)
>>>> IIUC, the chip in question cannot handle *any* action on the I2C bus
>>>> for 15ms (or so) after a "soft reset", or something bad<tm> happens
>>>> (or at least may happen).
>>>>
>>>> If that's the case, then providing a means of skipping the reset is
>>>> insufficient. If you don't lock the bus, you would need to *always*
>>>> skip the reset, because you don't know for certain if something else
>>>> does I2C xfers.
>>>>
>>>> So, in order to make the soft reset not be totally dangerous even in
>>>> a normal non-muxed environment, the bus must be locked for the 15ms.
>>>>
>>>> However, Eddie is correct in that the I2C mux code may indeed do its
>>>> muxing xfer right after the soft reset command. There is currently
>>>> no way to avoid that muxing xfer. However, it should be noted that
>>>> there are ways to mux an I2C bus without using xfers on the bus
>>>> itself, so it's not problematic for *all* mux variants.
>>>>
>>>> It can be debated if the problem should be worked around with extra
>>>> dt properties like this, or if a capability should be added to delay
>>>> a trailing muxing xfer.
>>>>
>>>> I bet there are other broken chips that have drivers that do in fact
>>>> lock the bus to give the chip a break, but then it all stumbles
>>>> because of the unexpected noise if there's a (wrong kind of) mux in
>>>> the mix.
>>> Ok, so for now I think we need the bus lock for the reset + either
>>> a work around similar to this series, or additions to the i2c mux code
>>> to stop it doing a muxing xfer if the bus is locked?
>> I think there might be cases where it might be valid to restore the mux
>> directly after an xfer even if the mux is externally locked prior to the
>> muxed xfer. But I'm not sure? In any case, it will be a bit convoluted
>> for the mux code to remember that it might need to restore the mux
>> later. And it will get even hairier when multiple levels of muxing is
>> considered...
>>
>> Maybe some kind of hook/callback that could be installed temporarily on
>> the I2C adapter that is called right after the "real" xfer, where the
>> driver could then make the needed mdelay call?
>>
>> I.e.
>> 1. lock the bus
>> 2. install this new hook/callback
>> 3. do an unlocked xfer, get notified and call mdelay
>> 5. uninstall the hook/callback
>> 6. unlock the bus
>>
>> The hook/callback could be uninstalled automatically on unlock, then
>> you would not need to handle multiple notifications. But then again,
>> there is probably some existing framework that should be used that
>> handles all than neatly and efficiently.
>
>
> Hm, interesting. Sounds a bit complicated, though very flexible. For a 
> less flexible, but less complex, approch, we could add a i2c_msg flag 
> that says to do a delay in the core? And then si7020 could just submit 
> a couple of raw messages rather than smbus... What do you think?


Um, nevermind... that would require changes in all the bus drivers. I'll 
look into implementing the hook/callback.

Thanks,

Eddie


>
>
> Thanks,
>
> Eddie
>
>
>
>>
>> Me waves hand a bit...
>>
>> Cheers,
>> Peter
>
>

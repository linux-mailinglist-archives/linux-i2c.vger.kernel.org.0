Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9070D264CC3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 20:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgIJSVw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 14:21:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5565 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgIJSTr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 14:19:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5a6dfb0002>; Thu, 10 Sep 2020 11:18:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 10 Sep 2020 11:19:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 10 Sep 2020 11:19:19 -0700
Received: from [10.26.73.219] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 18:19:17 +0000
Subject: Re: [PATCH 1/5] misc: eeprom: at24: Initialise AT24 NVMEM ID field
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200910134239.192030-1-jonathanh@nvidia.com>
 <20200910134239.192030-2-jonathanh@nvidia.com>
 <CAMpxmJXbhrmJJn4f3zk4=Y2tCwLzpFc+c6NbxcqVe8eaLSRvtw@mail.gmail.com>
 <88021f57-b8cf-d3d6-0e9c-19ed0bccb729@nvidia.com>
Message-ID: <5afe9537-dc50-16ff-028e-b4539c6f924a@nvidia.com>
Date:   Thu, 10 Sep 2020 19:19:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <88021f57-b8cf-d3d6-0e9c-19ed0bccb729@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599761915; bh=relp5/wSsIqsD906iDWJJiEpu85XdzNneJxGcqDM//I=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Jo9IhtiG2ASEAijTpfHP3ape8NSkNjtJFTKB89QW/beXoFkgNO3YlurRMYmx0CuEZ
         JHywXBJWEL2iZ+QzhUzpd+4fM1Om8KvAM4Jo4WSn2hsoorflJw3nrDG5NxU4jKZmmK
         LLmNsHWigUG86i8o7OaAGOU54pp3cAU0qCARt5PEneC8IohtoUJDoaphjP5Ml3ToMb
         u7XYNbYTED0Aa/AjcNENZ0eIO70MBT58lp9cTdInRqwlraUdn6Nc5vrxLLGLt4h/B2
         X3Zk3+QUQbwGQQJADaJxlAT4cmYDJwRm60sPFmGvpCbH4QAX2egFnpMYZD8Vu0su8P
         XfzBYBK8OGZ/Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/09/2020 19:15, Jon Hunter wrote:
> 
> On 10/09/2020 16:35, Bartosz Golaszewski wrote:
>> On Thu, Sep 10, 2020 at 3:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>
>>> The AT24 EEPROM driver does not initialise the 'id' field of the
>>> nvmem_config structure and because the entire structure is not
>>> initialised, it ends up with a random value. This causes the NVMEM
>>> driver to append the device 'devid' value to name of the NVMEM
>>> device. Although this is not a problem per-se, for I2C devices such as
>>> the AT24, that already have a device unique name, there does not seem
>>> much value in appending an additional 0 to the I2C name. For example,
>>> appending a 0 to an I2C device name such as 1-0050 does not seem
>>> necessary and maybe even a bit confusing. Therefore, fix this by
>>> setting the NVMEM config.id to NVMEM_DEVID_NONE for AT24 EEPROMs.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>  drivers/misc/eeprom/at24.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
>>> index e9df1ca251df..3f7a3bb6a36c 100644
>>> --- a/drivers/misc/eeprom/at24.c
>>> +++ b/drivers/misc/eeprom/at24.c
>>> @@ -715,6 +715,7 @@ static int at24_probe(struct i2c_client *client)
>>>
>>>         nvmem_config.name = dev_name(dev);
>>>         nvmem_config.dev = dev;
>>> +       nvmem_config.id = NVMEM_DEVID_NONE;
>>>         nvmem_config.read_only = !writable;
>>>         nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
>>>         nvmem_config.owner = THIS_MODULE;
>>> --
>>> 2.25.1
>>>
>>
>> This patch is correct and thanks for catching it. I vaguely recall
>> wondering at some point why the appended 0 in the nvmem name for at24.
>> Unfortunately this change would affect how the device is visible in
>> user-space in /sys/bus/nvmem/devices/ and this could break existing
>> users. Also: there are many in-kernel users that would need to be
>> updated. I'm afraid we'll need some sort of backward compatibility.
> 
> 
> Thanks, yes that is a problem. I guess for now we could explicitly init
> to NVMEM_DEVID_AUTO or maybe just 0 so that it defaults to the same path
> in the NVMEM driver. However, I am not sure how we can make allow some
> devices to use NVMEM_DEVID_NONE and others use something else. This is
> not really something that we can describe in DT because it has nothing
> to do with h/w.


Unless we make the configuration of the 'id' dependent on the 'label'
property so something like ...

	if (device_property_present(dev, "label")) {
                nvmem_config.id = NVMEM_DEVID_NONE;
		err = device_property_read_string(dev, "label",
						  &nvmem_config.name);
		if (err)
			return err;
	} else {
                nvmem_config.id = NVMEM_DEVID_AUTO;
		nvmem_config.name = dev_name(dev);
	}

Cheers
Jon

-- 
nvpublic

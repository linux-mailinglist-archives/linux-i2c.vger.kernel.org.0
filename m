Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E821F5990
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 19:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgFJRAQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 13:00:16 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18488 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgFJRAQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 13:00:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee111920001>; Wed, 10 Jun 2020 10:00:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 10 Jun 2020 10:00:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 10 Jun 2020 10:00:15 -0700
Received: from [10.2.167.70] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 17:00:14 +0000
Subject: Re: [RFC PATCH v1 13/18] gpu: host1x: mipi: Add
 of_tegra_mipi_request() API
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-14-git-send-email-skomatineni@nvidia.com>
 <e84c6723-e94a-3fcf-8b38-eb680c88de25@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ef909904-9d21-c124-73fc-79c9ae7ac75b@nvidia.com>
Date:   Wed, 10 Jun 2020 10:00:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e84c6723-e94a-3fcf-8b38-eb680c88de25@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591808402; bh=Imz6doYV660y+cWZb3k3Hst0ZTywDfXDU/B2fakCmbE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=gpiEPWI11tmwvkC1z4UqgSJgJALbX1UO7Icf7RcURBPTCfOGmtBoegR9TiB6A1cUT
         BpcIZVnuYZ8a3S7SmDrChcksWlyjGqzfvDZXMnS4WELWyhq4yG4FrjJiTJg4mCMbE4
         b5nHI9snhjEaBq5DJ4CX83uT0iZQ4MuZPOnaSNRtaGJOfIiNlekdxcM+RvTG37CUIc
         J8dUr9wKHRpV+wILC4lL55qvEvo5oDQp4e7JMbnxy77Z6tpPLlbYVCfOGRdESHEXKQ
         LVhoCkttS4pwxekjsd92ZwpPPl4whkJTICqFAMoQrXnxd0KcJIUCX7LSF37gShZQsT
         1pYidMutj/pzQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/10/20 6:33 AM, Dmitry Osipenko wrote:
> 10.06.2020 09:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds an API of_tegra_mipi_request() to allow creating
>> mipi device for specific device node rather than a device so Tegra
>> CSI driver can use it for calibrating MIPI pads for each stream
>> independently.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/gpu/host1x/mipi.c | 10 ++++++++--
>>   include/linux/host1x.h    |  2 ++
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>> index e00809d..f51fe69 100644
>> --- a/drivers/gpu/host1x/mipi.c
>> +++ b/drivers/gpu/host1x/mipi.c
>> @@ -206,9 +206,9 @@ static int tegra_mipi_power_down(struct tegra_mipi *=
mipi)
>>   	return 0;
>>   }
>>  =20
>> -struct tegra_mipi_device *tegra_mipi_request(struct device *device)
>> +struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
>> +						struct device_node *np)
>>   {
>> -	struct device_node *np =3D device->of_node;
>>   	struct tegra_mipi_device *dev;
>>   	struct of_phandle_args args;
>>   	int err;
>> @@ -252,6 +252,12 @@ struct tegra_mipi_device *tegra_mipi_request(struct=
 device *device)
>>   	of_node_put(args.np);
>>   	return ERR_PTR(err);
>>   }
>> +EXPORT_SYMBOL(of_tegra_mipi_request);
>> +
>> +struct tegra_mipi_device *tegra_mipi_request(struct device *device)
>> +{
>> +	return of_tegra_mipi_request(device, device->of_node);
>> +}
>>   EXPORT_SYMBOL(tegra_mipi_request);
>>  =20
>>   void tegra_mipi_free(struct tegra_mipi_device *device)
>> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
>> index c230b4e..a61ca52 100644
>> --- a/include/linux/host1x.h
>> +++ b/include/linux/host1x.h
>> @@ -325,6 +325,8 @@ int host1x_client_resume(struct host1x_client *clien=
t);
>>  =20
>>   struct tegra_mipi_device;
>>  =20
>> +struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
>> +						struct device_node *np);
> Looks like adding a new function here is a bit of overkill. What about
> to change tegra_mipi_request() to take the node argument?

thought to avoid changes to existing usage of that function in other=20
drivers.

Will update in v2.


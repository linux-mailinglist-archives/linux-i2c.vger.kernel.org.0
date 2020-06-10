Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E8C1F5987
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 18:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgFJQ6b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 12:58:31 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16700 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgFJQ6a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 12:58:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee110da0000>; Wed, 10 Jun 2020 09:56:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 10 Jun 2020 09:58:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 10 Jun 2020 09:58:30 -0700
Received: from [10.2.167.70] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 16:58:29 +0000
Subject: Re: [RFC PATCH v1 05/18] i2c: tegra: Fix runtime resume to re-init VI
 I2C
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-6-git-send-email-skomatineni@nvidia.com>
 <fcced8cd-d80d-b09c-b657-cb413ec418f9@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <dc310c94-ae8d-fcf5-be9f-6236f3615dd7@nvidia.com>
Date:   Wed, 10 Jun 2020 09:58:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fcced8cd-d80d-b09c-b657-cb413ec418f9@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591808218; bh=lCn+LcemkNEZVacRc5PI7q1npMKqaFgl+fw6okE0H6U=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=cAdMeWgVEE6NrJQx9xaYzarZGK4cJyQAiZ7rz/T68LylkHXoKF9ZkCO4cE5J4WPJq
         XqyqOJnzN1EnJnKmXed80z3kWtKMNbInpHBZGDfr9wq/qVSj3g4VPx7mAlyVAVemL/
         zDYp5EYDTApVFC/EHXQguOlm2P4nJ7ZiddjaFp4a0vF1w7zNA4TSeF4+TAPOAZLwzh
         lA9sA7jYugjKYvC5LyAxx05fy0Gp6vu7vzB1tHc5APoXMprBjBnw7y5WjWASSktptq
         sNrLyHrgvxTy7RJViwMupBAjSxEP71nlEkEiWg/FEiHkPyf3KyWzOMDvMsjO7ZatDa
         QI7UY/E4NDRpg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/10/20 6:14 AM, Dmitry Osipenko wrote:
> 10.06.2020 09:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> VI I2C is on host1x bus and is part of VE power domain.
>>
>> During suspend/resume VE power domain goes through power off/on.
>>
>> So, controller reset followed by i2c re-initialization is required
>> after the domain power up.
>>
>> This patch fixes it.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index dba38a5..650240d 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -293,6 +293,8 @@ struct tegra_i2c_dev {
>>   	bool is_curr_atomic_xfer;
>>   };
>>  =20
>> +static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reini=
t);
>> +
>>   static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>   		       unsigned long reg)
>>   {
>> @@ -679,8 +681,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(=
struct device *dev)
>>   		goto disable_slow_clk;
>>   	}
>>  =20
>> +	/*
>> +	 * VI I2C device is attached to VE power domain which goes through
>> +	 * power ON/OFF during PM runtime resume/suspend. So, controller
>> +	 * should go through reset and need to re-initialize after power
>> +	 * domain ON.
>> +	 */
>> +	if (i2c_dev->is_vi) {
>> +		ret =3D tegra_i2c_init(i2c_dev, true);
>> +		if (ret)
>> +			goto disable_div_clk;
>> +	}
>> +
>>   	return 0;
>>  =20
>> +disable_div_clk:
>> +	clk_disable(i2c_dev->div_clk);
>>   disable_slow_clk:
>>   	if (i2c_dev->slow_clk)
>>   		clk_disable(i2c_dev->slow_clk);
>>
> The clk_disable() can cope with a NULL argument. Won't it be cleaner to
> remove the conditions?
will remove in v2

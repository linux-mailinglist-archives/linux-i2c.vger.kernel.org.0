Return-Path: <linux-i2c+bounces-7352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD499BD26
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 02:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CD6E1F2192D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 00:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F914C7E;
	Mon, 14 Oct 2024 00:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="dDYfCCbG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293213224
	for <linux-i2c@vger.kernel.org>; Mon, 14 Oct 2024 00:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728866940; cv=none; b=gBFion8YgeIHpEiZnY5GJeMvdl1/idmhHlhqlbuxA6w4AiMONwLuPLxwh1FagoeWTJB9wR7JBonzTGRDcMZYwnu9bhYxLjdsWBhKqc9xTAjsGJHgZ8KsRSFJT/zw3Hod7cDfH5vNqfDdF6aIA3SlhFbbQ0X92F1UFnf3Uqpaeqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728866940; c=relaxed/simple;
	bh=IK/+jnfHuCbDOQyrOzCmeSis+MuzTanErDfuCeYtH9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDqsVcoXgmy87lVAYFGId4Uq0DXM7Ildv0VXDHrX8lraW3yq1WOLH1E8WuvmmzQdvrW1fPJaFKv9TcqhAfPSloZQloJ5V1ZcWqcWRQnY/CPt5q5H2ANdd+II4p0WRM0J/WhQ0c0jABOpZto9mbmO2wfGOdTk/WsQJw01NKZstrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=dDYfCCbG; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E16262C0404;
	Mon, 14 Oct 2024 13:48:54 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1728866934;
	bh=O4zdt/Cjmlaout6iODGs924VsI5ahGfN1gpPJKcIjNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dDYfCCbGzAlNzM0FZhsKd5XZYsPX3eM8vRTj0W4aAkbaHJ8PPLNxFcgp7psVLZxfT
	 hKBMFwGKF0FNMyQgSeajU6ZmQ+71CgIOoY5CD1vpsXEa4QQ9WXmvVHh0il1l6ATjdh
	 Wxae7Nr0RjS/UPHVtvHhuf5ePP7t7X04ykXaLtARVeza2RA2J6xPZMuw5JeeWAs3TY
	 k4ghYJm+9xsSPwPsXMZrt6+W2afTG+R/PObSd8IO6B/Kq+Mt8r2DClMCDC3T2LpOvX
	 QcMHA1PCTmHiaP3TMH520fhHfUpAuMnBCszZ4vVuDvCmbcewfw095MkF1j6kyIsQzE
	 OX1Mqf45S+nrA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670c6a760000>; Mon, 14 Oct 2024 13:48:54 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id C72BC13ED7B;
	Mon, 14 Oct 2024 13:48:54 +1300 (NZDT)
Message-ID: <fa953c09-d22c-483a-8860-92f1ebaa6162@alliedtelesis.co.nz>
Date: Mon, 14 Oct 2024 13:48:54 +1300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] fixup! i2c: Add driver for the RTL9300 I2C controller
To: Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
 <20240929200934.965955-1-chris.packham@alliedtelesis.co.nz>
 <rldg7q2je4alzn2qridg4ls5vakwioaphquog24jejwynmfd6z@2irqdiizethm>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <rldg7q2je4alzn2qridg4ls5vakwioaphquog24jejwynmfd6z@2irqdiizethm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670c6a76 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=62ntRvTiAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=IvJyAl676Ggpr9NaoQsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Andi,

On 2/10/24 23:57, Andi Shyti wrote:
> Hi Chris,
>
> On Mon, Sep 30, 2024 at 09:09:34AM GMT, Chris Packham wrote:
>> Hi Andi,
>>
>> This is a fixup for the spare complaint from the kernel test robot
>> https://scanmail.trustwave.com/?c=3D20988&d=3D8Kn95gKUGD1_OL8d257ypj3k=
PxHsjXG_y2-BvWXRiQ&u=3Dhttps%3a%2f%2flore%2ekernel%2eorg%2flkml%2f2024092=
91025%2eP4M4O1F2-lkp%40intel%2ecom%2f%23t
>>
>> Not sure if you want to fold this into what is already in
>> andi-shyti/i2c/i2c-host or if you want me to send it as a new patch.
> no worries, I can take care of it.
>
> Andi

Just chasing up this series.=C2=A0 Did it land anywhere? Were you waiting=
 for=20
me to send a v6?

I think I've clarified the SoC naming with Krzysztof so he might like me=20
to send a v6 dropping the wildcard rtl9300. But I didn't want to send a=20
v6 if v5 was already sitting in a tree somewhere else.

>> ---
>>   drivers/i2c/busses/i2c-rtl9300.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c=
-rtl9300.c
>> index ed9a45a9d803..f0bb0ede79ce 100644
>> --- a/drivers/i2c/busses/i2c-rtl9300.c
>> +++ b/drivers/i2c/busses/i2c-rtl9300.c
>> @@ -318,7 +318,7 @@ static const struct i2c_algorithm rtl9300_i2c_algo=
 =3D {
>>   	.functionality	=3D rtl9300_i2c_func,
>>   };
>>  =20
>> -struct i2c_adapter_quirks rtl9300_i2c_quirks =3D {
>> +static struct i2c_adapter_quirks rtl9300_i2c_quirks =3D {
>>   	.flags		=3D I2C_AQ_NO_CLK_STRETCH,
>>   	.max_read_len	=3D 16,
>>   	.max_write_len	=3D 16,
>> --=20
>> 2.46.2
>>


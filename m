Return-Path: <linux-i2c+bounces-7081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DC989743
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 22:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24521F217AC
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 20:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295184207A;
	Sun, 29 Sep 2024 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="KcJ7uV53"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BBC4C62E
	for <linux-i2c@vger.kernel.org>; Sun, 29 Sep 2024 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727641060; cv=none; b=Pukovb8vqlT9MoD2iKynosuKtqLwYWx/S9U+rBkofjlQvRVSGx4dfAKBJ5V1CTQASw8jUiqTBGd8zQpv+1IkTUI6ekpn0ecleOCeXSSXDSVSdTi1BZuYNse+QGkjyoVYGH1uZMxIxh/1pqCJMGJQ2TyMYdYNnYHPJnJMCIh3IZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727641060; c=relaxed/simple;
	bh=e/DLduMorhCuSFXTa5d51gLMRFOsS5++OOTim6BWp6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5ozQ7qRSQlmy2DHVFQWu4skH5Hu9oG2BvA2oIb4rE7hS0+nsh4Y6yk+kXrWk/hcPkqk110PPAjQqPlL2aT1BG/pFcqq5QHxdzw06PklSvbuG5YiYA8IhgxnenwT4Sm/M+S+EqWzo2mlFA8X7sjY0Cuf4+TXbbRVVKL/iK0y5WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=KcJ7uV53; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 364B32C04A9;
	Mon, 30 Sep 2024 09:17:35 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727641055;
	bh=YN7kpomPes0I6UW4Xml3XD6fCY2IicArvQi2UkGGKzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KcJ7uV53RcFvg4kIf3/n5E06cCXoeXbKSHtxaYjMTk6ruov8HxUtUq4Q5vmbBCqJC
	 dQCn94K/rlodLeq0N8B3ibkv7ND7MXCtcbHtQjYZTpz4EJRp/zb/AdBhTx6gEg269C
	 f8vNw5Kyjlsae6HdTF0HSe2JkP4yv3ztCLrdfJVvvcGn14wsNrOAOVfFwZaJMZkMkJ
	 mbaaAJp1QixmZ4aaXKxU6HPoK71A4b9iwYPEy6QAxBtMfLcniE8Vo9R+8hZ6jCCrDD
	 9IcCXmf8gwWLtL4PgBzgin56kLCVsigWmMW1Rj0xx7u62N6cmyIG4xqdrnX6NfzNI4
	 ykqH8sy59j2ug==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f9b5df0000>; Mon, 30 Sep 2024 09:17:35 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1B85B13EE36;
	Mon, 30 Sep 2024 09:17:35 +1300 (NZDT)
Message-ID: <0c94d0fc-dc0c-4e35-a6c1-2d7e01a3eb43@alliedtelesis.co.nz>
Date: Mon, 30 Sep 2024 09:17:34 +1300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 6/6] i2c: Add driver for the RTL9300 I2C controller
To: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
 <096aebcd-778c-4160-b478-bb26025f3940@web.de>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <096aebcd-778c-4160-b478-bb26025f3940@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f9b5df a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=czHN8OwSvR-A_l93-LoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Markus,

On 29/09/24 21:45, Markus Elfring wrote:
> =E2=80=A6
>> +++ b/drivers/i2c/busses/i2c-rtl9300.c
>> @@ -0,0 +1,422 @@
> =E2=80=A6
>> +static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,=
 unsigned short flags,
>> +				  char read_write, u8 command, int size,
>> +				  union i2c_smbus_data *data)
>> +{
> =E2=80=A6
>> +	mutex_lock(&i2c->lock);
>> +	if (chan->sda_pin !=3D i2c->sda_pin) {
> =E2=80=A6
>> +out_unlock:
>> +	mutex_unlock(&i2c->lock);
>> +
>> +	return ret;
>> +}
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statem=
ent
> like =E2=80=9Cguard(mutex)(&i2c->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.11/source/include/linux/mutex.h#L19=
6

At this stage I don't what to change unless Andi insists that I do.

I can't find much mention of using guard() on=20
https://www.kernel.org/doc/html/latest/ but I can see enough examples=20
(although notably none in drivers/i2c) that I _think_ I can see how I=20
could use it.



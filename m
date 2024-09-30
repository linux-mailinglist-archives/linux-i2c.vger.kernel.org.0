Return-Path: <linux-i2c+bounces-7089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7C989C0D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 09:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82BFAB233CF
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 07:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCB716F8EF;
	Mon, 30 Sep 2024 07:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tMwRr1KI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872415C15E;
	Mon, 30 Sep 2024 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727683045; cv=none; b=lPzJYq9qy5GrKD8+6DWulehAtii5YkguislSdDQ4OOJxleDI8ewgWLEZRlhi/Gc2HXkOaWEU2VZGADbK+/ERu/onV1CbQsyfRBr9vV36w/S+g0Fcbi0q6HOZ6wkf2i2qmyjnQX45r48qL6NZmI3c7cJZBwowvhDh4/px4XEN6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727683045; c=relaxed/simple;
	bh=BFhSVfrePAJI5gNJFgIjaJrtixX24iPbQQ0d8FSWhxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrFoogKKHEhwHPWTrQRqivKOMJ23mY8TVkG06sZDyRP5hUuNvgpmb68qDb2eyXDiQ8iDjNPZVrNEpR7uCTZPQM7WdpfsR49A1uBmp72Ym2nNszVRVvfguIsN75RA/Ocwc1H0RFd6ba45N9PYDCN3iT0QTlOaTfj7qUkxAQhUNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tMwRr1KI; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727682958; x=1728287758; i=markus.elfring@web.de;
	bh=BFhSVfrePAJI5gNJFgIjaJrtixX24iPbQQ0d8FSWhxs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tMwRr1KIHHyh601Gc839na9nhq9Dm2GgNPNeTu9qU1b2BKLRy5pnp+NE3g5kt+UX
	 n549nii8w4GKPAL+/AGQJ6ceEAc/+fTQW4nfHkC1LdPgiDST1dHaVfuEJ9UgKklVQ
	 +AJoX5mXtBDNoPMjN/e/xbufG/p6X0kigI3SpIhdjkfAjOEl4sA+k/qI1lkB6sKhj
	 B/hhfEU2k/7Ocjhbz9ZkUwaVYOqgzgs1zs3H4imEjmeFPdq2m3F402mgeQLQqhVAB
	 iek/jx9kpvdXWy9pacVWcJP3i6j5JtNlJbALBLZP4SXqDuIBOJH0QJNXx+1JhqrtC
	 r7OanPlaaWmZkFMvsA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mf3qK-1sEwku1p7a-00eq9a; Mon, 30
 Sep 2024 09:55:58 +0200
Message-ID: <4eb3dbbb-d3fd-43f4-b90d-9ecc222a87f6@web.de>
Date: Mon, 30 Sep 2024 09:55:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] i2c: Add driver for the RTL9300 I2C controller
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
 <096aebcd-778c-4160-b478-bb26025f3940@web.de>
 <0c94d0fc-dc0c-4e35-a6c1-2d7e01a3eb43@alliedtelesis.co.nz>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <0c94d0fc-dc0c-4e35-a6c1-2d7e01a3eb43@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ya5KDFxRxA4bmUC2mDm7LFw51IhhhVCjIMPrxa02CAdV2bVYjo0
 ADOHdv2LHge1wrhdGmG4Mnl8ocWKIM6IS2ZZQyadK+njoJA2WZydqr61MmXQz0gazXoxW1K
 GqTetFglpKU1fUI0KFGo+TEBoX0rv8Zal6KMl1LFm5pIq481yfR4KExoC/Jc+uFntwBv7oa
 mG1ZTZ5Dghy6fPD0Y6O0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PFk3D6ULmM0=;jd3RGWDVmFA/pHKwxeiCNfYAaZn
 682Ys3A+JzDSwa2F1ZtPL7qmyDgHkc8haoy7DkSf4wh5PGeCk0AGF28hlkzvuKaS9NWocqahK
 6DkHQX80fNRTWpRmwnQO7mRY9/gJIsVMn7KZqPz4CrqLErvhZkHOpHzAUzuXeNIIXoiPWcssl
 l/iJLMyVdcJXPTq2DinBWpeWmlAqlaqNBQ/4ZPbSG/xa+Wkb7hw3I5DonAGDBfuU1mc+xUwEp
 SJFh7Vy+bfrRToQlJhoaRbxAjsXX4Td/rHv3jTZnDkwRWE/IMCAXy/WjJqkN+iN6BtCRB6yBq
 RmaGFBICaWx2VfAzd/ytG0S0rHtiq2y3YZ1vlb2e8ESV3DW27H0Y7QMfqcwlyMh4yRoCSTWvi
 JWZ57Evg+q+6xNUhrEe/litBqxgZI3/0y9i368ooqL5g0ZQfynQxkZKKdpN2daqepLiAbm4ks
 YCs7QM8wjzWN0D+Q9pQGJGSp5ktpBnfKHWOvLYgQ6CgGhbzYtdkXvNtfwjaEeKbPkhHoLcYde
 gLRJg7NpIvGlzWSuj6Q7w+hkaKU6KYkoV/41nfqcpr717cHeRU+Ds4W+ICm7AoWx6G7cfaFGi
 y+N0OxZM0ytmDAIYm0gKK6QNUzq1dkbsGt1DL6OGqvEN4Z0HHmIXI0SKGRChGiKvVQTWUSDd/
 6poKEQVmDUujV7quD0tQ4WdDWVrLZkMJ5zJe9EiCQkt2B5Udeq3NSeiSrHfJEziFGLN0Il26V
 TcFZ1HcQv2AvhCIiFJIyWNCTHoBhCqigmXqbFq2OSHMR3Ymj36J2gA+YZbVG3yjRVPWkcwCmU
 xpZ0AgMI9U/D5hbKK7Nah2yw==

>> =E2=80=A6
>>> +++ b/drivers/i2c/busses/i2c-rtl9300.c
>>> @@ -0,0 +1,422 @@
>> =E2=80=A6
>>> +static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,=
 unsigned short flags,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char read_write, u8 command, int size,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union i2c_smbus_data *data)
>>> +{
>> =E2=80=A6
>>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&i2c->lock);
>>> +=C2=A0=C2=A0=C2=A0 if (chan->sda_pin !=3D i2c->sda_pin) {
>> =E2=80=A6
>>> +out_unlock:
>>> +=C2=A0=C2=A0=C2=A0 mutex_unlock(&i2c->lock);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>> =E2=80=A6
>>
>> Under which circumstances would you become interested to apply a statem=
ent
>> like =E2=80=9Cguard(mutex)(&i2c->lock);=E2=80=9D?
>> https://elixir.bootlin.com/linux/v6.11/source/include/linux/mutex.h#L19=
6
>
> At this stage I don't what to change unless Andi insists that I do.
>
> I can't find much mention of using guard() on https://www.kernel.org/doc=
/html/latest/

Do you find any other information sources more encouraging?


> but I can see enough examples (although notably none in drivers/i2c) tha=
t I _think_ I can see how I could use it.

See also (for example):
Article =E2=80=9CLinux Kernel Development - Automatic Cleanup=E2=80=9D
by Javier Carrasco Cruz
2024-06-17
https://javiercarrascocruz.github.io/kernel-auto-cleanup-2#2-automatic-mut=
ex-handling

Regards,
Markus


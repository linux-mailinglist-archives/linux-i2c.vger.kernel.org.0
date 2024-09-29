Return-Path: <linux-i2c+bounces-7078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE149893D7
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 10:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 804411F210E9
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 08:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FC013CF9C;
	Sun, 29 Sep 2024 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YhHz00tV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301DAD2F;
	Sun, 29 Sep 2024 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727599592; cv=none; b=dAvUGxChAzn+pyNHoi56PRhFqhS+Iwsj+raep/ajN7wS3UMoBOoOGnfAAAuEB3Cwp3+IvkiIwvh0GRJThIwHVUTEYDb69JaWJY5vbMOpuF/wR1fb86QKzVMpFQEYyNtSCp40pm53E5O9YwPmIEDJUgLyQDZOD3Q7l3ZN4nRywaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727599592; c=relaxed/simple;
	bh=JQQZ1rM9Oe/C+rmEPljFG0dfaFJamoG0QhwDFME6AkA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=GnZWIB58N0WDpW97TZHrjCDX0UuDr5ALXzv5Ryl4r1vzHN0lTK7KMlynp19kTZiXfIeaSo1w7fD8VE5hMr8abEdZ31B+qzx16yYywPr7VtRUMp8BLK0x3C7th4BL2rcxoHni+98QdLAIe/WkBDoryCZZ8icYOUwMMCNj80Eu360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YhHz00tV; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727599548; x=1728204348; i=markus.elfring@web.de;
	bh=TFqeF6QIlkUpsuw2gD42mGoy6UZKPUpkQ/2SBkM3EzI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YhHz00tVaQC06z/vzROSJSVuNRdkJ/fKOiQ4FOkZPPDQMphlVn4y9B789LfOrhXB
	 6sclHfEhdeVpdbsBVKhMvbaQo0myy1W/mxRLp4FuZiJI8kJDpr6tn5mpZh4pc3Kln
	 5yWxJsyiKAf5QYDurVhKW8iD96FiokhCgA+KXE1aD/9Sjm2uLOKzCfUwxJYrBhI+M
	 5z8qTNaNPCEX7E9Q6huypLPiw3cLDEt+UKMeXkwPwcnJS56FqnITSCZtiy95nuUxS
	 7IYz83an7oY/6x2z6jjyupnSAdb6WVR6/+Zp10xU+CtsIVvdgLbW/m1dx7LJetzE7
	 zZ2kdAYRy1u6qM8Kxw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mty5w-1s39Xc0q44-00tjts; Sun, 29
 Sep 2024 10:45:48 +0200
Message-ID: <096aebcd-778c-4160-b478-bb26025f3940@web.de>
Date: Sun, 29 Sep 2024 10:45:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v5 6/6] i2c: Add driver for the RTL9300 I2C controller
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i91wv59hcq2k2nFHmBRcakpMnqNJexrSho8sKn3t1TQfhs1bkEY
 U0msouL8ADNMLlyFjbiRTEZb5yHT4gFgylhdtxf32l12zE0L5TdsHTU/tSRbh6Z7tdiY/Mt
 mjL69hnym7cP0IzKw1uZczzRMASdSjJ0ib6eMexIyn+kYYV5BCHu6z+3wJIk3fJ66cYaaXf
 4zHstsWnOAG95+8c6oDrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RjUmfED7P8M=;2Sd/hN3BTW3cL+opBdD5oxm2Mzr
 aPAxf00/cX3tI1141DE9P4TO87bpEreoqY83ifwUqD+ts3+i+KhsMXwQvgAN9lTlta1l9O745
 Oet2efTJMtWNpwxms458GXjW1Z2/06ZB1DjTz5lu8UwEztFK5xGui2XnxXDjKAvIw9ZXwiWJO
 a0pdlAofX3DEKEnZdBRqr2P5lFBk8EyDYldtqhVfh3ijJlZnBsl1wzTKJ5Rk8vOAY1+JkqQ1Z
 yT+ymyGUN6N1871odxtENslv3LXTVkaugGtRLEri8I5mQkCjcap8GdGLts1FAGVQB0oZ3W9MN
 kdrtRJzQ9O09PdDnMyJmCnGFIG2SFHbTNUqQXfV4/twiN0SV9AAMXbD9hjKD2nf72LRCpQdws
 Fr2FEC89QCkJdigtmBq9hDONp+LgDjoKsUGfJvx55esm02+5ci9bM5cS2AA0n5B4fO20VlbV2
 ihYxvK3R2nbfmMhSQGL+y8qlSrOezYQYy2E+d5hgBIa3J/+9d6fwSjqPCoKmQTgzhFd7V2Y7C
 jym/D95RmZEPYhySZnQXaBgXvuhyQRGSutDArg4lBpkCa+4wvCV/IXTCp+vNKybBIIZBHW99U
 aL+oo8Pgb5Q409zEe8nVq9i72WB5a7tROYhMiNTs5iwPudks1+PnEpXJHBnWHnxSlRGZ6Bihd
 OQxXl5lgIMjTtRdbrpGy2QYrJqkvSW5yVmoipWXm30TPUNbbqZk0L6VnCVx3IlAxXEpEtoIb4
 6UDcCTTkBP3XoJw2RcYJBc22soaaitJmLlRpG9sbsBzkyPCaBk5TTyDRh1ST7CQZBiWkEmTgM
 VHwIWurAGaWfU1PGxvi3Z9Vg==

=E2=80=A6
> +++ b/drivers/i2c/busses/i2c-rtl9300.c
> @@ -0,0 +1,422 @@
=E2=80=A6
> +static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, u=
nsigned short flags,
> +				  char read_write, u8 command, int size,
> +				  union i2c_smbus_data *data)
> +{
=E2=80=A6
> +	mutex_lock(&i2c->lock);
> +	if (chan->sda_pin !=3D i2c->sda_pin) {
=E2=80=A6
> +out_unlock:
> +	mutex_unlock(&i2c->lock);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&i2c->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11/source/include/linux/mutex.h#L196

Regards,
Markus


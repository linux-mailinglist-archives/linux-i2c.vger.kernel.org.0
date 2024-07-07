Return-Path: <linux-i2c+bounces-4741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E511192976E
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 12:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EECE1C20AB7
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 10:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CC517BD2;
	Sun,  7 Jul 2024 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BaiIhj/n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A31C683;
	Sun,  7 Jul 2024 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720348499; cv=none; b=CJFYKsdtIq5TAVcNSgIj6MrVbRSzW8v98k0DHXcwW1V3nD3nqMHz4S5LmPOa1RPsEXLfpTdMr+PoO79Wn8Rgh1PQBl34fDkDOCjRMAOO0miPx34wSsI4L8+FbDwew4lMuQ1mWbMV01onRvZkvzbGx3MPMCDKwpapOzV8F95mYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720348499; c=relaxed/simple;
	bh=MhxTcsrDSHGO+C8jtgwFxx0LWkqcN9RjnDhlC7F+N1s=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=VFOBovhV1ZCxn14xQfISGd08gTtf0IcqU+zDb7SZ99a9F/b1fUu2mNd7EOA25edJd5wgY8BnKFPl13C5LqSdNrkXFhLtco9NqBkY2Mzj8/e6TnWWsICQ+LBfqIqWFBIS3usZ9nlMYk+Mj4WOC87JQKVXwPo7IqNKViLfUPEfmw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BaiIhj/n; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720348477; x=1720953277; i=markus.elfring@web.de;
	bh=D+SPsbGJu5It2MY1B3RZE6h+ZnLTjyryv5HKavIC/ZI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BaiIhj/n+qJznCVRpvDEMbyykg5JFhpOlj6zfy7fdLvsxs1cgertKPYhrSigPAZv
	 nCd+ZHJ/elIzh83s5QAawVOKofRNZRbCLw6CJpLUTnxs1MjdglmAnKAaio0gp2V4p
	 AqBn3Gz2/h5H/myf85ZLDy0cosc4pXIDEtfhlUU9VlnBRKTOUATGzHkUaP0v2+hIV
	 b8BF5mQee4AU6uxg02kg6eMKfhL3hV+gqbTcRP2jl8BnXjZMqi4DLDAPZFAfIsImW
	 ZpbJhmgGwIq4WHsXAeQpZHo8yKXbNnOb93POwZhY4u+2eXw73tV1KzqF5UlYiBhbC
	 Fu1yHTIy8bxKI001Kg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuFD5-1s82OP4BiP-015Shh; Sun, 07
 Jul 2024 12:34:37 +0200
Message-ID: <f93eda7e-e65f-42e9-b96d-e88290201ca0@web.de>
Date: Sun, 7 Jul 2024 12:34:36 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 3/3] i2c: rcar: minor changes to adhere to coding style
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r6WwgweZhK45SJhjnwHrINrV2plAo3Bj7qgFlr5uJpk63Hjmown
 +tNPqEglc4MQBwjuDIL2GK1UoGAeysGWgadhWHZiF9+RqknA3wNNPh9UPL+2Nzf6VK9hc2d
 +UJJBcPSgj7JIY1TwKYPsXJnwGh7VnGmq1xMGuTaLevLEIoMjdbdPlFAySUzeZori4XGpI4
 CV3E4JLvYsY8pxieZLGow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mrKbUFhBIO0=;3NouNBf2MWsM2ib/fq2NJh4MTjC
 9g0U/VeyApSV5GOCuBQc0lWbBTS4r+OHG2GA5DbhYnUbNw3I0ySOwe8wvBoTDAY+tDj22yEC+
 RZXx1N1hsomU/xQSptPs8KqVdAaHKGLebh42VXkS8jFwhG7IVVTXxm1uYKwA/9huS92xkzSPh
 jwtgiD3h/SyWZNJ/SM09P1eQgmP3Qq/1lo8czUMHwG0HY4n67Z704cv0hSPIQkQB/n+o9KVUx
 csd9gCAC+ElkIwGpwuvNMD7V5Nfc8Ua291uCjueWL+v35hIdVuSdMqaYgSYHk7kCnYt7B674O
 m8vvNdai3pscbcD725R05hiiSvRe1cAfkqOGUk8lcsm/mRoGYjE4p9VWEYVkYwQuTvOYxs+jI
 iBfJYg38uVQ6DMhZKfwSbAB37HqI8GwyCkq8KHThmNfDIxIfvJ5TyKwjHQF+Mo+zhoj/gsvxW
 WcLxQRnn3XT27d8DuXLOli7BuC9+t30qAdtXf9Gq1dpTTTQDlkoGSeJr9cZBkGD4eai9iQAan
 ZL2m76T3IHM+w/PNWwGI5YkN6fsvJ2nI26kPtHgmDfxsEAFbB9bMJRGdjLl9S+5HF90gCujnS
 N1/7DnvmSeSjw1csmGsxCt5z9Vhy9OKBGf+3OIz9vTohnRYMjRVEB5GIwCFrifLn2XFsC2hrB
 6uqMtEBWBq7iZ8orvIa3lnHwb5VQK7313lMImj5J3glDUGhq67qJFSkUuDjlwfZfY4h+5Hw1w
 EZsG+llXmdb9md9DsmXk/fU7vs0u7hv1YAFXSQDUs75gud9YN3tdxTjG6hbAZMOMRjbB6zmtK
 07i40Kby5PR16Q8fHDECk1/GyWejZeSCYiLsKKX/wJbzk=

> A newline was missing and closing braces of functions do not need a
> semicolon.

Can there be a need to offer such changes by separate update steps?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc6#n81


=E2=80=A6
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -192,7 +192,7 @@ static int rcar_i2c_get_scl(struct i2c_adapter *adap=
)
>
>  	return !!(rcar_i2c_read(priv, ICMCR) & FSCL);
>
> -};
> +}
=E2=80=A6

How do you think about to omit any blank lines at such source code places?

Regards,
Markus


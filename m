Return-Path: <linux-i2c+bounces-12715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7355B47B91
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 15:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A7C17AE55
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 13:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB2D27511A;
	Sun,  7 Sep 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="R6e84JkY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B47189;
	Sun,  7 Sep 2025 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757251520; cv=none; b=U+lhZu7t2U3+EJ0vcqe6oAa5EdNgDKiNy0elkejel8Pkwpot48DdOSO9NCXCiw0NcKD0hAdI8PlJQ4elofdb65lXENf8G5Ec9aM3qKV5l2t5vYC54leFTU6Ht7vXur58xJiSW0sV+8J6BVCxoOlFiI/bbEBOyXHdvlpIUk5PmWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757251520; c=relaxed/simple;
	bh=fTBWrmTJnfGOSkkH58kqFeRKK6Ed7AoSn5KO/YdN+Gc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DWzutKUUsXpprNQFKHbe/vgHLK23Rov7kKg5hieLjx+W/1q1kSd+PMo1XD4Z29i9ylHBo65anZi1nzcw7xb2BCE1PzxSlDaGZhlHvR7Y3xvR81v4oGL8GCNDADXD8WFP2YjUKDQbs/ReJCN9RjWxqlInCZCW4ugyQ6Hd2QEdWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=R6e84JkY; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757251506; x=1757856306; i=markus.elfring@web.de;
	bh=tbBb5GVz7n/mNYrSevI6OrPd7EfNyHuWIkDsBg5vWVA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R6e84JkYyNHmEkk+H+TkKguQK0oiOlOoepgIhxu80HKtwkWhYilBoG/RO0M+FrKu
	 BuASCKfuiS+TghtQrNr8+Pkz70IEJBBf18u9gn26N+JHEGKvXc4aZUt3xzoOHUA4X
	 9MsUdpjAoDuVCJ9NBK9Gw8aiPCnNO6Bd3u3n6O9nBh4KkClcQS7dO+XuGx2KBg5vJ
	 KCL80Zi3Oexsf3HK1Sb5znyXYV98uViFyt8M8rW0rB8lWTTkJlEJ4oNWfd2AMm5TK
	 S5F+iHg6v6mQmykN94Z+0Urr8OI+xzxQxLQyjfhQzWbPmWAWDMjxVzi9UwMBZomVU
	 XgASlr70qS2FZk8hZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.176]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmymp-1uCJdG25J9-00pfpM; Sun, 07
 Sep 2025 15:19:37 +0200
Message-ID: <dcadf502-8c14-46fe-8e2f-222cdec4dae4@web.de>
Date: Sun, 7 Sep 2025 15:19:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <20250907120706.44114-1-chiru.cezar.89@gmail.com>
Subject: Re: [PATCH v2] i2c : algos : i2c-algo-pcf.c : fixed errors shown by
 checkpatch
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250907120706.44114-1-chiru.cezar.89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+gOssOwThaimyMVBJF6kwGTiUTq7+XGMwneZCpBz1veeHhvu58i
 JfJnDil4SN5c1CM7VjtADXan6VrDBkySJcQf3Fv6iUOmU4s6+0OWfGq9Bfd7iZTzQDmryPy
 Q6l8vzBVpvGUF2ro7bJymLKyBOUCl85yLYM6loOUv8LLnaxl+lyn7RP51sD/GIMGnTzM/r1
 fK/HsU7z6nysx1523M3ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QTlSBWhCdMk=;EyWnRY/C9IN4HYqpF6KG0ox8xH0
 DSDLE78BWb5Z7vxOjskh+32GLjJ6kCLESc9lAJ73JXkTW7Hs0GfhYCgt+5cvUBYjw7vvDruVE
 lB2Nn0iKMQNlL+STCRFeFb8fUIsVX5lbSkqWQyXuo7SU7SFl934jhCF5I075ox4lyLim+wngt
 MimLQg88l9j9CqPVgPCXJoMx4s9DJEp1KTCQ3xLFWpPgnas4l+hqwHl9jerH8zUReIuz25Ucw
 8pma52NksHRwCCdNH95Mlf/kyyhg5lzUWBH3515l53UMqNeui/zSp7kvjGRysxk47J7BNXTxV
 NzjjOiLT567Wt90WK47CP8PzvUu1Tt9eRQOYmubaVsweU8FIi4zRvGhPVhy0Zkdjz4oZaibxK
 3cZz4WUzDZ6oNAjP+r//JkPdlRoJC6z7Iy/1lIKwwHaWNo9JKSoC7hidkjGgWKTvo6jE0wWMG
 YSnDP+lw3mLhUF+3XXDUsYCMa+MaIZjGEKfsFQ6c95V+OXztdYFhIz/Ksc7OW4BfhDFKLGkZB
 bue3hNFhkOFtUrR2itP6W+xaizzsRYmDAb0jWIdw8FGGiY48QrbcK0ItyvQzLYjxVdz0wMWqF
 JxYjRNHLKcWK9Ui2LWu2B3WZsf/+3le9XrB5eFwJYfUSgwbk0eiDExA1Yy1jbnibBTQZEAhJH
 vWlqLKTCf43ZMiCb+uJvCCYu5zBqQ/TlZ8jRc/UE+Wp9BZLpHdFV8yJIBOqJVD0NUHWlCVgl8
 572xDL+C9R1f5Ig45sG3bZvDzNLkEXLKZ3z1anI9ikeIt3PE4PS/klc02FRxTYFqZbWwH5QOe
 YpJiBmdjMGpiA3OPg8t8boNUsorhQI9W3+dc2a8pqzFq1NKyUv3i0GDhBiNuK22SjTpmu3SOK
 Qo/DNGAWxydoqT8Z5TCOIdfNuDlncDBZvUBHLl41ZTIgEJBMunwI42txsjqOXdjKfOelb0n+B
 SdvQrrBTbvZdJNA8oeFEpIqDvFnnQy5PkELZCZEQQbcaTMB62lTwPbieTCK1XVXO3kNl/HYi+
 omCRsRYGSeONm7ZwCfvX3GSAN1n1IqIJb2EkLlrJNYwWDMZIGiddxlT+ewtHP3EHDAcrRStH0
 2o0kkhTX4NblfoklDTZDsVLqwY6/QMzRkQJb0imZyce68HWEIY/F7vNTMd5gqIz4t9WeTBjxD
 X8J6bfUNt46NzMa02BTFGBrEWNXpvxHzEN9jZXFf6AxRVTf6c+tS+xBDBQwbvA5WXYv/PrAuj
 55zMSvCW7gyTHnacujz9Rvd3HLq8KhaPaH7zDhD0GbvaLU1+deAh4+Kb+cCAOSvlLYNVr/Mlp
 Z+Qfkbo8K0E449Eh6WyKbvEeXpGm3ywVsWMi+I1i/7PnyfXouw2e9H0rD4c7Y+D1Gj2a9R63K
 SQAJ0/9ZFV+jNjUbuUmgGOAOzSu0e39F42mDu63Q5DQYswoksCNtWESBzO6m7Wrw/I2WjFV+E
 asepw/CKhhwbhuYpxo+SqhiL4x3xYCP9j1eheLBk8hDyH3jmjLzOz1lQ16inaZxoBU4NJ7RQj
 wKYUpzRdX6YO1s29f/7MQXMSJJ7JkgAH9RVvDcQ2HhrM2x45aKpCN+5MCGcmhiGL7BfeCv87q
 ezUlj2oHF2pmBvDlVfqSMOUzQlWzg9Les9+gKJihEkGKBacjAtoUJdKYOVGhOnYgCUkumL07E
 mai5cZIkwf8H5bqPbzyauWytBq1KIQ9nYp3ePaMAUsszyaoJO30eLgvMYwxuYg0d5DLjQqLrw
 X53JLpe8Qc0niJtDLt92RJwJQOIPpm0d8QcA6dRkvbkT/OMGF29wthYgGeKtLgfIJzHkMXXSV
 SzYhZBAbIDfDZFQ240TGBv83S8c0Xv6YrPM92VCFlrc7pq2hux0UqZ5PljGyHW6tA8i20wUu3
 oilwswqcnAd3GYP43Yo0vU0j3zQn1uF3IGo/DsVcremqMr8HCuS8lV5k88f/tGBhazeWALFqi
 MVqfZbGuko3XAFQqcJGx3XCsSiaDyyWitGgiZpCk8h5lENLLjIUgkqmqmCnwSgA3ftaic4F6w
 Av8qpI10lVwvxA/qDTojdnO1AL3jihhE5ETkAr3cYUBi6JIBBY4FaCoibLz8UJoc8WJ1ph8U1
 Jv9s/fS7cfjzNiuNdPsHA/mDb1pSd1A3gJNk6ppDbfILifXu61rdahm9GNbMTZEXV5+iOUMpP
 JUN6MALG71CaJaZGoPMDxd1lylBM2CKYdc6D3Y8SFwApjg0w+8wC9c6ohVlBwa9kv/3WzDTBT
 tX2C3s1xybhC4DP6xsVECWsSvEXe7igpLxzGL1DQIBzXKhkWYUJYCdegI4+zEr6gwwpzPBCZU
 r1WScAgeBdDeL+RMgzPtIZGDq8auLOxZKuBhVXc+23+iVS8wBx6W2wNqfD5HCwOFMoGaL97Nx
 IgfcKAICBKnJbJkbgtHypeIFlW9J8cFCxAUyrSBg+JsydPPTQtEUwgZUBCiaOnpWWw6BKRhh+
 kB036Aa16tO5V35NUUYZjBBhXHPDg24m+vfQBGOM/kzDWHx/yjbn+VE2MaeppvEnMxyszZ698
 UVhBPnTlrTFCJbZz2wzDvmWPcjehtGFGbhMJQ1D69BZYbdGu5ffc11sXneDJm3nfCLa3a4n+V
 +0Q/VDg/MIRLR9yDBGfzI5VPeLHVwuCWURlw3X2gQ4wFb047OlbgMyXHsAyygaGPuHReP9w9I
 TKUI2JaaQqF3gv6biOTtW/JxnPIKwinMLMC9fXkhCeW2s32w/bG09l9BEHQuQU/NV+asYHnVh
 2LbOFcjCrk89K1/89k59NHiHbkNlY677T2rqcWHH3rifLkqhR2ogkLlRGk/lyCK2lRWAgQsvh
 xUDS3ToBwVFKQWhs3a8TqQTOb1M3uyHeb4nduZblpQZKU7iol++9pD+O/AN0f+brPFpSSC1vx
 oneakBXv3u7ImWStg0BFCv8Zca8FFLa08vIgM/Ek60KIejWYrQGETrfBeci1Tm/IxMMZM1sAC
 LeVpTwf9rZO3H2kmW5qibv0jtrIC9tiHsVqmhUZEgz+exZQKJccPoC0tiTXxOSqU46gGrL+/q
 Xobva3XDf1fOHkSFGzUoeS7Cf7N2t7eeSmZKRC+xv9ITio87zRdsvhBOf46eCQ9kZP5eqnGn4
 979rpksfcpp1oFmEG55Scks2iIGi8resVVzlT2LGTJcXYRnWZUYEzsxKm/6kPLR8ypCvF27QU
 bEgI+E/ILrtbhZ4ORj6nO+HgghpB47JeLNTuaw03gTbplek3+MnTd35dWv9VG+G6D3hjdvVF9
 oM78owdV2RJ1sJx4sFejYs0o4SHXx+ntyYm9agXeoF0gxzr6+zLLUdjyeDUIts53HK3E1yoJe
 Vpewh1xZBde7OeLwO/ayFuK0x6nIthSN1jo2HNVI7eqS251NdSL2RdZGS9oa6mBj7KZ6LxFAC
 FlYGIV9VDrLt/rg0ZlnDAIxrUyWWjgY7s6yYEFsUOfkUFN7zidok1hNKoBMhEYk4aPDmaMhgA
 oWMDJyZtARyKld9nc7tTlTkGrA/l9V67aDjetVgExLbS2xbYmErNJJyzWwsLOtWrfPJvhs6yv
 o/0kcZ3tl9buNdw5hPPBjLMycMpgLBa8fK42GXzF4zJTMW3dU2/rPeRmyYkT5vNKg+6uubj3M
 w8wbgkV7ohwGqADSC6xMdtS/1benJxg/56w3asrONm8za6OXHR6S93n84g4nTcfepCI7DCpmK
 38puesF0lcuWZFw0uAAXbFp0vzwJPygtxl1GxRf9DyUm1yJK98OECFGPSD2eEwg+1tuiPHVrv
 2Rh3/x2qcnDRuAHkzSXXlge3iZ2IU+5eDHdNfjsBh005JFSB8hXfa5izSqUxVdGBmE//NkYOQ
 nujQJKpgMnM1+/chzb0Rch06Byy8HpnI6ouXYHLVGi/u6VbeV9O05ps63OBXOky52tRL3ZVOk
 QqhBDbd/5+ztt2EOp4ts9dPxdTcYQHi/Bi3W7M2rhum/WaWKhZ9iYL7ACGHU9+5+pIU/pbFPq
 HHy4i67IFSSZuPqOhvfYuvsURcayVXK5tPUlD8iXr+yw8muxflc05fV5DD7UG1G7tDpmjbOZ7
 OddRmCiyxH7zBPQPEBt68XF5b18Gpcw0BaS8MWXfAHSWHGnn90JONMFpyTviD2ymZxq8rU/Te
 hkRaUi4T4kr4osAO+lsykblRxFp2vcCpeST68gYuUzsIguvefaLJKK8Uy4eEQQwoCKgHsChOn
 JYi+TLdVBGhyHGu9/cR1Hyd8aYlgEMah4ggdQAH6Os7ZG5CDzy08EZMiwO3EmywI33CfeYyUH
 7+4RAVpkYTY7EsisNTpDOE1joLeFVq7a773fFaqcKsdbypT6ElKk1jQqxaNNn8WkySPuIAszz
 ZdJCeAT/ewA2l03lPUO7Xe6TIgTC0PQOeFPfTTe92mV/8CKg8kPcufTwMSDpJQR683JCyjuzH
 m1XidRONfxu43mfN/FFixVJ7K1AW6o8gsgXClxXhY8QrRsdN9FLz/tv8SgRRowpURlblyqBVA
 ZzOxhYgKi555sA0XgZvFsu3TaSqw/Eai4lV14OTE1mhq8efKYGD0qLfa331P8HYsYGs53kIgW
 IBwqvqaVDRhDppcS5UoBDlsqV0ZEXOA0urr4aCHF5dOnE85aHVGHYyq3YgVZrXD6PkRTXUDI5
 HIL2Xgz+6avkeFsYBi/gqtFHeGSlEw9Nk57zXvwGL8e8inLpdlDngREnXkAsh/9cSVNLB5oeZ
 lFHMe5m/CeFWLuqMJUnMNo6ebmwRsPqi4hLT1QUmdmFhI16FdawjNtbOv3reoeB6LMvKfU6Zj
 GSWfqIunDOePVtZ8p+pUZiGHOTASYwSShLyWttJoQ==

> Fixed all 18 errors revealed using checkpatch.pl on i2c-algo-pcf.c
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc4#n81


=E2=80=A6
> Motivation is to fix all errors and warnings i2c-algo-pcf kerenel
=E2=80=A6
                                                            kernel?

=E2=80=A6
> v2:
>     Fixed build errors generated by missing ; after do - while.
>     Missed to git add latest changes to patch. Build is ok.
>=20
> Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> ---
>  drivers/i2c/algos/i2c-algo-pcf.c | 42 +++++++++++++++++++-------------
=E2=80=A6

* Please move your patch version descriptions behind the marker line.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.17-rc4#n784

* Will enumerations become more helpful?


Regards,
Markus


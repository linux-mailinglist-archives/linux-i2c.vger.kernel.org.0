Return-Path: <linux-i2c+bounces-13674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B65E3BF0FAD
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 14:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCB913A4343
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 12:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAE42F549E;
	Mon, 20 Oct 2025 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pzYULXIp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D31F3D56;
	Mon, 20 Oct 2025 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961650; cv=none; b=rrdwq+DdXnRilmovARAX+pBqi9QmZxBwMW7QISzaWP3797phYVIIERJBLNAwTmlTUB7qzjgyDDcuCafN+BPNTpYk8VmozuDydKYdWOFF4Tcjnb0zce+PozY6CKJ5bvgMyvI8yEsHWafz/wHhwBQd8cbaxNXnAIwaSzu+3T132rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961650; c=relaxed/simple;
	bh=Z3a389jFMV7KyWO6D7061iHIzY+T/KoYV86JEaSpHbo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Hwe90fW1Yln3HZajGqxLc371zZR4vwocFZYZXC+1vtPbyIMC56nOxjb9IW+1M4qM3WhduxLPreCnzxmaL1DmKnvHiKvpfnE8MBVkrh6ma/ZgcXPVIjqA9mIjNsI1Iqdf29q2CzT00DFrl4TSQ1rJhB5Uy3lpkTudT5VyX/PY6aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pzYULXIp; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760961624; x=1761566424; i=markus.elfring@web.de;
	bh=wR0/2GDY7PH4f7EL3ehNGkIHb1OEc16UpmJv/AXFlEM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pzYULXIpa1aKDh5s29C6h/xiByFsNfGZaxejGzkiXlPItYoench1eBhLmgBEmvFv
	 XblxS4SvWNwUhRHA1JGFDWS6UElxWZgo3wniA/xzSpqNp2JzCHtmjLav0sfEtUV/l
	 t4QSNC4IGa7Clc9qSVxJAW9OgZcGKxiLq3VkSTybH55SXeoY932qs6SOx1/Tc3pcY
	 XwXghRIK5CtmZ7V7GF2eYtPBu8Qo9UpsFzy+1zuzITijA84hHMxDsdFYclOySuTYs
	 KtoX0n5vRVwXzZOxRtKbz+ldtVPwpOY171+ltRJrZ79sf1cvfP2PCCARsHfFd3FNv
	 c6bEYK3UtjiTjJVnHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPdr-1upB4Q4B17-00WFTc; Mon, 20
 Oct 2025 14:00:24 +0200
Message-ID: <f7e0c023-d2d1-40ba-badb-74a7e9c23684@web.de>
Date: Mon, 20 Oct 2025 14:00:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat
 <alain.volmat@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pierre-Yves Mordret <pierre-yves.mordret@foss.st.com>,
 Wolfram Sang <wsa@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] i2c: stm32: Omit two variable reassignments in
 stm32_i2c_dma_request()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3kcerp8Cu5TQ+HhZrHN48BG+Gwrdd5fazreJR3XOmWOQcdK5Oj0
 RxkyfdlNDEtsNYXUEX8tkt5cPcuOD4j/fOOQzVAhDZttym6UgCb/tRRXNBq1LDgNMsnup7T
 Q1qb3IKAf6B9ltb4RWu9Pj9j6JXMi0GU01S125KojePSRXEvJzIlWEA9JY3QZ2GpZmH6fiT
 Grfnu4Pz91RbY2C6eKYBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9qK5WERPxbg=;O8ongV6UJdinuE+6t/wpg4wTbmB
 Bimxygkc9Keb3PXpqZehWhwcKM8aGZN2FOX4lWHLUhaj76D6VRmouXlcn2LJt2Idaw/VNS1lA
 W4rJemDQqAN0Dir7Be6lDwCXJh9/So0q/6qBhlpk5xEZupEJyM3bGUo2TA01DAGQZXMcI9+d6
 GpiX5+Ml4oGJUjxs22eLvu9YjtWzQGHr4KaBpbd3LWWfmlfSBe3bBRH+7W6lwvPSMes2LY44d
 0sXQQrJQMaQc+Ao993IAuOkC1Vdr8wrBFKPnd02j9JgBQR5ORnEI/5+/0VDuw7mhFpLaSP+6j
 HCrhoJTNf65Adv8+kYD9l8NEKWu2UFyfpQQbgttXczQh7w6vWfoO92rKBmXukpWk4aJ/7WZ58
 d7TNtiGairzWhoBiQodp/hnTq7hzbEZk2iBiyOyTBWwGxpHFJ8MgI7n/3b1vgwZv01mnB6AcZ
 w5AXX/mNVJISp0xu6f1qxGq0KTo/lEI30VNjyYdbUDauF5uSGmId5MlcViqi2RvnRFoJyyU7c
 EH0CuCyt3v+fNi3j540EzmhOwasRcXRFYg4/Dr02M8z+zFTBcCZdLKGf8vkwcu4oMBxNju2k7
 9mA7R3CjEfD/cSDal1NX3NigiK4sploRMyTKjZftn8+BklXtYa/YXkZHTXDjnAUB4q49qzEdv
 6T6++1RZyNvuDpY7zk3ZYtcyzdS04ub4HtIK5rS3UmRPZ+ulURHz96tzjnO5Cny/jZVRXRjgg
 tXKUj/cVDreFNDgMwN0nb41nzjHKlDvZxMI/uIzIqjHcccYW2q54ngzVmopiHLyvddRrqu2jG
 K4qO0NofM3blBJzrRm1AC/26ZrsOAhDKT2VF6CjxAVWC5BQS6U+e0KfLe3So58XMwGK2GZXnj
 D1j/U0RzQ4wr5igeZZsvr9X0GOzcyY90LBxZiBt6j+ilbVHnwypC/tCWpGB35cLqmW6Ht9tQw
 P8qcj2tQQ/5QxL7MjEhyBiqjtMACBZSKCdqw5S1UBjRECaU2U0ze7uTithP5+QypFJUW3eK3p
 YpaVPzWz1pWO+2XU3mU5ERz6ReRX/aVDm81ZT5Ysbxa4KF1mzOP24VELZ53ogU3hdyR5VeCa/
 pWnY5c5y7abdvGqhcX6SsY0SpOkKK3NmnL/ltcge9rtJTm3tHWncKeZCG8wytLHY34SEc2Iq5
 OuorsGZUt7t54wSfL7UJWLTBW8c3AC3T0OGgmR84MZekdwyQgoF33PBt+ubflRE20gNoNS1fE
 9dnpWhZiQ5EJXinDeVyH1y+Dn90cRXLAwJCOSRukHxFSf7J+zIxx13994RHoLSkFKi8J/0mjS
 l3HpK5iaz6KaNtRXkIFXHL78bpvB3B0v0DZGFl4e2sUs5gVJk0ine8vV5DrORJNrGXqMuoSOq
 jHYsNnCDf8MMW1RW2IB4MP2KCxfwNakTNUlaq8TuhTjGZpOU+Y4pbIbMj8XYK7/N1BAGczXX6
 cEpAF+DJvwyJL4dXKvvrw9zRrHq7RKv1t3ecs0B5Uxtvwn5VNrLjRen9gBj72HAmJfA/6ia9g
 FNAk2ADZrZ776vuz4igutvxAzL+bkAg08uT5COUf9yaHWLKqaLvOjYjrgmjrQlikVo8DqlbK0
 QCdYeC5WklxhkFmz4WWPg6A6tVDSiPQd1bMmZB2vLL5ZfvYGX5pGvxQ03Ts8jruzFcqvFuXCW
 n/qE9rCt1/jwHqmIH1LE6iWcziboZGcWQU3M8p9O+qDYxj4nCu/IX8nBSF+JcwqJAnJUJM1ce
 KbAMkCREHYHi0R51IsVG8CSYl4B3aRYOiVB8PfAErY3E7TyAnLRSfXaBw4kP0N0jgw09s+B0E
 yC+WTjcho+0K6r2wpW0YYD/IAFsHY8+wCgHGGIZGvDK/bgpdyXahauiohSgMkFxv6u2Dkg0ba
 v8mLSg8ZYlyM5IYk7PNa5wffR3uSPP+jXp1i6Ux/7rOhixGnd5ExpaiUD4Ubc34L0q5z9U+Qw
 6eRIhf+V7J7dMrzLiIEpJa4Lie/yzgxOUoIdizk6J3hC8SNrcVojOsSdEYbb3LA5+thyTaHV2
 qavExLkVUre3TbYp+DvDRGRnzqmOZn4BWkBCCknAa4d4gPS27mrC27Dm4148SWHFe31WqqbXW
 M9lrvElNlezqlBcTlDhUmBlbbsqFMmAWBpxuWnUsmnTvQUmeEZ10hWGZ7qkxRmjhXE+ICVVmq
 0IJoP7zVJcsyyWYKaVQgkahEwDNlIEh27O3hQafLLkP+hNW8Pe65VgdSZQlQ9qwWiIP02UMmE
 oRUDyYIVuXAMT/ljnP8Amrk7gVN8C1ZiEzl50UNbMoIS2o9xl8RkDWJfVVfYfinzRiwt0ijQ1
 G3JhQgsTetGHSTBTUPbxwVL9rRnKflAXNRuSSYqLnUVank+sLUVe6ySv8unQrTD/wtZhgoP2v
 Io/iVNu65ERSJCzzdd0LqUJRZHx7eC/OA0ip8lAC9RxyPcrTIBMtHjcr9e3nB4BubRvGwh3qm
 68LvFDQLjizUz+wZuniu6Eax4oZVexq/o2kmY8o+rkxtEKOwodtrR8ONdrI5XPvhVByfQ4w0m
 udgqXaHSvewIMC9er7utcvrjMr0qMcc9R2sxUFwCVTOaKHf/4dbi1LjErZHXPaM+5ftpnxz5M
 kbP/H/16K1eW8RH3fV9e/8fnq0fS4GvF7CmXVcWZwJMIpgWEd1hFOqJHdIg+lyfBl0W9ljVI8
 b+8ARNAIty9/B25yOYSgxfFKW6Gqvw5cx9FWOrm6c2zemwrzorKVQd+bwqx5FInH9HSQjNbkv
 YlN6gEitzW19zgi4RyV5Ln/+djEmSctgCPnEr+LxkWW+tNp0XjhU6DZnN5MKctJIK0o2IcU/v
 KXGQgwAROlo/2i30368ZkPbZ3ZTYgPiBDgP5R7Zuo/FPNA7M2TuRvtu/a80kvRV/sq1uRwRPq
 uMJx6bJWnpzyiDlC5X+gtxjTq7MRWcZo3Bzq4c5+TK39yyyFggN23GmSyulN9/+lroAqYVYkW
 qKLZtqzIX14Su46qQvR2bP9ukVQEduqjv35iCAoX0sLna8zqTOpUIgdsOkrBNGctArbpt2jbM
 vTjn50Qq7mDDGbf0UnVvcsGQ2j+1rng4LrsGFsik5xcET0AGDlVbhLn79uWstR28yJ4Bxp/s8
 /HiAoKMUQPMNqjKG9rK8afGcI96ukqTlqbq9e2VkWevEJpqI3Qq+/3njQqOK9r7I3lFsHECSL
 EpbbcrfS924ZdfUcCG1ebY1/8555S4xKsVZB1ZU4rvbOOmcit5YWxCBokW8ezKCKOD+e7/WXh
 8Oo0rEDjZbyaJwzfIq1Wbzd+BbM7Ov3QTEoA55VI+u2y650O4JWmoJa9ASAQfVUFF1frIos/R
 4sWXhmKsBJfNHx88xl59BMETgI7povGA4jkQndsTbB6Nbq3RuUVUB9LG8k0MWvbv4HEFe/Krg
 cdS68VLTMqoUL+iGnrVuuXpza1ie0K6r4MRKYr4wjxnXnMgAkeZEELZ69IrSTxv/Y4hGZKUVp
 Cz6nbxU+w/vNTsXIKgRFiJao7GVwVqV2IhsyRhebgDvVf0bM2cQYChSNZ/ruwq9ob8FbSlRV0
 9u60LmbcsHHKk+vMhUEQl99TH2ex9nk/0NBDyaxhC8qEFW0zsNPQz2f6rt/JvXB9wUPU0jpHO
 2X79U4XmPswouKfJaXTIA4e8VFbMfkrFOxN6gM5YC6RvnSRXn4ztRT+SED1SEh/YuyBD4Dptt
 ttbQ7T2p0TLeatzhLsTor91LH3TgjV5zUTo6zfwB0vDLmvbB4g+cOKP52iWanYWY5tmgc/I8l
 RtO9X9fsjn3+dcrr7Bo9pIWV6/KDQ/ExHPvxcqeqy98hRUDLW9U1j1l85BMNi2QrusBcIcJI+
 vfxO4t3W8MKsDkTRXrrImA3OuR/pbAJg9En11vSxjAJIX/2Io1PtgH30UUoTxFfJWDKKBjLOt
 tpcFCUco8TlT5P7YjWaz6tSSyU2MbtY/goOV7wRje4DvVuMeYb7XepkQ4g5K2udyvOHAIToiX
 mxOalaSnYyTvaOq8nlz9Lp9+OHzEc29NlAYscUJH+k0FVlBny7WxbveNGDtVueXBtSSPnY3Ry
 PjNQ6YCmrYtH+IbTPLFRqsu09hDL0H+t6A7dUcdPM05OQbFIXFXbYHfCkCvpe+ug7rS4tMS1+
 rW+vvuaOlNjuzDHkk7w0D8t8yg3BBud2voYGy3zVHxQ0A/RWTDgRqgqjYnScNcnvl80A68zDo
 Hgx4eandnU0yc0BGSrMwuvgtDy9eBREFgaphS2vzhQmAkr167yeO/ipD5Ai45EpypyzPli/ko
 LUavQ2vqptg3IF/EvtmHbR5X3IbE0+iZ12dBbTgz9URUFbvu+tB6pSWhVZHBJ1VlMBc8Mmtwt
 MQG6zVu4ssM4luI3N/HBVFjH7u16qqfPh1F2cUSWBBEXwOivJB00Pg2WRxM6ET3/5IduKlWG8
 8D6bJa1bYner5UJtJ0G0Or+RdF8GE7d4C0Txw6MyEssv4U3BmTJT5Ij/AcT+d1g9FKmlcjeUZ
 QJMCxW9oTyaKjsp1fiuOqCw1NptSS+UJShl23CBcXVpdRlcPwG9mUJ0XRUvRz1Up8NtlwfYaV
 aHFKVy9kegRFPhncWmkPGkDc1elSiRKVMfi+hsyo0KxjbJCBNonk9jy06hCncwXd3J8rnXjRS
 6NbhwnHodIp1X34aB5kh6jzo3jKgMfDLCqM6l6LnnIX2Nssh7nkwiD2v5FT2qOyiX+XNQ4cZa
 MUPbxPliXaGUTkOay7yDbn0NdRc32UFknXC/lSVFsXaWCA9ARHtos6LTEpCO+wS3yXF8EzfaJ
 aajPA4eK/u20CtcU3V/Qf51FSg2HHe//pHUdYFP6n7S+jmI7F2IgNM0F16cbdQYZE/z8l+8xM
 HnyHP+yL1qMBGzfRY75eAfEOgmytyBuoK2fSvX4xg75U5AFf42KQy9liz/9d24GB1ojBkGlUN
 WmmmxnGFRZpt6HRPxVGAkSAUAtEvG+Y6Lz50VjG4TknTvW34ejvIAz2b052LXY8JHBYMPiPfm
 N8cJyE07R9x4gk+2v5v+7ajaH3Wyni2xRPdzNn4TS7TzYEZCGNT0WmWK3Tu/gRR18CjA4xjBi
 bTnU4Msx1H0El7ATaVQtop7QEQ=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Oct 2025 13:33:12 +0200

An error code was assigned to a variable and checked accordingly.
This value was passed to a dev_err_probe() call in an if branch.
This function is documented in the way that the same value is returned.
Thus delete two redundant variable reassignments.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/i2c/busses/i2c-stm32.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32=
.c
index f84ec056e36d..becf8977979f 100644
=2D-- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -27,8 +27,8 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct devic=
e *dev,
 	if (IS_ERR(dma->chan_tx)) {
 		ret =3D PTR_ERR(dma->chan_tx);
 		if (ret !=3D -ENODEV)
-			ret =3D dev_err_probe(dev, ret,
-					    "can't request DMA tx channel\n");
+			dev_err_probe(dev, ret, "can't request DMA tx channel\n");
+
 		goto fail_al;
 	}
=20
@@ -48,8 +48,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct devic=
e *dev,
 	if (IS_ERR(dma->chan_rx)) {
 		ret =3D PTR_ERR(dma->chan_rx);
 		if (ret !=3D -ENODEV)
-			ret =3D dev_err_probe(dev, ret,
-					    "can't request DMA rx channel\n");
+			dev_err_probe(dev, ret, "can't request DMA rx channel\n");
=20
 		goto fail_tx;
 	}
=2D-=20
2.51.1



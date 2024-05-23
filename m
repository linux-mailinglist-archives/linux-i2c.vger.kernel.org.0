Return-Path: <linux-i2c+bounces-3662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7058CDB65
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 22:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EA5A1F23EAC
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 20:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526A184DF4;
	Thu, 23 May 2024 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="DflBNhIa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DEF1755C;
	Thu, 23 May 2024 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716496415; cv=none; b=gn8jTg4rZwWSPbsyJy/tEanUFHvNdK57veVWy9ywLiHKKVdL5doc+g9zydlWiY0yupfmrAG8DSVBsG0+mswl0kdn4+Frlc3leBOI0bK2BOzf24RMU10Nrs6DslTT99KPFv6ooZLmavLJc12yOuEQXEgm4IzmGSfAENTTg8S8uBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716496415; c=relaxed/simple;
	bh=DIDQ2tYtq8MFdZfE3oj6pVt4+VDDvCMI+FvVKdCMQSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ebk2w0euHAY7m8JBiJ5UNiW4lq5MDZJJ4U+4SlJNDmqLhYdcdsCRhlPrDzolBUh1gsEB5Rkj/hq38ubbhzuL+RpgbK8b2o0P0tLtTxv2c6C4CR4jtJjrigRnsDbXHoI/KNw1ICIjc7R1jJty/SA2IkRE5Y2acMw1wydpP31REgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=DflBNhIa; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716496394; x=1717101194; i=markus.elfring@web.de;
	bh=DIDQ2tYtq8MFdZfE3oj6pVt4+VDDvCMI+FvVKdCMQSo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DflBNhIauaAVPv7df71cbgjmYvPUxpSWvxhEzsJ8ncl8EsS5d4W+2i7KJiQWLzlz
	 KAM6W/3pkgrOLTNBSXh1Sb5Q5aOD4bbQavFraOZl1y6iWIacP4VT4PqibFWbiwCKL
	 ibSe5POriSau7agC0M6rVkJf/GMkS2FKxO3luDDa6B7X5dvz/OmC8VIpTGovj7hKp
	 A82VLkWAwpQDDHs1/BIf2xn3fkAW+q2XUN71UoJZeRktCEE2ATxK8B+NPYsatTgBO
	 0ip7ZzWqPtrL3tVnoS1DQWjxkZTNyRZPdVRnMzIo1HckBhcbn6b/5bGoSIF6rmAi5
	 PwUtMeKL3yAp27Dslg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBSB3-1sEslR0qQJ-007SV7; Thu, 23
 May 2024 22:33:14 +0200
Message-ID: <f90267e9-e62b-4504-954a-0306cb9de1c3@web.de>
Date: Thu, 23 May 2024 22:33:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <acced98c-79fb-4c32-abf3-66fe93031f36@linaro.org>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <acced98c-79fb-4c32-abf3-66fe93031f36@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jLabXc4sQh1w4S6fXJXVoj9rwHkBKzpssIKqnS3KTM4STAHIjIi
 kFcGsxBOlyKNoMTI6E4/rdvAT3hwJwkWRnJaCPGBPRd5nG7NqrnTR4b/bwAQFLjzR2cBudb
 YPNThBg1kfbI9hWv8uySONQkiRcTyK+SbhDcPy6mCZH0HU53K5AQtRo4rqsEHNy70WTEMw3
 0sZpRTI2S4BA60StiBH2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZVE0sWfFGGY=;IkuDhKwp5Y3ZkWOdaYr5BeXEQtk
 K5CZqEANOKAKvnJerp5A/YOUgs/WK/X9FFFT8wo0VcMVpW4CVlafIw9BbfpR8CZ0n6q0z8kLq
 eLIdgXnYivKN5O64ot1v3X9BghpK9xMzEBccM9+W7mLSSpCHe7P4SF5synYrfjTSNGxP6VoVl
 Rk8vsWfP6BrlPwQn1qEsJ4lfEaxl14gMN5S2ObPlEPksClbzYm2y1kP58Un2j2IVWXscMFpX0
 iCzHdUsRBArQj/8dPHYyPE2KEyzlA3C0HHYuq0fum5gkkj5TLU+TJEvLBk8CaTe9r2kT5zGP1
 LGzQorh4AtFrg1egbkrGratKE8F2XRtniwHX7Yrw02X+ZOqcS/KU3ZPVqaMYPs/ulDicwTGtx
 mpkTmc0t7Gpm9ZduHiPYuBYcfUjeNVK+KQGELf5LeM6OAhltl8UiU1Pq2kltX7Fc/mt3EFDJH
 5bUC69MjwoTGzc/8Uri3kSnCS+pdAWgQZuVPv2blUvccUIey02FH/pDfnUo44LhaGXTR87fr+
 WXVNA652/YEooX0ZXUyvqNuA+ij5gdp5+IgORM/xpTpDvjdb3wwLl6Q0RvzdojN8kA0GPU/Qo
 l7pEANZizhd0K/MRz0TEVR26cEWMy4BK08szyd0pecvrAMwU1ijtORF5sqOaXVGHMWIWuucZd
 +kMKHYy1yI1xFLwz7jf5MWXLzKe1tz9/Axd+jbJK81K9f40OERuL569Azzdu1SYs0yzFJ/LIb
 4wBvm/3X3CuEx1VHSfcqUWJ0wLWPyJJjf4g4FSJNv47+9IeZ2enQC5Nqks7Q05088LYnx+sHR
 v4QdJ01YEw5gWgwu3YmAPLkodxSd+uGGvPWRtUkgZrRCw=

> Markus is banned from mailing lists and most of maintainers already
> ignore him or already marked as spam.

The running patch review can eventually become more constructive
despite of recurring communication difficulties.

Regards,
Markus


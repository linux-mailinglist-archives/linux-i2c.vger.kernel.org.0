Return-Path: <linux-i2c+bounces-3657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0268CDAE2
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE66A1C22B0B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 19:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1F88405F;
	Thu, 23 May 2024 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="IU5MAlBk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396F29AB;
	Thu, 23 May 2024 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716492678; cv=none; b=p6BiFkJZPJrCiOuMd9d6h1HNjAqJZIiOwWK+PUXEV2KZB7+hoGYjKh0BDWJAIpAZKTOPnaNFKk5z9oKaAHI+vWEyUlPQLx2M+skpHu+1PgRowR+SOXSQZRhin0DSp+6zTbFslVEPSV4hTcm+kDD4VOwAyuBiphDqdCpMI2Jjlfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716492678; c=relaxed/simple;
	bh=TK0k/etgn4gRoJ/jFUnhfFck0IgfY5juULg0GsXhWCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MX3pcJftx9OaXGsyYtri1PFRB5/Nt01IaF+vIWMnzLP5FPLqLbO74PL4xRClOA2Cl5v0ecOxdlRwKWGVSK78B0SR5QF/E97sY9FATyV8LBKy5W2WXJomufUwGXSqk+tnSLJeld2GFEyJ/oI+x8BABo8z4EzeqiEdIPgq+Alz4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=IU5MAlBk; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716492658; x=1717097458; i=markus.elfring@web.de;
	bh=TK0k/etgn4gRoJ/jFUnhfFck0IgfY5juULg0GsXhWCA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IU5MAlBkygKlyE/FJFR795c2AV5JmiM+5/V75BfZhIj+xqR0jb0X0xzbnSiUx9Fb
	 4JVOw/WkZXUwK+4g7ujtGM6Z8cUHm1RONLnCsLmgECMWNofAxsrG5/YRlKgYSZBEP
	 kpWEJh461RMrRibNkwLWE2Tu6HnovKMMyOi1ziupgqdNwJRPhnTBZm2rF2L9VZOBC
	 yNfgzTi33Hg5Z09BiANFInRI+tEhnc7GQj58IMSi8DIvxk+6ljYLLPeZHUs1ad1G8
	 kNzqQNw8rXA2LqPCd8lGG7HFYLJlkfOw6XeRlm7Siqn5Ckw4b1kXFKmB6FizkRK0g
	 nzk4iPzZ/YYLPAMHUg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWQuP-1s2sfJ1Fwx-00XwPl; Thu, 23
 May 2024 21:30:58 +0200
Message-ID: <398bf753-6701-4925-b814-781a68a75cc5@web.de>
Date: Thu, 23 May 2024 21:30:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DAGnwtib86FkvFWf5Ytb4zfOvEDuQlQ1LfywcVNule/e6md8cTj
 cZ81CNDimlWAJHud38f4peWZFqWRBbK2Baop2QNPyneIHFsRkJ9KrYRBmbjQ0uQDkhxgXCZ
 dYlQ4D+X5r6RN2N2TWQaiuS4uBeDqtyw7tMHMFmbvhAU0QY/STpENG0YggEXjHAlK08pKr2
 PlTJtlKhF3m6iXBICcECg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AvAUgeT2+NE=;92TPdx7IhOKSe1vyjO3YA8PfoWa
 wzrEU9QnhnZQGo73Zhn8I5Sqdkbp25SsbeS8Z02pMV2BNysdZDsOaNOTnof+7z87NAtoEWv6N
 8d8pKYf7xRyloijiXNSDcwt+eknm4+WUFhFp6SRAsaRPnq+p3t0KcTVqrw2wgmGc3jiqe88z3
 soX5Ky0VnQ53AU9qJbXHaSu9uuo+8s0GF+emLYmv7caQYZxy/HEna+VYuO9apa1HD/5CzvGsf
 BxrgcB7H2hqvH5iQ/KTYkycbi4dsJO8T97sd9qXdeA6dcQHKmYjQTCq/ABzI+Q7cXqXib3MSE
 FUyN/GcKcbhRO6WPeWMef8VUFP/bYkrTCYd8gIWdDjKfaHQVnUK5Q/QIvdHBx2PuOdb3Ol/Fj
 xb7FvqkLGCXp1MS9UkeBc0pUDXoPnqV0NUQG/D+GkuvAtXytJ+qrg8H+wSt6q3BuYxcg24VZd
 TvCiA997y0F+NYclHLXF24tQNkGOhC0GbvoRuLAEMuH23arU5zaTZ6FajoQBnLDYTQsYakRhD
 FIZTvhJSvFfoC8gu/0ygVhZcgmMa3jSwXdc5cExperNWqQhTX7Ut0/pCkVYuWBPAR3bF0kezZ
 83GVaUSOcBqbDBorLCwpzSjrRLrQuxjnOc/+dgrBClYK1Qdem8GI2eYq+f/sZ1Mo8wkWjX4b2
 fG51IQOVVM8Q4KGxv5lk3V0zKtB2w6Ye/wi6fMKjd0mb7iSjK6gR7TuTqVHqOSTHkl203mOIV
 lqUHb0wMjGbSbdmhQq/YovQX434I2QJgtbtuDvoTcMKnH0f4DrrZyTWtnWdB9XauuGnydRs6e
 N0D37WL9Z/2AO/szkiJ5UgnNjIyVVi9tpRdVj3wH+RBUc=

>>> The Huygens is a Rainier with modifed FSI wiring.
>> Will imperative wordings become helpful for a better commit message her=
e?
>
>
> This statement is a description of hardware. I cannot word that imperati=
vely.

Please take another look at corresponding improvement possibilities.


> The commit message is imperative - "Add Huygens system".

This information fits to the summary phrase.

Would you like to mention in the changelog that a hardware description
should be extended anyhow?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9#n94

Regards,
Markus


Return-Path: <linux-i2c+bounces-3645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F38CCF4C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 11:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F4C028188E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 09:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B6513D88A;
	Thu, 23 May 2024 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KJOE2CIY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F31813D2BD;
	Thu, 23 May 2024 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716456576; cv=none; b=BxDkYOHyEM57RfBmM66UYoUea4WY1K/7l6S67Oae4BSPysFWDMqbYIa8G8/jWW4+Ax6DptVoppupYNRRzL3h0ntNt5FMk3a4xLtWDenJTYeKOWdoS0zrgp8VLF+UZX3kCQCZqugPvwd9ZRJi8SKZIZswEXki+axqLW02n1rIZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716456576; c=relaxed/simple;
	bh=0uGdwFo2ctk4FML8FdSGhBHGQUtdWc4iJ2oydYFMsa4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=F5hiRW0OJ5gFxtUVBg5WrE8+6wMhBXbrzmy3J/v6nbBr3K3V+dlvQ+yo3Nlh2vkQz+IxRomBybdQJkKH2HW/cLcuy4s3gqrSBa1+rUna1jnbKvcQlUIBQVZF90qob21GtAWuzN48j02+BPTDwLH1gOyHnrUFgLM8ZAnQ1bTXOsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KJOE2CIY; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716456515; x=1717061315; i=markus.elfring@web.de;
	bh=0uGdwFo2ctk4FML8FdSGhBHGQUtdWc4iJ2oydYFMsa4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KJOE2CIYWC8mFWw337WxXrfuT5zpj0lprjcGArQGs0nxCYz38AKPUnFKIfZqOYX4
	 KqCoJyWjMhtj36aVUQUIlvVd4TCSDz52LtL+g17MigyozPBKIyxrzTxk8nSCG4D6p
	 CqQAWukCRV0cH2BU7pkITeBVj4DvBt3L6xzZHHCugYv2HYkkLO7hh37TIeDEFHUdc
	 +fWgeGfXAbjxfiSSljuOVaL+4UCdo9Aq1paqkIM1OHqnpHdDRkhHJv1X/M4KO0d7C
	 cMHMpecncIgIuCjhwHdhV2oA7vA/NJdwQilOG9pd5yUdi9xsmp3jt2/AiKxhQzPnY
	 mgVcYjbllNSThckIUg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlsKH-1srQK80XwJ-00j1C2; Thu, 23
 May 2024 11:28:35 +0200
Message-ID: <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>
Date: Thu, 23 May 2024 11:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
References: <20240522192524.3286237-4-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: fsi: Document the IBM SCOM engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-4-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cfQr83D1oKR1K1NDJlowB6vfMcdr960N+SAU9f1dz0d6+hwSiTb
 MA4DYIyXKvGsh6W4yZTbt40KcDLzNPCtGhr5SbA1zZh/b53pGXMq35QTAQjVaBgs/qxHQ4K
 dSBkMwOZKquaoxw07GODYUJhnLWk/5y9wK28ZohLGzwbQbbgMVsBob90mit+EvdyO21gWYS
 zogPGGr0Cem2+krxYe2Sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+kO+b2ef9wo=;nwiUopGz3O0QZ7I4ZQnFU6xyZIc
 ZDUkM6RKhsYekJsahbSU4aXfnF1UA21ORVVvjbhZmDq2YIlwp1jrpQgUJfEwy8Bgxk1A1Hnqm
 NsxrsJaVTtpKzOWN1f9N2jrGf+hsyLO2t3bpfHxForuPGMh/IshEe0uKVZl3S2DdIDoTjwDbf
 E4rV3QqW5ZBpOZTJK/IZF8vB8qSPiDu3/UheuPv0yLgOKni3LU2Kcg762QptuMcN5WWhJl9fA
 gz7xAk9LFg+r/9HQz/4ODwFMp6/ReHDL1v6Jz+ZQMOIDr0g6TZ8CTXM4ujaCg83kHr63ZXjQ1
 nBOSWNnZAbaf5g62/jiuh6LWoCVMIcpEkh3YQDdbRP9ZZtnU5aysHwJOEkBrW3HkP9aXQYaE5
 hGSeapi3PXBR/9p0xpAqI1tAoG8eGjM7jgXzDLdNu3hdbxNs65aZsCEHLXZFHzHTg4nb0gJGB
 XboGqBK79xtD+rHWvw3n+zLlcZW1qz0VXaf3VG7A0s6wZN2Uuvhscm95JqFaFYcHSNAzHBy+V
 BgXK9lWR8JKuDjvdvVUbFdwdffZDpALMwVJfNVBgv/ozTNHw3AGalCUzo9gD67wnWaWrxXKCU
 Opz22aeqUeooArgkL1DXuDaEqJEpJol0/sg2/HJEFN++2Ah66yH0W9J9v1EWZtupJkILwf0J7
 XmSltzHFG+hy2u0H7pjKc/llwd3Q2ZRHi/VYfNmifsGelKB60hJeG9qqE9IlkuAJNgAMX93aH
 sxzULP6aG8CzC4ZEYrQVU5W8zlYMkckDcjJa781XWPEX8HA9lTuEFO7Ktbi9iSj0P54QKh1LT
 StB75X6Q0mEyXHLFiOnKy74n2GwfgYmcEQuFxuphrsobw=

> The SCOM engine provides an interface to the POWER processor PIB
> (Pervasive Interconnect Bus).

Please improve this change description with a corresponding imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94

Regards,
Markus


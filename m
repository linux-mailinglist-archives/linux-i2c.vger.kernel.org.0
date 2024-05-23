Return-Path: <linux-i2c+bounces-3659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F478CDB15
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E2E28121B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 19:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7E284D0D;
	Thu, 23 May 2024 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pMfisWgZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A656284A30;
	Thu, 23 May 2024 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716493631; cv=none; b=o5nAKnd50qQW64hcoOgqH824+ToEBe4n/dvUEJsqs3Uj8W3NPv7qMItqOnvEI//ShcxZ0WdX4f5jzcVmu9albTHpwGS567opQ9OT4kss4aNQCqP4ol96qwUuZp6TY/b3hOMistWkfRrRCgCgqG52LJhw6KSX73OcBzKzbZMt8WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716493631; c=relaxed/simple;
	bh=k8z0la8swt9SpoVjei6Q7ijAcgG0toE8rzl/jMTWN4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1Q5sjGJ8G+ADBNoq7a01zvF8DYfg206jCG5WNOuKuLHYtHt6OqSBIRDDJznzapcB4mP0Re8yPPdZ2AA9Q5ZuKV24OpARWL6oZn/27jqD9DE4hGtjlI170GpRodSacT0ye3KOx+okGrVYcROxJtkX5WJJLKursUIYQvclZNdQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pMfisWgZ; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716493610; x=1717098410; i=markus.elfring@web.de;
	bh=k8z0la8swt9SpoVjei6Q7ijAcgG0toE8rzl/jMTWN4g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pMfisWgZWnM/FhOvo+nCi4UgD2gjh4QYro+wIQfjQ6UmLzBAZ91xT1pj0Coigcqg
	 CuEGj1wiMtz0KkCHOLsyiaSeeD1UZfCn+rYYOyjcpBkRJnVOujBdm5PPxPSmGXjbW
	 ml/HbAGEzV6UL/wahCJ7VpFR8r7GKsgjRi6SvI6722a/wEP7VSIkjuMYW3tyge1dq
	 NSGctsigu8U6npwFkYf+j14DeyFONdumyeWLF/42I5lX2yBQhzcKMdsLyJL9V6XK/
	 GrxgE2e+lfx4KDnX7gyn4IZD/JzjmxWXrRiT+zsd5FaO+KPbYy8jG+b8698cAY56w
	 fIo4nfd8cxVsn8PtEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9cLf-1sdb9L2own-00rL0H; Thu, 23
 May 2024 21:46:50 +0200
Message-ID: <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
Date: Thu, 23 May 2024 21:46:48 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Conor Dooley <conor@kernel.org>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
 <20240523-rinse-sturdily-7c78d8517884@spud>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523-rinse-sturdily-7c78d8517884@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SRij6pkqI20XtlliJG2+Lw9Htp2ddj0ws5B/QnwTrN4rEaLguRq
 k9T8nfUjiOTpzukcFHBskiQjrdTNIxhPIdXp0JiHSIAnmBYkRaU5KIuOCmdJVqOTR0fmzLl
 WU8b8xY2+2hLy2uvH0TyrTEBzLckvOriX4k/fHVFBwGgSaJ/0GMM6U+qo2HWpYQKGVFcXvf
 qlxx+y9bRqPXoZrvicqUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A+jf93/BvYk=;zOpRYljYPtdE2TlyksJhOK+SzJk
 Eo8dsQz2052UZrZdjf9QZfwsSkWJaU9jvAb/dkILP6LA8vDT2EGojhHixsYUxJqKQZO8SBpXi
 a/RghEvNCtpuRxWqEJAbqXPrM3aSl0vH2IIxOMu1XLIf6HOU2tl7nxHsHnfh8pyuKQ3nMK2mM
 4i6e91+qNKH5ZYGjDyNul8odIWh4515fZhRwW97B/vAO8iM8f2OGZxJKT9hA3GL++/s/zXCVu
 GwZH5t+8f1ewsmKFbOEwrtHVXdup1+VCHMw3kLeyCAUBA8L4NXNrkPFJp7xN6qCDcemTALJac
 Eyv+8JOSzpHmLL3iGv3EZ6b+5RDLvunNHC5TWjN0gnnfODhWLddkbhPOGIbVXLXIpg3VKDBV4
 EkJjWu1+X9OK7/NJ0pgji1b4xhz+tXRF8xuKwCFg9unbuAHb0f1TItkUR69Bf0dL03WcS7Y4+
 IDrr1qSDkEFlS3ARU+kBtu4pBsy5O3LsJbrpurPIUX0hie3fRQuzR9lQQ5vxYQF+F6cyS2i5H
 kQR24V9Kx7O9qEXukqyxT2q31NgydK6bC2WJkfygeuAqa4boDF9VtK29WekPDkMTTY5aw7hHf
 TPtbGWwIpAQQ5EeMicBbPMrRUBw/CLVpkVCEc15AeIwaB7lbqss/cqAWYeGLKXydZsNXMiDOs
 rVVAwdbSDKPYN2UCwHSVA8lUvKuqpUnEuSFhUK/KKMbOvuSnIJ+ZTsBnSMRPAFbAzHXqcY/7s
 I7+tA4K15YKNYW+Sx8wUbwIWA9lDN+nKHJPAJx88Svb2Fhi+gCv+ol2dtKbqYvTgJWE3dNsBr
 o4LOqX+AgzbFfQ4q5eB2xCZus4ZUxdU83PdXoiB82E3cQ=

>> Would you like to mention in the changelog that a hardware description
>> should be extended anyhow?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.9#n94
>
> You are talking absolute crap here. Stop harassing contributors with
> your inane comments.

Why do you interpret my patch review contributions in this direction
when the official Linux development documentation provides special advice
on affected wording details?

Regards,
Markus


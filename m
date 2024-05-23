Return-Path: <linux-i2c+bounces-3647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9D8CD0DC
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 13:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C147CB21361
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 11:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0607A145B3C;
	Thu, 23 May 2024 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LpLtzae7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C631214036D;
	Thu, 23 May 2024 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462365; cv=none; b=YzKjENjb+s2jcmYb+5sdIOndlrpXi5udkpKTDfm31liJ60oG2jHDhEmA3qvI5NbfwNlpGBjf2FYnVUB9ExMo3aptuouFGMxY3wN9Di2cVca5qxmhdkBSsU5IgIFuQE7s1P7O3teW5nmYv0nylv50FNa0TZFMoC5V4N1scst7sqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462365; c=relaxed/simple;
	bh=gYGpWw1dwKwYXbTMuHWCYz3vW9FamyeQy+MaNMDyXQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPDssvMnoI3ztt5S1y9GUhdypPKynE26/2bls95VrkgNpUw6+tpDZHenmtCykmRpdOyWQMTW+irPpwzPPYh/okdIvw32G9aSKhEUrOPNZ9dJr/Kq/IuChT72MPdspdRfmlY23kOp4G0MriFZgiMeKZeuUlHZyHbPyAKihMukiJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LpLtzae7; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716462329; x=1717067129; i=markus.elfring@web.de;
	bh=gYGpWw1dwKwYXbTMuHWCYz3vW9FamyeQy+MaNMDyXQk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LpLtzae7k7PGKt5CH/219ViPUnt0svgwRR965UkDeNCI5x1p1CkiWMongjV5X+lY
	 i5DLXwXw31baly1omeTzIDsy9UYDSoceCL5dbspMZPG7TFfUTsknbQeQ1KNvkU6SJ
	 yi9lG2RDA/RNG+MWsUNgWqQllc4FiJC1b++c1C4iJrWLCmYh1myPcBHEnwyVIxqR9
	 lOJbOw3GrW+GroY1xZrn4Eur4sZOVicyLx003vjF1JMYI1Xd/R3DPFqDZiDr5D9KO
	 FBQkZqS4eTLU3vTyl7iN8tCR2AgVENT46IVX9/hrRdDVEUEn3M6NQc51NsTqpR7Wv
	 sc++cHwgmJ1ixNYMzQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Vsx-1seoPp3Rq5-00sRYp; Thu, 23
 May 2024 13:05:28 +0200
Message-ID: <8fb9a0ce-0a25-4fbe-9a8f-c2789c1553fa@web.de>
Date: Thu, 23 May 2024 13:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 03/20] dt-bindings: fsi: Document the IBM SCOM engine
To: Conor Dooley <conor.dooley@microchip.com>,
 Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
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
 <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>
 <20240523-armband-utopia-66892e08b90d@wendy>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523-armband-utopia-66892e08b90d@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o7i1z0ffw/sWelUqhm9HyOezHTgMOzYA8t77RncB11/ez3M/wDb
 UuHT8Lnovhq4bgS/KpsKcRxPEEVZN7YohbH5GTBSvC68ZjsJ5nlLiIth8Bi6K/J1+s7AYyP
 udETwbHCI0hsTmNHARRG8rN1YNiNf6d8Y1WYuTQxLOA6N/1dndf0oX/ayLfD7WUvt92/d9F
 rNyB2ahjl/3ti347klAOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KI+1kjpW9rI=;+qnjuxKLSMLhUuyHZ0TmL5l93GY
 OvI2k30qXI+RE+3HDSUwIoGgElWYXIK7FEEkTBEVlHxW1SiyCCs0BTNcVxn/l3Zq8Ws0CeIEp
 QZINKzZcaKn9eNu2Dz1kxEyuKrDPbu5c+Efj8DLZ/L6esJAhBn6LmkCwkfa+zQVEG13tJqNXU
 kSFF/zcKybqlqXCZVpYPxAclkNySRHgD4Al8iOHz2gyWwK08M6YLR9e8BBnv6ZJJkqK/UhwcY
 xMwgwZ5J11M8iMXAwLUTLmgZqlpHe8r5DwrQ8P965i7Ref2UBf5X3K6rxXiLcwTLX0oSDlbct
 tCduY4v6XpLjf5YCdSRPTXKozh4bjVqGD6WQYl1G98oSYMdTKDEmr5bcmiSDBjdvRUD1muufR
 vMjFEJa+D3F8t/QZd1CgqwYWaEdHx2Ljz+ROCADzwyOW4WZmyYBlmfyoYlYHlxpgeHFfEiUts
 1Uc1PYCd4gP2ATAudVgf6jhNFAM/K3JshCsb3FsCio+W5dyRrE7plE3ZmU8JBAk5aKhAn7KHO
 ZxzBvSQaCnYpXLePWBdRnq72MYcj3m/UMiCKcUp1id7vlts78exdPIp3ExK7eT2KQuX8OxJ5r
 kzMQpHCO89zrjba8ILgnGZMXhwHWNj/r1spWpImwLdQyDVWadzx1NJrAt9TxXC+8ZwpEZtlgz
 zWmEpkdGa0bXePLcD1v6WYHzRE+AGQVW1GpGu9vh5z4nX831O+Zv8X55N1Cqz+IInTsx0JDkH
 wxuVPJAHDrcpk5AQ/YTteexE7tK8yMP9vYS4hl+mnJBR6xLo8CReXEro9WmY8WDIW+o2XzDj6
 2xQNJRNo3NOosW4TSbQJsHJGB8/OljHJn5LkTaw3lHaHI=

>>> The SCOM engine provides an interface to the POWER processor PIB
>>> (Pervasive Interconnect Bus).
>>
>> Please improve this change description with a corresponding imperative =
wording.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.9#n94
>
> The tense used here is fine.

Is the imperative mood preferred for the final commit message (besides the=
 summary phrase)?

Regards,
Markus


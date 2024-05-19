Return-Path: <linux-i2c+bounces-3584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53A8C939C
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 08:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 781DFB20EE5
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 06:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6ED175B1;
	Sun, 19 May 2024 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="p4MioMuX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DFD1798C;
	Sun, 19 May 2024 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716101103; cv=none; b=lA5Efh5JeNHnujjXN/sLkXyOkUM73ebyIWEhx2WxQDEyz0gCFOAJqs9J1wZu8UIUyVVWDHWjuEeu798GmPiSEW2IhrQ1gmN8TRgJ6wsu8fF5w+rfFNJccRtnTslm5/NYpjb8E0Lnq9M/HoAMX8f8m2hlCBhzLRabIy2In7cg9+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716101103; c=relaxed/simple;
	bh=foDH3v96Rt8qLe3b1e0Q8Zg751Smptuk+sSdTARttOc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=A0E/m78wXXmxA0K1i2+GSP4gWNXZXjJNjE+BJdMioCE1cxTWEe3X+/1QasQy6bpwfSOZeS6PB4Q66kSpUfSEHRY0vCZAhPhnjGj7RMNKBtHQ26ae6Cskbmz1cq8MVw887c+4xmWF4JUSuKCXcz59PCfhrLNHLJYdXW80rYTHJRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=p4MioMuX; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716101068; x=1716705868; i=markus.elfring@web.de;
	bh=pd86gvRHXgTjz+8IOcII5+ruIiH2fACD6NYai6/iRRQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=p4MioMuXYu1eZDe/5SNsUdVx5l06xivMwFHukfqzUqkq0weMbw8Q80rnLICx3A/g
	 ZIF60PKHcvBT/dhbWskaQdnImWn+khoLUPEd/WWcV3d2OuMvWb0r8DvdmpXL3cK8M
	 7fkLXRWYNetCmL+ZyflJ+NG2K2E5NocmnhF97DtPk5ia8wnuirc6sH4xqnMkxTMH1
	 em0eArWGYl4SibM/YDnNKxcWheI1IXVoBXo21ImzESJV1Zz8G2/R/t3IFvKoey+jr
	 2YTkYuLaZRHrqkNm/4+y3XSkY6D+SzG1XeiDhQQ4QcLGIBHuCsQYvHzD/7kiy8aIM
	 jx58Ve09ly/ng6N44A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6YN9-1sATxd0G7d-00COij; Sun, 19
 May 2024 08:44:28 +0200
Message-ID: <0eba5037-fede-4394-94b0-b652797ebe45@web.de>
Date: Sun, 19 May 2024 08:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alvin@pqrs.dk>, Emil Svendsen <emas@bang-olufsen.dk>,
 Andi Shyti <andi.shyti@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
Subject: Re: [PATCH 00/13] Analog Devices Inc. Automotive Audio Bus (A2B)
 support
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d/iiRC5QJRic14p7QJ6N3VfkYwyyGCbH4WVB1eIzMiHdoYypPQP
 ql7ZRLKdDFm9Ypsktm0n59n6MY5OAh5959Fjwc7Uk+28sQKUhrb63j1w+Gyrl3c+4Txd/My
 fsweztoNl8USNfBD61Ph2qzumXcxqJ4n/EvoFSoOUavQzbUtjc3oL1S++nah1+sS8mMn/sV
 Sga/AIDMLm+boLr8BFA9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jh3/DQZ8T6M=;KVkNMRa9ZK94MY5gRlZ8HsQOc4k
 ymClhjW9gL54NptDiJ0eCs7TXHGIbABcRIhHp2iFVQiXR9sZFwOBtUo+igemEcIt549AW+8bQ
 SY5SlI5FH7aeq0dukuLWS4ATswBUOhY7jS9/3xmgvaU4C3xxKK2T0uPISjk+a4UaALsDcMH4H
 B1XHP0K3LUPcmQNTRLszIhYZAMXyz08VHnRXNKW3hOLJMDUN2Vw6XF3YnXtIQkltLInCgGZ2Q
 fKoqL3enGAWrcNeHZhEh3vKPOqL5lTvfseLJxobOu0QPpSwKOC7JNvkP3Y5A2LMx81qrNB5sE
 r7MPV/TkTkEVMdW6uKx+0na2A0q3gTgxDClItdrEDOVehjPFDkpiPhzspKH2s4BuFu4JSvQCX
 xAnbSzgYDb+P1xj308Zzxdax4fg5eAyEGoOBGcaL3kI8ew+mfaIgzpDjZHsUqKiSVJqxwf1jq
 wvpcrncNbORIHQlIswUKKXWXm3eSSyj9jSDHzear45TtxhORKzYcZ8RyHhPfW/kLwEmwpZPo2
 u7UcTZbOlJusqZbIiuVK+NmyvJ/YIqoiz+MIic0MOa8mvyLSextsRTcE/2EKhEUAAm+/Bbt8o
 dZW953jIZ4bY+ZdgxYmBGP0TQxv1yFNQEZcEKTBjc+55AxIg9h6JAdxyEuGZ0i4dOtZoBYKG1
 CP5vZidWSDU93tdCLhwViHJlA64RfPq1oe5OzAh9WzBEyKvmmh0dNiOzcylKLn5JdBe0M8ght
 9eEcpv487v0a6sLubFSVYUOlyfoHBj2VhlriDbMUzbC64Sp1KnZfmXIbeWnVGeU0d4pA/h7cz
 m1ZxZIY2MJaPZsp74XHqTMJIMeKmLgAIw57/7+WEW2J0o=

=E2=80=A6
> A2B buses consist of a seires of daisy-chained A2B transceiver ICs known
=E2=80=A6
>   This is the main feature of A2B, whence the name Audio Bus. Each node
=E2=80=A6

I suggest to avoid a few typos also in such a detailed cover letter.

Regards,
Markus


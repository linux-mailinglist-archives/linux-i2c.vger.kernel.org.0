Return-Path: <linux-i2c+bounces-3960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2CC90277C
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 19:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B4121C212DF
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 17:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F36145A01;
	Mon, 10 Jun 2024 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="XcvL1n7f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC48142E98;
	Mon, 10 Jun 2024 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718039448; cv=none; b=qrVG+br6ahRzUi444U992QQ5z8mm1pr0nM8Ztd42g2LQrMPyqInMVADKYvEjRWmNuHsVrO/vCQTQvJgg5SxV0dTAuxeLcBM+HU7ZsNHJnBa7i6AuoMxhSJetAVDINUq5NQfnB9Dveck95trRLtvbwtYnBmxIy+w2YsRVBpzfZ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718039448; c=relaxed/simple;
	bh=KFZLKRJgQQZenPBAgjVr/0fLpBXVmplQTRwYwWy3zRA=;
	h=Message-ID:Date:MIME-Version:To:References:Subject:From:Cc:
	 In-Reply-To:Content-Type; b=KdWdpKdwxhbUFt3bG3aLzTLaJZZu+Jx0CGdBCBd3aHi9zzlCE5xwLJY3FXRO4lNCSWqY0Fu2DDaXpkKwl/D0UhC6lYmMGRYuhpVK9zQ+GGfcYdKQLUZjzlKsCmiDpM4EMdtE2tmTEzyw8lD5YbECGnS2eykV5PyEYIUgQhRwRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=XcvL1n7f; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718039398; x=1718644198; i=markus.elfring@web.de;
	bh=PI0cKSPt9y9ms7d09bbx92IbLJG836EONN5o/9dG9ho=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:References:
	 Subject:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XcvL1n7fEkSA1yTH4Juqe4oy+/f0vZ52IzqGBSVhV3S04BJShr6KMel5nF92DuvD
	 NDNWO3NaK2WhXTy8lBKdsV+rZRI2FKf3ZSL5YgqMKEarqtl9V6GK/VGHCOOrH933O
	 AD0SUatgiFswk6BgLPvNnykQ8amaikbLKo/Knl7vB4IU8CSqOnH2L/ppxdoW1J4Ca
	 JaQCR1+fh+IVlZd7DaWmdCiCSNkdx1gto5lWvGxQLdcXfwJTSZg9H5h5V56WvdRxJ
	 J+/VuAvCtyC5sM4Vus/8skXEt5t50zBuWjJwle201qB5Kp+Kf5tQ16M9PEczxAOYb
	 Gqt5Nkg/Upt+dFhDTw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXGKA-1rvIQV3RD4-00NQcB; Mon, 10
 Jun 2024 19:09:57 +0200
Message-ID: <70516ad7-fc85-4ce5-8a7f-e3e02d499d02@web.de>
Date: Mon, 10 Jun 2024 19:09:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Noah Wang <noahwang.wang@outlook.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <KL1PR0401MB64911C4D68B4361C9EA97422FAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
Subject: Re: [v4,2/2] hwmon: add MP2891 driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Cosmo Chou <chou.cosmo@gmail.com>,
 DelphineCCChiu <delphine_cc_chiu@wiwynn.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lukas Wunner <lukas@wunner.de>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Peter Yin <peteryin.openbmc@gmail.com>
In-Reply-To: <KL1PR0401MB64911C4D68B4361C9EA97422FAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MGcOBqdhPn6PNd+nWXDeFns0YHTOPA44mXmtXzb6LFdRmzmb79g
 sKBhtHsyP+CY1EpA7f7AWWSxB0RoNohEsHFZiynxd0ftT+tWICq5x5KcWL2Upexhf4SnwNO
 VvcCU1X9fPAX0T4/gAJuy9ZAKrczURGnW4x+ev4sNBOzvVroJkiQv7cCzfkblocdVlFBdYW
 76CNEIO20xkyeKIlT7+Gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gexMoFMv7zI=;6tw9e7rsPkNJLiplCwiPpUfF4OU
 bveq/kR1QbnOfW83CVSdlF4CoAdMQjk9Mt3zZyfERfRu1LnrSew2rCnV+AKdd/mZrmo99Sfi9
 GAqmO3a5LaWvjovn7Kq7zp3mxMLplsO2RzmWDnXpgFH5duFpc/AzMxbsoLKdbY4FJTZLd/URY
 R/DZQPqhoSwnTcBQX4aE6gHoYTNgYhvO7mITaZCJ9GW22ZTP3T5/0Y5Wk2EjFWlGumBJJ1bRl
 ulvdpQ9PBaHVY7W8qcvfWdJBJ/u2jq6zll9JXWKDsvxnacTLR4NTFCq5dqHjB6ldGbvD7zYWE
 Mn/1c5d25p3iX9DLARyiFeXOYaVMajdjww9rVI9CNGzpiMulBIVZmVYRhF1ko2VDKgDeDyHRM
 h6IhbL7OqNXgcnwrtA5b0PteBwT8lSsYCQZVU0HTwYOQ2LvC1cXwa6FW4mpvJaC7W4aW2ao9H
 B7eh/MYBGd75ED02mxfoutxZwFQ9ja9SnlTOKFofku1atWT18O5xzakUzKr3v/D32T2aAZDWr
 amDTPbQEOfW/60tSWbLqlZV/FGXIikq6xPtGO9QnOdmKcBttk95aNSUQq7pxIX9wAxddCpi9F
 z0EmCBMFkoUerkhQpAkqxbM63FVg5TDSAmjTV+5qqjnT6zg4hIZ1vrfmQ554L3BHP1VBD3eRU
 ASE6tHi3DAYgw7TDqvJ1eQvOusgJX+GXB5a4JX2g1ovgmKtF4Vf1fwSekZwwOISFmv+hJRq7r
 D0NXZe7jMAuZaSmVoIGtZP1ttBPg7xwswFgOqtOQzdaC7auQyuRg8cF3Macoz1rL7/iPY0aXN
 FAySYQgtunOZUN0yMD+gRkePi0YbJRkZCxbtIzkX+0ecc=

> Add support for MPS VR controller mp2891. This driver exposes
> telemetry and limit value readings and writtings.

                limits?                  writings?


Should the presented message subjects have contained the key word =E2=80=
=9CPATCH=E2=80=9D?

Regards,
Markus


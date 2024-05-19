Return-Path: <linux-i2c+bounces-3587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1978D8C93B0
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 09:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F6A1C209F3
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 07:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B8417C9B;
	Sun, 19 May 2024 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="aCfhLd9t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61497168DC;
	Sun, 19 May 2024 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716104010; cv=none; b=kbUAF3X61rxZ1FT0K7g5zLJPtSD7RMg+f/fPCVQgVNO/A3wwGx4zZa3aCqTq5/SGvBzudVABz509kfiJte7pgLmstyhuacXQgdo31RP08hRXFmNiBRIf9PIqWZSxRcnfxGyMzdWAkCB8GOXCihA6oXt1VWQ8xD9CVsim9/0vC4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716104010; c=relaxed/simple;
	bh=xzuyhU/C3Sgs8JAj/uu65583uObYWqEmKO2M6mcchQ8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=q1OItuWpcSwnqBU3aRQGXSUV+MuO+YInK6Q1t7u3DgYRmAyYukkK8hEjlPp+hAEAQPeMTIQexggiVa20wWQYRQ2AErn5TbvyoR3x4SnCsi2bqA9j8l+TlM54SzJZtl2GpcMxtIyW6raTXsQTOh0AEpZD7hwqNOOBda1rqkWCSQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=aCfhLd9t; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716103991; x=1716708791; i=markus.elfring@web.de;
	bh=Vc/DskwTkMLimCdzc1KNw8QmtDiL/132/HZiZz6WkFY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aCfhLd9tDYLgNa2qsXvmkiLbpArbAYDjI7YmR1xaNLZaDBvq11qaTZnG6ywIxReK
	 SuQJeiEZLm5HGzkMyPEokOS/NQAzjuuMbX+9PGLKk+PQdbaadUdxBwk62GNRuaggp
	 F+C16FSZDOyYrHNnqkHxZ+p2/P/opXKIQ0NEH3zNRU+Y7Cr1kiNgxAUiTk0tc7oKc
	 rZdxoLjzEzv4x+xY+4k8fzZSDpzxxU6pVBI8ri125Xn+n9fP7zOyAYvyRRaA9ZNWW
	 HABnOk3PRRXjABWiYNvilNvhtJohRp+4CKCzQEkd4hbh6i7CtFz/E73sH7CfVuK2Z
	 4ugDdCnYLVCjILW7RQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwR4R-1sQxIw1eXl-014UAw; Sun, 19
 May 2024 09:33:11 +0200
Message-ID: <e2dc9857-d3ad-4060-8363-f8ea0cc37919@web.de>
Date: Sun, 19 May 2024 09:33:09 +0200
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
 linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
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
References: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
Subject: Re: [PATCH 01/13] a2b: add A2B driver core
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+l3+NQO2VssluOBJJXXnKAg3DDtBKfwnya4Yj2/k/UC2D+zw5+4
 5wfQkxlfmnAAtNNFCCjQ+BU0F7rn+cGTYPS2zZnk+WCR4g0TyFXpYDB1leaJU2S0HV30pfs
 xU2auRNo2LPMSNPMOXHZuo5BcD3XSpP433Rqp/0V76PL2HviR15aWHqMYeyyjkj6kZzl9Bb
 N4XePPuYdCvEFIlb24vmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZKr4EqZbUiQ=;9LA7nsO9L3QH/khKeG9YCNPasJ1
 qie9orih1hOiq5F82MekSv77InOTDe00MK5trWdRlRJ0xQCVYDZA9s7gOejT4ieFq4fHtnmin
 IU1HY8qmp7qeMN5CjQeGz0T6B1b17UILq25Gh3tdKq2n094AQok3E7oxh1z2egS0IV0wTa+/c
 kQ9u1zbKQhpBTEgsXY26job3L83t4GM4NJ07KZcQx8IiV4YOVbzvUwQUuFKcUanK6IijdHBZ3
 VRbGUywRb+9y+4klqJEfayWmXG66m3YtfV32q8BmLqhiycF9YvjXpJsFZnAOYfUKltjHmO6+8
 xCpxBxbZ2ksWU23HXfX3zaP0SoaPSHxGsQBJDBD+o30VMzMSAbq4zqFPN5WZJeFM3lf86svly
 mQbPcAqkQmtEC1vclRtCvA7goyWsePWyYhgqWIRQTTRqcUUEa1HQjN1L+4us+PPRX6riYHdHs
 dekVKdSuzzSdeU3QsjLeA9dQCnah4/QHJaiTMu/Acinx53NwNeCkMW93hV6C2kcYOglGVkok6
 q6x14ug6svM5aYFj+Iu/NPM1X1y1DLkIOUccxgRA57jhN/1Zu8NzIfXRURXkMAmtGUbIkgV4Z
 PPhPamHt0qluIGUstK3Ll0qRhaac/nM416/FsRYdu9gdUw146+gJzcnW3CBUrxh5z1/svLiZG
 pRela0v+jfl/vCW2lj+nbh5nmQq7Rvbmrpt2UQ/NJfhFrOX0IEcJWQjGV5ie7Kus4lzd3XAwd
 zu1PxieCX8rrGxgFFTCKSsSbhQw0lKXyLQNMfIsjs+aa5XMGKjX+p+U9ncjeqLkkR9hslh+Lx
 +a0pr9P9D7UOF/P363jhsz3xPD9nQFSkkvV0DhcRY9O8E=

=E2=80=A6
> +++ b/drivers/a2b/a2b.c
> @@ -0,0 +1,1252 @@
=E2=80=A6
> +unsigned long a2b_bus_status(struct a2b_bus *bus)
> +{
> +	unsigned long status;
> +
> +	mutex_lock(&bus->mutex);
> +	status =3D bus->status;
> +	mutex_unlock(&bus->mutex);
> +
> +	return status;
> +}
=E2=80=A6

How do you think about to increase the application of scope-base resource =
management
also for such software components?
https://elixir.bootlin.com/linux/v6.9.1/source/include/linux/cleanup.h#L12=
4

Regards,
Markus


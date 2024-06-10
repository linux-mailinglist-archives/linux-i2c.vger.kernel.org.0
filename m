Return-Path: <linux-i2c+bounces-3943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6D902259
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 15:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3273D1C20959
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C851081AC6;
	Mon, 10 Jun 2024 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YWLZW0yx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2E8286A;
	Mon, 10 Jun 2024 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024685; cv=none; b=tJUxDkKrmwkaZbjTddDG/zVp6+NLFzmqimEyKzyBiisUmM9kDgpK+i/tCeVJe1FfGyZPIVSiz1oVs4BMQCJYkWklbytqeD3Scsg4fiHOKgMlLE/7xksruAVGKhh+FXoBsLsIGHymV+7BckM++oKooCNiHKDc1nJ8p5oRNM9JAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024685; c=relaxed/simple;
	bh=j3unPiR6cYjkj+QmmQQQODvkHswhgr4ev71KQWbcj1Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=CjsGnVAGssUDQEwRzGw+dYRpFY/D5GVOxi/RBR4C9TCeQOcr/0pWMCcaOJxa9/8sIP0Dw0yz8NwwSzCV30a0m7B2nibZViOU55w3rKgP5h5Owm5wJ+G/QLvEY9gUrdYrEazAc6ATNysn8UVBaVl+y0dkI+gbYNPLMUyG1X+f1Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YWLZW0yx; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718024645; x=1718629445; i=markus.elfring@web.de;
	bh=j3unPiR6cYjkj+QmmQQQODvkHswhgr4ev71KQWbcj1Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YWLZW0yxBi+tEZH0kDTStkErGCoHMAKQGxv0mAO78dlsZhrKyCfzmy9qyMNLUxjo
	 nPLX6SqH0653WhmBZmVWjOtZ93494oob94pGUuXQJjtqC4eITVM4qJ54xQCSA/vql
	 H844uAOMjcR6N9LkA35IYMSMrYNGtbOcI30me6hNGiMM//U8XEEe1GaTAnU1aTsBQ
	 mQuFIWPFrhPFx8D4q59DoQGBp+aCXx6jvP/1doOxzpqgCjhrw2qEP9qPneOsmxPbn
	 jOpgMBq8kH8SMMqRmwr36L9s3jwX8x5jVDDnUYSQmz/C4xhAA6iIYfea6jcFpi3sn
	 SNlIF5FeAQjVPHOcfg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mxpmc-1scyfj39Be-015VYr; Mon, 10
 Jun 2024 15:04:05 +0200
Message-ID: <4bd94a7c-370c-4784-aae6-17d4b2a2ace0@web.de>
Date: Mon, 10 Jun 2024 15:04:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240610025955.2308688-2-aryan.srivastava@alliedtelesis.co.nz>
Subject: Re: [PATCH v5 1/2] i2c: octeon: refactor hlc r/w operations
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240610025955.2308688-2-aryan.srivastava@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RDyYRvTaajZboBrUhgUvo02yyVdLboN8QBYaBY4rRJSjr6HecjG
 +KOKaIvOm8j0KioFE1Op7ZsUh9DoMPPzUeQDCzHwAnD5f6KOzvGrHEWaColKNp84LdaQSmf
 6njWQ7VTrUXpgMnVjhXTDrWa03aEAnCw0I5lxxo7R1pqrShEkoimHfmXdiN+GYcalcqbn2G
 oUubC91ZAbDYUPV+f25xQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CsBIpItxYLU=;reCkyHB7FhGeCbO7+M48dCz99Ei
 STW5LC554tuie/aV1Gb5kQWLGUaH+D83BCoEiN3L24Dp5qupJipz1Ob75MEUj5nLNYcdQOmpo
 4DDgi7txFOczW6EZ35Gh/eI1TxJmXEzGzaueatzpqFXL01tSWHuub0Gscf0vW33+dKBSfUKrB
 HQxv3jmwuYUhlfbjbwn8W3IRUh1jDX6KaNsRNR+DbVO3yJ9th6WJ/FZWd8dbJGGDBeChkBRLD
 aCAicrBBnL8HTt39ab8ti4LJruUVyYULm7HWgYLU26+14xMr+3hoKFJFXiLLEGuW3Epr6vWF4
 KjQeikQ+vWMOqbQQZJ1OnYj9b3UXY+nkIdH/Di8W8TMan/sK3Xd23qbZCvhR1PX0XR1PFVHn7
 8HaxCRwVXjPnn1UDyWwduN1c8gGoq7rSe+Lm9qilkHraxrv3ALwk8ZqyAEflNjhmaFAqi08n4
 e6ki4QYZth0zFp/yHL/0ZHErEWLuRMQE+MJcZnDizqS4DCXqmDDDd1QCfB6Gdbo/4jM3H1HK2
 TWo/7qXiAYx6MhU4Q+fGGyaTNmgrnKTG5C3n/5zUW2N+qY+Xz1OEu2lHpfExUxsMyMvVciIWy
 3Pd5XmZUwiMj4wVEwFVltrFWxTSOuA6XORHUxT/iNHnsh7OClUIVrd4nuWWyWskAyjxPAEllt
 6JdXtfVL5TCXEztQZvLZCuNg8jm29Cx6GyLOkFsHYQaX9midk8PPCF9kXq57S7FgT8CskRK+h
 vB01/8RrU1OxI6eRwgU5BYHWABRjYRPhosphefH8RRD5GBv07JVP/BJ/BAFBqDRKXo0LM8RHf
 5BoNHRw7Iphm7Gnc8sdUepy3Ad2y1b9tyaAOq9vxr3MBk=

=E2=80=A6
> The write commands cannot be made entirely into common
> code as there are distinct differences in the block mode
=E2=80=A6

You may put more than 56 characters into text lines of such change descrip=
tions.

Regards,
Markus


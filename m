Return-Path: <linux-i2c+bounces-3944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2B090229D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 15:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9691F237AE
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 13:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E468249B;
	Mon, 10 Jun 2024 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="RKx7OBVE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5112F588;
	Mon, 10 Jun 2024 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718025834; cv=none; b=CKLz0Qz79r/+dr+U22G+YBFOszm++Y35cjQnvx0b5SBr+MTPe7V/OiqTn0T0ssQqiXMfOmtuiSq8pyanDR5b9Enr8Q/6AVFGs2mO2ESFKnrNWkon/bO5Jic530smArCfezIQ5KvkzsA5MsHYgijTbKJHBjAsEPiOyoR+EBSwQQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718025834; c=relaxed/simple;
	bh=etoDYrvrAEmm2NEi9LLJSkBRi/8PwLFpjEsJ8VecqkU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=KC532XecFqVUDOggtP2k0QdjaBLGb+p9tG/lmkE8F/YAKMlzqD21a5dpux5KeEpRfmSvvX5fRQfL+99nna9V5ABvYO9RkXHyoVqkYM+984h/mXobkcUoBET69wgC00fsXMzf0rJcrtJ6MC+o2TlQlvyiNByuRWzbX2aJeF80S6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=RKx7OBVE; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718025804; x=1718630604; i=markus.elfring@web.de;
	bh=etoDYrvrAEmm2NEi9LLJSkBRi/8PwLFpjEsJ8VecqkU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RKx7OBVE2h835VSLsrkPpoxjttjo9JcYOUYchJJ0CDaMz8f4uThEHaFuSdy2qxgJ
	 B16wUWUToEmr4wIQnYfsO5/9OfejYfNi1SxOGEOsXbnXQKiFRXUp4mNrwFaU00b8H
	 RizIQzaUezhPkKD673gh7sQACHFtfR2Z4ph9P+PgG54QV61SAKU7moPUX07yDUNaR
	 VAw1kzwCj4SEBTQa2O49eAtPbiREfCpnL92ZLQSpwHy5hBQJDH5MHRVYBXqGlwqHq
	 K9kxBGwxTllYJsJ+pwP4VoK99RZH3Jf4JypSxSi9EHD4rTYe5mI6PWqCQGq9HpcQy
	 dQtLTwXsk4he5PyGiw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8Bvz-1sKlbD0U2V-00FU09; Mon, 10
 Jun 2024 15:23:24 +0200
Message-ID: <e5a334ba-5237-4a3b-839b-0b716caca42c@web.de>
Date: Mon, 10 Jun 2024 15:23:20 +0200
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
References: <20240610025955.2308688-3-aryan.srivastava@alliedtelesis.co.nz>
Subject: Re: [PATCH v5 2/2] i2c: octeon: Add block-mode r/w operations
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240610025955.2308688-3-aryan.srivastava@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OeB3bRNkEnbJQV++HbGMd10SVwmTO/w/tmgt+AL+VmfPq8OnRE0
 hvjG/GuR0i1LriSzSeAKUlcTsaGHZixfx01DMESGPbItWuPltfygdBnmVD6jcXeCBtJu+Hu
 znantBB9K2HweQC8WroZpNfjP9PJLsDR9/qenH2o5RUkbwiDeWzlPFWuppjAwTPRYRNmSJq
 E70NAt+JGHpI3eqzhmHWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n+0uPCcoZ+g=;bc+cyYDu6AIZ05CmIlHYlSFdFLK
 Rov9eLlaIc5bwOk1I6tdoctoV3D0KlhY4HKqeloohXrDcRtScL97TZgmXm/IMuW4AJFpYrMLT
 sDQv4IR7ynJpHYprAo8+1ZGbG0des4vMnJ0woAUc9VbFXAAzoJxS3UcNA6E4ikvHYH6dbE4DL
 rdSW7V+tDwotJ9qK0hO8la9KMrys90QCT9f7POJFt+MMNXFDXyR8KGUMgshKpz6E/8wKH1WLJ
 mXk/bpIhz2/4VDOxpqvKTAZcM+LWGX6gwWho9q9KWUebZkqO5isnNC0tFib7fT5j4Y8Ax0JdM
 L4LGo2txmTvZNtk3Q+lTBe3ntf10izl+1+2l7FgG8f9DgT+nTY71vTA8QFzr8Gq3alroEGO10
 4A6aPdJQsVZbyVQ2L1oXTStxf8hBbrP1S2e9gNBbBLVRh+iQhr4cw2uZZ8zQYGdXrFYnTvnpr
 X3ZxBRPezwVN1b7dg81aSUdEQ2MEGYVrcsgGN3bD3nn3o9PR253MPGCc0LdHNGUIg3ncU1xP6
 PUaWUQG6s5y1dTdNaX+PzVRsZWcqntGX/yvbCYqCYPgDvVgbWAgKnd/RRPfpYJc8RwENAK4nZ
 clpSBjdqiDfxjqwjW9RrCAP7gcKbp5hLJpozRnRQPAdr86Ut2noKVvp6fZHV8hNkf3ePzsOLU
 lLdxUdrmXK5/wslw3X1+FaYti3qSAum4PLvb39VRTol/fLphVUL88ol1CoodPUaO9YnvxwiV0
 DO2bW/gG5CBVeM6QXau1/Cet2HY9l6b0VwHBlKouJ8COgGg3V69kwTdHKRwm4E0cfybtnOjqf
 M9zpzDragcKfndKN+X4gdRNz7C7hNo3Et5421RTwZMGBk=

> Add functions to perform block r/w operations. =E2=80=A6

Can the final commit message become a bit nicer by avoiding the abbreviati=
on =E2=80=9Cr/w=E2=80=9D
a few times?

Regards,
Markus


Return-Path: <linux-i2c+bounces-3030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D98ABAAD
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Apr 2024 11:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 382FD1F22339
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Apr 2024 09:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CD43A1C5;
	Sat, 20 Apr 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EQNVL3d3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6F5179AB;
	Sat, 20 Apr 2024 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713604295; cv=none; b=SU2JuoznDzryI6lzsd/PNqqFGRQuUG7BekjnE5CPEpAamqhXuCR9A8r5jOKi+3DXCCld3pELs3zff/m0AsKXp75b+2SY7GV5Q3FlnkpVE175zNZ2sRzoE0pzRRFc/Ao2Vx/km8tEjvCCbqkVaXBXgD0SQ9TkiN3fV7YmbG0GJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713604295; c=relaxed/simple;
	bh=98ZquFlgNTsj+YxCtBFDDfmiJltAPDOmWeaNu2nkd5g=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fIEEgGrKLiqHTC72y3RrjKib7S1elYDPm9RUPupORgdyHv2mUCEveoSeLrPgZdPYiQTQrfsvwBTs4C/RMtVeEw4HpTzeSID1Ht380/3zEjkbzBQbj0XgjcPx3y0h46ieYl7nfGL3BpniHDCFLrMpiyFT+y85qvkIOu5tazPslVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EQNVL3d3; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713604279; x=1714209079; i=markus.elfring@web.de;
	bh=98ZquFlgNTsj+YxCtBFDDfmiJltAPDOmWeaNu2nkd5g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EQNVL3d3cf0cG98eZi3ymeMLlojm3J4pzRoDoE/KzK0qLfF7PmtTWXO+JjjrVus4
	 D+p2PhPMuuqlxHQ8kTaeairyuPb81BtMtLBaYcIBz9enRGJ3QSc7hR6zP+b9Mw1V6
	 Kfbq5J1RLSntdOHMHruqoq12mSF8TKL4V8yEjHdOWGbeLV3tUbqtuEqZdl2xzNyX1
	 UH0jC3t+Eh0K1r+z7bHvxv6DVt5MLTIDk08DeUFYSS46Ht2X/MmnYvGdl3HWBMOiA
	 NQygxv/CoYdUyYH/rollZFUG8N9U88c+j1AWzmg+K8Y0NfAVKWJSJRqlrfG1TlxvC
	 mpkMkBzfKf3Zkg1kHg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCGSW-1ron4v2LWU-009eQz; Sat, 20
 Apr 2024 11:11:19 +0200
Message-ID: <939095cb-b9c0-4214-9429-7b45f9a31f36@web.de>
Date: Sat, 20 Apr 2024 11:11:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Okazaki <dtokazaki@google.com>, kernel-team@android.com,
 linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240419191200.219548-1-dtokazaki@google.com>
Subject: Re: [PATCH v3] eeprom: at24: fix memory corruption race condition
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419191200.219548-1-dtokazaki@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5FpNBpIEF4HqcnHpOVcfL7OBZmrVR26r01H8uPNsFDuUOJ2BIEE
 EFNQRdnKzol2xho8scQUiM8+fnKLoV65gz3zMczDBgc/mTXtVxO0FLzpUbD5hMkTsKxx49a
 kq5EeXPxPZziesCkkHWPnVHgFGKbUJPhY1O3U0jNzYOXopX9rwa8APyxiKSwT07PPhHE1hm
 PNNfIw6nSQSOxO+ulBqZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:okgtqk/UjXg=;U/1/owzj2wxDF1M/Gp2nPZhPQu3
 g9XTvPZPb6tS6SOTXHwUySHE197XLl928un6nIxTyoqZWVX+hgbCkCQS3mHIimdBlIwQDnVCY
 Hh8SIau0BYmK2I6gg/ZDGD9cMHVXi9DHFBAHr4w9zcWGt6pY8cPf250v5X7VV0OD2sjaf4nsp
 8ELlQwYxQXJDu3P5SMwk49YtSXcdcXuusIW8fYQcIkL3cJUw68LGcC/pFkrbT28ibNrA5PWay
 2S+FSrbZ2zVwZ8SKFmVTNVCsxAZTd4R2y1ur159RBURDBKYXbJ3KrzW1MTV3fn8gG3q4iwc6W
 Ew/MpmBUI4rRbnz9aGhvJMyvM3+7lADgNmxpRslT+3bAdutLzje0KlWqHx3rl9br8wQXk+oqn
 jXfBLRh12/2KTM7LnAASxuhn2OlxC9PQR7DThj3uVvVRWQgWtOF9I8ENB9ShFRZNVoT2fy/zc
 ZHEllJBW7Na0cTbS16X3m/71XPg7xCR8S7c2FQnDu/fXqmlbH92A1WtFXT7I5R/cNUf+bTn33
 7n4Y9wCyjahdTPNolyvD5JnE6nXymqnditlzfPK1stEkCyDNxt97tFOWgcGGek1X0UA7J4YEd
 KSEKZZ6oD237gevr0RCj+0MLTqyD5RgL+xX0BlmamNxbd9Z66vCadHLekVJi8CZVP8GKjbOGZ
 RptttGeG17PotR/03Nm3786dzZZ0Ey9rsXVX34caCrYBQP88W/SEZBD9wcTTg3sXXFawgq7Ai
 3R48J4YyhjsHvlFZB78hRzRoJCgujhd5I6HSZc+yliPwPGHiqNOsr8VWMdiXEnJMnJj6iKn3o
 G+Nivvoi/jH7TiHsxpD4pIefD8oJ6bJzG2b3r07hOofGs=

> If the eeprom is not accessible, an nvmem device will be registered, the
> read will fail, and the device will be torn down.
=E2=80=A6

Can it be nicer to present the introduction for failure conditions as an e=
numeration?


> Move the failure point before registering the nvmem device.
=E2=80=A6

I would interpret the diff data more in the way that a devm_nvmem_register=
() call
should be performed a bit later in the implementation of the function =E2=
=80=9Cat24_probe=E2=80=9D.
How do you think about to mention the affected function also in the summar=
y phrase?


> ---
=E2=80=A6

Please add a version description for your change approach.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc4#n713

Regards,
Markus


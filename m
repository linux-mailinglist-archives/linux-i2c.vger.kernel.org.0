Return-Path: <linux-i2c+bounces-3050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE18ADD63
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 08:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88056283517
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 06:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D336F24B26;
	Tue, 23 Apr 2024 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ftJtTVSg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A037A225CE;
	Tue, 23 Apr 2024 06:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713852965; cv=none; b=UcEjgOnZUKnQ9DZRz/ZsCrD7YHiCoizrZRbRe81oX5Tch5fIyDZ0Q3mzLQR7GevfZpsU1nwM4GJdtLkJwWv2d0foSP7BqT1CtC2hFXgJczDFZEOWuHWRH48k3ktjwZ9Jk4hQNMB/FoZ31KNbStG3x4Fs/IXW6lgLkWj90frhTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713852965; c=relaxed/simple;
	bh=8HZOokaf2e/urC9+j/zg8HM4yzJXhpo+pSuikz395pg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=CPqlyFZcFDdWOtxwWg2w34cNifvnv8m7twzL1hS4TdMo/ZuIsIRtG5axF/V2vQ1idU4TanssJcId3lmhAKuPBdMXaOlc7ypM5zT05rRL/n1NuZ/e2Mt+za8xb+ugF9uPy7SAyyZRgakGCzaWiHGr++JPmU/IaQ7zKFQvzgDl5jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ftJtTVSg; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713852948; x=1714457748; i=markus.elfring@web.de;
	bh=8HZOokaf2e/urC9+j/zg8HM4yzJXhpo+pSuikz395pg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ftJtTVSgNVSoDHfc+KAZQ7ywNskxloDYgJiUoHLnkVP3tPP2dDEI9tXC885mfawh
	 o5Lt8/LTLMwyYp/99oA/SaCkHW90HqkM31+Nyt1uRcPz6DBHtPxD/tttdQJ3aU/9W
	 cDgb1HpGDptwG2t298K9fN9qSsoq2Q4lkBud2WZT3nZSyTIMQ50H6WHPAsjvCrXcy
	 2pVjkL4bPzJkx7yiljCwg306//ZE8hHACiiD7l2+kZLhtdRViot/gNzyigRzh9qPk
	 fePF2N4qkCft0MFduYl1HMosF79SEifLQqoMVzqo8ZHibnLtQnUOj4saeZBfwJFWX
	 m8yMm0djuIskLi5kCw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYLmq-1sBkNl3eWg-00VgwC; Tue, 23
 Apr 2024 08:15:47 +0200
Message-ID: <ac9cae80-cd9d-4ae0-9f27-b4b424304cbb@web.de>
Date: Tue, 23 Apr 2024 08:15:33 +0200
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
References: <20240422174337.2487142-1-dtokazaki@google.com>
Subject: Re: [PATCH v3] eeprom: at24: fix memory corruption race condition
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240422174337.2487142-1-dtokazaki@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HueGTE6pDjjGq6fr0JtQFXMnH0PkSUwOeI6TKKF/rFse2NdxFMM
 js2RHiBMVQ4ZEw9p/zQQnMPF2/BR8XJ180yRoFmLISekyoprHvcYM+dBWTCSZcAIaGdh62E
 K1N18NIQrC+Zapvle9oC3ZshKQ6eHLqbSe4GN/VaIthN8ZLkKrwSPRFzHO8RD9Vy2v88Mpj
 W6OzuJxwp1MDtub7V8ZdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4UEACg2W1e0=;Xo4SzAXl0+sOQrC9KIxB9Mp5BBt
 /M8O5awMH88Oa8RtLXfshSJ6REZ79IZxchV4eATXnuq420jXN5S1zxOOAv3fZJOzkfP7zGN8l
 ENLvrRDOUmfh3x6soqg6sdaJuWj+24BYK80hOAmlHloP5cuy+9rAcZQvIgdKcWwj5MxhEhqRX
 soXe82Kj0zi1Dwlqsfj0PyDeo5z2JaJJ/iNGI1IfQwZ8/ZEZeh9rg8MbLyB3JqG5d75SfsLnO
 dh2ikNGQkDYN0U+oXCp+VwDY58JsezaZVQ2NZwCLfdnUTlfggpZnzg6axK0VKJ4wTXfe6HNcc
 JvgsbrzQJVK2x5EGeVeDqqML2HYh/s99DV+ff2iw8kmlQ879LJhHuDY2IEdNqkfixbxCZSZTc
 x+0lnwrZMEoHUe8ONPqIGuSnRaaRYuCePx0mXshY4sWa8qRckhfogkU4SI3WVqbPeQCtVCleA
 S0dRmDn3bNXzTajU8Y6bMvNJt58kTBdoKManKg/xH/DcGHVyVoShR9C+fKbTRe8qU1Tr9B8Y4
 SqOuezeF0IEUH6gCcvr+FaBBQfPOsWb5CpCHQBOre36+qNjAb93vI4+U+ubwvK936cLoy9UTn
 BCAAvvH2uNKCYhJzBJaE1dQceEUj6qiV1LMQLHIsE5ayrVyuM3nopGw1W2/Fv1xUdyIk5i8Ae
 7PULxdGhPpHu/TdpIJJhRaxemeNm5tKk3YCkTkuc+NJvBnK6wp2k20gr2pPaDQdMrg6wJcPVm
 mKCaYc3RwKDVBg6QpqFnyCNYRoKli1g7cwqdZssuc/sgxLq3LpgGQoe91mhVQDlsotimQwVuu
 BmyZwKIMXSYpp+uFDEEK2Lvv24ylFxlUL7Dyy/LSIvE3E=

How do you think about to increase the version number for your attempt in =
the patch subject?

See also previous contribution:
https://lore.kernel.org/lkml/20240419191200.219548-1-dtokazaki@google.com/
https://lkml.org/lkml/2024/4/19/946


> If the eeprom is not accessible, an nvmem device will be registered, the
> read will fail, and the device will be torn down.
=E2=80=A6

Please present the introduction for failure conditions as an enumeration.


> Move the failure point before registering the nvmem device.
=E2=80=A6

I would interpret the diff data more in the way that a devm_nvmem_register=
() call
should be performed a bit later in the implementation of the function =E2=
=80=9Cat24_probe=E2=80=9D.
How do you think about to mention the affected function also in the summar=
y phrase?


> Changed sha length to 12 in description

A specification was adjusted for a tag.
Please add a version identifier here.
Will version descriptions be extended another bit?


> ---

I suggest to use blank line instead of a duplicate marker line.

Regards,
Markus


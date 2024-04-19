Return-Path: <linux-i2c+bounces-3026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D98AB55F
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 21:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 147F6B21150
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 19:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C1813A86D;
	Fri, 19 Apr 2024 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MCpQ+vZ4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245D777F13;
	Fri, 19 Apr 2024 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713553452; cv=none; b=P2Zzaw515cg+usCkIUN3TmJ+zLP0OeuMh6vKRvPzVUYsf0TsyqtJvfBQNV+pD4ohWBc6pnZQ655owLV6tuUP4ow/+uraFjfkZegwW6m2vbErjf+D+nCfRJlNOue0avaj+9tKhSxSripADvIEUdAx9Eelu1Aa3lJhosoCJRFDxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713553452; c=relaxed/simple;
	bh=qBE2yyqSctW+YR1XWrzaQcihvJql1d+feDAhwjhB2Bw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Q9Huwldg6oZKGX5hVMplAo9qcSBoxvQ5aJR+fMvpjb9JP7T3LCIXrYSgQmdA/X3I4vm2/6nSVlynUxooYwfc+mhmQaemrXM8u2MqmX+Sg9mggQxuLem1QZG00ywyE5hkviWdphJQpuFWu7HnMB8JpfeA8phrVl7R7b1djqSZjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MCpQ+vZ4; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713553443; x=1714158243; i=markus.elfring@web.de;
	bh=qBE2yyqSctW+YR1XWrzaQcihvJql1d+feDAhwjhB2Bw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MCpQ+vZ4Uw1u2V/4xWXP5Dh9R72E/MzDtjijJJPhgEtTe4nbM94QIttiGyvvQwET
	 g156Z8/7lNkE0tVDg6WA+9R7sat23UZjhfrw0uIbNVHV+fe3N9VZxGXXGP22wOQMN
	 naIqd0ULkONK5jbHit0r8Pg8hMGLW/HvTMDjNwhO/biCEEdW3oM/cxER/P3Zr7dCE
	 GCdrwcDnqjX2hMypPOb8pVWGqgvgCTo7nEqFWmOpm6FevcqVu8JP059gqTa21WIpm
	 a09O2tGeEGLSCfFL2Ra+fjjp43MeRD2YcQlr76CI6do31cUzWMLfJ3TqjOmThHpJh
	 Pkdc/VhghErkyKeVOg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N30ZN-1sjJF80nTZ-013Nf8; Fri, 19
 Apr 2024 21:04:03 +0200
Message-ID: <cd8ff4fc-f6bd-4834-b837-2a0d59c93648@web.de>
Date: Fri, 19 Apr 2024 21:04:00 +0200
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
References: <20240419183142.169963-1-dtokazaki@google.com>
Subject: Re: [PATCH v2] eeprom: at24: fix memory corruption race condition
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419183142.169963-1-dtokazaki@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x/vF/xh/PZjJQryN3DceYuEZJQt0fvCrUORvR9v4mCMtdPaZH3T
 VAA8OePyvwUhLukRVBbAxqjC9lusWoOoM8csaQWbbHSAl3YwvGI+VnDuyyW2aVPnuilI35L
 53rvtqJ5BWpV2gqF/ZwDIHzBedSz3HkgYC8TRePMV1vBB5LLOd5n1i6+EhLGP+l0zQh//Av
 hKKb2Fpp6O4H++U5fneKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:avNeIPiAZE8=;s718CUtrPhpkK2K3iLR0Wv98P/y
 HOFnLl6NGq8XSVKrhrejUHCXEaVEV3NLoOmpAWlf2sppQOSjHap6qzOJcjiWepMxTfHdyhH2t
 RSQeg8mawqv1jHgvXAvWHklPxEO0z7Q19Hdl6cdzmiV78NyqvSrW+7hw3gllWOFA35WtoUwQs
 MCPsCcyddifw6pBTM4BPnqAuxCNNBzz7lLKe/+h48uOK6WyW0oN3LtYrhllkVkBCBRFvDvssE
 xfTr/w5uqH9U447QaT7ZiOdWXF0/9/RP72c7e+fPpfB2rJ/C/osQzZqbElF5zYiGu32JGECrd
 q9Qp+iVQJDeR0JDmaJNRJQO3zvwUtFOVl0vo/4xYiMwd/iKokBIfSJgPvnbgEaBGVxbKphXmV
 tmN5R0cdVTGYOOEGF8owhBmOtmyGyACgRxL0EGYF8+Sc4OE7W+MfG08WpP5Iy7o0FHzLmjpRN
 jGLEXAnFBRVkae/KZXqiPI6z6wBPIc0FFS+cKxMOXTefYfOFCG7zeDMjVQmx49nk9ZxxYeTLj
 kl4FASRFpc4WytxqntdXIZqmC01QvHGKRZGKF4ATdDvo092blOUVcx7dA1bwENctW3TsZWPmK
 IDiBjrhmAd7MSzUt9i4VA7sSR4sJKLsum0Rr7Zh6v8jTOJJY8fjzHrhCENR2lDlIndB8l2aTb
 zyXDsU9CHRWRYJw7tCHCtEXNUxXr+45o5Q6PDmljSEF2fFynXcPkxh4GWUPte/Q3PrLeNadbA
 82VEgBWfrK5oVkgxcZY7ETSxmaX2zD30/m4Ad2df97LLTTXkp9+M/xSn9+n9ETmRPlDzlpwpw
 0DLaBaFJSL/dijk8t0oPORJWYKJXAkbk/+Z80w7DLizck=

=E2=80=A6
> Move the failure point before registering the nvmem device.
=E2=80=A6
> Fixes: b20eb4c1 ("eeprom: at24: drop unnecessary label")

Please use a longer hash for this tag.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc4#n145

Regards,
Markus


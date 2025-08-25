Return-Path: <linux-i2c+bounces-12423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD9DB34AF1
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 21:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36F101B2419A
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 19:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDAA2820BA;
	Mon, 25 Aug 2025 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="sGmDif54"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A17283680;
	Mon, 25 Aug 2025 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756150431; cv=none; b=qxsqIp6IMsf0Ts35aJMFeSeTP3AMRMl12YUY0Nqd98L4zqqYLmZThGAvvOr2PxWAshGQLFMoO57jqMW1j+4xLVXzjCQ62YMOEffWs8F86z2iQ5qEFoUmVQogDxBf6psxYnY38NoK2zGTNxMjZP4uMxcheJ9lAsREjcsde42Gv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756150431; c=relaxed/simple;
	bh=c2/I6St37sazhGIn4tIWoh0TKErsn4QffOHD7uzqRzE=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=rD3TZw/ZJyW+8FU61jetAuTlMnscQ9vHSTI9rB+QWelk4QM2B9xqzkObfAvDJx8XxJSYvLSXzgkXvnyPcaPDgNyBkZl2/k1DAfJvzzLhrdHMLlJztuz649JC2uTJWKClgjea28ELQyQqZh9mUUjFfEzwDX2Eg9u+hO12/z1sUXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=sGmDif54; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756150427; x=1756755227;
	i=markus.stockhausen@gmx.de;
	bh=P5jRbr68OMpEywqhpyPjYlgASpSzHOqv03TMw3i0KLY=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sGmDif54jp5J3NzQbS7glzZbDCW8r8+nipS9mR5UI3XMCWxg0WzicjRieDn2kJV7
	 tB4sPCxCp7gn+sBW8YZJyyJFxYvTr55M3o6VJWQpYgDZ+4maK1WCnj3SnYVY75JFb
	 fQHqpqmI9nGopyu8HTJym4Na3Qm/F/ilU+NWcx4DhPkJjtmhud+bfK+GWaD+Y3jfM
	 uHF6iCT6MlmULQEkA+vqeJJOGoSsGFb5R42wabiZyMzw5Lc2kOwI+tfura6LOVOfV
	 6dpsJWjM4mwdXr0yiTAFHGeQHSFAxZ5+zIH7MsWHc/uH0E53ZMNro8ah0amXn+/cV
	 SsM0NvSNJRXLCGGPFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiU3-1uwQvm01gz-00TKwF; Mon, 25
 Aug 2025 21:33:47 +0200
From: <markus.stockhausen@gmx.de>
To: "'Jonas Jelonek'" <jelonek.jonas@gmail.com>,
	"'Chris Packham'" <chris.packham@alliedtelesis.co.nz>,
	"'Andi Shyti'" <andi.shyti@kernel.org>
Cc: <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	"'Sven Eckelmann'" <sven@narfation.org>,
	"'Harshal Gohel'" <hg@simonwunderlich.de>,
	"'Wolfram Sang'" <wsa+renesas@sang-engineering.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
Subject: AW: [PATCH v6 00/12] i2c: fix, rework and extend RTL9300 I2C driver
Date: Mon, 25 Aug 2025 21:33:44 +0200
Message-ID: <064c01dc15f7$2cfce970$86f6bc50$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHU1E4yj+o7tljZENLvMBGdtIgGl7SCRALA
Content-Language: de
X-Provags-ID: V03:K1:PdOyKoOICfKtIVjmJVO12oX7pLaQvN0QAOXK+LxObnWJqH6NxNQ
 p7Ad6Svm0NIaV+u3UJ3TQboJg+zXPJiW7NaAiOjogHlZ+NGfwmDHjeFx4XbCZPLcy03s4pe
 Cqu8d6Cp82v6bb/YQnJ6148DazJI7SjW76a0mbpw9rP4OqO88tU51yzYF3IpNO9Of8XLpnL
 OiLi6mCnPQMwjCOgxHiPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Btl2rIMJCCs=;VZGLARTTbQYPD8zz2bknOqvqkn1
 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

> Von: Jonas Jelonek <jelonek.jonas@gmail.com>=20
> Gesendet: Sonntag, 24. August 2025 13:34
> Betreff: [PATCH v6 00/12] i2c: fix, rework and extend RTL9300 I2C driver
>
> This patch series for the RTL9300 I2C driver:
>     - fixes issues, one of them in some cases causing data corruption
>     - reworks significant parts of the current implementation
>     - add support for the (quite similar) RTL9310 series
>
> Goal of this is to fix critical issues, improve overall code quality and
> simplify maintainance and further extension of the driver. Moreover, it
> should be brought on par feature-wise with OpenWrt's downstream driver
> to be able to drop the downstream version.
>
> The first three patches address bugs in the current implementation, on
> of them being critical and causing data corruption under certain
> circumstances. Although the hardware doesn't support SMBus Quick Write,
> the driver claims to support it with a broken implementation. This
> causes to execute a 16-byte Write instead of a Quick Write, e.g. causing
> corruption on not-write-protected SFP EEPROMs and soft-bricking them.
> These three patches are also sent to 'stable' because they fix critical
> issues.
>
> Subsequent patches introduce various smaller and bigger enhancements.
> These include:
>     - use regmap_field + its API instead of macros + GENMASK + shifts
>     - refactor xfer handling
>     - variable renaming to avoid confusion
>     - move some register operations, calling them somewhere else and
>       less frequently
>     - use guarded mutex instead of explicit mutex_lock/_unlock to
>       simplify control flow
>
> Finally, the last two patches add support for RTL9310 (mango) series to
> the driver and adjust the dt-bindings accordingly.
>
> Simple operations have been tested successfully on:
>     - Zyxel XGS1210-12 (RTL9302B)
>     - TP-Link TL-ST1008F v2.0 (RTL9303)
>     - Netgear MS510TXM (RTL9313)
>
> with Byte-Read, Word-Read and I2C-Block-Read. Other operations need
> testing from people with devices available.
>
> Compile-tested with Linux, run-tested as backport in OpenWrt on the
> aforementioned devices.

Repeated the downstream tests with this series backported to 6.12.=20
Successfully tested on Linksys LGS328C (RTL9301) and LGS352C (RTL9311)

Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de



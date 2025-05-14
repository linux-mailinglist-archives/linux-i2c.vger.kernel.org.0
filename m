Return-Path: <linux-i2c+bounces-10991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF16BAB70A5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 18:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AD93188DE0C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 16:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8A22701C5;
	Wed, 14 May 2025 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dh3coW4l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417F527703E;
	Wed, 14 May 2025 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238387; cv=none; b=gWfIMFeEecGBVPTln8tWvp4/j7K610gksqxOzvCdPt9oHWoJx3BMtVfKfPdUzLBKx0KkbPSgE1AcdUkz3uf+hP+v5VIWg7p7Xh8H29eNc+wFkTzPyT3F7rtWEp2QeQOr2gpoBtVptvTH25jZ1QmbaST383lTeWIV9xnnA/LHSkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238387; c=relaxed/simple;
	bh=orMYHSP5ssuSjH/hleG580PAr5anMD7LK5PDBxTlud4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fUGo/V6V6+I8ZJTIUHter1laA6u5lZPZSj0YteZBMtjkAEylTOLVHVyv/q76JqX6dttE/YAf2O1gcrs6oElfjLypqDm5U5gsdfl8QdEhZzlu9NucoOylPt+psNq3EiZEh2fy1iTn0PtRzqX5INaUObmm2ki2FmOuUVGI3qITafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dh3coW4l; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from [127.0.0.1] (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9891B1F91E;
	Wed, 14 May 2025 17:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747237888;
	bh=orMYHSP5ssuSjH/hleG580PAr5anMD7LK5PDBxTlud4=; h=From:To:Subject;
	b=dh3coW4lpuAUBquC4TUhoOP6ncC52bSE3nyZgB9wUZ8JgoTeM4NA0O9X36z3/vtmo
	 vJClLHwHAToxJZFfYU/405c0DDZZbhU9mSwRqzpVEp8VZwvI1zjmesY82h8ldUHTVI
	 0wIUaBu8yYLgGehvIysDjZPsiyOxxy5xFMkItZH14Jo3Cj0dembW6Sv7d/fx7V9A+d
	 7fUrmnOWc+DJt4Btqe44v2qQ9R9yteHA32eRWCGL2bRcP5ywsTphx4dY0Os6xZLWih
	 mETPsXNNgc5LqtDk7sxrELvXasMoWYwud3y50B7RKwsrR3J52QgstRnAxNhIjl/UBg
	 U4Hq3Tw7DYKvg==
Date: Wed, 14 May 2025 17:51:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
User-Agent: K-9 Mail for Android
In-Reply-To: <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
References: <20250319145114.50771-1-francesco@dolcini.it> <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
Message-ID: <3C1EEBEB-E691-4EB7-A008-A1FE9CEE7238@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Il 14 maggio 2025 17:14:32 CEST, Andi Shyti <andi=2Eshyti@kernel=2Eorg> ha =
scritto:
>Hi Francesco and Emanuele,
>
>On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
>> From: Emanuele Ghidoli <emanuele=2Eghidoli@toradex=2Ecom>
>>=20
>> Rework the read and write code paths in the driver to support operation
>> in atomic contexts=2E To achieve this, the driver must not rely on IRQs
>> or perform any scheduling, e=2Eg=2E, via a sleep or schedule routine=2E=
 Even
>> jiffies do not advance in atomic contexts, so timeouts based on them
>> are substituted with delays=2E
>>=20
>> Implement atomic, sleep-free, and IRQ-less operation=2E This increases
>> complexity but is necessary for atomic I2C transfers required by some
>> hardware configurations, e=2Eg=2E, to trigger reboots on an external PM=
IC chip=2E
>>=20
>> Signed-off-by: Emanuele Ghidoli <emanuele=2Eghidoli@toradex=2Ecom>
>> Signed-off-by: Francesco Dolcini <francesco=2Edolcini@toradex=2Ecom>
>
>this patch is causing a build regression=2E I'm going to revert it,
>please check the test report that has been reported and you are
>cc'ed=2E
>
>Andi

I am looking at it, it's a warning with W=3D1, not a build error=2E I woul=
d not revert this patch, just wait for a follow up patch or comment that wi=
ll address that warning=2E

Francesco=20


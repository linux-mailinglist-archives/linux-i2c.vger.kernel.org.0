Return-Path: <linux-i2c+bounces-8356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9DD9E690A
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 09:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C439428337B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 08:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EE41E04AC;
	Fri,  6 Dec 2024 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NVR9hKjE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883B91DDA3A;
	Fri,  6 Dec 2024 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733474125; cv=none; b=F1AREfT7iH4E39PDvaIhrRXW9UX4rEagLAvvmUAR4NTiJV0XvprGScj20D4USkZ2qT+UavtDjIEGzQ/L5qGG7SheRZMS/571KcgcluY0z7PyZO5iTrNHU+M6lCPmBynCla5WSHrkiILmsNsWQCSVwKmLyK+RF8G4EK+mMONiva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733474125; c=relaxed/simple;
	bh=WV1SumrajbXcBiCZh7cR2oodxjaKHzLM/ljKxiy91EQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ftxhzGHIkL9/nVJBf+FyNl8ASMjkUVBqC1OLqb8xGur3xBNW1rr2lmr/KBIMBPpJs4CraRsyKHwqdbWgHql9fX2PkAhKrwh01H6zizS7L8gzugWpMUc2NYqv/n14WVFhtww14+pWeATseLv5/l8ho7yyWQCV7BeZv0B0JGdidH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NVR9hKjE; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2F6B6000D;
	Fri,  6 Dec 2024 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733474115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WV1SumrajbXcBiCZh7cR2oodxjaKHzLM/ljKxiy91EQ=;
	b=NVR9hKjEAG9vYhynz6REfbxApCyedl4pC+K9g0c2uoNtqUXAlwha3VTqMb83md9W6qHwE8
	i1vOcNCALO+W5ixz/qgDbTPfXuT/cTweM3YXwRJYAHlp3gH8rS3GQYuGs5+e+Z2nzniDFo
	3xGH11k7Dv1XpB4QExEFuhFAc3QyF10SbwZprHXbECJQzDobU6sE3VFzOMQpVuxddwO81z
	Fw0+J8uu6XyXEw+IzVXX67VfUjaTyv+19PRbSpDwoAwVEywL7EAojFtOygHBe/f4Q6Q6RW
	BMtpe7eYdhKeJxZzRZ36VMASdxxtYZplzL/4nXFgg3kpT9JA5NVieyb2LbT+kg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 09:35:14 +0100
Message-Id: <D64HAEFFEGS1.3FJ6VM6Y6F1M1@bootlin.com>
Subject: Re: [PATCH] i2c: nomadik: Add missing sentinel to match table
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
In-Reply-To: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Geert & all,

On Fri Dec 6, 2024 at 9:28 AM CET, Geert Uytterhoeven wrote:
> The OF match table is not NULL-terminated.
> Fix this by adding a sentinel to nmk_i2c_eyeq_match_table[].

I had the exact same patch pending locally. Sorry and thanks!

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



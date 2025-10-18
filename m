Return-Path: <linux-i2c+bounces-13629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFF5BED70A
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 20:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2BA019A6308
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 18:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D221B4257;
	Sat, 18 Oct 2025 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Idx5rRXl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5641DED49;
	Sat, 18 Oct 2025 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760810450; cv=none; b=ugU0nM18sSzPTWnvIPVeRMQDne7lHfgzOre2N/0Bb5X3AkzBXiMa0aksmJ+Uo/3+q/XZwzepa0ThGSg7rBADcju/vtClJAj5D1TXEE4YNu73TYRtyD/APF7udaTBZqMYz5B+V7X6p8dt6O900odeoVwa1posytQSue3auR2kZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760810450; c=relaxed/simple;
	bh=hNLLtRN0y/E4an2IJFBc6CGoq08af3Lvlw2k0MymlHc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nOUhzPJgPIRIjAC9t8iZdGlUlv+Z2HvaySn8/w7gw0eJFC8i1WONx8pWQ+0C8SY6WpijjI90TLzUQck567ChkPXpW3Y5Hh90LGLMQIG7FXBFsnV8ufm0l4uqwz4jSziPadt2j8DJR0RN4oRLKP+XsJTmw/X24LC8yoQnQR0NYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Idx5rRXl; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760810433; x=1761415233; i=markus.elfring@web.de;
	bh=hNLLtRN0y/E4an2IJFBc6CGoq08af3Lvlw2k0MymlHc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Idx5rRXl8jD+TvthZjKglLuRHA+UNYBg4DnwUMeY9N+KzzAARVFcC4/5HtNXK3Dz
	 vxxcrB/lb8gM2XP+yu14lWfQb0Mo1cf8zY7QhAs4J+EJ8QnCy97iJorUgCrnp+eWy
	 lp3VdgGjtd1CBgAvq/sYcaWd4/GmgJsszbcGmmwKnTrAepz4waVfFJsZyf4MYZXRq
	 Av26lVFVh0OVSPJ3qx2xAX2XoAglZbsuGQZdo6XVY7YxU7HpZIokMVT084VvaLKpG
	 ry2CsVT55NSGwwVL2G5zdf1auHW9J/1m8i4HlvRYNhw5HQBEFb7bLJQAWxe1Wy4UP
	 VT1tNyoYF4cIZzPRvg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.233]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKdHE-1uvog10792-00LCjP; Sat, 18
 Oct 2025 20:00:33 +0200
Message-ID: <5e4c7964-0b15-4595-ba14-bbc0c71520fd@web.de>
Date: Sat, 18 Oct 2025 20:00:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251018091258.5266-4-chiru.cezar.89@gmail.com>
Subject: Re: [PATCH v7 3/3] i2c: pcf8584: Move 'ret' variable inside for loop,
 break if ret < 0.
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251018091258.5266-4-chiru.cezar.89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SH/s9sdThxGaDsimgKcXtbIcphpjXZySulkS4KxPEaY1jsQHsXQ
 NtXB9nTHLGPPn5LfLDgBobPVhZEhYbbDD+CC0ma/+wkLZegxixSkrlvKDS25YGfW/foTLWr
 stqGjy2y14DeugbFK1g/M0rBHpD72FLNTJ2rpEzUzEBjcy1RN8V59HDzNCoEGQ/UMn93+No
 H+9P2cFkBg2IlsBOo7SQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LxoVxXCEom0=;xhKsLRg/NuxoGtas5WOPpJcEDM7
 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
 s/rzw==

> Require spaces around '=3D', '>' and '<'. Add space(s) around binary
> operators.
> Move 'ret' variable inside for loop. Then check if (ret < 0) break.
> This improves usage of ret variable.
=E2=80=A6

Is there a need to split desirable adjustments into two update steps?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc1#n81

Regards,
Markus


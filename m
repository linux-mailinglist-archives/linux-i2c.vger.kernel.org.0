Return-Path: <linux-i2c+bounces-10982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C76AB678A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 11:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE9618939E9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 09:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8548227EAC;
	Wed, 14 May 2025 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JK1vTSb7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FA019F416
	for <linux-i2c@vger.kernel.org>; Wed, 14 May 2025 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215123; cv=none; b=MIXhulQzT/D52xpJXkWjrBnVaHcKGr98/pxYyWukuce6WcTIDhWmKCi8X1mDwJtOz3wnivU2ud/opitj3kWBfIU3/4QgHYL+mvTDuHhFdqEAb8of9HWrr2R0bt/IZJyG+jkrPxnF4Ghq6B5oi9/eZAfnPKOeoLXHeOJj1mX/2A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215123; c=relaxed/simple;
	bh=DKJPQc2UnDSjTx7nZLHqJP7cJoeJGHqZa8YDeDrbSlY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Z+A+U0I05fA1ncT+SxHigLb5sWy5If3z6Gg0ETw6mFXJOZO46r9tF8fwGJZTBOaCbuBYSYfpG1I8Oug4U28c3DEnrvUZb9lSs5ay/jcSaeW19DA8cEMihG31NNLbFnb/o/OrAJ/MKHvS3i8qUgh5ydV4wJXJhq7BZQBVN8aZ894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JK1vTSb7; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B35043AD3;
	Wed, 14 May 2025 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747215119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dfv45bnichpjCAGq207bFcZlXwMMK/d535qeWmESpzY=;
	b=JK1vTSb76jiCXGtp9jYMuHjcCO1yDmVHmnQ5TSFIkWkhTBGTUIzhZxb3d1FITdkaFV5bPX
	5bFjWFpVpWu/PHCApYZ5jXDqP60eDUXjIBeLnpt1IJa6gmtIRUaOvk+fMv0QYoHVjgVxHl
	8VLOqKSIYHf2GaV2ahgX6ugssAM8UuFejKQdrYhNRQiQvkUi0a0jnll3x9Y42EVzT9VUt0
	VbHmkZkwW/Uzdvjx5EePlz5wquWTDY0L1AT6yM0G7w/bE13tYOoi+gIE9TyXMJVUemypy1
	0LyT+4f4JaGQRskZYQbBA35TZ88s0sF3BxwIKBtyuaOnwfNMWJMb/X/KQul16g==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 11:31:57 +0200
Message-Id: <D9VS2G7S3T9Q.26QDCDRTC2S11@bootlin.com>
To: "Linus Walleij" <linus.walleij@linaro.org>, "Yuanjun Gong"
 <ruc_gongyuanjun@163.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 1/1] drivers/i2c: fix a potential null pointer
 dereference
Cc: "Andi Shyti" <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513123754.3041911-1-ruc_gongyuanjun@163.com>
 <CACRpkdb6-cjyvXornKcVrYSRqJLE3LqtzotwapHwrYGVm4RNDw@mail.gmail.com>
In-Reply-To: <CACRpkdb6-cjyvXornKcVrYSRqJLE3LqtzotwapHwrYGVm4RNDw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeiieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffhufevofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeutdeugfdtffefhfefleeiiefgleefueeltefgjedtueejjedvhfeugfeikeekveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepudejiedrudeiuddrvdefvddruddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirdduiedurddvfedvrdduvdelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhutggpghhonhhghihurghnjhhunhesudeifedrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Linus, Yuanjun,

On Wed May 14, 2025 at 12:10 AM CEST, Linus Walleij wrote:
> On Tue, May 13, 2025 at 2:38=E2=80=AFPM Yuanjun Gong <ruc_gongyuanjun@163=
.com> wrote:
>
>> Add check to *priv to make sure the input *dev is not NULL,
>> and to avoid a potential null pointer dereference.
>>
>> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
>
> Why is this a problem? Reading nmk_i2c_probe():
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> OK so priv is not NULL.
>
>         amba_set_drvdata(adev, priv);
>
> It is unconditionally assigned to the AMBA device.
>
> Surely runtime resume isn't called before probe() has commenced
> successfully?
>
> I don't understand when this condition can occur.
>
> Also including Theo on this, he is the major industrial user of this driv=
er now.

Thanks for the Cc; I agree with your reading of the code and don't see
the issue.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



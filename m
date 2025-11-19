Return-Path: <linux-i2c+bounces-14164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95181C6E66A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 13:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BCEDE2E154
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 12:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38261357A5C;
	Wed, 19 Nov 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Sk5KYcnW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE334CFC9;
	Wed, 19 Nov 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554465; cv=none; b=SARCfrRevx2awFBNAt89ngZqd7BbViMkmIdWZRDj6tHDScVxpURHBIUTWGr9vQvuA/kMtSgQJFVILj+0HfeZhrPhWpoChRmK1ctwPgKzE86BoH76zcXXBG6VfaMZOancxU06G4/cTd3GPNom5LxtOvpUFlc0bT3ubKCmlEjSCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554465; c=relaxed/simple;
	bh=c3m0nayYSri6U0x2qPHnit4slZX2/LMlcibvLz/4APg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pilZS3G3QmxXnbT6pmGXfZxvtaot2yqFWHRXwgXbBWrN6+Oeh7QpebIEPE2/oly8C5JP7iTwEMqx3dJ2N0KRRShHogiAy8dfrKV4wHOnxSo4gXJ8MioNredLPA1wzIkvmnfoI5vcisbfNtvKBFhZycTNnBPqzzKeuKmn0m3L+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Sk5KYcnW; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763554295;
	bh=84K3nB6P3f7jaLk3QXNeVG5r6HVoItxT2o3+Sx3KhXo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Sk5KYcnWX1ubprEXevmxMbtQ/K5HOtureme4/Mt6gx6hCLk/rugzWKSTrOyPjda41
	 /2+o2t56uO8g8JZQGv41WUhUkAMXSiQ1egSrH75vijECcS/GILpprife3lW5jfcmZG
	 ZobQaBrAwzQYYpe0SJhLHNAOZW8JxMmwLsNGZUPU=
X-QQ-mid: zesmtpip4t1763554289tbaf07528
X-QQ-Originating-IP: TDvSvCfL9BCTc8r2vjv8+BrgnY+PKM0ZxPKhhUXcHh0=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Nov 2025 20:11:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16475274264780386058
EX-QQ-RecipientCnt: 18
Date: Wed, 19 Nov 2025 20:11:26 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <AC00D74FCBA8F87C+aR2z7i1n4_5tELvW@troy-wujie14pro-arch>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ocns8ug84zPhyk0jplkfMooNPowoNxk4/W7POa7M5oK/uVyrLusHHgt3
	F+0Tqkn2b42YXL/cUN2BX6XGOEXhVEAym3xSoOr706nuVjvPZyrqL+0/AXk++U+iq5hlWgW
	fbF0XcH031FwikfuFgKIdEzZ3hW6ubZoTD3ZPLRSijdbFrPiTabOU/3dxaqttqkJDv0PUiR
	Hjrw0gQtZQ6A9YAdmrd2konpeYQYrGWYbXAJRXuM+f7EqlDI3uDNSKfbm0rFROswhfZcg0E
	ZYq91Gf4nB+JeLbL/rnFhxGn9olquzl8XaGOt0UyYbm1Cw4zPd9x1s3fWN4/udN6fgGE5ZT
	uDaqzM+6Z+2NPDQVYdWAV6TqUKm3oKYgVsxdUJAVUV0l35/NjqvXHXxC5dD2Br/PtgLOnPC
	HWUE+Hi5EToFnbGh2UyFPPrLm9HpCQ+PjZDMmUGY1TbcpQEu9z258YW6wWkeJMj7FtfLk8K
	j/wNCgcDBjVMRNTuMhJZPIb9765AWWOwaP0oMGnBM/2nTYTeCLrdFrIYybimrJN38Gy8nrl
	G9bUYAeORT+BDyMxFGSjGj3ky3pCNh5CSxL6SbiYdeK8Ijv3q3mvHKCBzfEsAbbtSonQQlC
	auhWOKSVU8dHRN0UMDPdcW4nmvdgzJSSfZprtHb6I4lY6bUOIC9ADNIhWMS/zOqYDnLm4ym
	n4Rqm8JRv9L5kF4/v1srK4dS4B071xbSQG6fEipEI/48tuOiiD/ozpytkGMPlam8C6Z27ym
	al4OKguGR3tjqsMdtLNc4JNyVdbCtM4VyHBaV/MwmmZhPESKp8QGpjLxCG6nw/HKyqwVLB1
	HIQSwgKzK7wzIdTqsF5Sqys9jzoM2IRYgJr+bWgcNH42rAJx5wD0CbibSSOSSvV9wJ7WzPK
	q0qHgDgasbdtTUkM7YYj17WhNLFaJs+7iMxr1meu2m4OLc8ap1PMDqoycqys+OHweKmcim/
	puFcbMPGzuncnhHdKrxqJhMyVXTans0/U+FbZBz3MOhBizJoMfWdPdNbElCqbGBsi9r1ZeP
	7JZ+q14lIIi/5wbmPASXf7Us4wqQ3YcIrRGJ5I3G7f9en0ecGQ7xK4h/tArgg=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Wed, Nov 19, 2025 at 07:46:43PM +0800, Encrow Thorne wrote:
> Add optional reset property for the SpacemiT K1 I2C.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
>
Thanks.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


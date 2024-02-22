Return-Path: <linux-i2c+bounces-1918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 789EA85F845
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 13:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245751F235AF
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 12:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A822A12DD88;
	Thu, 22 Feb 2024 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="YWB9i1QA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59112C809;
	Thu, 22 Feb 2024 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708605208; cv=none; b=Ox40SG7+9hEkHx+fTxTwJaZGzxPOVZ8jwwxoMTFvhLmr8xTGWiC7e/QCywBw0hvDkXtzY7IPhV6WwG1gu11Ul2NtIC5PUS4hTTRyMb2pBHGpcW7PCly4RCC9U5AhNEGftYysQFaD2EkcWWMKesgP4Yu1GwsBr//lyEbBZ3dBkE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708605208; c=relaxed/simple;
	bh=d8IBLOsOQdtQiFzfCa4rzkp7M8N0SMED9bMMxXfaXt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaGJgzjU82NHyHYyeEDv4l0vw1vQbi94UpTlBNwObOWtESdK7GvuU4MPWrTKHb0HjuO1w0KypgEYDkuAWMcmPuQzWvumK+qcsApCpq27y0+UkVjVwyUiDVJkLz2uddZaT5FBHCoaADUdeNjubWXilkMaz2YvVzK1cvHI/T4Ts9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=YWB9i1QA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5654621d62dso506948a12.3;
        Thu, 22 Feb 2024 04:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1708605204; x=1709210004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MG0vDESW85KfZHlebYHCzgubjC4U6RsUx6p93ih8in8=;
        b=YWB9i1QAvS0jYzldpgC0URUHG+SesrEkacobvGZkjC27D4BwDl6o5hYfD1ivHzbcXw
         w6D/9TRTL4J5mHC8+1Td+QsmI9DS1q3jUIWzcJtF+6EUtYlcd29aocivANCbPmssRdZd
         Cct2yexxyP4S0EPWQf0X22YLOyIqMaTNmAjIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708605204; x=1709210004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MG0vDESW85KfZHlebYHCzgubjC4U6RsUx6p93ih8in8=;
        b=sBJAu7i28EJ91wZlDh5GAjDk8gsBwtPtoV7vwyaGqHfNDCZDx0mIoiE6bfv1kDC5SM
         oUrBUYJWsKzXpNBpy7YaOdAxvx6mfnkfiHzeOzor6EBvHDtwjyYJR88970njP9cfQnAU
         HBlALS/AidfkidcnUug/JqpROeb6ZQnEkxkxoghYzj5BGs3K8hTEUCTy3vqyDiOP98+D
         ZOwpGp79roP1N7PLZw1BcpKTD8ooazEfFVmZyzkBG7GayDABEf0t4rAzHqNvGR/+0bvN
         hvQm3LoP/rL9SVX2yt4y+QkxD3NcycXqqAOCpcU8hv20+KXaGBbjCkhFwalq0X6LHSX0
         AseQ==
X-Forwarded-Encrypted: i=1; AJvYcCU62+GX9H9D3cWCSplXeq1H/37Q/J5iBd/GMlOrcKb2LDaMTiBJ4iRcma+NIPBwuRDZgbzqtNI0/HbPvD6QzEo4/npLJ2pSRVwbeXdJOjipuF+iYQKdEjFBRBPymCNw37J4+xexeYeL3q9dORPVj1cOStVQJ0eZF2SHLjSqd8Ir/4v+hxhq6ElGGA+6lCdVKZ5RwjRJSlk4BmouHwNUvA==
X-Gm-Message-State: AOJu0YwsX+DHZ4MGwJrtD6nRnDsc0wCoMDLVLctLNW53WtXr8R70BvVy
	r0/uuEWh96BVZvP6dyl+LHbh9hITAZu+JXdwLagrPW8sw0RCmh3DAh9kiF34CnCnnbGEu39FRuW
	JrkljmJ98PIHOOXtRDhgBwKvEwfc=
X-Google-Smtp-Source: AGHT+IFNrhrORPsfM/GgVwQUISFHcEt4aCj/nGl8kGj58IUCD9NdG07mYT8c4lWWTr3+YPEzqcaJIS6qW4w1k5sANc0=
X-Received: by 2002:a17:906:c5a:b0:a3e:d2ea:ff5e with SMTP id
 t26-20020a1709060c5a00b00a3ed2eaff5emr9620337ejf.58.1708605204290; Thu, 22
 Feb 2024 04:33:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215220759.976998-1-eajames@linux.ibm.com>
 <20240215220759.976998-8-eajames@linux.ibm.com> <67ea1daa-72a5-4dc0-b766-34a99052dabb@linaro.org>
 <8649af3d-c7f9-452b-a8c4-921fe5fa30f8@linux.ibm.com>
In-Reply-To: <8649af3d-c7f9-452b-a8c4-921fe5fa30f8@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Feb 2024 23:03:11 +1030
Message-ID: <CACPK8XdZ6twg=d5tHKh0OuDXsHDuD8kjhcPVxRTn3y9N75hERg@mail.gmail.com>
Subject: Re: [PATCH 07/33] ARM: dts: aspeed: p10 and tacoma: Set FSI clock frequency
To: Eddie James <eajames@linux.ibm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-fsi@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, andi.shyti@kernel.org, 
	alistair@popple.id.au, jk@ozlabs.org, sboyd@kernel.org, 
	mturquette@baylibre.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 05:44, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 2/16/24 02:08, Krzysztof Kozlowski wrote:
> > On 15/02/2024 23:07, Eddie James wrote:
> >> Now that the driver doesn't hardcode the clock divider, set it
> >> in the device tree.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts | 1 +
> >>   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     | 1 +
> >>   2 files changed, 2 insertions(+)
> > Please do not mix DTS patches with driver code. DTS goes to the end
> > because driver code CANNOT depend on it (there are exceptions but it was
> > not explained here).

No, this is fine. Please continue sending the patches in logical order
as you see fit.


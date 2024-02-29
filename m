Return-Path: <linux-i2c+bounces-2076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B150086D5DD
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 22:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E18A91C22599
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 21:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D2516FF43;
	Thu, 29 Feb 2024 21:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpmSeTlB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057016FF3B
	for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240679; cv=none; b=m/6Ekpv8CvXWkAhbQDhwUgdwCl4VIplaW1wto0NeqKYIYqel9HnoXVNZeJP5+JaIG0Z8nHdmBLHjU5DXpxj1TNTD3JLR8cWRTVPWJ1m0SnsmcsIgUNifH0OA1opKpUraoIQxI+ff+PfH8UUV/eHtzgIFSQZ5HMOYWKabbVk2ZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240679; c=relaxed/simple;
	bh=8uPVylV9EO6m0KYXwD9bCM+qusEzKV7OpBt6B4Y/Y+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WH8bU6EED0hGRUoyx7FivD2DGPCr5K0yzLQeLOife/DB1H0lzr/CVA1GjjsHV5Qq5KMWn6FXYZ3HrzUubOztXU8xAX+Tf48+CFKt7RDXZJEpF+Arb8q6dOTN4OuhtCRYA+17L95UqyH+nLAmkxccpU6og+n0wc2HD7baXmWXaUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpmSeTlB; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6084e809788so20973427b3.1
        for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 13:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240677; x=1709845477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uPVylV9EO6m0KYXwD9bCM+qusEzKV7OpBt6B4Y/Y+Q=;
        b=QpmSeTlBYpnn9mqBMS99KSQoZHAmlh6zlGdw4USU97YoQ+XX3pZp67WWm46223FX8E
         0OfZt5HLZBO8Pu5KzQziX+rCqF/8sTLEPjQHydYjaCsMwcPqwuKoS5NtLLh1UtxMBeQF
         KgnqF8j1+ZbS2T/jI5OKRHJP034PAmx3TvT0AVXyfm7uQpSy0p6CyPeQ2NvtRi1JW6+3
         YoLDRiQdHEuk7WtViN1J9YTZAUSOjL1sjYC1n5/A57Kb0etZ0YMUSRkpsJhmn4QtjHWW
         gSB18Nu6KqAbmV+1j31K3lkdiyW2E0SBTieklLw5yzjVU/AYYoomZQdBGYI+fwMmHxUM
         amFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240677; x=1709845477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uPVylV9EO6m0KYXwD9bCM+qusEzKV7OpBt6B4Y/Y+Q=;
        b=TM/r2bFkXKdIR/1MEcTt4zU1GFU696MpOZwZ5+ya/SH61suXmIhFZ0nvaXj9sAjkZ1
         mpDaBTVrfr8MdXQW3esSWCJSjPSnCI8KgV8YbYVSfqjZOPsWVhevznsZUbsAAirNyvN0
         hVjBjswg0o7eO04xLcPqRhK/+9JAkwwqFan1ySKi/3PXHavK2n3cze1LU0NHauLxjEHk
         RTNZV+9/T2bQKlR5P1Td8xNAlDQmI5T08QA+GRsZvbUmciP8jDHJCIaDA29UmGdaBJXT
         /G7+67XcxwgF1cRzQ8EYBhfeP+780tYJYIASixuvye++sgw3Ie6IAJcLgGlkf+oM7161
         WZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh5kGMi6TMVHIqHzaAJhZHM706uMqdUq7mnGNC/QW+YKgVYBQpgOatOyBc+cus2D1sLSezTZUDvg/QAEoAlvzhbQRQAWES9sFP
X-Gm-Message-State: AOJu0YySZxUuUMAR7uZka18J9NWTNvZmrv0+uk1ShxTmze/D3Byp0vDU
	KkPpbRLGmtnoU1UgQ4hYENcJzuFUhEFjZWUd3Wv02A1a1VVPKCrzu7kQtqRBiE/0244LrPqctLN
	sBLEibVQGJC/wK/G34TvGkRJQIE41z63aQbtAMw==
X-Google-Smtp-Source: AGHT+IF6WpL6uXLdz5RRC4t8N2wE2n4WdvI8YyClMoKto9MRFbIOM8wSfgQJvA/IZCtI3mWM0tMsS/RNNVdPkijGBSI=
X-Received: by 2002:a5b:9c5:0:b0:dc7:421d:bcc0 with SMTP id
 y5-20020a5b09c5000000b00dc7421dbcc0mr1924276ybq.32.1709240677236; Thu, 29 Feb
 2024 13:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com> <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:04:26 +0100
Message-ID: <CACRpkdYRPNq0diYUyQoZ54pYb6Gz22rj-WoGwPFALiuvgY71jA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] i2c: nomadik: fetch i2c-transfer-timeout-us
 property from devicetree
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 7:10=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Allow overriding the default timeout value (200ms) from devicetree,
> using the generic i2c-transfer-timeout-us property.
>
> The i2c_adapter->timeout field is an unaccurate jiffies amount;
> i2c-nomadik uses hrtimers for timeouts below one jiffy.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


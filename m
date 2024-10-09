Return-Path: <linux-i2c+bounces-7295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B4996885
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 13:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B84B01C2200D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 11:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0246191F74;
	Wed,  9 Oct 2024 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xo+Hnc0X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01CE18FDAF
	for <linux-i2c@vger.kernel.org>; Wed,  9 Oct 2024 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472889; cv=none; b=QQlXOad4XyjQOtPw8L4txEl8ZKBH8/ADKxbrnN3x74TjzSq2kvuZ+lbIpBegUVP1uQqDPERp2jeikNnLvOCQ40CLpxKDQIDfUwFehweGqXY5kcxvJo6caZtxzoeLcX62w9QqC7OrgzmKQnT1sFyg/eiO+V1ghdXaHwf7KzveGS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472889; c=relaxed/simple;
	bh=K6vtvPB908Tq38kLIBtEKe64ao89wnx025O4nGdzLHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6pyYq7TJyYK+Edia4AVdlWRed7dUcBxK08cWO0RRPMs8bGntc9ELoMy5U9LlRfHhXVgFHI0GRSOEh2wXfLdafFru0U0KVQ/73lZevIbe1VcUy4seyQiU8WEkpYCvWO4GtjMcdKDb1UV/++mzPhXpVw4EKHcL7oG/5BEuPsSAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xo+Hnc0X; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso73288501fa.3
        for <linux-i2c@vger.kernel.org>; Wed, 09 Oct 2024 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472884; x=1729077684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6vtvPB908Tq38kLIBtEKe64ao89wnx025O4nGdzLHM=;
        b=Xo+Hnc0XpxoDGOXSnRl0hFyz27Ox2/8zcdpESIqxR5zmN7oWRp5UasuFxUBGqTuPxh
         z37m1zsXt2K3sZlnIaHBmPCl3+myBmC50uM/lZb68hTAtTeDHeE/T7Kz+nDIRIcdw16f
         WsFWos1HIWWdbB79gTriUoy9kiRmKJ/fa26K4RclIqPtlX9njNZWK+i9HnTvHnFe/qzO
         cxJ+hyeUQQVGexpVAEPWNkQCr4easf4tFvsMEPqfq0RyvC0grW+7uNxRu6gYelJyFE1B
         xcjpm7Wt75AZhTytVj9TlPgx9yFM9GQjKOY4oP7ACRtBp24SclvB39mgvdLcR4rRihyO
         Do2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472884; x=1729077684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6vtvPB908Tq38kLIBtEKe64ao89wnx025O4nGdzLHM=;
        b=l265HarepRiOTA/WmLH/WV2Z0IZPQDw0woMPNT2Uc0HRBP84ECiB0QPW7+FsdwvEnU
         amxve0rtZiIffe5uh3QqtXIWKxASJZtgkVZ3v3ZDJJ6uv3VC9GK3ubpiCWPQbGg7wr7E
         uSmgHYbuaBkfkJ1XDO1wprWvXKqiQ/H9a853sqlKwqen+8GGW7fGXYsyaV5tA9bQprIe
         cDGiFm6GFq4Xg/NyEp2tG3gMjck+9f/1si9GRxfgoFegMWvGWwOJDEyvEAZkZ0zSubug
         cm+APmiKXYx6aemdtREQTj8w+mUw1Rn+sYaS+JFaCjrZ7Y40cYqRNLvc6P1aMLbIiQNf
         brRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVljq3wxaTktyODmi2VYp7UdAbTbuUOGspXdYHts32BOYxe7287oVPNpvn0/0mwkQRKMcaFO3ZsVzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHbRao/SGfMnRXBuGSFBi5BEsFeQODTXGchJ+S1mvjxrzNB7k4
	ZgLYMmcFIckcj0uNyu/tRfunWjx1GA64zpD2xxZrit1mAW19diLt2MMKQyOvtTk15kEC9gpFERU
	D3u6Cxlo3ZaF7dSpwGwMqcYS1d2cqIcl81r95Tg==
X-Google-Smtp-Source: AGHT+IFmEU5oJ/7coIsQusC6z/KBPVtggdarUFKeOox4L/etbXaEuzXf0rVsMoW/uJRsuAKWRkyIQgcPek93JhTv9Bs=
X-Received: by 2002:a05:651c:1986:b0:2fa:c841:af36 with SMTP id
 38308e7fff4ca-2fb187ac41amr12317131fa.30.1728472883961; Wed, 09 Oct 2024
 04:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com> <20241009-mbly-i2c-v2-2-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-2-ac9230a8dac5@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 13:21:11 +0200
Message-ID: <CACRpkdYym4PJ5HkkNCerXMASfA8rx2ABzwJ-vz8efRhrq2Ts5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: i2c: nomadik: support 400kHz <
 clock-frequency <= 3.4MHz
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:23=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Hardware is not limited to 400kHz, its documentation does mention how to
> configure it for high-speed (a specific Speed-Mode enum value and
> a different bus rate clock divider register to be used).
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


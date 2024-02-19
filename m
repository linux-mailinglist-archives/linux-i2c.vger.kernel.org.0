Return-Path: <linux-i2c+bounces-1875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6813885A676
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252CF283A9B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4978F376EB;
	Mon, 19 Feb 2024 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqDohTbf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932641EA80
	for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354409; cv=none; b=JDBgq4I2AoUtY1zdV1HmFfz43zLaxWPV+ZCvq2MxSnEhwEh2x3sDJY/kg0hopIgpzek1WdSFdNO5zLlHr3Op0/ir84/NoD5GEa2CMqnmCMRgiyXVmUImo7CgH1QePOIiuhG6ZWpPmMxxBq9TOmF0zOcZ7OPYRZa2KVLynUebfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354409; c=relaxed/simple;
	bh=zMctZEwS487clYI69wTjBZbHwKLOIJfqLcoi9P7jP1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZ28vgWCJwkHq/Wd+iPkBJ2rnqY7PDUqWBTJou2sb+Q/kiT3s1ZQNEGB94mefsAGv/VEvSocO6/Zb0g8aNV0sMbbAdz5S52bQcLphromF8bETu+sYuiTOhk+rRCDUCxapVvAp7LVtMulRU4TxTGIZ+ZyQQ6z80x2zAilWX3DVFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqDohTbf; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso4441287276.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 06:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354406; x=1708959206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMctZEwS487clYI69wTjBZbHwKLOIJfqLcoi9P7jP1k=;
        b=DqDohTbfO9dq3v2fymtmMv0A7OPJ2Mnc1HXqKmScqdsCV1QikH7VM3HAmsuFcdtZA2
         bTJvPadbXostf5R1og7+VmVurwlfdPFR0ynt51b9nSrdqRPUGAxOlVMAPbQgOMu3DeLG
         NtoSDCu8jjCZkkpf4A4b42qMzP4gIoPAzBKge5G4laxVAo3jO+Y341Yc+OAcr2e1/iUa
         jTAOXC9wNzXdK+ZhYa3ihcwv9aFJwBBJ1aw33sKvOe6k9qyNWliCFfaN158fWqxku7b3
         8RbmXke7NnQsEymwBK+WxeBgo+4qIU4ltDvAsVORbL5u2FJ953mkF05FrckueNRuxoHO
         r75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354406; x=1708959206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMctZEwS487clYI69wTjBZbHwKLOIJfqLcoi9P7jP1k=;
        b=WDPb0iVAH0d20A0yDhMHmC4iwk8eGpkNM8yYqlWhSuPLAjCJTYaMG2Z70uZOMHNqxq
         TYp8xRK4gzd1hegR732kMRWwt8JqnjPIRks0vCwUdJIy/7AGJRsoWADGAT0Tszj4HZpx
         Y5kOOSXiSjZNYFhdBuQRXUxBs0geVPVrNWUxBFhhkU0o1WESQpXeyvoPVgk53ycMnIvI
         DQWG5pPykNaiDOLd7B76wZB5PjTAiPFYir+P3wIosIYIqxv9iuCSO7CA5HcrK7Jq7mbI
         0dgDcgloyaD+0z7LO9FcvyOui4ANpYOysNp0K//B18TTgzPA6RcaG23olJyDLUaZQWb8
         ajfg==
X-Forwarded-Encrypted: i=1; AJvYcCX2/n4JWYM3DI/QOfqBB3qzqjinXcQttv9THf8Dp8e1M54cfyQZtG6x2qaN/1QQDp6mlXcTwQct7dybeukVaLFS0JCqopC2fe1w
X-Gm-Message-State: AOJu0Yw1lgkeCOTNEcLtldRVG3vBYZXTercQP/ryZReQaWqrMvGxbKw1
	bdTG/nIbxpLuGfrpkF50wqC/JvNxYwx0O0RuMvbJLWh8FJ4P+ztj/fXVaUGCwNh+jIAB1X2fbSW
	VmcxBUaki97iXNVyXZDYKrVDZUtszWhqdtM/fQA==
X-Google-Smtp-Source: AGHT+IFjLqSGFbIDvH5cX7ed0opXwPcuJwCD0Xc+ptPIjerX33CSAOO/7gjxJZTJd7jLjzTB0GTLbynGAuFaWNVORRQ=
X-Received: by 2002:a05:6902:2405:b0:dc7:47b7:9053 with SMTP id
 dr5-20020a056902240500b00dc747b79053mr12979596ybb.15.1708354406642; Mon, 19
 Feb 2024 06:53:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-8-19a336e91dca@bootlin.com> <CACRpkdbuTX50syD0CMFcZXBmAHw4nwpcSc-C1OOUQEA9WHqCwA@mail.gmail.com>
 <CZ94S0SE0WFN.1RS0SY3KNMWQQ@bootlin.com>
In-Reply-To: <CZ94S0SE0WFN.1RS0SY3KNMWQQ@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:53:15 +0100
Message-ID: <CACRpkdaVCOB_C45KTEtuoZRwb66x1saGHN3A_ZpY7T=a8YtV+Q@mail.gmail.com>
Subject: Re: [PATCH 08/13] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
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

On Mon, Feb 19, 2024 at 3:38=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Somewhat related to this patch: while writing it, I noticed the total
> timeout of flush_i2c_fifo() is 10 times the timeout. Without this
> series, this means 10*200ms of busywaiting!
>
> If you have an opinion on a more sensible option for this I could add a
> patch to my V2. I don't know enough to pick a sensible value.
>
> I'm unsure if it makes sense that the timeout of flush_i2c_fifo() is a
> multiple of the transfer timeout. Does it make sense that those two
> timeouts are correlated?

I have a *vague* memory of the timeouts for flushing needing to be longer
but I might be mistaken. This is probably a Srinidhi or even Sachin questio=
n...
Sadly I don't have their current mail addresses.

Yours,
Linus Walleij


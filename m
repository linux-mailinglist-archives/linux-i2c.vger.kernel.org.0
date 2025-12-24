Return-Path: <linux-i2c+bounces-14763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCDCDC771
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 15:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49115302AE10
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Dec 2025 14:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4B7352951;
	Wed, 24 Dec 2025 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="OwOktS97"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC7350D52
	for <linux-i2c@vger.kernel.org>; Wed, 24 Dec 2025 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584888; cv=none; b=t3OEBxR2kmT07Udl3T1Z4yEFKMs9mu0hxPWDThbzt7Z6BgDJcGdo2fYz07q6cBzKJUbwUaVGL2VMEaE+d7J4YDYzyj75zriOwYMu67FoIpM+DO79c+x1oP9eTlf2BCd8nWtiGp9pHYQOjHqkWVMqg8vuD8hrVpiArl9c4/oKYzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584888; c=relaxed/simple;
	bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rro0LrI96CtmXjOPEw60MI8aoVTaAVbmUrKMi07l+Wwf1wf0QnxY6Y1d/L15njAYd4qs5+PZ0YAMPaBzupd103Wa+G4aPrVps9nrxvaGgfz504RW7kIo9oXM2bUYAt0OUAzhWqejnLVYq+QPcqFd4SeQy3UKueNWBi2Z6v3Xy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=OwOktS97; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b83122f9d78so68770466b.0
        for <linux-i2c@vger.kernel.org>; Wed, 24 Dec 2025 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766584884; x=1767189684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
        b=OwOktS970iZyjTToJrv3vpFIp+TVfoApn5xuvs/UTEwPPJRn+MEeHzVu/i5cdpLGVT
         c0Qd3a6PUuoevDp7TY7TY2CybeAVSC7N8/jEA5T/5hFTwdqieiluHy54dP4zknESaAGB
         bNizDukwvsJqgYnyjKPfBCH5tc6upXcXTkq41BQxwzaYcJAi6GMbJAHalK3kUHPjUC6H
         RPJtAND8ymrvcy8Nq2bqkNF6MRBftJGGzwdXE15I5yysfQ8A66e79CCa10L9imyAbH/P
         V4ZeStIKcTcR1gknTPgWu9Lclta6kc8pRDXW8YZMteJrXRcw5mrBiaS3bHY8ZvKq8k3r
         7TAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584884; x=1767189684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7+JGBFRKWqyrnVXzLUaDYsKdcEDRxDNeUF16RxUnpo=;
        b=JZ69PeZsI16U8Wc2bgJ08LRWlHQCgbL4WKc6dGealybP38U7CsdU7Y4oqylKrp6ZPB
         +IrAohfgMGWq9z75XKk/6jWMCOEDNfwLsweZmnqoU9QICszeiu1nTQlo0lXE9MRFhXaq
         W5xaSoV6LTZRkrHCiKpJIjvXgoqAGEh09CUi6waAjdStySXk2Ws4LH+JYbUZ505Nl+/x
         rdj38Uoyl2A8jLGcISt6w0L0DY9/6KM1lmmDHi81AjxPn1g3w4o6hg5Syx6ruslpoGqK
         Q3GYJPnkv/P/hNEa5idCb7BD2bi6bu9WCBIaizRQHowTRZb15W8y05gur+PIOAbi86O7
         60vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpIs90jU95QxP3QL6r9uknbwGhk78DnF6H4TPk+IWrsG28flyjSIQ9h/4YvQSPucOKQLf3m3Zg1VY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5GSh9tZah8FIK6GzUFQ2m0T8OtfvliUMgbgXgziuqRCJiHAse
	05ggwN+ut7ZRWkZclbmzWxECbfotnoaVgXR7fniq7lMt3YT7LIn01FnNRGHxVXZSp56g/JWBg6z
	bjflaaV5JWFk81Tllz/NG2xAtyr1PHYnfF1ExaWTPXw==
X-Gm-Gg: AY/fxX7h70PvChLJ1rcrHhOXfkVmnpb1SpVB7pCkvoQXekMoi5B6DL/K0TDfuYgenNu
	FWbyR0RrrZJyCBMlu9U53Z0A03P0rmLxlE80PhMoPpFEFilnHzy3nGxgbPKRzBVXpZGPOajWro8
	P6cEGYpknYq0pLuMGjjOj8ejIT5x8M757WACye9ZtHenGLBn2cd1DpMdnDT2HURA/poUlPqnvv5
	q8zupvVwfdVFUiH4awbZuALvqIzTy5KlEHwiUjqgl4xv4vmSZ2DkfygJ13+WpRCZqyQs9OLQBz8
	Mkjj/ZjNeVKVtKE6wfDJ8TCd8uYkPUKqykDEA/S3LwCQMXVtxg==
X-Google-Smtp-Source: AGHT+IHCXMeYFxQVcU8rJRtC/cDnDm53nQPvIw0Xbx77plqQqDjE4I50qoqJy3GeuDjgR14U8tTAxFKyl0h6HDv3chw=
X-Received: by 2002:a17:907:6e91:b0:b73:8639:334a with SMTP id
 a640c23a62f3a-b8036ebd999mr1821689366b.13.1766584883876; Wed, 24 Dec 2025
 06:01:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr> <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com> <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
In-Reply-To: <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 24 Dec 2025 15:01:13 +0100
X-Gm-Features: AQt7F2owdEGYn8vQgdJCyQRcW10NeJzDUOJWapd16DEqGEP6zPqPRLNSqy5Q0Bc
Message-ID: <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/12/2025 11:30, Robert Marko wrote:
> > On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> >>> Add the required LAN969x clock bindings.
> >>
> >> I do not see clock bindings actually here. Where is the actual binding=
?
> >> Commit msg does not help me at all to understand why you are doing thi=
s
> >> without actual required bindings.
> >
> > I guess it is a bit confusing, there is no schema here, these are the
> > clock indexes that
> > reside in dt-bindings and are used by the SoC DTSI.
>
> I understand as not used by drivers? Then no ABI and there is no point
> in putting them into bindings.

It is not included by the driver directly, but it requires these exact
indexes to be passed
so its effectively ABI.
LAN966x does the same, but they differ in number of clocks and their indexe=
s.

Regards,
Robert

>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


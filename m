Return-Path: <linux-i2c+bounces-13564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEBBE1D88
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 09:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C6AD4F2D7F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 07:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1988523ABA0;
	Thu, 16 Oct 2025 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ1U0q+3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3DE573
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760598070; cv=none; b=D/voVCXvKrOq3ieDAeVKxRedKsaR8CHlV6vzXPTevqhqSIoLMdJXDOZe6aEjNFDfT9Mbk1cIhHe3/ibxuC62YVspCiNDsys1i3D0LW/Whv2NIz7xBlmq2gXRkX1ieaZKrmCPWt2G+v5cKp0MJRgHu3uaZ5sZ8wRjcr6B9d/NQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760598070; c=relaxed/simple;
	bh=vDcdkcO33abxC4TnKZFWyjF8Ipj6BQMFJF2qYzz1w7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYmoiKG5YQ2I28VVsiHqWM8KzcV6wooBz9KL01/KgBLm5exQeiDKiUH3Z1a0NVMSDcxbCoF5fYzMswt70Nm9/h3p20nPHbwQl1neaIGI7505q6oxs4MGOqsqUBLujuBdCcWzhIiFQF0RKuRosnzZeD6zcL8Vohsoy2v5Wwl6zR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ1U0q+3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso374238f8f.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760598067; x=1761202867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CgQpFz1+9Zq2VExIEJHCudhv9BcyFA2koCTdblK9hs=;
        b=QZ1U0q+3sg/IOfWRc6MBPPhtNfbeE0kIp42W81bqkQtXXRnPD06DE1Mr6CdZQk26nG
         4slPgMtLvkqPLg134UIDPQYwZ52Sq4pPaxFNXfBEZoez4VBFGItF1ZIIYrhbe4nuCVau
         sZ5jGpe4pL6QIioMkNSe9jgOYJlADs7ImXmeu6w9Tqzh7qRnBZs2+KbEZOP5YqucSxRp
         VnX67rq4bzB0vcXMKWiZ3oWwm6jXk01nRkQciauCUxAfksN+MGNmAeFdmj/eSpQQl4Dy
         lk1B16wMaSFIP9HZXSAumwZ4hBQt5XACxK/4FhMR1eRYr3hihpI/vucTSoGY4ZfQgZS4
         C1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760598068; x=1761202868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CgQpFz1+9Zq2VExIEJHCudhv9BcyFA2koCTdblK9hs=;
        b=NrA4tuO5KSwZp7mibs3rwItPIgWlfVAF4UoYtsPS6CSXfRoopDclWWWp4Hg9i8NRMg
         n7/eRDgRT2F2kjWwnYHbeH51bLKMM06kkh4BuaCkdlSQkrX00aEy3UwETDc7uCUS+Mj9
         BImUsf+wzVy9zAK/4g+7YuIn8MQh4zpVxqVo7Ufig0ofJ+qfSMCGwUyVpQZ4aD0Ea+KT
         pvYL5YsMnRXpbGK7wY6rtWXXMY/S9Wpn4ccUob2Nff1zjVMX2j2ZHRM4KybSUvplipxE
         ks76Q7JPLwDEGtAlP7lwPRbhJlxCqwXcEQTCZFmtTxl2lEwId82uiuRZ/pP6qj7STZZa
         YZwA==
X-Forwarded-Encrypted: i=1; AJvYcCV1KgwRAxGeFG74d/B0j4PkEp2m7Vlr5PnXsMaAu5Qa7cfon92jWdEiAJOrpk80HSuofR5PQvLY0dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIJSo0Jpn/QV6nEMiO1KjS86kX0wlUo/WuG2U6dqvJSQaijOIk
	9zguEGRluB3IPsk76fCC7klpS+7W7bF+febUUsOW+xWl1R6WJXHVmA4ZQdSHnbi04R9YQioUw0Q
	WHiLDA0wbNGqbI5t7M9Sv94lw9XIFKNc=
X-Gm-Gg: ASbGncuWHhroVluNv4/4q8jYz5mRSmF2c+V6GknHYbXAaoUhtHvMEPn3FQVfH2syTiZ
	OTrjJneitGW5KgOAgyPQW6B/bILYoZKgyrvFrZanTGzxYWibRj3QO4Ipw9iO8MJ6Pbdjojkk3kd
	gdp5CxQC0YxK25uYnv02AbqokzmiC+LaYDpK8T72L6mnc+9skFufOFxNr5AZz2rUncUWF3gSl3B
	m8TXPFsALnlwIdGi1XXR0aDRXGlYUSweRSUJGZpG3nFK54hVzaewwHbiVz4eTHEPTfS15FkWusp
	op22IW8=
X-Google-Smtp-Source: AGHT+IE/QoaGfvrFFNkg/zp/kyT7JmowtxdagZlFC9qI35u9ouLTiaZf602K70Y3uTAToSg/Y9suDA7MeHQGM3SNeTI=
X-Received: by 2002:a05:6000:603:b0:407:77f9:949e with SMTP id
 ffacd0b85a97d-42666ac7026mr19754082f8f.21.1760598067327; Thu, 16 Oct 2025
 00:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013060018.43851-1-clamor95@gmail.com> <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
In-Reply-To: <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 16 Oct 2025 10:00:56 +0300
X-Gm-Features: AS18NWBNnSxArNN_YGflj1sewGtpazTYDp07r6whpHpGwvXLBORgvLxkZeeTdZc
Message-ID: <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 01:5=
0 Andi Shyti <andi.shyti@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On Mon, Oct 13, 2025 at 09:00:15AM +0300, Svyatoslav Ryhel wrote:
> > Implement driver for hot-plugged I2C busses, where some devices on
> > a bus are hot-pluggable and their presence is indicated by GPIO line.
> > This feature is used by the ASUS Transformers family, by the  Microsoft
> > Surface RT/2 and maybe more.
> >
> > ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
> > that line through optional dock accessory. Devices in the dock are
> > connected to this i2c line and docks presence is detected by a dedicted
> > GPIO.
>
> This is a resend of the previous series.

Yes

> I want to understand
> whether this effort can align with what Herve and Luca are
> working on. I have not looked into the implementation details
> yet, but I want to avoid overlapping or conflicting patches.

Herve and Luca did not come up with anything meaningful, they provided
just a few rough ideas. It will take an inconsiderate amount of time
before there will be any consensus between them and schema
maintainers, and even more time would be requited to settle this into
schemas and implement into drivers. Why should I suffer from this? Why
should changes I need be halted due to some incomplete 'ideas'? This
driver uses existing i2c mux framework and fits into it just fine.

> Thanks,
> Andi


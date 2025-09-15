Return-Path: <linux-i2c+bounces-12954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDFB57979
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 13:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC62482305
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 11:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896DF304969;
	Mon, 15 Sep 2025 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg5psPh4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CEF30147F
	for <linux-i2c@vger.kernel.org>; Mon, 15 Sep 2025 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937219; cv=none; b=WAP37+p0Qa6n6DBNa6dgj/ar5+H8xpYWOXNev/qW3920jjMVw6ykwnLTSlYmJo5nE2J4ZZTQnxKmKKb2uFTBaQDaAfEX3NuNr6t25Fq0ZoZ9asCV3BxBVqaKOD/9BhcQ1ITT2qRCremM+vlj8/Vz0M6beqkdyJzg5jt0Zad/kdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937219; c=relaxed/simple;
	bh=0ILSGIiItmyMCE7xHI853y8dy3amB33rFGrcT6q6w44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ip/e8vsfx4TNJklrZKkTyRdixisUPwQMrypkxjimSR+AVcrymyf1EkXORnvVmSQepX9kHQspPepflu2upe7QFlqDAqgo/aVcPMq09wLNsphkD8bEunrK5djhzsQCsINOqx2jCe/YaXZUbEjTKaksX9BaZrmu1OPbYi4BPD+LsFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg5psPh4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ea7af25f42so687086f8f.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Sep 2025 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757937216; x=1758542016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9rsfkbv0EL7aToRl/37b12mldmjeHZasuzSc06g/5c=;
        b=Yg5psPh4WYZ92pfMU1Q8RGDtkgtbVzBijRhhArXWxcjCQh7G2fsyAIeW+QpA1vE1Io
         nCv/WF4UgrliahfuxHIJLVjISmUpoAJYkxt0siwxT0iq6BmS7ZU+MgulJvzepOA5yXuv
         yzUMbfAXMl4dbqDCITwYp920tI8Lj1lAoIuUGNAJacC2seqrYv8qHW2ANiApNh77wJNc
         VI37DsVmgptMc5/oXJTjIhioAO1KxAg+69q9c2L1Qr6UKEFLaUogMB+C9lTQYejLLnsF
         8EwaHXq7nuy5DlVrNXOuqgAzrPoJmNRg0IV5lY7l0IWhqOKrxywuJrRNuc5G6SQUUT0f
         mJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937216; x=1758542016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9rsfkbv0EL7aToRl/37b12mldmjeHZasuzSc06g/5c=;
        b=WLbsZnkAaw6Gq9ts++PEnuaBdvFN2pTTwlz/HLRsXG4pHRmZWQhzGMK06Ru+oupVsA
         Kb/I6Ut5yu0+y+yejn7DSVNwvfVsKLbH841lqa5+cYW6RFfcKtrvE82VDokkJrcETfNl
         iOs8ECeqU8JmRoDbOEQveDOLB4Nz91uMw0T4KJ0R7qi5FW8Iujr7dSYXVTxQPEiWky7u
         MA3h0faFvYEWDHkSnCaJLkiqhMtST4h0GQSsHSDv0mA2yVLshq7AMFQRAXI9aLAOg0N1
         W1QHxLxmPSjFSelI2YYv+ght9Ou6kaQjzHFWUsjW5naDN6mcPTJCo0jCt/YKNrMXpKuu
         5vvg==
X-Forwarded-Encrypted: i=1; AJvYcCWX5m6ZKbQaYngTgYhAdsTREUOEu4HmE/k9JLnifF+DpHZA0DqtI7SeKZW5JCoOVdIBXGmxpDL6VBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAR1VjD0gJn1UzGTdjdzNQ5yWhKXPl9nyqANKvg1Btk0xAo4CT
	tKf+i/EDfbIJJryoDfYK5flv2SsBNlwltmHkLX9gyXbPmTTSxefL/CCrxPtxl0wBLuKsMnt/uUM
	GDWMIO9I5TNAj2UvjxwUPDCbqrEI20gs=
X-Gm-Gg: ASbGnctZ2mDjcUPrxFylyJrZbtzFCoAnrDxcNMfvvWUsYGYhYw9LikcBQTm6aLRZQ44
	OG/mxxY9JQcoIOC6THjwmN377L9AMLEJqbvxmDVPS+flJW5JZA0K+lUb+/jhTagOdgyJBquNAWv
	kRqkscol31mkemeubZM8cwaMNeCYiYoxTFTu+idKbIUDUQ+reWZ8N/eA217UEu8czSuYG2CnFa3
	Tqs9Lx2AzrFssaCcQg=
X-Google-Smtp-Source: AGHT+IGfEQTtfZM/ItJCozrT631R5nXA0YD+rGtclPjyGWg2BWC+ZOF/elBODu9mAt1IorwWM6bWM2cMtMtquc7HPHI=
X-Received: by 2002:a05:6000:1884:b0:3ea:558d:8e33 with SMTP id
 ffacd0b85a97d-3ea558d92femr3441083f8f.11.1757937215754; Mon, 15 Sep 2025
 04:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915060141.12540-1-clamor95@gmail.com> <aMf6DLr8pTCP8tKn@shikoro>
In-Reply-To: <aMf6DLr8pTCP8tKn@shikoro>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Sep 2025 14:53:23 +0300
X-Gm-Features: AS18NWBLkeKaqjltS4302C4IX18eul5NJVuVOImh89VIisTr8ceAaA7N6g0u10Y
Message-ID: <CAPVz0n3m9VOV5unVHhU67XQnk4jckA+zyJdCHXu2fFxCSht4JQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] i2c: muxes: Add GPIO-detected hotplug I2C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca@lucaceresoli.net>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 15 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:35 Wolf=
ram Sang
<wsa+renesas@sang-engineering.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Sep 15, 2025 at 09:01:36AM +0300, Svyatoslav Ryhel wrote:
> > Implement driver for hot-plugged I2C busses, where some devices on
> > a bus are hot-pluggable and their presence is indicated by GPIO line.
> > This feature is used by the ASUS Transformers family, by the  Microsoft
> > Surface RT/2 and maybe more.
> >
> > ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
> > that line through optional dock accessory. Devices in the dock are
> > connected to this i2c line and docks presence is detected by a dedicted
> > GPIO.
> >
> > Micha=C5=82 Miros=C5=82aw (1):
> >   i2c: muxes: Add GPIO-detected hotplug I2C
> >
> > Svyatoslav Ryhel (1):
> >   dt-bindings: i2c: Document GPIO detected hot-plugged I2C bus
> >
> >  .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
> >  drivers/i2c/muxes/Kconfig                     |  11 +
> >  drivers/i2c/muxes/Makefile                    |   1 +
> >  drivers/i2c/muxes/i2c-hotplug-gpio.c          | 263 ++++++++++++++++++
> >  4 files changed, 340 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-g=
pio.yaml
> >  create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c
>
> Adding Herve and Luca to CC because they want to achieve the same with
> their I2C bus extensions, no?
>

I have no idea what you are talking about, this an original series I
have sent 2 years ago but now I decided that would be nice to have it
in mainline Linux.  Here is a link to patchset from 19th Jun 2023
https://lkml.org/lkml/2023/6/19/781


Return-Path: <linux-i2c+bounces-14230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BECC7CF6F
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 13:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F1CE357DC3
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 12:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A8F261B6D;
	Sat, 22 Nov 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2spe3LZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AB22FE0E
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763813800; cv=none; b=BIsKuc53wEhs03ckphn2jNYSpQZZYpmPTfmAbyayBG1N2usb59OqLYDyHkITq/DV4qxpYO7LZw2HeQ8u1WI7lSdtFxb2otBgaYOdEknvAr5QxezIInclT+UzstBWtfa8dHo0Nld4wKFhIDaoFlukc3o/DvzCZowX/uP6F4ICiYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763813800; c=relaxed/simple;
	bh=wz1THz7SNKKsv1P6q3WS/mzyxspZycff65DaoObWopg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hq9uLw1FEHF4Ulv8p8s1u130Oj/mDfoMhwefurbhrMkZ9eeyow1ZBqTZTNnbJopAImvyLoWEGHEWgP/q29tkch8tpTUCTm/PSYeGJov0oA7l8jxDs0KSBJez91GuKgEqS182tSV1BQ4oEZSCfrbtHKJUdoNMk9nHM5hL5TJ+6b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2spe3LZ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso4819924a12.0
        for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763813796; x=1764418596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wz1THz7SNKKsv1P6q3WS/mzyxspZycff65DaoObWopg=;
        b=Z2spe3LZTdx4aB3kvvpXCQEM3YXux+FhIKUSe402znOjR/ecR8mVv2TVzpz7hOFV4b
         7TpNoLWFgIwb/8QK7wS9fdZtAg2DVbIMWn0zGmF25ts77e2q8OP/ioarYsE7WdNeu8X8
         k1mlGcYmPY1oxguMMIRZUsy1AVnZvqWN77PQmQVxEHsCYveCyUGPyJ7FgMDMUoHmJ3M1
         z9yOBorUmCuf5WvZNHVKvT8BLbHCkyUBogn54bZZLxPgytAe4mQbHQ2cF0pxjvk6MLji
         8vVC0zxO+hI3f/nWpDRZdODrM25c+UCc3e7w7dOuifhf1ds0rNO14NQqkoVZeie1t7n7
         nzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763813796; x=1764418596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wz1THz7SNKKsv1P6q3WS/mzyxspZycff65DaoObWopg=;
        b=DthMileAi9/d207pV01LoonWVgCD1FfiKn0izGPsLbnwYMY8wKaq7gkA8g9EtLtF7c
         etvDaqg8eBk97H+K3uB/VVENpcetFCVTAErwXmibxHMYPZZTunNvTkJy+CvzH4gA3zBG
         wJi0MYZdPGX+ZA7H/gsYucsAfs7pd0dEVAcQKFjJOTLyE85IXzLU/nXC1Yt0YOE4kk+l
         gtxzPTkY3ccNn8LSV3QQTIjFPfjooMMF3ZFvXQt2pCu3xmODQPtPqp/PCU/ZrUIoWbES
         DUn9XLdLoKTEbJkTi2wixg+5HO45dHexdBf3u87Q2yxc7W51Rq9hnNtcXS/mEbRk6TK3
         13kA==
X-Forwarded-Encrypted: i=1; AJvYcCUvQs0vvQP54tGbpkWswWDx6cXYSelgSJ+UbCFJlm3mOWheVidQjW90Jmk7RANdwNNRbirYQPjsl+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEAE8vQq38+iW5ECYyvzvZEk0dvuofonxinyRz05d/saHyiJQB
	MB2MX9HnCbRTk/Ge1Qkv+NR32ASsKw5uBSvcmYP4wJui9Rko5q4jT8C+00rLvYQy1RkpY7a65in
	e+iyW05BPDj92N0orzFi44kBrTaRZWrmYKg==
X-Gm-Gg: ASbGnctGB8/NAUU0kMBmIdXlGkMdMxEQp9KPet/q7BN/RoCXGQz1+w2IrK7VgMoL+3Q
	AluMnARMYJqkjeNupuXOorTN+prWEt8DrEM9Rfma21+70djCWKDqunx/5u/jA4JFy01K7MXZI36
	JQE4LvU23TXbWbUVIGX+hYwSKV/u6WcMnNE5R8C4acQyizzf4WnxcohYmTutu75RwnFCGrNDzPJ
	Z00SEzhxkl75Spw9EMZn9/AYahAm8mkCHFhuNoNXPGvSm93ITBKymYyrOfz1XYBZGCimWsH
X-Google-Smtp-Source: AGHT+IHcofEdyyqsTFU/BhYmhbLCp9Qs09wimb0NOaVEO23dJWfuEpUWUtZecn2NZFUejwjknhCk8CijQlLuOTEiD04=
X-Received: by 2002:aa7:d387:0:b0:641:1cbe:a5bf with SMTP id
 4fb4d7f45d1cf-64539690464mr5914765a12.9.1763813796062; Sat, 22 Nov 2025
 04:16:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+=Fv5T4PqVOFHnad_aLoMcYRZpg4Oenrmn0XYvb=Gjt1+5L7g@mail.gmail.com>
 <aR-U3kr-IyXlgYdV@shikoro> <CA+=Fv5QbDy_2G3KiXF=asX2+61BWMWE70tz3nr9XE8_KhwRNmg@mail.gmail.com>
 <aR-dktlDxOem6mOX@shikoro> <CA+=Fv5TN6JQJY2gOmjxPA8VPZto1+dxqtfYvDTL-dEnoNnVDpQ@mail.gmail.com>
 <aSATsgYaWt_-g1s9@shikoro>
In-Reply-To: <aSATsgYaWt_-g1s9@shikoro>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 22 Nov 2025 13:16:24 +0100
X-Gm-Features: AWmQ_bkABLVNgLXN7hvkuDCr8oXn1HqIFmjow-JjTlCP7h1Bf2LwWTzDcata_8E
Message-ID: <CA+=Fv5SWbRVZ1cMOOsgWAX4EHfXFNTLBoqKjZ=ZaW_-vzcsXzQ@mail.gmail.com>
Subject: Re: lm75 on i2c-elektor.c
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks! I've been running the driver on SMP kernel for a few days now
sending i2c data from all sensors to influx/grafana and everything seems
stable. I'll send out a patch later for review. I believe we can just
allow this driver to be built on SMP kernels.

Magnus

On Fri, Nov 21, 2025 at 8:24=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > they are not in torvalds linux git repo? I could only find history
> > there dating back to 2005.
>
> history.git is a dedicated tree, built after the facts ;)
>
> https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/
>
> Fun to browse for such questions...
>


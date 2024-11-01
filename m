Return-Path: <linux-i2c+bounces-7720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE69B9339
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 15:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83B821F2327E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 14:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B4D1AA7A4;
	Fri,  1 Nov 2024 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw9uAyNf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AC60DCF;
	Fri,  1 Nov 2024 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471423; cv=none; b=JJv5khvRyoKIO1JU8K3vtDM14Dk+SplyHTBJ+sTSXBFm+u3RA1Z7EVN9PtkEu5oN6at2zA72jmtpEk0HMFYl5mljFuA6KedmOgbBJrGf6mv4HNEguKpqqh5ACze3Rg5yhmAoFynu3LwBSh/p3VfkDnJ/XU83H2+HvSrqq1M/lbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471423; c=relaxed/simple;
	bh=GELZeM7SL+vX4J10M+PYFvjC1VtfZpBaaZsWDEcTe1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BihAFZUwNnAj/2XlxZQT2G/8jl/HLD9jHZ1vInrS6Z9NcHB7z45ZoUdm3r9PLk9RhnR+1At44FC3jtXo6BiUz2wSlv0KzmpXVoR+PzfGdgqVXcgC/7ZC9xVL2RDzl2WdpYcBeEozzZFF1ZdYq2hQLPXRb0n3EHwuN0F0FisyCNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw9uAyNf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so1526579a91.1;
        Fri, 01 Nov 2024 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471421; x=1731076221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GELZeM7SL+vX4J10M+PYFvjC1VtfZpBaaZsWDEcTe1o=;
        b=jw9uAyNfBZ2rj29cAQUnj9vn4Kl/6VKxeoej0ohChZIWLACoFKgOrrFjnkkTtLtjXP
         t45ByGYR4yEsF0GUp+MSaaPOtuyMu20349ldxhbcRzHbe5S54rxJW/h0fCz/FgHgcC1a
         LUqdodc4HXi8T12SDmG9KFjgHjTPInr0anjFmhHOBSYPp8AyE8blXsgkkS0SJZ0/br0t
         rc1Gxpp8F9zrozL+Lna7FLAdJlVi6yLzsM/iss3wyilO28pPnBAtJHSem09/fS85GKQk
         2nWMDB+IZkWR0j2WIcrwMV+IF4E8LwwoD4KO8jHWKBK5TKQU0tVmRaGhEyyf013bdx9w
         rJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471421; x=1731076221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GELZeM7SL+vX4J10M+PYFvjC1VtfZpBaaZsWDEcTe1o=;
        b=J6R2W6JAJl2QCLywzSstfhx5ddEPA4HzVhiMXm8SUzW5Hc0h6dKm2er7HGGv09LSH+
         0RgAmTESUise5DWWan3Lfk326gZstvqxver577+oE0sJEJHxwxeysY2DxxGuEHkfokfE
         6B0MDMTEOh05ONdZyuLAzqodbcewnS/VpX4aLU+l0rlctPLEeDqtLTlII97uCs05Eypp
         Cbp3Y8arpOpRVTnRFqC89BcpprfkFL1hcK3mWBXYv6z2r8s/MYvWCo4QOZTzrb7nBm1+
         mi66Rn7fWEoooS4mGyPLH1Umx/+ty5owFNyE0wqzuq/683ivxRCQvEQDNq6RRX1472ZO
         uPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCULtoc0nqB05G7tRj9fBtUqZtr9igcwpsVnEgb3RMvo6ppRDcckPAzHqKmBqBdBrgTNxUaEBYpIVdc5@vger.kernel.org, AJvYcCWMWJDXzn4R3pem4JB4Ks5dDYrr1/tJXkeMlNPWToL/KFoO3I1wWowvQ7vW8OXNl/bolStIj2v4yPq+@vger.kernel.org, AJvYcCXbfgVw3uFfUBy5A32bRzFAVnOcTkC7hKw3Cqms69LYggxzIF4BSSwzsHRr2vgsqCkzsRCAF6mqfRPF25nZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzwJnMDl8kB94Acto0Y8d92ipCSWGCYwx4BOcaOABONAW8tfwTI
	q+9jQ1ipi6JjlSkCXEExhNuqf5RJKQUQbslkxEKHi4q13qH70FSciabj0FnWjByAKNrAb8p6LQt
	/H8gj5mlRvo341ID/sw8GtnOejEY=
X-Google-Smtp-Source: AGHT+IGdeX3stWgFTyf6spjEjN99PHriOnBxS+A509LgHsURAUxqmYxlKZ3iqTfB/zTj/U4sDz+/1hbT7XtnP492ocs=
X-Received: by 2002:a17:90b:4d06:b0:2e2:a2f0:e199 with SMTP id
 98e67ed59e1d1-2e94c29ec6fmr4741654a91.8.1730471421289; Fri, 01 Nov 2024
 07:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com> <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com> <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
In-Reply-To: <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 1 Nov 2024 10:29:44 -0400
Message-ID: <CAJFTR8T60Azb3refwAB9LALJthKxQz8E1ixZyEA0K=hXfNcUyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 10:24=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
> > On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
> > > On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
> > >> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> > >> and supports FIFO transmission.
> > >>
> > >> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> > >> ---

Change in v2:
- drop fifo-disable property
- unevaluatedProperties goes after required: block
- drop alias

> > >
> > > Where is the changelog? Nothing here, nothing in cover letter.
It seems like it was accidentally dropped seeing there are the dashes.

> > >
> > > I asked for several changes, so now I don't know if you implemented
> > > them.
> >
> > I deleted the FIFO property because I believe your suggestion is correc=
t.
> > this should be decided by the driver, even though the FIFO is provided
> > by the hardware.
> >
> > Apologies for missing the changelog. To correct this, should I send a v=
3
> > version with the changelog or resend v2?
>
> Reply now with changelog. Your binding has some other unrelated and
> incorrect changes, which I do not understand.

...

Thanks,
Jesse Taube

>
> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


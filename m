Return-Path: <linux-i2c+bounces-6759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775F9799D5
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 03:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0441C2218E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 01:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AFFDF53;
	Mon, 16 Sep 2024 01:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm5AXC4m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A039DDA0;
	Mon, 16 Sep 2024 01:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726451111; cv=none; b=cggUMP2RdTFo1F53QtqpqV2wAk97kAgtFO18AarOc6iCYxVwty3jZZBg5N0alU0VOvnh6ZHFf9P3l9S3UUbxjPfZTXUETbxrHPv4ebELY3N/T4zNKL7dv72eqURK1cCgURBtsN7VvD6oeUQ1CN83RG4wjAD6i4EwU1lOW8aAA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726451111; c=relaxed/simple;
	bh=DLFByVSGhi5JpxF5PSv4cW7rm3P6K8uvXwbirS5wglg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJfVRpv91C5xKBm0ggb4Z3Kl8+S8CoMFnjSiOw2Mf076MKAVKnz3lHmgr0Def5n1NHzYv5zlJXgo1EaQwFdsh314HLJ8Vw6WYIKbUtQTA/64bArP+85yPLUHho6U4JGju2JlwruI3wznhCRjdzuciOTl4ZX2dtXMQC4e7Xbuiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bm5AXC4m; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso648420966b.3;
        Sun, 15 Sep 2024 18:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726451108; x=1727055908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLFByVSGhi5JpxF5PSv4cW7rm3P6K8uvXwbirS5wglg=;
        b=bm5AXC4m6ulaiDuupvnJgDluy3wWJ9hSZjC8uFbVLTwTGt/lCaRgykl72U8mrdQywL
         hj1XTRUnMWhwziCbCzcmRfx1hBHKn3zNFp4o0JbFF1xfMyHVaPtHL2/XM+txKDhSjfOI
         Rt22J5D4U7ckYhi8tg8KUICeGGVgyovquR1PWDoP4BhL+XWTZBpU5yY1zZ4Ysvn8V2Nm
         C5Wb0OfjPovNjvEAYGPCQq1m1f+FTzSTCUk7Shnl/23MjASEEvoPoLs/22UYMGVyyARG
         V9P/FCg5u83F+qytb1Wr5gDtNhj4KkQRVWfqRzpWSQXuWA1Q188Jd5XwreE2+QJqVgcM
         xXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726451108; x=1727055908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLFByVSGhi5JpxF5PSv4cW7rm3P6K8uvXwbirS5wglg=;
        b=pbvYXeJkJPGkvs67JBrqCL0oF2DIqfggsh9+oYfgX+0BxlQXs9poG8Yz5frPzWX6c0
         OEKun4y2SAkO14GQrUujJsEgtq7cl3NgPSNfxubwZp0kEATAAC+DfVcq+VL64i0jYndr
         YrHKR3sEamsdys2TLZMR/7zqYh0avhiJnCTD5HyFBpUjQ9wHx+pnZTOAhyN6/4EX9vQ2
         0sHIT6mbZcthrYSIxvJhDf3V73JpcusR3mGIgBmsd+qOJKzG+mamQ60jZigMRG3U0a/J
         Fqf+GsAlXBxiB1TPIxHT7e1Kru8P2y7QN1KLJe3GFU9sR+v5fEDmWYzIwWSk7jSVvS0A
         jMEw==
X-Forwarded-Encrypted: i=1; AJvYcCUqacpzKhPTp9meJAMEASBzil/wF4DbDR38RNmq0xu5xvLI3AJ1PTnsh9djiOKwQ5pjxB2SHQTtjhnkhEut@vger.kernel.org, AJvYcCVGptS/s7IAKkeKjzkfXO+SXogqCW133V0ws1/mRwpiRe1oc9wZ+wTIciOvpH00fppKb8YLdjPB17Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7zDtKQhp/Ve3g2n/rkiIGlJPwwe+U7icIRSsLxUw2sDPbz859
	8obtzdQ+JKOZue05OPEpdH0j8L3XiYKZQawM/493N7rs0hHkc1cv3JWviBVysmK0IdLTEji6Db7
	TuU3J6XSyYL1S3wzDIAR7bZv+4w==
X-Google-Smtp-Source: AGHT+IE3qNg2omwd3AkZnRWnAj0ifHnzbx2Ocr/ShLMIongfZtKXv9BV0AkBgTcdKgk8wy2erUN/u7BMFQ5vYPOt7lY=
X-Received: by 2002:a17:907:f75a:b0:a7a:a0c2:8be9 with SMTP id
 a640c23a62f3a-a9029432e30mr1434118166b.18.1726451107608; Sun, 15 Sep 2024
 18:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913101532.16571-1-kfting@nuvoton.com> <ZuQT8YfVetrkMotQ@smile.fi.intel.com>
In-Reply-To: <ZuQT8YfVetrkMotQ@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:44:56 +0800
Message-ID: <CACD3sJZDDaAiS4Vpy1keVp2pUS5g_1A-tx_tu1wcb+PxUsOCJQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] i2c: npcm: Enable slave in eob interrupt
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:29=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:15:32PM +0800, Tyrone Ting wrote:
> > From: Charles Boyer <Charles.Boyer@fii-usa.com>
> >
> > Nuvoton slave enable was in user space API call master_xfer, so it is
> > subject to delays from the OS scheduler. If the BMC is not enabled for
> > slave mode in time for master to send response, then it will NAK the
> > address match. Then the PLDM request timeout occurs.
> >
> > If the slave enable is moved to the EOB interrupt service routine, then
> > the BMC can be ready in slave mode by the time it needs to receive a
> > response.
>
> Fixes tag?
>
The patch is to reduce the time for the i2c module to behave as a target.
IOW, the i2c module target function will be ready earlier than it was.
So I remove the Fixes tag.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone


Return-Path: <linux-i2c+bounces-14800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F9CE0336
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 00:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5D4E301B49D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 23:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B11E26F46F;
	Sat, 27 Dec 2025 23:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NIT4p4/g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E3F3C2F
	for <linux-i2c@vger.kernel.org>; Sat, 27 Dec 2025 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766879646; cv=none; b=HOIaxYaFOjEOl6wbqeVA5sYUu7+p9A22eYYQvjUXE/91ORmuFhQvsexUZUy5LqEkJ75jCkDxZIEzWmwb8CMb8rvum0lC4YDHMs+qi4gCkKZbHZJdm5979gxntaE64WOSz1wrTxX2nBS8aBLGOyeK1yXanzGqQWjs+PZJ3qOJbQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766879646; c=relaxed/simple;
	bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+jdI3hGNLQxhTcOhqYqrSCUoKSDcPsJZ7qkeWvM+qNn4Mt0hzec/cfQV3nhSmZ2ROWmtaNOYVpB5e9SjMYaXCcF42+uubQNw1X5Xmzfw4/C5qiyx8Z8Z7BPC+Pt9DmSnjwZkdzm1dDSMJdnEckNxkdYNt5p9spPMPryo47Ad9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NIT4p4/g; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79018a412edso11754727b3.0
        for <linux-i2c@vger.kernel.org>; Sat, 27 Dec 2025 15:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766879643; x=1767484443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
        b=NIT4p4/gN1A5tGKXPF8yYygovNP7H4NVPg+0lk44yT3JGX9hTF+skNu2tt4v9UMeXW
         c9RKzgXnPH26w9PTMujaLi6aGu66WUnxA5jhMOj6M4tOr5Tu4ixOIUF4E3KoR8u1PFI2
         Ck307CgBFPcHof8jYulljBMK4tk0i9/dfMcu+O3OiMtyKO7m8xYr59eh7f2PJhSdHOWY
         S5eYAQdBZcANob+1P1lp7Bk8wl8kPTh6/22NIedE9oAQLNtt9j6Omz7vs3Vv4m1ko/8f
         XKYXaBK/xU67oHfC4EgcWy2Uqopvs0uHFtftSdn8sRf9QUpJLKpv/ebHFJhi3iix98Yk
         +hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766879643; x=1767484443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
        b=dOCuKNnaXFRuuGwtMaVz3sGovgyGHYPRn0gGUzeNJ6h1LhYrFsdHKVmPMqZ+m2Xf17
         jYczNfvDoBNMKs1mAyZlAM6qoo1+kwdZrjMAictKXa/MgpJNHYTurROWe6N/2REe/iD3
         PoWbkYLKoXIi0rATwB+kS7qI3WjDbTqsfUMkqet3m55LVRH+SQrYudDFi4EvEkb5rx1H
         F13BhmDLIinV4UphajD68Nav4MkyHU7iRQPUgTZ3Ym+5kce8rCdlMV3FJ+xdBSwdl1cG
         twZRnnHj3/CfH0pPs+V0zJgMoAjiXVggkpGcp+Ht9MbCppWyBBgBQKkTqVUJ7S4hgagI
         W6qw==
X-Forwarded-Encrypted: i=1; AJvYcCVMohh1Al+b0x02mPSCq+qU6ewI8xtpp+PkavEA2jVz6kPa28BNXHAsSUNXXNGmbWfafYOnQRFIuDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpeha0iuaSil7g37YIAQIx6nkkXkbpKx+QoJBhecMFQboZrcir
	cN4D91082vb3/g+7RJ3ipO1do1K8OxNCTywkl46m0xBUNcguRpOvQS/pYVuDvzOhVLq/s3SPKt+
	q9l9UimKzmOqe5RQOEYvfd/RSb1AcSsrxFO/1xlveiUnSVcdPY+v94GnZDQ==
X-Gm-Gg: AY/fxX5klS7ABXVHd03RDcjgX/xB71B6JN+UMwt+i8T25DP7j9iE3tSR0K3BkoB2dKB
	7iF91EKADfWtWsIgTSPPoK4mhvE8H6vVh5cl6nEGD1Bt/2kGZncet+ADSiB5i7Z02ZjXG3SD2fo
	X5hQEBX5Ae87XMdTGAvkd3Q5Yxd4HLF+lPBpYSMkM/1/v/CaZ2B5HqpHrHZQmPhZh1bJ8XVfFZ+
	l4AFnfe/bziaNBw+KTjIPpNRK0T6zS5NxMBVPUym0pec+o0Kq6IPbl5crRtFB3MOsJuy6Qlxxtw
	mYy72PKJvDc5KRrJiu7/LM5hCU1TbpsjSvKtvXCu+Yuoa2NTorJKLhs=
X-Google-Smtp-Source: AGHT+IEhv1iwMFNgzL2n1D3qxYmYFnznNjZn/Bh2THNz0qVQWcHa3YNmsM1U54RXexGunoARNUdRYz2jyJk3Os5ODmY=
X-Received: by 2002:a05:690c:610b:b0:78a:6e23:2542 with SMTP id
 00721157ae682-78fb400dcfdmr218117857b3.35.1766879643443; Sat, 27 Dec 2025
 15:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com> <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
In-Reply-To: <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 07:53:52 +0800
X-Gm-Features: AQt7F2qc20ZUjd9UnVS-1ZbeNfksHFtdnbsOaXZ8RFpk1tbDmXxCOs-6B3ZEmyE
Message-ID: <CAH1PCMag00z2Fp8zjMUPS7AdU6Lgk0UsS+mku93NtNejqjyBMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i2c: spacemit: add reset support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 4:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/12/2025 08:42, Encrow Thorne wrote:
> > Add reset support for the K1 I2C driver. A reset ensures that the
> > controller starts in a clean and known state.
> >
> > Reset ensures that the I2C hardware is in a clean state. We cannot assu=
me
> > that no program used I2C before the kernel booted.
> >
> > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > ---
> > Changes in v2:
> > - Replace reset property in dt-bindings.
>
> Replace with what? I don't see anything else there - you still have
> reset property.

It looks like a phrasing issue. By 'replace,' I guess, Encrow meant that
the resets property was moved (reordered, put into a different 'place')
within the file, not that it was swapped for a different property.

Encow,

Would you please correct your changelog description
in the next version with something like
'Reorder the placement of the resets property in the dt-binding file.'

BR,
Guodong

>
>
> Best regards,
> Krzysztof


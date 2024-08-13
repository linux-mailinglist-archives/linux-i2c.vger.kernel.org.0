Return-Path: <linux-i2c+bounces-5345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD40950D4D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 21:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E43284C1E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 19:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2311A2C2A;
	Tue, 13 Aug 2024 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edZ1Dr6E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017351A255C;
	Tue, 13 Aug 2024 19:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723578346; cv=none; b=mzPXqpGCZRrRhb5pmRSDNCO+xlynLkmP15mwx9dqfQ0KpRJP/5Ywv3tKwis6LcBO8GRweNFolO2n7oefP2vpk0TWSqEtwbCd4umO+nMCsxlTwIVseNvCT/Vjq1AOWTh1skgvU6wfVE7ToGcm7L5DzVzyx37t/BkmfnOHn3WHgSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723578346; c=relaxed/simple;
	bh=iZiuz6zxDsxVFKysb+5itcwWKV4xjkj8rqrMxWxZfTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+fckkhg2WOG9f1BRvVYdL1FFPgwJ5T0T+G0uxvWqv71PIF5Us+foNbDeWT2y/OVF+ueOD5a3enfqXKGCOjZqfWgvQ/8VVNwvmfHIyJN1KOHj8H039Oz4M1YvK2LiszsITqwo5NDO5vlQmY7ffrw8GgOL9H1tRbuFey4mt1pE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edZ1Dr6E; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a728f74c23dso645854866b.1;
        Tue, 13 Aug 2024 12:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723578343; x=1724183143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdVUKyjKCPee+Tv4VtccmUwE6SLMt4R473IJ+no9TQ0=;
        b=edZ1Dr6Eh1S4RoBuIEHslVibAFM6yfcbDVGxYhTfBFoE+zCcS45HvzZlxdxd8zUfQX
         rrH/qiKl2UuQdtP1ZuMRgd2wRIHhHsIfm3RuBU1Jrv/AHj+NLd9PNzL70wz7uF/x0XoJ
         /8p5uyVGJe4BX4qu/SJdEh0Jjt73QqtJEqnDHZ0tQzDIDVntf+p4tKmIUUJtVhuLIBb8
         BDBgxLyzAn36FZXhGqrrVNSGQ+G0SZB/G1UdCGJcmoNLAZFb5SKVHsHSqwMsrVxNsvrE
         AK06Ny/HeL6g+jSEnCCGnXq1wFefHhyn9eTEzEGv3TU1/g84ysMwlm0jQSZZP0rZnFY/
         TSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723578343; x=1724183143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdVUKyjKCPee+Tv4VtccmUwE6SLMt4R473IJ+no9TQ0=;
        b=upRW2wXxUb5g8+bkptLpFYqnh+TxekKMtszpZbc6d0TYujJeYvkjNk5Ws0yeE9WqkH
         DktqYSFMV5ZTOz1kqTniwCfT6AGyXesJSI9rkvL0xXJZAMHRGzG/KfL/AoAmSUHPI4FT
         UI1ZwriFMZPFNz+R5XA+K+GcAcIBulbq1pZfkSyT+GcjZCGHrWzppR7uSubQKGePU27b
         eoajZzyx8LeeV5c1aBIic5gfJmS135jKFYedQzFw1RyzxLuHcKUJt4w9uQSXfHiDKRXh
         W9hZHGWpj0kU6ZkBPvDnFT94fFs0gPH7Vmnamn/XkrEkI0tDApQCTXJgjp1ar1kwl9cc
         NYug==
X-Forwarded-Encrypted: i=1; AJvYcCUBvaPsiV6VJ6kTIxGTxwXU3gwniJ/K1L1GqQJqVhMC35VCnZ9rXcmuLtZAsJquGzeYTrVBL3JkkhvGioIThfAmr4yPFrMNAHrnRDOGWiH75sjkKN7hZKf8Q7sioIIRz5jp+yg4CRAcQ/8gggnbkBjewXr+aZOD/Dxc6f0VvfT1lmivqeI=
X-Gm-Message-State: AOJu0YytXkbWxKzuarrsMbXtKV5ad+vSJaTspY4fMCo2OLmgNoHOWj8e
	lmti1sTgd1LKNhhU2Mz5CINivWhyg+N9s1w6p1jqFIOMlziTABIVj7qbj8smE3yJK4SnbFaKtfl
	EIuKhVqPKCv+IlS8QHbQh6CEVx2I=
X-Google-Smtp-Source: AGHT+IHX+/mwBRqSI6SyeqUb4LCEHHlL8sfQ88hnxFMMNjieYEixFUMB689yoIF1TiOOg5+gkhjdlU6RZB205nh8LSQ=
X-Received: by 2002:a17:906:fe49:b0:a77:b784:deba with SMTP id
 a640c23a62f3a-a8366c1e61dmr24887466b.6.1723578343032; Tue, 13 Aug 2024
 12:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813161254.3509409-1-leitao@debian.org>
In-Reply-To: <20240813161254.3509409-1-leitao@debian.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Aug 2024 22:45:07 +0300
Message-ID: <CAHp75VcLR5ehrCyVsY0TKWSogRt-_ETqkZ1VE=ATVqRc8Y_9vg@mail.gmail.com>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
To: Breno Leitao <leitao@debian.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, 
	Michael van der Westhuizen <rmikey@meta.com>, Andy Shevchenko <andy@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 7:13=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On ACPI machines, the tegra i2c module encounters an issue due to a
> mutex being called inside a spinlock. This leads to the following bug:
>
>         BUG: sleeping function called from invalid context at kernel/lock=
ing/mutex.c:585
>         in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name=
: kssif0010
>         preempt_count: 0, expected: 0
>         RCU nest depth: 0, expected: 0
>         irq event stamp: 0
>
>         Call trace:
>         __might_sleep
>         __mutex_lock_common
>         mutex_lock_nested
>         acpi_subsys_runtime_resume
>         rpm_resume
>         tegra_i2c_xfer

The above stacktrace is still too verbose. Submitting Patches
documentation is clear about this. Please, remove unrelated,
insignificant lines, like
"irq event stamp: 0" which gives no valuable information. So, at the
end it will be ~5-6 lines only. Other than that, LGTM.

> The problem arises because during __pm_runtime_resume(), the spinlock
> &dev->power.lock is acquired before rpm_resume() is called. Later,
> rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> mutexes, triggering the error.
>
> To address this issue, devices on ACPI are now marked as not IRQ-safe,
> considering the dependency of acpi_subsys_runtime_resume() on mutexes.

--=20
With Best Regards,
Andy Shevchenko


Return-Path: <linux-i2c+bounces-9880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F248A67315
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 12:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5101F19A2115
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 11:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8CF20B80F;
	Tue, 18 Mar 2025 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAs4ja6a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F4D204F80;
	Tue, 18 Mar 2025 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742298402; cv=none; b=o0zayZRSnU81Ggg2a+RhQ4Fq/4/8U5b8V07tWVGhRNVSVLScmrD8RcsnBh/kKp/4twW4pm78GAR6Cli62vz8LZPCQ8EhaeWoI45nqKv8FG2WBkt1sqXJSdkop+kFv+hOfWTuJzyX0HOtlXcjh01ir44dV2JELGDFO3WDa94+ywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742298402; c=relaxed/simple;
	bh=KL8E0gCwzmRt1EMqDOC1510GTWQzlUEOunkYkhW2oDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAJPoyI1gKaPemjY45dbUicfvnO0uLw5Rdsa4mbGb2oR6FsviDNGeTLvVwU5y3wFW/FvUb3hDG9V7NqCoO1KK/A42ZaWQbyj0zMtfzMwSespgMy28XiGfXVGqyIUd5LZBn4Tme99mvB7ymnmFTngIb+rAXPH34XkBM3fi2VXty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAs4ja6a; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1233079266b.1;
        Tue, 18 Mar 2025 04:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742298399; x=1742903199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL8E0gCwzmRt1EMqDOC1510GTWQzlUEOunkYkhW2oDg=;
        b=MAs4ja6a6s4CtMTYwxF8fI0JON5CEW+2CZSMtiXj2u0nhwh3fU3jbjzeeHlRFmAbg8
         0RrbpVEd35kkxEHQoP0uDuZLhMKjqEQYAE5gP2f/IcsZNA/BPwxSvp487LtcdMPcXDa7
         xB/u7uUzhxXxhkStpDHhpqfobZqYOU8MSdhJxCQJWHff5/RMcs98aQftzsQk4oqUaOso
         /4OgSLDZu/X4yoZlamw1e8BgjoZqyNk48MQ0LwSG/kWgRSHMlt5K7T4YhHWdlZsYtEuC
         5ktr7txukYj5f+3r56O0tkLdDvoJqJbicK7Fnfzt40uxSjc40jfSBwMQ9Kx2HpST22Yw
         i6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742298399; x=1742903199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL8E0gCwzmRt1EMqDOC1510GTWQzlUEOunkYkhW2oDg=;
        b=ZpoEWMRFiGHJGB2ZhctLn5d1TK8jwXJ5YatKaAR+I/V6C6q3BrP6TEsa3SbuO56uH8
         U3iHI1zHek0x7iHqVkKYkphmlgy7DNS8tDnfI2Vjv/T9Sx8zX1JQogjaC0Kkz99OXHEr
         0eXVVkjuay6bg3SiqEyEt8PezgzIJiCc9R9CHJzBQXgdSHernoFkhr8RUc2jIFxZf5ow
         DncGsN1eS0RFN/WAzJyEAKh773Ytm5OSC/65+s7yqCaHk7JgJckUIcKqtcBkjdp5xlk3
         rk2RfQBwhVidTSXxz2I0HDg8bhA1BeMXRmIIKTwMUg3Q67o1+sE+KyBtjoABm3oqLhne
         g++w==
X-Forwarded-Encrypted: i=1; AJvYcCU0xuPHbEe/c3tq+ms1zgSgqlFOhHGw8sFuBPwcRfKfoGAr29VOHNoYtNPpPJKLyQGFeC3GmKc8AhULjk1b@vger.kernel.org, AJvYcCWryrc3XYak3CBBetaftpH4NLJZBRc5oqryNoXb5PGUyt/n/ZqV9p9o5yAM2i8kaGidFvH3Bp1051E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNEuASWxfGAzv/OhhKGaEaIBKl5LlL876U1LhSo4UXF5GArv0
	SA+5au0B64ahfmLJO07US/47j7x7m9cZVlG8TlYfAZJHIik0OHR+HRpN/5PG3orO5nOniFtC4I0
	YrfQjEi5tRuJrBf6bJx4udc/soQw=
X-Gm-Gg: ASbGncuO/5PSSlZ8crASYoKNIq2pASMBlUUeyR0LpbDLO6T3COft0YKVfePFMl4+QKx
	MtackOhyF+9PezkBAAbavCnSC+yXoHso65PfI4nxvjjzdSjwzdJARfC1gOUpRTks4SFe/AgQIv+
	bugEBiHrvvBXaAzU6EDMSoXwr52U2j
X-Google-Smtp-Source: AGHT+IHZVKieU2SHdGbuI3lDvrLFMVr2onCO6I6NWrfsdRduvwawWi0FI7ocrrZODI2sxNgOK6VJR4GOddr0MsTc2Mc=
X-Received: by 2002:a17:907:d9f:b0:abf:749f:f719 with SMTP id
 a640c23a62f3a-ac38d3894afmr301647066b.7.1742298398454; Tue, 18 Mar 2025
 04:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz> <20250318021632.2710792-2-aryan.srivastava@alliedtelesis.co.nz>
In-Reply-To: <20250318021632.2710792-2-aryan.srivastava@alliedtelesis.co.nz>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Mar 2025 13:46:02 +0200
X-Gm-Features: AQ5f1Jp1pwMTyen9jMEAQrIJywQNkvClXMRxJ_eQeF94oGzWxGi_MEHILfj9Hbw
Message-ID: <CAHp75VfHgY1VUVkO6p8OJ=4=Omrxs5fih_DjWzB52KYCX8joDg@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] i2c: octeon: fix return commenting
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andi Shyti <andi.shyti@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 4:16=E2=80=AFAM Aryan Srivastava
<aryan.srivastava@alliedtelesis.co.nz> wrote:
>
> Kernel-docs require a ':' to signify the return behaviour of a function
> with within the comment. Many functions in this file were missing ':'
> after the "Returns" line, resulting in kernel-doc warnings.
>
> Add the ':' to satisfy kernel-doc requirements.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko


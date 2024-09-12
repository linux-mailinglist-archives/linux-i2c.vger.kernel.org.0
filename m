Return-Path: <linux-i2c+bounces-6624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7177D976DF2
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 17:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28DFB1F23A7F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 15:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40E21BB6BE;
	Thu, 12 Sep 2024 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIsPRL9o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E675C1BB69F;
	Thu, 12 Sep 2024 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726155551; cv=none; b=IucQakmFcePRUnhmj2qwtvd/CpujTyh8BFX6SoQ6b2SiGKetA03JmsE7jf1Ces6u65Adg/oYr8/9UGwPP6/iaNzrQ8wBnOg7W3M11uRLNuczQkpRRAbnEA/9VM/IWVVf2VlDmoo/LeKOWpfAEGb2RlsV0ShBvXbF4djnv1menQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726155551; c=relaxed/simple;
	bh=YIPg3/0Q/RFE5hkLD0E2e2hBYozaF9BliEyD2JY1oW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4dr+u3iyNJ7+ExgJiFGArANm4SeA8yTD5X5D5Y/SwnvGEoO2avTTzKJ+pd1zBitEgtCfRsBsFCk82iUHmp87m1v1f8i06DQm5VmRtgdi8LrWUzSqSQ1BP7/ISPKtUP6KOGEoaZXZAi/HmpQR9W3LMYJF5zLpG2p4ovp9/gC6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIsPRL9o; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c260b19f71so1274429a12.1;
        Thu, 12 Sep 2024 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726155548; x=1726760348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BtcRayUquZ1HTm468bj4gSJwZHUN53q5eBS5142F4c=;
        b=JIsPRL9omYvVvWD7Q+1LU+/l2cePxlM1zGchdgJyfJod1/AKgo5UvLslwD9e0oWgdC
         r7SrnXCb86u1wprfLvHyq2Ln3b790PrO58N92BAzHehl+aFIfpIj6BYKSj5S9+W5+8Fg
         ArlY9DhKuK2RiZ7VyLF1WfSrS2REchqrYNevaeZnsQlhBPJLtUQSxmY75xHXWT7N6RAi
         /LViEoKARB4n6n50tfOWKq0S1cWGRO9b6jJ6+kTBXpenyjw/lLprSpk7OAjpC3eLB/gY
         5fH7ZJaXg5WEzkbFEkxZRHy6rnJewOOzM3xkx0ZhjQxvEmWwjKsgwd39/gZcy5ugalMF
         9XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726155548; x=1726760348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BtcRayUquZ1HTm468bj4gSJwZHUN53q5eBS5142F4c=;
        b=Ko6UJqh1JcAQFbFK+F0T/WARKxdw5WEeKE20LsnDlHvIxDArl0KemhXc2gvMVjZJ5C
         mVTUoobOHBVaOYryhz5iqgTxmLmziDoOZ3fz3+aYCXhpazxG1O6wjOh/Pu58eZiix8W6
         alWF7sI1Mz4UAWDiM/Jc7yxuEd0m/sxYYn4CxSapeVXqmx5CbZx0UcVoSz8u6q6bUjKp
         pUj2b60N/KSxpAvnGOVO9+8mUjd3h+4XNS8bs+SEUGWnpbAR0AOk9GjokDhRHejKaNzb
         Xd3BJeabTqUblg7zJBIpU//j8t6abFJpIPSjicV+6ptx+LEbAesm0xvi7/AVYkYrsD8O
         TE5A==
X-Forwarded-Encrypted: i=1; AJvYcCX8m1Iv7PCe92fDWkkbBcjM+VeK3zQHLb6uwtovsQ4tNU544p+RO8j4bC0pjzS66uxvi5ipCtaWDFc=@vger.kernel.org, AJvYcCXVztwQmy2awo5vf8GPekDYdhGu8QCIGIwDXI4Jtwq3t/jVAkIuI315La15eBxqEm/o1xs1qh16oangzrAX@vger.kernel.org
X-Gm-Message-State: AOJu0YzaysfSByT7sIAeFGeDkUAM5RAGAmv+fhFrec9Ubw8lmPUkR7Db
	ac8zmLN0VmCOBRj8oASwnKYoYPUVkZbCuMIlUKmOtra+XmHHuW3U+30h1v+Mii5ykXt1J7t80c2
	PsMWYMTwjYKQuj+mH1rUALw3mN5U=
X-Google-Smtp-Source: AGHT+IGrfF30eKW9T2Se4Qc1CPgLOwrRTdK9YCkCVoUZJhJKPV4DLc+TYO4z+CxcXBg3uvSRN1ZRwp6BIpk/TRGe3+E=
X-Received: by 2002:a17:907:c8a9:b0:a8d:4b70:b09a with SMTP id
 a640c23a62f3a-a902944976emr289824766b.20.1726155547793; Thu, 12 Sep 2024
 08:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912144105.1555624-1-andy.shevchenko@gmail.com> <7ha475ast6xpzukbbxq5xg4jniyo4t5rujee3m3eejaigi6hry@v4di2uxcxky2>
In-Reply-To: <7ha475ast6xpzukbbxq5xg4jniyo4t5rujee3m3eejaigi6hry@v4di2uxcxky2>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Sep 2024 18:38:30 +0300
Message-ID: <CAHp75Vd6anhDPVWrE2yDDGvBx0dhtx1R5ignzzmf06fH4rBJkw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: synquacer: Fix clock rate retrieval code
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 5:49=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
> On Thu, Sep 12, 2024 at 05:41:05PM GMT, Andy Shevchenko wrote:
> > With the devm_clk_get_enabled() the probe will fail on the systems
> > that have no clock provided, such as ACPI-based ones.
> >
> >     synquacer_i2c SCX0003:00: error -ENOENT: failed to get and enable c=
lock
> >     synquacer_i2c SCX0003:00: probe with driver synquacer_i2c failed wi=
th error -2
> >
> > Fix this by switching to devm_clk_get_optional_enabled() in conjunction=
 with NULL
> > check, so we won't overwrite the clock rate from the property.
> >
> > Fixes: 55750148e559 ("i2c: synquacer: Fix an error handling path in syn=
quacer_i2c_probe()")
> > Reported-by: Ard Biesheuvel <ardb@kernel.org>
> > Closes: https://lore.kernel.org/r/CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VN=
DCxnBfSPe6b-nw@mail.gmail.com
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> you are late, Ard already sent the fix :-)

Ah, and it's identical! Means it's good as is :-)


--=20
With Best Regards,
Andy Shevchenko


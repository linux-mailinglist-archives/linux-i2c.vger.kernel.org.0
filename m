Return-Path: <linux-i2c+bounces-9881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C5A67324
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 12:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 567223A9430
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 11:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F181420A5DC;
	Tue, 18 Mar 2025 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivOrQG+p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5561EDA1D;
	Tue, 18 Mar 2025 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742298661; cv=none; b=KjF7reaQkMjKwgNNeYkaeFLLJopPuxWomfrbfRRf3RFNFxm/LS5FF4BMJuSnBsrd3nfYwQkTbC2xMdMgjEqoOnTr2SoqRUZV+JY2Dno0ZBmLRm1/4tujQ5CH7gUAfhwVE20f3Y2SrDO+DUzNW/sHRxjt+P0wWPwkwFzXCn9jBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742298661; c=relaxed/simple;
	bh=3WTrSp2DHyXbKOnsrAoCSi+8DHIZPcAvaME6hBNV3qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IV6J45jhk4wIFFYNnVmB05vUVkx5WX76gBeHUdcfYHSu6Ic24q9Jh4CxeayJ/V4TQClZmkM8trFqPRVLaQb/amvyt6+SkGwhizVNJDXjLvGeH1d6dnkkwUxp1B5f+Tkw+vMoDCjpWFC+DYP6G0CpVvQtfux06Jq20skklJ8V0vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivOrQG+p; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac289147833so960319366b.2;
        Tue, 18 Mar 2025 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742298658; x=1742903458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WTrSp2DHyXbKOnsrAoCSi+8DHIZPcAvaME6hBNV3qo=;
        b=ivOrQG+paezji/u9BIBlAO6SNn785eI8/9Ty8qHiDJC3NS7/t/gEw/XSXWj9OySEPg
         dakVfdyr+1vCRtUeUdReizJA5d2fZJVHptnGWvxqUImjnNgtPKQlW82nmxhKPL2KkRhX
         gRx7oq64Eb4DHjK4MooruUEiYzRvtgeyQu/H0XGIOT8o32d83kDRNfbCwr/0dRC407ho
         UmksL37NCGEeQbfQhv0uqckAxwsXWXrLfFa+y1/TnirL1yzF1410TvczxdUdBSOdBe4x
         Wo1CPlkeXPPHqcaxMinQJZfxUfWYg8nah3C00+KsoUm7OnxA+MJvU/b35w/6lSZSTBO8
         AA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742298658; x=1742903458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WTrSp2DHyXbKOnsrAoCSi+8DHIZPcAvaME6hBNV3qo=;
        b=RZ6m9tB/U5BKT0wfKK3GzUYcibF2OgrD6W7OuJ5pO4daClkPobeJ481sndV+fo5jq/
         GjI4FlpBx9Cpcvtt3TK58LcmD1nNIZq+keP1JvNNlq4psMhvKdklKwh81Y15KA2ldW4B
         c2X4pUa6DREOJCcc2LX2ZXgJPmr7kge4EXXPCKe3wydQB7hIO8HuxdBCM2nQXfYrRnmA
         IDSe2MeYXI2sAf0i5fu6L+k3vik7bIAnYiz4dpwmVswjyTk+eoI+tZgy1pyhMz6gr7LX
         NCDdfmNn08sumTBeVuX1R3ycM7Mryx/CR43WNYqmjAsxcEIgy2zCtVoiB6XF9zKNJ517
         Zmjg==
X-Forwarded-Encrypted: i=1; AJvYcCV62kF6+VmYfoF1ah3lPbN1S1UuBEss/ZW3kvNPqgvmzSI/bzNjKYDcnL+U0oZHdOQ/PhH2BEUoLo8=@vger.kernel.org, AJvYcCWGYLvihgw8OxgD3jEcoh5iN2jptr5zJNSft0zMphspze/JIso788wiZQxGtPrUJNkql72Ym2UnuK8kv7JM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JBSwrYcEZRT/1EpBzZgtdLbg43pCmJoPsb+8Wf9SoU7wxni6
	LnAh4Uv+Zt6MTwOf4M5uXS4nJe0+xDUye6EldYSAAQxWxjTjIhqYGELJVUcN55Y/uY9DNT16F/f
	Vtsfth3Wehis3iJ+4Zv4D8gv51EU=
X-Gm-Gg: ASbGncvXVreWdQKadKVbIF7OJu4wpBeOlMrwhE6d4lSdmOebcwqH5bMcOOHvRiw819i
	zcF8UJhtaHeOs377gJW9Svm2zwtht04JeBAqJ1wkK0/ptkTmOrzddAZENL6QEUC225ilHdrP9k9
	yVMFzUnOGPfsyGdqtVybkD9aYzLXco
X-Google-Smtp-Source: AGHT+IECuylUTR1DKmMagcrKRFNqRSCEqsz5if1PZx/gVBGp56TFoFSmYzUeRw6STu9hhoyV/aAaoSGcexriZzMf9V4=
X-Received: by 2002:a17:907:7e8e:b0:ab3:2b85:5d5 with SMTP id
 a640c23a62f3a-ac330401c0bmr1914945566b.49.1742298658051; Tue, 18 Mar 2025
 04:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz> <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>
In-Reply-To: <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Mar 2025 13:50:22 +0200
X-Gm-Features: AQ5f1JoGLgHJ6KpuhdK24lZOOLB7cBe8aFQJ3qM_FAi3WGiuvC4CymIVkSVnE78
Message-ID: <CAHp75Vfa1kA1viWrz_JrpRpoZf3wVdVVEJiN2A35hBMPZbumrw@mail.gmail.com>
Subject: Re: [PATCH v13 2/3] i2c: octeon: remove 10-bit addressing support
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andi Shyti <andi.shyti@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 4:16=E2=80=AFAM Aryan Srivastava
<aryan.srivastava@alliedtelesis.co.nz> wrote:
>
> The driver gives the illusion of 10-bit address support, but the upper
> 3 bits of the given address are always thrown away. Remove unnecessary
> considerations for 10 bit addressing and always complete 7 bit ops when
> using the hlc methods.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko


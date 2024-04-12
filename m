Return-Path: <linux-i2c+bounces-2911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106228A2975
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 10:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41CA61C2220E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 08:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B065038FA3;
	Fri, 12 Apr 2024 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UeLqydDC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5EE2C6B3
	for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712911168; cv=none; b=R/k7PMu0s3OQInlH8yZp7hwfMKdCMlogORgwV3/74mnmgL2K2DVwREStcYVsLA28cao6VbjEuqFkcQvfNlCChgyh2OkOXJdGA3y3xEKNUyhPcl9YmmbAfFb7LX0k0I3hTItzkLwajsHYt/IuOx3DJ0w+E3drRP4we6sjXl3l7mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712911168; c=relaxed/simple;
	bh=BKiNXIsCkaahnSmQczV2Zt9OVi9hAuJTJ2qFlAnZEfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F1prppOcNKDbKfuP7bJKf9CZDGgNZSbrrbBvu6A2e7bNZFlny1p1rJTzjatLx89UPWjx7IfdXkiOQeyioTU/FFzozAKlqYNBPYlrnr3x0lRJkshZJ0ZD5nfcJPTIGvaB7gqQ7veIRX0I3x14Ts0b3I7Pjrq6zVLBbJeWq90cCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UeLqydDC; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so632170276.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712911166; x=1713515966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKiNXIsCkaahnSmQczV2Zt9OVi9hAuJTJ2qFlAnZEfU=;
        b=UeLqydDCYx6GdtFOLh6VLP50BTgV0a+N0dTI7VsHXzyC/cFK+XNr9C2K9rDrXiSGB4
         IFsZEb+nhsgxTJ4nc7aVFaOcVpeBxb4XQBo1B18F1hHHwJLOYC3sE1DOi+CgLj9EE9Td
         dCgQEvyEvgof2zLE4Lim9xzUMA5N+dwQhyyvElCDjV0yZgIyPMdxdzyEUiaDm9Iax6QO
         qpfcxk5h2M7YSfMsnPn+Rc/rVAOLlkd3paWvrBUnYfeIBYjjlwT8p4FS092irZWJkMbz
         Umg8XZPopsTeIVu1h1Sd7DYj6k4QsUoEjXhJJNnZ3eLmtxQUAPU1koSj36kNZTuDII1g
         3G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712911166; x=1713515966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKiNXIsCkaahnSmQczV2Zt9OVi9hAuJTJ2qFlAnZEfU=;
        b=FKzHCZMuwzVrUrLmkRb77LBWXq0Ayric81QCjpPcIfDXu72uw2U012aBtq725zfS+C
         Yo2zDCabGkCuCi1LoKrH0vnADvGvkxeagRoGz9DrOYiRUxop/vqtcFeXTcEHVqEVT0eg
         oRoAJ7lytu/CiF0CNwkYPHSW1ECP9NPbNUMbsI2I7tn/SqkCbRgQi9HM7wH9gMIYNHoy
         xWuahrtvMNbnHyMVrFe4vfwhHopuKr3XO2edLXlGjgZ0TxmUZO6Si7d4N/B/5HesrPqx
         B7/MbP17h8Tio5nssC4c2v3m2FhczYH0NU4JsE9JS5uag/6JyKuwR2+upK38L+i73UWA
         hRUg==
X-Gm-Message-State: AOJu0YwZWEVFAGVGQG9LyypGGxY9ji+EUGFviraluaEFBjnEcA6cJltd
	eWU3TpDP+dsqxai7GthyNgs3owEB7W8zYHfZv9SOCB3s4DSJhjSUe2JGtgT3IAiUqu0OdjQaTXR
	Pg9rWZcq4WFy/7xPns+n0W8pchYLGe638pIpBQw==
X-Google-Smtp-Source: AGHT+IHeqDWfes7rNkl5Br3aVeehemQeABtc1rPmx316LH4tLt/aurBODWB0ADu277UFiBEq0OYwZg2k2Ul3QX17x60=
X-Received: by 2002:a25:ab13:0:b0:dcf:464d:8ec3 with SMTP id
 u19-20020a25ab13000000b00dcf464d8ec3mr1811975ybi.3.1712911165802; Fri, 12 Apr
 2024 01:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com> <20240410112418.6400-29-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240410112418.6400-29-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:39:14 +0200
Message-ID: <CACRpkdYD2PP0_BEBPSX7ZTRPtx3PJ9ERC+-xpRRnreN7KpRFtQ@mail.gmail.com>
Subject: Re: [PATCH 09/18] i2c: nomadik: remove printout on handled timeouts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 1:25=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks Wolfram,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


Return-Path: <linux-i2c+bounces-2078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0986D5EE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 22:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49A528B575
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 21:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9B1145642;
	Thu, 29 Feb 2024 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IlBYQ724"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2F6D507
	for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240991; cv=none; b=RJakoJZCQqI9J4vN62+xgozPMK3UKxoaj3/gxpLN69bJx/bLCS4LFBuOMcJjFbmQ4EaQDLLcq5KXQdJPKdsS6vDLMWNAmLuQu2Q7n846fUPL+jMcO6VCHdiljf8LVZMXMcX9HCX+FS1jicHdfYRp+CwitdEg+9kePaw/ZAJbGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240991; c=relaxed/simple;
	bh=+OMSuNcz0f+S1pNBRQGA7ZZNiFav/x2zJeSkOoc++p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/kHaqw/TUi7XbCDq0PnkPZQ4WQ8bCFXiAXUN1CpQIJ3ngYUxFDqvWvnzaF4UW2LgSPP/SuXh0/E7Ip021dOoKsggmAkQaauZ1lrf2MrFAENJFzG5Bsl3X6+Aq6gmX6QnX/+di8XxzB+jFwRSk+llpAAedoaHQ06lemUFp49QDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IlBYQ724; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so1474865276.1
        for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 13:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240989; x=1709845789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OMSuNcz0f+S1pNBRQGA7ZZNiFav/x2zJeSkOoc++p8=;
        b=IlBYQ724fgirchkN11P2a+0JNsB2fbfLPnOC5TlpOLT64fOxGS3b8SShCpc0tZZIFY
         yoA1n1Jk2uhFgMk5+2GQqlM2KBIz9YJLJCFSqo38Q9t30dFvFfz9GSG7/YRcddliHCsE
         AmXQ5SaOVcvbXytI/mbSZynlk6yhieTOtg+3Nf1I1NkAxrP4QPrI6bg1Tc5A2+AG7H7k
         R7jNKNfWukO2ZWSWiQZrKTrkJJL1Nm39vzmd4g3TAqJc95Rl/Tm1K02dlo201C4npxwG
         LTiCWV5J8vGckInQ9mTGo8qvXOagqV1ipuF6SR/rKXWdUhe11xUzDk1yIajvTOA79/nf
         kNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240989; x=1709845789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OMSuNcz0f+S1pNBRQGA7ZZNiFav/x2zJeSkOoc++p8=;
        b=fwxKZixu0yMof7F9ZIk0yV7Fo8e0Kc98n2WITNgZce0uuFfib+B6nKSdOe4X0gGz6W
         bF+Vdntg9got1FoeAfbgI7YvKehPeLsdanJfSCt2cAMFYJud+V8Z6ciB9BWdOXwYSknZ
         QNv7QY+/Vdr0/2BTeEZCJxD8mpf4Zrx/Etq5X+2SQiXRaDtYnCHCuF4f1NfZu1WL0pmv
         BUPEZPb/vBgvRhBprHAETZ7qsBftYM+i5TbGPBtMzE04eVwgeWBQfWOZLDeMaJLDHIZv
         96AlxC08FJ5WYdNdgiQ9evwEJ/gmfT23wYvZQCkkJrlHHtH4oV1ktKcp6yzadrUHv6XZ
         M8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlFOC/s6JuG+G6/b8XqPJIpl7OJxa1e/jotWDezTJpkRr5jIyi9vo/C7QgSeDw9zBxv9BNyF5MWBm0dQ7vyFg5BUQtTuRXRIqZ
X-Gm-Message-State: AOJu0Yx13ygeMWvX7IqeHvdBFrD3gw73A0cHLXlLa7EirmbcZ1OI7589
	2hjM6iNq1Wmoir30PkYq2gm4pT7Iebaz5RmwI4dHRBV+gjYIgxx7FXHz1FJSZEjsYGSBTYYFVYC
	cmKqMSg+RRT3i8lsNJX43ukDzLxmxjnNr8L9RtQ==
X-Google-Smtp-Source: AGHT+IHbva8VtENYJ0hw2FAcTEKgi5UH/B8oRvg5bufEYQcp/sju2WedSjn4h1t/PREb+YdBoA48AKTJb4go8f2x9Zw=
X-Received: by 2002:a25:8e85:0:b0:dc6:ff12:1a21 with SMTP id
 q5-20020a258e85000000b00dc6ff121a21mr2558461ybl.31.1709240989292; Thu, 29 Feb
 2024 13:09:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com> <20240229-mbly-i2c-v2-10-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-10-b32ed18c098c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:09:38 +0100
Message-ID: <CACRpkdbzLGViXJ-qFNYhZJ5x2d5zrRe_2sCpwnkjcTNp3C1XmQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] MIPS: mobileye: eyeq5: add 5 I2C controller nodes
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 7:11=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add the SoC I2C controller nodes to the platform devicetree. Use a
> default bus frequency of 400kHz. They are AMBA devices that are matched
> on PeriphID.
>
> Set transfer timeout to 10ms instead of Linux's default of 200ms.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


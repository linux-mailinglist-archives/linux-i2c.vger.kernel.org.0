Return-Path: <linux-i2c+bounces-2982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1F98A7629
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 23:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69AE3B22DD3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 21:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35F65BACF;
	Tue, 16 Apr 2024 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sluXXdnc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF25A0F9
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 21:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302047; cv=none; b=SHv7ePqNjQzLEUFPrkbFpqx0ghDzndMO2+FCJ4pYKYpUQ5X+OJuUnfUdCWmA/PPFw1+/Lti+wqo9Jls55ip+ivyaF6sd2I8QFqbWxlttaz6vbtMJxrqMUzuG2NPKdnll9iAVANlKHlsG28+ncEkeLWlQ9Fu0+TEJ1IVaf5fTeuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302047; c=relaxed/simple;
	bh=hYbx6PTsoNsyBmCWhe2uOm9re81gqj53ZsseQt9fWB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVFeXxlw05Y8I5NM/2kNZ1ztTk6sdA6FAik1m9Jyeh7AkDwE1PZX6toEvIIEdc8DuV1sK8J49JOyjgcMhqiohuOaP7FFdKKWCJhWTtQs9o+uWKjRxFwJ2l0X3SUc87aGcfrvx+3xDYsJcHnKU8JvszYq/Yo8UOUm5ZisescpBoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sluXXdnc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516db2214e6so6040275e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713302044; x=1713906844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn04wT0JBm+obxx+kTlgG9j7vzEDda0ye02bvz0wRxM=;
        b=sluXXdnc6zdIs4x9p+gDWVyfXHvhECnrb0kh/6H9CxC3yxUcvbKWCW0Ape+I8l0i9U
         W9ZeZobz1qmCW39geKwWfPYrDAlXPXVifNNvv0bawPASmEwmF/LA7J7lhrApjyRLiVdz
         4TfEeajCgDREwrov0hKC7Oshdsam1q91u7msP2RoulU+sgsY5fMr97QSxD8uP8N59sWL
         Qx9+/BUHXLKoV7+5P2fzGXyBJ18ZWyTIXK51qTFC0RkJcsi16/6w7O8ixhVzxWcWUVfN
         wVla90dAB15OGkhRWafEYM+wi7txvBODZ5xK2eEAo1/bXudY99irrjauwtSz9rUBodwX
         fctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302044; x=1713906844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dn04wT0JBm+obxx+kTlgG9j7vzEDda0ye02bvz0wRxM=;
        b=mKgxubFbuxWSE5DIIFLFM+6ohxSwonKNWwNapTCDZz8fbGKFrEMXvXBsdNaCW7WdcM
         kjKo1eUiEXOqG2PeUDchH6/ngZ+KMEzxY6wdVZV6AYM90M+i5qs5ctka5zT9ALSJ7+HA
         C9tqsZlN0196ImqaDZSdmav1UD+2WqUMP/AsBK2sk0uJ32IVezO3cW0hS/eNf1SJ0SxQ
         sdbbeRrmfZSTd+Lc1iVGhM6dnmjFqtYwoouEXojHc8R4tt2eAJvRQr49PhmqHGAvchVK
         QHdQtSB2JHXJXndrkktEUvMt4B/wDUOlo8b6GEkZn4On/BR8EOpvDE7PqELqrqvJBFsf
         rjnw==
X-Forwarded-Encrypted: i=1; AJvYcCWlO1YNpaVAS3iILX9oDwld5qBWJa1lqSEn9Igt1ClongOkhtIlhlr4OLL/JFTREf/XgcCOdquXWjlEz52VarLObYb8VfbtCpRo
X-Gm-Message-State: AOJu0Yzq1m/ukCH8OVUT7QmUPTrX2GWcG9r54nKtN7ocwLDaYb/J6kGU
	XuK+Ed+C7humPwPM3rOrezeVS/2qHLcZj4TrDGWBOM5vYKhA4OPEtP/Nw+JmFyACGUlltOYJhUf
	/yqJ0AkG9awJzigukmEowRj80E8t++lfIDTtGdQ==
X-Google-Smtp-Source: AGHT+IGAyUGV6VvWLvHMDAGW8JKzTq1oIDcVu3L+TgdMnw0Thj8YRZxvbWr+f5vVYXNKQFG5YhxvVU34ldmvzwxme38=
X-Received: by 2002:a19:8c49:0:b0:517:87ba:aff3 with SMTP id
 i9-20020a198c49000000b0051787baaff3mr9237406lfj.43.1713302044303; Tue, 16 Apr
 2024 14:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415131104.2807041-1-robh@kernel.org>
In-Reply-To: <20240415131104.2807041-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Apr 2024 23:13:53 +0200
Message-ID: <CAMRc=Mf+tFOCawEf=hmAYyBQMyMpPrXTrNhK3J19BM4Gx6zh6g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix ST M24C64-D compatible schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Marek Vasut <marex@denx.de>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 3:11=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> The schema for the ST M24C64-D compatible string doesn't work.
> Validation fails as the 'd-wl' suffix is not added to the preceeding
> schema which defines the entries and vendors. The actual users are
> incorrect as well because the vendor is listed as Atmel whereas the
> part is made by ST.
>
> As this part doesn't appear to have multiple vendors, move it to its own
> entry.
>
> Fixes: 0997ff1fc143 ("dt-bindings: at24: add ST M24C64-D Additional Write=
 lockable page")
> Fixes: c761068f484c ("dt-bindings: at24: add ST M24C32-D Additional Write=
 lockable page")
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 1812ef31d5f1..3c36cd0510de 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -68,14 +68,10 @@ properties:
>                    pattern: cs16$
>                - items:
>                    pattern: c32$
> -              - items:
> -                  pattern: c32d-wl$
>                - items:
>                    pattern: cs32$
>                - items:
>                    pattern: c64$
> -              - items:
> -                  pattern: c64d-wl$
>                - items:
>                    pattern: cs64$
>                - items:
> @@ -136,6 +132,7 @@ properties:
>                - renesas,r1ex24128
>                - samsung,s524ad0xd1
>            - const: atmel,24c128
> +      - pattern: '^atmel,24c(32|64)d-wl$' # Actual vendor is st
>
>    label:
>      description: Descriptive name of the EEPROM.
> --
> 2.43.0
>

Applied, thanks!

Bart


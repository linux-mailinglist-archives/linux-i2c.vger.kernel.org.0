Return-Path: <linux-i2c+bounces-799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D2813460
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877871F21119
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130EE5C8F8;
	Thu, 14 Dec 2023 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltvDi11o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D191735
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:14:37 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5ca5b61f101so572501a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702566876; x=1703171676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWqMHpUSkAPDn3wm2z4jDOhMdXvzCuosczZCAgcr4kM=;
        b=ltvDi11omEnn5qaqbSVvMf92ELR8bE6qNn/++dxsVNOur3z8xo7SAIKQJ/fL+IrpqW
         +X7iCi5e3BoyXyokbX4BkYjJz8zPO3FPtbEyQGgS/DGcCbUw7bW4e1w4kdwTQutKWiCC
         dmHh/sfjBe52v+3QEvGNV7jqM0OBjYaskaThRqMLsArR3TW5DDjHXazJfYkvhli7OgPk
         3b+dcl/04RMP670Ur/uBVW5FlQXFwO5pzfIPifD8iLQMGBe03KWGhTDYrzzy3ATvOJje
         IuixlPuB8/xBPIVcvKuMpLKxwruxCmshCgKVOt3Zl2r9ZcuGIkp+xPgYiD0BXUTF7k4h
         lQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566876; x=1703171676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWqMHpUSkAPDn3wm2z4jDOhMdXvzCuosczZCAgcr4kM=;
        b=oa0/YBRRicD6NMecdFUxH4s8JbqbLx7xwHh6/bFi3xSXvCVRLfi4RYWbftlBafpWFY
         aO3N7PkI1dQxkaiO2N+q52Qu3od39hF2RCdy53SPGFEikUCPO/EJlxo7PPqzg/JC1Gc2
         usI7Oq5u46qQnedVNjP+4MY8Fi1Cr46kTC8k35nrtMZUw8fKjU/RTJcUmyZat8KbWOcH
         z5Xvi7L2ocWLurYajDOae/qIWPsos8S/7btX0jlIaWJRj9ouKGSWWDeC9KlVjp6UBhQ2
         XghC6h74KtMyHGhQGffXqL3d6vczJeMa2/7j2QdZgforyQjB7Wc5wdPa7t9aq33x48MP
         RZ+g==
X-Gm-Message-State: AOJu0Yy+qa6HXzcOcWZcj9MiGeeH5kqzP6XVTQriX0mqJiXmOAwevexL
	xZE+VTSp7aSjT1CsVvYpfDSQEkwVBdUrRhfUedKq5A==
X-Google-Smtp-Source: AGHT+IEM9NOntXhLmCrjcoIuQ47Pfui0YztUJd6OSshayTkyxMrEa+wi5LDmzXV8P+FrMsH0LnE9quA35R9O9TaR7Z4=
X-Received: by 2002:a17:90b:3697:b0:28b:d51:e7fe with SMTP id
 mj23-20020a17090b369700b0028b0d51e7femr354699pjb.64.1702566876603; Thu, 14
 Dec 2023 07:14:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-5-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-5-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:14:25 -0600
Message-ID: <CAPLW+4kBPj+f+aedr3yq_KTg7V7NFjK3RzFMypeYdQ-eos-NAA@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: serial: samsung: gs101: make
 reg-io-width required property
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> GS101 only allows 32-bit register accesses. When using 8-bit reg
> accesses on gs101, a SError Interrupt is raised causing the system
> unusable.
>
> Make reg-io-width a required property and expect for it a value of 4.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 133259ed3a34..cc896d7e2a3d 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -143,6 +143,10 @@ allOf:
>      then:
>        required:
>          - samsung,uart-fifosize
> +        - reg-io-width
> +      properties:
> +        reg-io-width:
> +          const: 4
>
>  unevaluatedProperties: false
>
> --
> 2.43.0.472.g3155946c3a-goog
>


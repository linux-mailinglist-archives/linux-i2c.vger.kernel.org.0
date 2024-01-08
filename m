Return-Path: <linux-i2c+bounces-1212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A582713C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 15:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437371F23256
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 14:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CADF46B92;
	Mon,  8 Jan 2024 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HxAv++Am"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A44654A
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jan 2024 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-67f91d48863so16487716d6.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Jan 2024 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704723957; x=1705328757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9atKNkCY7lxaNFN54oiB03vJ0WvAQsiMxxbA3uOpJJo=;
        b=HxAv++AmFbl0uOddkisZqolW49+5/sYZDmLWn55JNbPR0+0BLwAvulL5LOLtXtDYtI
         ekgeHSgkn1R233Ht51bVb+yyaVPz+mCOvghU9jU7pNrABUDI/EDExdt6wub3q0D5N9zX
         Hab6FgMqgj+wpjAwT6kdhsHlsvU4N+JKrpqFC61rjLGFg0axJjgcwCL6oSENCElubm+h
         7dJEOvlaRHLLRYn48uO69/Heg/+PwbotxuxrD7Ape5MbtAihozkhxmLZC2Tw8ZNaykbQ
         CWFVO1BTWbqt9e37D3PSpOG7izWTQFvacx1LHyDFyHr3+aIhOYZpTQf7PJu1MNWO9oHv
         qowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704723957; x=1705328757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9atKNkCY7lxaNFN54oiB03vJ0WvAQsiMxxbA3uOpJJo=;
        b=i13/h9KWPWlR39+UgWQisWG7309Wy8qkJ4EjtxH+YKyKzIC1DisKC2KOdLqEaC2n+w
         efr2ljZqFmLmCYKJM9I7p4TR0q7loJwLD8pKx3A2UStUF2kahOuuSNmypxeIuFm9h++b
         bosgBPjC/VLdlI1J5rHIXc2q2IvBr0OPnqJpF9iK3wwlxXcMrgJfSxWeLEv7rKNrDuqv
         nZRM0kKLMQqzETSeQpCOH1yqkaXnsIU9WKbs106yM/SXhHs66iPFikD8rKvnqsWU1Y8/
         Yl7VUEAFIK10G09KqKgm1zmUD0rd/N0RP3DZTLLtdL3B9MIfuIFCyF1bN73uZPHPaWF8
         y6Ew==
X-Gm-Message-State: AOJu0Yxa5P6TRDwE1unqfXUEewfbv0F61TNh92O+SRQIv34lXS3AaYrO
	Z7HBs+7HT1RW6gr28DlioHEEY08NbDeaIrmf3YHPYhISN5mzjw==
X-Google-Smtp-Source: AGHT+IGYBiojUjS9fJ10IBb9JbhjqsBHMSGrip1FcvfI6xmIy5S39asxIjjlSyHXTw4klyjrfzRzcW7TpJi92WQvvuI=
X-Received: by 2002:a05:6214:2683:b0:681:212:f9a9 with SMTP id
 gm3-20020a056214268300b006810212f9a9mr3329090qvb.34.1704723957739; Mon, 08
 Jan 2024 06:25:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-4-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-4-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 14:25:46 +0000
Message-ID: <CADrjBPrpooS=8WERcQ8zUJ=tDXtWncPpyxQL2ov4PEqQ0wmwYQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: serial: samsung: do not allow
 reg-io-width for gs101
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, kernel-team@android.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 28 Dec 2023 at 12:58, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> All gs101 serial ports are restricted to 32-bit register accesses.
> This requirement will be inferred from the compatible. Do not allow
> the reg-io-width property for the google,gs101-uart compatible.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


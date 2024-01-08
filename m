Return-Path: <linux-i2c+bounces-1217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF3182732C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 16:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3D51F23193
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 15:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD50524D6;
	Mon,  8 Jan 2024 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY+6josP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F7851C48
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jan 2024 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-783234dd689so81614385a.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Jan 2024 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704727812; x=1705332612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzw/cgm0NqSiQjobJ8Qq3PX7WH99Q7opW3VxmOxNOVc=;
        b=lY+6josP6BMPTp4bR4tvGbsOd6mdEgpAadcly5LWlQadAqv6cgoWlDr1tW6WjcSzx4
         8LJjvz5HGluFQ0FN41mX1Yp5TllNoVBMfmkk8vVk1uRD0eFdE1CRQlLww8khbgECZT/M
         ZUe0pUl94wXOhjV3ZRpGVvXnQRpAHuflMTF+doZODKjId3G5F+kngjf/2VEnqb+LSsw2
         qdXpPL+y5mI+XhilGbmtg1lBd5A8ZM39V6Y8F52TAmkTAnU88dA4fHiukhCxpZ/wBo4O
         pXzLM6jfTQnIXtur4UnVsr/B0980TDais4VYwzfJJ7LH/7gT10mysYfvkpYKTS6oQWv7
         3Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704727812; x=1705332612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yzw/cgm0NqSiQjobJ8Qq3PX7WH99Q7opW3VxmOxNOVc=;
        b=wbrDwWjvkNmqSsC3CJyFbLbFLuFaDoW1HhA56Tf1U1ITCodsBZbZjILf9b4h59qy3p
         +WHPxCLjce3FJSX0cTGgCBjKeZdd7+cqQG9lpfS299kUx5SLIFkO6lMrZh5hPvwFhnxy
         6PnWf3S1apvy//aK8IlqSV9Q/BTUXBlfBbzT3y59TI5ZyYLlQLn78EI0S0YYp2qlmUID
         029lVerMldbwK3kaPQeFLwGDf1Gr5HJ03ktUS5fMlRe+Q+5ZPtdFh4IDaVHhiZOS3Fwn
         m8grqBhwgy4B9b/AWPIz0tWwTCxv5NbcoxDvXCeaa/nyouCiViCktgpNHeO2deZ8EF1w
         I+PA==
X-Gm-Message-State: AOJu0YxGjX8S4nQHfNIo/mbrIotaUyNDU+fiMhjnQvkgNSOmSKaIDXTf
	SRGuw5ATj8oDqP1H2omVN9LTAZC73sg7eP2yTSOYas1yUO+X2g==
X-Google-Smtp-Source: AGHT+IFYKrhFgbRYAiEyPYoqEve1qSR2GT6wdqvLM/UdItQ5yRGST7HVQm+lQQheC7taXe1ZY76iPAlFAoLAEnpj6vY=
X-Received: by 2002:a05:6214:1302:b0:67a:96c7:4c90 with SMTP id
 pn2-20020a056214130200b0067a96c74c90mr4913500qvb.38.1704727812403; Mon, 08
 Jan 2024 07:30:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-9-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-9-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 15:30:00 +0000
Message-ID: <CADrjBPoBPrQh+73eqk_oc0VXFqJrLhY+BH4m9dFN=65QnpB4DA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arm64: dts: exynos: gs101: remove reg-io-width
 from serial
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
	linux-serial@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 28 Dec 2023 at 12:58, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Remove the reg-io-width property in order to comply with the bindings.
>
> The entire bus (PERIC) on which the GS101 serial resides only allows
> 32-bit register accesses. The reg-io-width dt property is disallowed
> for the "google,gs101-uart" compatible and instead the iotype is
> inferred from the compatible.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


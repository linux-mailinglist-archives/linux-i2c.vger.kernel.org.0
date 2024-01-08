Return-Path: <linux-i2c+bounces-1213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB8827155
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 15:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4961F2336F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 14:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D2C46456;
	Mon,  8 Jan 2024 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGqaF2MR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD58546458
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jan 2024 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6808c3938afso17492256d6.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Jan 2024 06:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704724206; x=1705329006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=us/CVEv6G9k9DQOG3dlOmhBFEblPcysaqhNz+rCQ/Uw=;
        b=SGqaF2MRmOPcIFyxwezOastuAeBZSpsSPiC4+TsD+th6ZYdUXkzXPa7eO4zuC+7KSc
         rFYqskt9GDrFmbcrS3lvx/edOAHGT/C1HIjfiWDGoPgl17rA+DikjMPdU2n0di7/ow1n
         eY/4xxH6KXLW9KlLOanJOfJRngoxK8hPqV7xObOSPjZmO3WCqwbeXz2FooiL1/csJ8rX
         9ZecwMjbpuRPv9UIVQavsCdNThaFNGz+6T/58fM9vTfUss7MJZ8ODDYzNlfkm0MmPsNX
         DriUdpbjgc96pLtWq6iHJ9Zi2Kl2HCheG9BODvSImImUVn7DZZACIuln9aAHbJVHHR+1
         UW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724206; x=1705329006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=us/CVEv6G9k9DQOG3dlOmhBFEblPcysaqhNz+rCQ/Uw=;
        b=IoHg5ruA5uh9yj/7HqXezQerkvzHKOm09sR9SToWHX8eNRUBTYpgCDeG6Y5/lGm4hR
         4IdjG9jFtXzaAxMJeNPUsBSXcqso3ZsPogBWjbsgKFHnUpsOAQj1wm/Uh0mox/qDGQ+D
         F23Gc3J7S27TNWoIt/zOZO3WCS0yl35EoriZD5iLsX9pLq1SsUZOl/07zz/z4oFZdvug
         SoWRRa9lU12vPbO/MfaFjVn+/Noka7/ixeD14kfuU348aInyjP/XPNFYIJeHAEDSjc4l
         5ez/gdV9iVh3RVJFK6jtCDkyYDY7FF+JCGjgM0J8LWYYCCrnGuIOvMkDkXmqfw8L3UKi
         pQoA==
X-Gm-Message-State: AOJu0YyqjtfVu/nu5MgXFJF17qOQW67qBLh1NH4jK+ZiLHnZmqujDMac
	IbBDxlT+9ayzj6jHC6OJpCUt4eHuXn9Qu5whj5CMp4+q9vs0AA==
X-Google-Smtp-Source: AGHT+IFjtzhQ3BfPSDEs8Agdj1p4sk1vFjnrvq9PUoG7FKgA33cadkc0hjK10VeuHBRIfWpXwQrhgg7VCPy+lRL1XnI=
X-Received: by 2002:ad4:5f4a:0:b0:67f:a6b6:f050 with SMTP id
 p10-20020ad45f4a000000b0067fa6b6f050mr5204636qvg.75.1704724205761; Mon, 08
 Jan 2024 06:30:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-6-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-6-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 14:29:54 +0000
Message-ID: <CADrjBPrGmi5Dq4dLM2pJDtFS6Zq72FqzvBEnu=1wbeehsODijA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] tty: serial: samsung: set UPIO_MEM32 iotype for gs101
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
> GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
> include the I3C and USI (I2C, SPI, UART) only allow 32-bit
> register accesses.
>
> Instead of specifying the reg-io-width = 4 everywhere, for each node,
> the requirement should be deduced from the compatible.
>
> Infer UPIO_MEM32 iotype from the "google,gs101-uart" compatible.
> Update the uart info name to be GS101 specific in order to
> differentiate from the other exynos platforms. All the other settings
> are not changed.
>
> exynos_fifoszdt_serial_drv_data was replaced by gs101_serial_drv_data
> because the iotype restriction is gs101 specific and there was no other
> user of exynos_fifoszdt_serial_drv_data.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


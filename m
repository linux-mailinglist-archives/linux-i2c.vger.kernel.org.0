Return-Path: <linux-i2c+bounces-1209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A86C8270E0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 15:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D38001F23120
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 14:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DAD46551;
	Mon,  8 Jan 2024 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7q0+JSg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E063D47791
	for <linux-i2c@vger.kernel.org>; Mon,  8 Jan 2024 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-427f21ced6aso15724201cf.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Jan 2024 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704723514; x=1705328314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ezznyb8/vx5+hfZyfj88KqUcvTty4zUAzZJ+hlesbo=;
        b=y7q0+JSglky8dwbo7fPHUAJZrkmcEW3YVv3Rqu0PrY+7plPdrqp/9eTiGoaMVdhvOh
         QL/EjqH84hKdZ7UuRJZztsY+YMjLeiXfj82UpPSJWi1mrdGljvKaC6xu2bZtJaFOEKhP
         kQmoZMqrXAV5COSZOL3cAT0Jb56G1loyJF+6aQyCHpCLH/gJP3E5l9tGeqNZsp2PeDSH
         Xrlii1D0+vn9aXLJ2p3LSp/PncI5p4XoA18K3hNg3Kap3Lvknzz8EYjToXB1XT8jlVC2
         5HJnFSugmbo68qKZjuT7zbYWDNptfuM33oznYKMZlVDWoSV5e+Rl0NSog4G/YYwW2L0v
         8fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704723514; x=1705328314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ezznyb8/vx5+hfZyfj88KqUcvTty4zUAzZJ+hlesbo=;
        b=PuHgNQ3TnuNfR7QqRXYr5fAZ7Bk9zOc6H2twqQJCfln0s3oO+rWVmLFDaPGqmVkVBj
         OD9IIds0MxpQIA7oC/wtmo7h/mjcV+7Kbi4FD67rXMckvtahB7KQLZJyhM6e+ZF3xGuc
         7AmU77L6eMfS7DIF/tzHGsIoO1vPyfi3dbBB14EhBYJ12qERrqgJJGcxHHWu0QoL2e6R
         qVDxOpMz4P9txmJkGe7THnMxAJgncFQwqWSdxbbpGXjOWfNVS/UsaobYdyKPUQRM17eh
         mrfkYsOospSf0PhCZw4dZLTktdkDnSdkcwqGuySnLe4oADWq/jANsq3jqVjrVdVp3Duv
         Ka+Q==
X-Gm-Message-State: AOJu0YzrlnswSdxPm5Bw8WJSx1DywTMqZv2VMCSxwzHc8EqlqQhejWEh
	6Ge3hcwyz51Fm15Ytl7PJdpSyGkr4hrM5s3fWhGsv+6iR2wa5g==
X-Google-Smtp-Source: AGHT+IGPjgYTxHMolIfwDbJJoI+7GNHNxr913C1/eJoHLVLrZVJqXMfjkqYykrGmoMDgJma1CoSyQSccprDC0VfOBi8=
X-Received: by 2002:a05:6214:29e4:b0:67a:a721:7837 with SMTP id
 jv4-20020a05621429e400b0067aa7217837mr4866809qvb.92.1704723513781; Mon, 08
 Jan 2024 06:18:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-2-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-2-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 14:18:21 +0000
Message-ID: <CADrjBPo8tARhHjpBJMABV3dqrd6AqhPVASTK5+3rSmoDA8eStw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: google,gs101-clock: add
 PERIC0 clock management unit
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
> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> clock management unit.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v2:
> - fix comments as per Sam's suggestion and collect his R-b tag
> - Rob's suggestion of renaming the clock-names to just "bus" and "ip"
>   was not implemented as I felt it affects readability in the driver
>   and consistency with other exynos clock drivers. I will happily update
>   the names in the -rc phase if someone else has a stronger opinion than
>   mine.
>

It would be good to get Krzysztof and Robs view on whether they agree
with the above rationale or whether they would still like to see the
names updated.

Personally I like the consistency, grepability and the fact the
current name encodes whether it is a gate, divider into the name.
Seeing 'sss' or 'ip' as a clock name in the driver code doesn't tell
you a lot without having to then cross reference with the dts.

Is there some rationale and/or benefit behind having the shorter
names? The only thing I could think of is trying to partially re-use
this file on future SoCs like gs201 which might be clocked
differently, but then these exynos clock drivers seem to be SoC
specific anyway.

Anyways apart from that:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

kind regards,

Peter


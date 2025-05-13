Return-Path: <linux-i2c+bounces-10959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB515AB5739
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 16:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D70B3B713A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 14:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083271A2381;
	Tue, 13 May 2025 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8gzNNuu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226A6199E8D
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146803; cv=none; b=Ji7k2lDnxeak7LSNEm6XjqtKeIBkf2JZdXl8f4QgDkqT5RmLAxEteDqO+gLL2nC/D4UA8UvFHU9CUV8FRhKGRfO1EkD/6Vnhn8D0yR58gcW6tEMhuO/QoLTkuJFz9//JAujp1zHm14nu5SnWpFpq52+X9qfxzCWwxUipt9UmcWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146803; c=relaxed/simple;
	bh=iQEF7nznmEycoRdRwifBr5zcStMelsRnNg7k+aa6KwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PX6DgVg71ZNm/HqqHm18o7tKowwdj2RBFHwJFESxhvQG1HqQAQFf4cQy0K84Vcdmox4RWsxKdyQhMkYSL9Cl1arXSmkheh5ZP+cZVPgIdK87UjhmIUAp4WTHGOX4QyBh1X0b6ihysQQ8CjgM2IFwS2fryUqDUd69J5f0IdjRYVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8gzNNuu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so3489532f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146800; x=1747751600; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=Z8gzNNuuEhC9ToJQBXiF5ZFqeeBi1WceWyKf71VHr6WiImWo31odsQdUVlm1PvTvsA
         lknjbDZB7X/B9T0zGlVhdfvQrpg9Ghr/22cTvMzDP2oiGvO2RG7Vh5AQcSgR4gj7EXti
         rvbqSSNBzQ8gtjBFzFk7JqoXHTmf2d+kglEP1IYmNsd635FGJ3uHY2U6lvYe9fPCvx3J
         q7iIngoTIvA4+HP8iab5vMXw4PnXlRq100/q/UbF40pJf23ssspCeS4gWloPRh1Zgukj
         3vVaLmrZqJn31ScAa403D2/XzpwahA9FDoMgNNQLzGFwFpIW5URs7hDIRj8GOP3ME3AK
         OWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146800; x=1747751600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6C+eOPgBkYyfSbaSp3zhH361dNsffIyxJdkkZYVPmTA=;
        b=Tig+EXx8MuvMHExMGrxehjPutdJX64r1H4sWHYn2cZ2IGAU5Ebc6+Esm6ds17NxGTa
         hx+riJ25qTdZbQ/4prAg6+Z4tdQuBK4CXuHcr7omYsEUxAFZMqV8XtyDCulaMPs6f9X5
         /kivBJpJx4y1K5IhmIL0p8U7DMaBCU4gq0XYxVu1MO6hRzuIOibCHv/rgntJ8mO/bL95
         AsbYiEAwiFk+Q91COM/KOKHzV3rPFTKN9WynesAWtw0CaNfEQy7v3t38WmuvR7iyPlF9
         H5y2rVXi/cKsZpMcOjgSfUfJwYuYaCuT8+oEdE0pol4rTV1OrH5cBLFsf9pBO9gdefTc
         z1Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVDVqs+6zBWP78uqxVT88EoekZSE22FLxxcAnAg3+MNzCl99QaAdt/laU+I02+h5DlUPpdIxfyiGpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDAKqXW6+jYtsPBKgpg3Elw65e6Prw6iniYM6LzKN/Ce4e5Ulj
	TMONhrgAhOd2/cs7cXfIWuMrSvfThScgy62xemcQ58qvNZvMX15b7+vieWLuui/DUPrM++6xq3q
	YeJPdOw==
X-Gm-Gg: ASbGnct7RRn172OfRUcJyyWunubLabVgLco4IyuJ6UDwTfaUjdVZ/G3vGCf2VlsfPKV
	XeQJO9OFGK1gnKsMiOYr1UR09jLJ3rEHW8ofo961PIQeWiwEReeaAOUxpd7r1BvS5CzXAQt95hE
	UusegeWiKmLxHlCQjLe8BMuKN3mJDj5y4PStueohFlNFddTiwJ6RH3dAgTnvbfMUxVsTRuVK4fb
	9+jxW/hYyeYwoCu04DPdTPHRHEvD91GFN32i9Dd3c9dUWJ4UBBnaV+ySs1G7R6DUqwPRU4e9qMu
	HdoL5sYk8ZNRibpnTM43F5XmzkXKe/bxk4mjW1Oer2tMvLnmXtvOem9ro8UP+ByIZaI8UPsBSE5
	RBB0rHJZ3GnmPD0a2AjJxJ4Op
X-Google-Smtp-Source: AGHT+IEBNTH4zw64AEMKKTiN2s5UEu33251ThUx0I1Ms2D2DvDbTNPIeVXC3gTvYmyig2JEqJ5+Vcw==
X-Received: by 2002:a5d:650b:0:b0:3a1:f655:c5b2 with SMTP id ffacd0b85a97d-3a1f655c5femr12440694f8f.39.1747146789207;
        Tue, 13 May 2025 07:33:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm16357348f8f.22.2025.05.13.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:33:08 -0700 (PDT)
Date: Tue, 13 May 2025 16:33:06 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT
 timer
Message-ID: <aCNYItP6SWImMvFv@mai.linaro.org>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250413223507.46480-3-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:34:56AM +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied patch 2, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


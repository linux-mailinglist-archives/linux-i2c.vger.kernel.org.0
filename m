Return-Path: <linux-i2c+bounces-10684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 960EBAA418E
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 05:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15FBD1BC73AD
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 03:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABAE1D6194;
	Wed, 30 Apr 2025 03:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuwZ7434"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD41373;
	Wed, 30 Apr 2025 03:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745985440; cv=none; b=UAkZk2sqFYI5rtXPQg8otYrmaQv+eTQCyS0/hB+dy+BnlOGgx6IJogD/paw0TFEIl79ozyWecISnRr+fETf9rSE0CS+K9UryVqArwwJmD4fgfOuEQwTEiwB8K8FCU+bCekzy+cK51MMZYP8Jrcc7XGx4LeSGT3L531A1W/d0elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745985440; c=relaxed/simple;
	bh=Nvuefhy7SkxmyXEjkN5uyEWBh1+CMbm33k3AWIeHcLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJuqnXecclNv5ylkR7SlhOVnctGSDlG+6XuPGDIORLb97WdNPdPw0ZgaKQQXln/90Z+IZmB9oCAlN0MaQ/xp9PYwVRK2q9EaCQcjJuJGLdQTOt0kgA7cH8PqJSj450mOsVBczwq3r/RZPh9jKbx1gZ8fIm6aDWUIYgngOqDkUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuwZ7434; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22409077c06so108937425ad.1;
        Tue, 29 Apr 2025 20:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745985438; x=1746590238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyLc3Zik1vXa0yun6h3Hm25QI+ZOjteMPcqNd+zv4kw=;
        b=JuwZ7434hwk0XRDnDqIxjk2jwyhIajJZIFVQvDdYfNorEMpX0DMddQXMxrpW36oxry
         W2Vt5Cz/3Yt5dgmcfap50Zi4NIzb+XgTZ6vS4fjnQrpqv4YGZdLoY1Ra76VfVBz/GxMI
         974e5vjKiXuDJmsaMpGQxJsFffybD50SBlmeFOdnlvflFXWEIunLCHHnUxDnWRa/twL3
         jEvEyZ81qQcsQnvP+kfpi7UYOAxytpi5JM6KUft3OrA6Fh2QvnYr71PXJIi0M6grkOSr
         bmCdJRPAw2oE00/ZPlkJhGGvYkCOFs66TUf61SyoT/w/Bspk68kXF/HDjtV5ZYeJaQs1
         go+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745985438; x=1746590238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyLc3Zik1vXa0yun6h3Hm25QI+ZOjteMPcqNd+zv4kw=;
        b=lmD49t6Lw+JSu1IHPKRg7am7OqXq8f0hhKqwf6G+pY/tC08O/CYRhln0f2UoIQHuRt
         EsWHi+tS0QqoJyKW/Bdsb1ro12gTXqYZke6O/AVfIRD6t7yxDhJCZhdAnYXjWEss/8Lq
         a0ma9aphYB9QTRPRAZZdDt+O025yUJmS8vBpHV0e6jeAPQ4eVjS0k38YtG8mD0hmtJ9v
         ySMZvX2rSbdBIlfeh3fwvFYxbdPPxRJ7iruZfKXqh026t3E5azLIf/GoTQR6xSfdkfyA
         AItZJoMimac3PN2/kv90Q55eFvS4/onTWjZouuXuu1NsOxnfXugjfgNcrva9YU087+ld
         n0aA==
X-Forwarded-Encrypted: i=1; AJvYcCUIQdhTr2OaI8xYYr5CflA9cqyooUoTCxKH1T6g/PYO8PGDTjkYitwcoA7ol3R6EPJ9WyxqmoDSr510@vger.kernel.org, AJvYcCUs93CBNSF7Uez+nmVeb4ZcCQnFBFXr9WqB2XR5Oxkupesh2GhIizes8Lw6NUXACmF7kqmwiCCO/0x4@vger.kernel.org, AJvYcCW4jbxhl8klzOpc+17wKzR4M3iXle2Yzm2IF6foglPq2xdvRHYWJsmF/2dzwjL6R78lKDWogXiq6lheRdJZ@vger.kernel.org, AJvYcCWY6ajZwZG5CEXrRjfdUkjRZlzILlKtdERs9OP6Kctly8Egi5XYsLDyAZtcm7Cn14FIlybxtFPUDv/j3rk=@vger.kernel.org, AJvYcCWj87wqkTgfRFzNQ6M+WL7elSi3H1T4OqtPHoPIJcPf2SK4Qe/4xYdbdlGQo/akBlAcAM3xRNEME+Iq@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLAfDn/aXMY00usU+YD+xfoB3p8wmRYLdT5QRIxvQhNN5rCFW
	Ny3dYvP/Yq8sudit98AKOAQEtmtwaDXrWDAZ9NKfCnb0Fjoq45or
X-Gm-Gg: ASbGncvp7lO4O0wimywMRH39b4GzXLJVVWad9SmrnYeinKgaoTSvXGDgAIQuwFpKzqp
	vsfb2RD0YXDGaRn75LpNuzGYlvslHWYdD4EFEnVOcjzYsCklLOR3lZgU6xRZ725igucoOm+BcIe
	ulA05/eNOFLWPHwwPXsk4DYugyKjN6PWCtF43NW7vaKhycOhUpmy7RYTc3mKFglDt3ElaRklVz9
	BRWP1qrDsXOrX0kyUBY1nglp5oEiZ46iVs+DJC8JtJslPV3zmIVwZ1wiD8ZZFprfvGQISqp/3fS
	NOXp/Bdz/voLczi3AW/BCjJesRLM9URzD4pO5CAaYiBMMgn5nAAEuA==
X-Google-Smtp-Source: AGHT+IEaMGTDmHzgNvzoHNMd9tZbR/u1Q5bg83MPGafcuW9LIhwRqcxCq0Nvid7OBBWwbxOwjAE/Fw==
X-Received: by 2002:a17:903:364d:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22df3576fbbmr27513405ad.37.1745985437588;
        Tue, 29 Apr 2025 20:57:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100ab2sm111814375ad.183.2025.04.29.20.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:57:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 29 Apr 2025 20:57:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
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
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <08bbfb1a-57cf-4133-bd03-147ce107aeb9@roeck-us.net>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-7-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-7-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:35:00AM +0800, Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
> 
> Add compatible string for monitor device of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter


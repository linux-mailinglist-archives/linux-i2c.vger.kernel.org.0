Return-Path: <linux-i2c+bounces-10635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE4A9DA66
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 13:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A0B9A2F5E
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30055198E60;
	Sat, 26 Apr 2025 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7uDT957"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3D1DE4F3;
	Sat, 26 Apr 2025 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745666654; cv=none; b=EMCsXlmJc1E2FXRT1XN6cQZoSMhgF2Ns5UNijJOuq4ZYGAshZYDzEsEHVpEO9qpYOIf1EViFifWtNkpL13GDielHd0m7UfkFM92ReWOcl5OSzw7Eql7ylQATZjU5ZnpXhl3uKI1dFdbsxoC8FJKimjjTSFGw+ik9jSTK1t96FMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745666654; c=relaxed/simple;
	bh=D56xyUsRNjS6kGwI5WFwC9fzpNAmFejvLD+smYXxh4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2KXie0zQr9Szpazl/uWyeSGTrY8uqYty7897KN2WqD7U1dzcMvg2BE2aw0FaB7Vk++EEZTxR0RcbInlBu059MIrjDI3emP33ntAMGyhS8FfXz53heMaYf0JU/xYQlXisHbsCfJ/diL2NUQAqvYhxkJ/Nu1YsRK4aMCt71oqrNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7uDT957; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5e2fe5f17so330969485a.3;
        Sat, 26 Apr 2025 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745666651; x=1746271451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqnzJpyxKOv8D4bjtcYPnfE8mIr/LA4bSJZ1glU6cV8=;
        b=e7uDT957IdMvj7RowpbWuXtZH6eGBnkIA5wpQHInNvhH+dEtcp+p7QZvv80Zdf9Zu+
         bZVP3J/ytal60CLY2O7O6GgfyskmaENIjsoIo6xt+vYoJFIjEcALmU2lxkWD+EfnRlpJ
         hsUEhyx5Bj5Cj+lCJka565tgMApXlMBbV7qqh8tU3l7DehGDTzfxXyhh5i6kuKyVMwVU
         p+js1tkbaRxQV/rR5NW0gKY1UWsDU0V43Lr6eIbWPZUj3qhdAWyzZGrq9x5wFenLW19B
         L+dLNa5h2u8WPFfoQoGwh4dSsIJf1dqUDOMe4dFkflpXktcoWs6MocQ/7oqtPYfFK0tC
         2h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745666651; x=1746271451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqnzJpyxKOv8D4bjtcYPnfE8mIr/LA4bSJZ1glU6cV8=;
        b=QApXOoOPS5AZG6BVFhPCc7VJoDnyAC2mSfl7segIcN4cxgcuzdBCTX4LRyqdf5+bxc
         x0EyXVo8o+auNFZTYyAMwG63PzmLG8M12HhW7uSNNFXNH7AWU8nUCKEPV+tKb/1l04bG
         OwpURPkrtLFeceMluDZPL/xfX+FIoK/OHCcME7QCAtwERehFcqXxW1+yzQs3e4A0XYYC
         n8qloNWTKZYzuj9PDinnOigf0p+k72GJW30/5c641YdnT2J4pvlA+voNbEUBJRG+iRKp
         Kk7kqjPR0lbUewFN/+AZeZ1U4fvFWw9GwhrroF5PObzrDbLsVSaiGVSmohTvAdPgX5v+
         i+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlUznq0DrWVnDV+XsTX02NVzknSmxTENUop9MS2rq8De0hZ3qRGpn4jmOM+humEU+vXqOZeAp4mFUWlQsH@vger.kernel.org, AJvYcCUqj/SCVoIh4/f3YDmgL+4dha3XzJoyct5UofP5Vgy2supDIX8e93FZI1cL/Ecm3rNwqLnOY8BlVgfL@vger.kernel.org, AJvYcCVEbeSDFKoORc7FMpTvFHCh90UcBYTfAU1VCHW27iohQETdyfqpnQrQZqpTpstXgwhJ0tACroz+3gKB@vger.kernel.org, AJvYcCXcM676fNq03EStAySDszAUKnYlUooGRYJig0XRjDKPNa9MeyzBAcvBD3Lr6spiMcLwGH8AEF1AmSpG@vger.kernel.org
X-Gm-Message-State: AOJu0YxfN29lvRR8T0NCwriFwzuygkNQMSC6jxqTABz9btAhkWJHzuKZ
	84iU46l5/PBzBuRWC+IInqr0teZjc+i74/HYQphDc0DF+izMZuqb
X-Gm-Gg: ASbGnct2C8sK+yTPT74Ds4z9nbCdzj/cqIqjIVdYlS6icdZyARyTxhG6gN3kItyJCgh
	CaYGwWWsofB0wswszITWqW73M3hvPp0chCEql3Aw/wBYclZtYEY9BpRSxkK5M3ZoKLnMhg0vkUW
	YvkL6ztif417EkcBy1+em87BVbSWIEPT+8+TK7TfKQ9LGitvVWGHOxUNeKYOb0i6uKLZ2pJkVlH
	1CuxyyDNsXnBWGf1o48oDiQHSAJ30diqu0kngJ7ualrX44KmS5ed/xuWb2Zdc6aUh53i9RkOLx2
	vG7OAAfpILiduy8W
X-Google-Smtp-Source: AGHT+IHTJyjJW4zRKKH13NlfTIwZIg4GsuvT7hEkrKwp+YV3SS8iaJApxOfdun7TkRMs5S8LELbrRQ==
X-Received: by 2002:a05:620a:460a:b0:7c5:562d:cd01 with SMTP id af79cd13be357-7c9606f9a48mr802679585a.16.1745666651286;
        Sat, 26 Apr 2025 04:24:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958c91a10sm337284985a.22.2025.04.26.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:24:10 -0700 (PDT)
Date: Sat, 26 Apr 2025 19:23:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board
 support
Message-ID: <2feyvebloqdcxxzmywe6azmwnz7zqulh2lixhw53ciw2ldisch@n2q3duucrp2r>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Sat, Apr 26, 2025 at 03:36:41PM +0800, Chen Wang wrote:
> Hi, Inochi,
> 
> Will you apply this patchset on sophgo/for-next? I see there are changes
> just about dts/bindings.
> 
> Chen
> 

I can only take 2, 3, 4, 9, 10 for now. The left I think they
should be take by the subsystem maintainers.

Regards,
Inochi


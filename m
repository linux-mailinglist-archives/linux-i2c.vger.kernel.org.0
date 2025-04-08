Return-Path: <linux-i2c+bounces-10200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32152A7F279
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 03:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46C29174EDD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 01:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B7184D2B;
	Tue,  8 Apr 2025 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0iJ76x8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D77801;
	Tue,  8 Apr 2025 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744077007; cv=none; b=kRuSCjWjTgqNhSTwLp6kTVP4zTDhkIow3+8DDXK6S/dub5vxmhxyjTTJDWk/mKfghGYIkoh93ofze9PJ+PXUrQ9gHeZFONH/9i9rmBj5r6Lrs3WqDiOQ3UyQ/kGjBPrfNeTMx4OYAihFg9ovzGwD0p7BWMgvYqGy/6pNyB7A8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744077007; c=relaxed/simple;
	bh=prcFP3cBCSl+6AOIebN1d9RvItjmT67etGz0szTiOs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzL0tOegosKUI5ai40LfBQ4YwICYnib2ZoHZ1PuLST5dtlVqmX37/jOH5o7iN2G+TgGOG/XUVrm9oPvg453d8W9AEMuQtbOwIzyZn773KqLrhfqaHtVb3Gg9ZM2LTfcyOAMMIdPuLcms1Z7qFFJx7suoWQJVaupNBLB+auD+S/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0iJ76x8; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e900a7ce55so75680726d6.3;
        Mon, 07 Apr 2025 18:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744077005; x=1744681805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wA0C35qf2r5ulHhjFJvznSvn1eaLA3vowI+Z+27d7UI=;
        b=M0iJ76x83Uc9cD94QuV9f2WOzH+AToJOQJ+hEpZtTAmuclj4JDlO28NzrAf2/GLoUr
         aXIpjxU+Vp6DFZYDsLToj9mc1tqdSUPlb0nCY8Q5EVWoHTfYMuN1VyYTC4186uKr91gD
         rkJ3ohkZApz8nwj7hjqbLN5h8oIsEBbFe9mwDL38pV3OUdKSSwbBTpPSVhCprEsv2jtj
         8JTZsNgYz6GZwMJX7MDQ/agcT7cku/n9w3c2pyj1DA3h9C2a8RUjZx9m7OiUBMLQGS8Q
         S3s0Nq0KtLFCWpXSayHRWdd/DBkDZMTB/BtmqGp6j9WE6Zeda6ahd1tjJG4iDrk83XfT
         nFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744077005; x=1744681805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA0C35qf2r5ulHhjFJvznSvn1eaLA3vowI+Z+27d7UI=;
        b=vLc44uabvYUCzzJ1VyvUBATH/N5DD28tUUjI0pbbHUFvfNpFh8Pnj3PfN/wofzNlHv
         BOfr02zfIDf5rqhioddpUC1V8sNHF170C1YFEyKLIhgva4wHGx/Mk1O8b19afJRTLtAM
         jPo72f5uHJMxpEGWvZpTrtkDwDPuq6yQf8mjBsEsINdPMCQhSV+z5bf9rB24MWiDdSm9
         ixB14c++k3Qdcgctq4iOQx3fZhUwCY72F/Z+rj1OdnVSamZkvWoQiVP3g8NKBUvG6CNj
         w9XrbyT5XrYy/pG7TJMwunI6a4LVX2uFxS3/nqv/7L1jMp2LvE7kGDIPaDn4uzvWOQhu
         b7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDjR2R4d4Jh6wgcx+aOEtS5Dt90w1mSBl4saAGpIF4UIw8uOG4GbdTNazgQZ/yMVkVTkSn4GholBK+wqAi@vger.kernel.org, AJvYcCXEM/8H3eQo7j+lbqqC0iDGCxHEwAG/Bd9DNonH3WHhMhM3BRORTzjArRLlNfo+cNp86fW1Hsz6sxA5@vger.kernel.org, AJvYcCXgEy5z9NdcTkso+nF2nd2lfYiGJIb1RjPG0p+H8rhbDU/kihJbRMfsFidbf3+VcaZQ4r9yPo8mviFG@vger.kernel.org, AJvYcCXy5BGNrzLCTmrD9E/DpCFHpIKa7z8uv1gnMje7GM/D9SJ/3KqLkq5wazwLbvAcxc4hgjbN1emMEhW0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyza2U+qF8kOxy0/Rqv4YBs22bTqrL69cx399f9nyiLf1U0HiVB
	GKhkrA0iUawdvNl+nvPcSApDh1IdEpkk0/UHYWZgfENGOqJbfb/G
X-Gm-Gg: ASbGncv7dcy6xym5JU/HM0o5UjIyUItmL1ns2C25i2EOB+rfNgUcmrp7A+7UGEHO5m+
	1bBgGuUBcfxU2yZKlu9bQCFncdjq1rZteVB/yNF3in5xh0Os2ksQ9V2UoZPbcOkTuuAGsfMCn8v
	io81o3M5hyGATPuaHbuWosBigJ1V6qQCfZAJhHI56+y4JzAdtUIS+iUnMlHwlaMRsZ8P2BbMkS2
	ztXvy0vRzXciNmH9tUOk3A3J29MpMd14ZIEEv6pnDq6C2RaV/WnjwUT1hVLQV8D1xCBdk6vLFkm
	N44moXWPYQdvp8dgNRbGfJIhHxD9Bgs=
X-Google-Smtp-Source: AGHT+IGKXt940d2WnT5dZ67Npfj4M6ycvJnxt5e+7ElGZNZ74lDTPp7xT9blL1C5HT5rNhqMbcc+BA==
X-Received: by 2002:a05:6214:21a6:b0:6ea:d388:dc09 with SMTP id 6a1803df08f44-6f00de70533mr215421436d6.8.1744077005257;
        Mon, 07 Apr 2025 18:50:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0efc060asm66725596d6.1.2025.04.07.18.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:50:04 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:49:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <4fhs7v3m7qdyfpqxllm5mbxqnr5i2sa4jkqnwkwnuagky7ql3l@q6o6ohvpgu4h>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
 <MA0P287MB22628DD45C86FAD169AEAB15FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB22628DD45C86FAD169AEAB15FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, Apr 08, 2025 at 09:40:53AM +0800, Chen Wang wrote:
> Hi,
> 
> I see reset ID in sg2044-reset.h is continous, can we move this file to
> include/dt-bindings/reset ?
> 
> Chen
> 

I do not prefer to move, although the id is continous, it describes the
hardware abi not the software one.

Regards,
Inochi


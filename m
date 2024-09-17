Return-Path: <linux-i2c+bounces-6824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE197B0C0
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 15:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B161F241EA
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05A1170A0B;
	Tue, 17 Sep 2024 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="tInRlTsU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06A156883
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726579716; cv=none; b=cRvtPo397j7afEANMXRNxpGp0FQKYvWNcfh7deQyWFzlACC8Sj1f25BghOlF48adRZS80TqJcOw0+LDW2U6q8exw1oNSE+BRPVojL5DIpBeWh2AzqUKmqb+aaR+VPhjfm2a+x48EI45na3UgrLN9Pvvdpi7sNDvxzUlEGiIOwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726579716; c=relaxed/simple;
	bh=z/QlTYHj16cG15b0556RWiV9m/fJsfLUu7T9utUH3Mo=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ALz0LpdZ0kW7jYBAa57SPUy59dfPDRe6PPhlE8lXMa8uRZNhzIEsfTtIQ4bMPX6s/VpVPZJIKCRyoHwfTXxfLfUyZQXhjDshzd3FdpteatJ8DEr5z9Q7LHfvM73FRbCoQs9jzX7C/41eLE3rHJsAoeNCmHXbD09LSI+v4IWpmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=tInRlTsU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718e56d7469so3403647b3a.0
        for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726579714; x=1727184514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSjVIhSmfJ0CyaIM/a3SSB+ZCJQA5N7E16cyTDPSeoc=;
        b=tInRlTsUc8zkkekyHrwxTnE66V0D1bKJc0KcnjOolKj43ibAPgFxJSg2k8OgXEh4pi
         HK02RvUQyw4w18kJ0/qoA8IjXslivxW3tmYZqOTSslxPPCfKRwnnMNtpuSFJZ9Ag7ar2
         59VFe2RIGv034jUXS1GBsvLs/bZ1pKQ6fOfjPQEa9odwAhSe55DpVq+d2db7gD0hs7Ps
         hq85D7Vnx5WAPUxdR9pP/S4XRJ6R4ltZBfoX2M5b43/kdkEojCuBIMIa8lmK1b3acg3P
         X5gR1n5PEQGj42RqJ0/skCgNKqGTCweYdSJwI56NOsCd9UUsOtZJV4DC4aqj2MN6qvux
         Mbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579714; x=1727184514;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSjVIhSmfJ0CyaIM/a3SSB+ZCJQA5N7E16cyTDPSeoc=;
        b=woIRbUa9Yw4womXtwn24cJb2ltO30clu1rYV3fDtgg9hBJtXptG6b/zdVQoLgjDVfO
         3fzBf6HeZ7CUuo90ws5p49N1XAR0yH+7D+8k5o9w4Zrr8gbdZj1aUkr5O6I3P5q+X0l7
         4bPB19/HvGE7dUbTflmucMkDE60IWuXwwF47rCHhhqrVYyFNSc5Dg4SjNsUe5fx1L2YU
         daa58mnv/QZk30IVe+BM/ETd6mRhNDyKL7ie4qIbpqEjIFsOFQCtrat9QezcXmg646L9
         /XCUZVO5u7zHyyYcCf6Mm4pcUlNCX7SNth+/iikX3amkB+fPmKHcpXGmKOmKep1Q/ccI
         zqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpznIBML1tyUAkovRsrYk0V+ouYZekEmh8LnS2LEO21ankt4uuSCREfybjAjxD+R4CIqe+nKQYQyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5HzHYdQhoj/ePMVqUPdfodvocw81CVtXdMtPoiO80Tr1ywxP
	ALnKheOjWHJgqOUsFD6kIA3FQbQ8e/CSFJvUiJUZkLYU6moZOt5xChOIhjdcaWLc1dW+rFl1gof
	k8tXgkg==
X-Google-Smtp-Source: AGHT+IEDqJbKpA6LAn7lxbzNxohHyNQyKe4VpZi839U/YbK8TEHIC3wtGjjJt3DVKNnGqc0aqDaaDA==
X-Received: by 2002:a05:6a00:854:b0:718:d94b:4b with SMTP id d2e1a72fcca58-71936a2f634mr25905784b3a.6.1726579713896;
        Tue, 17 Sep 2024 06:28:33 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a9809esm5146960b3a.39.2024.09.17.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:28:33 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:28:33 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:28:26 PDT (-0700)
Subject:     Re: [PATCH v2 5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
In-Reply-To: <20240903142506.3444628-6-heikki.krogerus@linux.intel.com>
CC: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
  andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heikki.krogerus@linux.intel.com
Message-ID: <mhng-c9a63485-1f83-48c6-8840-accd5f97d237@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 03 Sep 2024 07:25:04 PDT (-0700), heikki.krogerus@linux.intel.com wrote:
> The dependency handling of the Synopsys DesignWare I2C
> adapter drivers is going to be changed so that the glue
> drivers for the PCI and platform buses depend on
> I2C_DESIGNWARE_CORE.
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  arch/riscv/configs/defconfig                   | 1 +
>  arch/riscv/configs/nommu_k210_defconfig        | 1 +
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0d678325444f..a644a798f602 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_VIRTIO=y
>  CONFIG_HW_RANDOM_JH7110=m
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=m
> +CONFIG_I2C_DESIGNWARE_CORE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_I2C_MV64XXX=m
>  CONFIG_I2C_RIIC=y
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index af9601da4643..87ff5a1233af 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -58,6 +58,7 @@ CONFIG_I2C=y
>  # CONFIG_I2C_COMPAT is not set
>  CONFIG_I2C_CHARDEV=y
>  # CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_CORE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_SPI=y
>  # CONFIG_SPI_MEM is not set
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index dd460c649152..95cbd574f291 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -50,6 +50,7 @@ CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=y
>  # CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_CORE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_SPI=y
>  # CONFIG_SPI_MEM is not set

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

(based on the rest of the thread I'm assuming you're taking these all 
together, which seems saner to me)


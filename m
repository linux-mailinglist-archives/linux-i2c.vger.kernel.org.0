Return-Path: <linux-i2c+bounces-10949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A863DAB4A6C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 06:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F09D67A2B8E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 04:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FF81DF987;
	Tue, 13 May 2025 04:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdhnYKmD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2161C8601;
	Tue, 13 May 2025 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109953; cv=none; b=fhPQ6sV6Wp2RMS95TfOS6I7S8e3gPF/YyFEtm7mLKAHVGiL9ztzavl31+zl8k8tDH8WG9me3WC1D9gdGleBev1kvvgw/1vJp+oDy0lBJSSKkigibDQVxOkdSlAXEWFgngM5Mu2oKFqQ1+uyn6x0bBLpIqjPR/UizwZMK+I9F+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109953; c=relaxed/simple;
	bh=T+3x9Od6e/lqvamBfshpd2ms4FrKOSPZgnkhArtmF8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aEG/Sw81ZjfX5GmU+JJFHdToKjGNbnf4a5P19CP3ffi0FrBbdPaKXSi+qlnmLNuLgUTUNe5A25iCa7Nh2Nbs3Bb3uvmnpi5m9ZjIfbpUDTlBQLHPAChZa78UnBb1lnyJ6bKk18TNa5L93EXFucAhkLLBuozg+f9NRkDdHPOkeMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdhnYKmD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c55500d08cso571756085a.0;
        Mon, 12 May 2025 21:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109949; x=1747714749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbE8qOEQ8Cewj2pW9YzTwebuhpk4BnHjgjL+T/zo0qQ=;
        b=BdhnYKmDhujv+fpU7SDwNquHJHVcECZf7DgngjcNPhWEaWoKQg23zM47MfBClh455o
         94Xwp3uBfXsVmc+lZuVSOe36O5PL9hxtl4+jxpGcsMTR+YY7W1muTLini5l3mSGxqkes
         L3wAiu8eRFtl2VsQM7CKMedW1vcpLmXOL91govBQ0jYZsN/8mChqNUfI8U/+18qnXAMo
         QmUHnZzLeDG1ElAD6j2qKcBQE7KqX1koiLxpvuKoFYrdGbrEwPLbZPQc/Fz966Nd45sG
         +BnOhGn8VA3MhNfkhr8IzqRTO6Yc7q3hQ4sr64/LRmNiWpXjTKZZJeVa6G9jT5Dric/E
         zyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109949; x=1747714749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbE8qOEQ8Cewj2pW9YzTwebuhpk4BnHjgjL+T/zo0qQ=;
        b=COEaupu+ZA4lzmx4PMJ7FWtlQFjZW4YS3CW2WpyR5tmYWhpihmJQrVa40POE6OHV3r
         ymwtxLWhRzCbEhbZwvdvpXKNwkCsexFsf1s3cA8fTEDuATjMI7uFCJPf8bma/X7WC/NK
         +KjgfFzSS++EJQXbMdRb0Sq9PRnS8J9HdzXt6J5XxMebw3Y3P8+i893YWclrVxx3zteF
         jXB3FTpUGclmRzeXjX2/yErnoSGS5Pp52+2b1uH51wgkrqaIqhuIRTvzd9A6ejJh7fXn
         DejJ7NIrg6fsgo/36s1ZtvbNlW2DhH+/00U84l7ZnPUPdoq956zfRuR9pAJdM0NXyY75
         Fr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCZeMwz4z/ToHkpVB8i7yQ0Olk0DeqYmDRaQAcUCU7JJfMKZl4wELA8ziAD8seKlVTvxQPUEK/fq6x@vger.kernel.org, AJvYcCVHUdRTtHgbX4Rurc6YkkdCuY//3zS0fwxhmtwTeAEDo9qq44BiAasdb82AkxVNcAcgfUbp40cAAx8Bu0v9@vger.kernel.org, AJvYcCVLAVtoNHeRL7/b6EOUqlevHMdWO1504Xw/1SWHrWTvMK13Koz5lqzSuKrNsafOscTw82iwkMyip79F@vger.kernel.org, AJvYcCWHOUMwl8oH1kCmRDDuOlBFzi7Oe4Egy6gTDwCLWkNVtETzOvday5lXos4wvxXyAwYaL3vfj46kleKl@vger.kernel.org
X-Gm-Message-State: AOJu0YybwKUZd4B1BdErcb6f4zO0UpWm9dDL/or0e/FDvdmynQYS4x5l
	/RYXDknvly6b637c0+qy+wXPv5fDotYrkV6NWKZZoTJ/WERmKnHz
X-Gm-Gg: ASbGncukiKqSUGfTltsJCrKQf8gL7PIXT2al5AKfwP7/Or5aWRfdclBB2CHICethDdc
	eCJGZbscrFTbLi8xogeTj281qNENlQHqHUjQtoDxKeZ6u7xq9baQfypDEGLxD8MScgbPDtfgM+L
	F/5dNtld0vz2JVdaUsjrVO0w23fb9lnAoGn6tYirLlwLClvDG3CnzFDlynE4JJjLUnM+t35Ia9v
	e0ErLHuhDK3VS/adGeUHARJ/RnXIc6epqUr7vGF61RAo2/8xChwu4UGEUnkIXcCzDMoVNOVyGla
	lm7Do7DM21oZIARwZSEDFvAS1iI=
X-Google-Smtp-Source: AGHT+IGaGXEPNSY7gDD/YfTu/S9mOVv0B4S4N0WdSovqwATeGF5yrD8SEU/YDNwaJa71opCgKDqwWg==
X-Received: by 2002:a05:620a:40cc:b0:7cd:1ebe:9ad8 with SMTP id af79cd13be357-7cd1ebe9b28mr177227385a.10.1747109949442;
        Mon, 12 May 2025 21:19:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f6423esm652274985a.30.2025.05.12.21.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:19:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
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
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Tue, 13 May 2025 12:18:22 +0800
Message-ID: <174710989164.597941.2410446871539052309.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Apr 2025 06:34:54 +0800, Inochi Amaoto wrote:
> Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
> This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> 1 microSD slot.
> 
> Introduce basic support for this board and Sophgo SG2044 SoC
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250407010616.749833-1-inochiama@gmail.com
> 1. apply Rob's tag
> 2. patch 1: new patch for grouping all similar compatible ids.
> 3. patch 7: remove unnecessary compatible check
> 4. patch 8: adapt for the new patch 1
> 5. patch 9: fix copyright e-mail
> 
> [...]

Applied to for-next, thanks!

[02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
        https://github.com/sophgo/linux/commit/1e76b39eda76f7317ab75dacccaeda5a5b02c519
[03/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
        https://github.com/sophgo/linux/commit/a3cc46f7925b6b48e80c70815e3f637abcda77b9
[04/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
        https://github.com/sophgo/linux/commit/a7470f20e271203494b4cd427e687c12649f0087
[09/10] dt-bindings: riscv: sophgo: Add SG2044 compatible string
        https://github.com/sophgo/linux/commit/9ee1f97cf3e1743591ae76324d96082c8fb496d8
[10/10] riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
        https://github.com/sophgo/linux/commit/c8b1ca99c8485036cefa962aead3a0c57cb27d3f

Thanks,
Inochi



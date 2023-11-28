Return-Path: <linux-i2c+bounces-511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93A7FC03A
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 18:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4402B21551
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 17:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC64D5C08D;
	Tue, 28 Nov 2023 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF37C269D;
	Tue, 28 Nov 2023 09:22:33 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1fa48ad4e99so1420959fac.3;
        Tue, 28 Nov 2023 09:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701192153; x=1701796953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylIoRbnL8O2xTi9kh8EQEUoiv0UEt3VeCCDvVQ1Qxis=;
        b=NMSE2dw4wIB2A1zYg8RwwsmfuFq540vyBHlnhggpEDxaisgW1HTx0TGmVmZnQdqNZD
         sJ3UC2IFp7Jw1WCBeub85j5jKgEifMFwaZuTFfKNFtjeGmPtgD5Nt4AWnVjN1S+Kx2oe
         W+J7f/HlRWRO4jPO020SvQyBMVsAO99AesH6EJ1ncQN/harTXfEIli1156Wyj5lD7BO8
         wOM+RkxKj3AQFJ/hVPwD1USa4g9tJ7iJ1h1je4LeStEslLFoOZNvlFGxghDGyqdTqzts
         Phu4jh4TBJrNco1D0dKl0MycKJLghXfgY4a6PQUsfOsC0FFLKesx1w+GzrkxZ4QrLlcx
         nEXw==
X-Gm-Message-State: AOJu0Ywprt8gysvflFBl29YIjTGmeyy1h0zHE+1WCSgTj3TvCCqx6lRV
	ms5hvbAQn1sqD01cZnZ1qA==
X-Google-Smtp-Source: AGHT+IH4uka2JL/WD6JdYSwixPfHea2oa+Zs4fHCxwHNRKroPU5guvcL/77MKRhVhFrmIBEkbZ5BZw==
X-Received: by 2002:a05:6870:1e87:b0:1fa:38da:c145 with SMTP id pb7-20020a0568701e8700b001fa38dac145mr11792667oab.42.1701192152638;
        Tue, 28 Nov 2023 09:22:32 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id wh32-20020a056871a6a000b001fa3c734bc5sm1427658oab.46.2023.11.28.09.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:22:32 -0800 (PST)
Received: (nullmailer pid 3528242 invoked by uid 1000);
	Tue, 28 Nov 2023 17:22:30 -0000
Date: Tue, 28 Nov 2023 11:22:30 -0600
From: Rob Herring <robh@kernel.org>
To: Roland Hieber <rhi@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Li Yang <leoyang.li@nxp.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marco Felsch <m.felsch@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 4/5] ARM: dts: add Variscite VAR-SOM-MX7 System on Module
Message-ID: <20231128172230.GA3523780-robh@kernel.org>
References: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
 <20231127-b4-imx7-var-som-gome-v1-4-f26f88f2d0bc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127-b4-imx7-var-som-gome-v1-4-f26f88f2d0bc@pengutronix.de>

On Mon, Nov 27, 2023 at 10:11:05PM +0100, Roland Hieber wrote:
> From: Marco Felsch <m.felsch@pengutronix.de>
> 
> Add DTSI file of Variscite VAR-SOM-MX7 System on Module in a basic
> version. While we don't have a VAR-MX7 development board at hand, we
> will use this DTSI as base for a custom board in a later commit.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Co-developed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi | 607 +++++++++++++++++++++++
>  1 file changed, 607 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi
> new file mode 100644
> index 000000000000..29b9b9305b81
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi
> @@ -0,0 +1,607 @@
> +// SPDX-License-Identifier: GPL-2.0-only

This license and...

> +#include "imx7d.dtsi"

...what's in here don't match.

Rob


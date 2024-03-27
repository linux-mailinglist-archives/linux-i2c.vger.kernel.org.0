Return-Path: <linux-i2c+bounces-2636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E088F09A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 22:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72641C2A05D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 21:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C0E15356D;
	Wed, 27 Mar 2024 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VnEGkXgg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218D13A3F7
	for <linux-i2c@vger.kernel.org>; Wed, 27 Mar 2024 21:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711573526; cv=none; b=cm0VQyHa6seUR8XfmWBhDkJZi3wJ2OSyrYEGJIsPF5p8WZEL0D/r8hM9NkVw3dDdVgHZ/jaylIKA3YBsQtYbNFcm1QTJKRI4lo94WMZJ9bOq0ZQ3EJKiqjP4ofTkB5gMmxTuOkd0shA3BgcJEEg5LugEIDCmts2F8578f1Ps25c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711573526; c=relaxed/simple;
	bh=QFfCU2ShjmjmejolYLNR3xXPEKKaNd0/8UhyYa0TwxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mN1BPPHWxq5REiGlwJ0jumR83cw4bX/tRgSG/JPsu49VdId2ic+3L0H5OwMAQwWAtNSI1VTGv3JTDukUSiyKx0i/x0aY+qzFpPgVcClIQKz2C2BBAbu7A81iMSNK1clHHpcwhLEOkR/pz35MqDBEDTV2EsWnFBraEyO8y1PuUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VnEGkXgg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4e1566610fso17656166b.2
        for <linux-i2c@vger.kernel.org>; Wed, 27 Mar 2024 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711573521; x=1712178321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kvroJO6bsNvnGtvMGrSLScYHhDXOfSKf/BJavmfHO9k=;
        b=VnEGkXggk2CkMMagQO2wSMkXkcQ695bFLM+cmDpxCDYXxVAVDi0n+uCoqGuQACDL/r
         hY2kX/6sdtl8GPIZFBfgDF78dd3tI0O8fiZwK3U7lDh2DThaiGHo3WZQjspw2fV2/soH
         FeO8A0ST/J6psbHCD/WYbtW3pWtdakrIhO/wDscAneHa++5Ojgd53N99W9WufZiy4gjU
         tAIEKLgwSk3Mj1eJYq661z6WxuZciRAHb/ZxGI/f12cQG9ajyLHSbpzc9t/VIPyJIwwT
         RMtDB7n5kVf4qNt4b0PclCz4BYBQSoPOezRI+ryoIQWqKA+ANywOh8ZXYhcwwbgDjlGa
         h4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711573521; x=1712178321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvroJO6bsNvnGtvMGrSLScYHhDXOfSKf/BJavmfHO9k=;
        b=ZF9Kn3VSStoR6JpBUn/k6omjLcbKevrSCDhg1aBfEZeXJ3Tqk/Vg69gp3RjaDUNUiH
         x2PeF4zgjBb+tY4dqgzl7aj7TF55JUFA7UsKx+VAT2k7g/DibL7slzvI9Imlg9y+LMC1
         2AfPznB7pqh+fEcJKOp1gIfJB/PgM0PzYKc3fz6bCY0DJzAFfvR5RdlZ7i2qJlcWqhod
         mHzbm2yu5Np80+27rWLZNlGzEYJa6yr4LQ1JhIN1bvSkSZFBWPJdTh2V2243w07NhhJ7
         lhYNZ1MctpT+RLfiMjmZOBEfyu8eoKIPKApciYbz7kawHk3YT8G2KXlQmga726fWTGbL
         Wejg==
X-Forwarded-Encrypted: i=1; AJvYcCVJdjOHDtB66XXP28tBAKm3JWBubRaPri1q6rZXGwEYQ1TBCpDx57ius+eMjuknw8Jp1wBgbQN2clDkEdmFa0EiS+Iiig62ZDve
X-Gm-Message-State: AOJu0YxAGPfFY/GONv6eY3AzbF9+UvVM65Rwu2rAFlNdi2A1L352oUgG
	u1I5v5v7MAF7fX1P9sg6dl14DYqY4vhEJuuybSlIJa/ZSS1jjihcM+dArco7UDw=
X-Google-Smtp-Source: AGHT+IF6t7YYt5GlUd8lfYhh2av2vkxIM3TOqXNXPaXpHlhre1V2wxY1wrF1QXdBb2kLUPzUW8uZaw==
X-Received: by 2002:a17:906:46d0:b0:a47:52ff:194d with SMTP id k16-20020a17090646d000b00a4752ff194dmr441490ejs.35.1711573521467;
        Wed, 27 Mar 2024 14:05:21 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id xj8-20020a170906db0800b00a4a33a9f077sm4089735ejb.11.2024.03.27.14.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 14:05:21 -0700 (PDT)
Message-ID: <ccb312aa-3c4c-41bb-a3f4-b94971edb346@linaro.org>
Date: Wed, 27 Mar 2024 22:05:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Add support to share an I2C SE
 from two subsystem
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, andersson@kernel.org,
 vkoul@kernel.org, andi.shyti@kernel.org, wsa@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240327101825.1142012-1-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240327101825.1142012-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 11:18 AM, Mukesh Kumar Savaliya wrote:
> Add feature to share an I2C serial engine from two subsystem(SS) so that

from -> between
subystem -> subsystems

> individual client from different subsystem can work on the same bus.

client -> clients
subystem -> subsystems

"work on the same bus" - access the same bus? Does that concern both
read and write to the same slave device?


Please give a more specific example. Could that be for example APSS and
TZ?

> 
> This is possible in GSI mode where driver queues the TRE with required
> descriptors and ensures it executes them in a mutual exclusive way.

mutually

the "it" and "them" are confusing, could you reword this?

> Add Lock TRE at the start of the transfer and Unlock TRE at the end of
> the transfer protecting the DMA channel. This way not allowing other SS
> to queue anything in between and disturb the data path.

'Issue a "Lock TRE" command at the start of the transfer and an "Unlock TRE"
at the end of it. This prevents other subsystems from concurrently
performing DMA transfers through the same GPI channel, so as to avoid
disturbing the data path.'

Would that be a fair representation of what this is trying to achieve?

> 
> Since the GPIOs are also shared for the i2c bus, do not touch GPIO
> configuration while going to runtime suspend and only turn off the
> clocks. This will allow other SS to continue to transfer the data.
> 
> To realize this, add below change:
> 1) Check if the Particular I2C requires to be shared during probe() time.

This requires a dt-bindings change. Had you run something like:

./scripts/checkpatch.pl -g $(git describe --abbrev=0)..HEAD

you'dve noticed there's new warnings.

> 2) If shared SE add LOCK TRE inside gpi_create_i2c_tre() before first
>    message.
> 3) If shared SE add UNLOCK TRE inside gpi_create_i2c_tre() before
>    last transfer message.

You already described this above.

> 4) Export function geni_se_clks_off() to call explicitly instead of
>    geni_se_resources_off().

Do we expect other SEs (UART, I3C, SPI) to also support this "shared"
configuration? Would it be beneficial to make the "shared" cases common
and bail out of geni_se_resources_off() early if a SE is marked as such?

> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/dma/qcom/gpi.c             | 33 +++++++++++++++++++++++++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c | 24 ++++++++++++++++------
>  drivers/soc/qcom/qcom-geni-se.c    |  4 +++-
>  include/linux/dma/qcom-gpi-dma.h   |  6 ++++++
>  include/linux/soc/qcom/geni-se.h   |  3 +++

This is a big no-go, you're changing files across 3 different subsystems,
you must split this patch up. In this case, you want one for dma, one for
soc and one for i2c. Check ./scripts/get_maintainer.pl <filename>

>  5 files changed, 62 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 1c93864e0e4d..df276ccf9cbb 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2020, Linaro Limited
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -65,6 +66,12 @@
>  /* DMA TRE */
>  #define TRE_DMA_LEN		GENMASK(23, 0)
>  
> +/* Lock TRE */
> +#define TRE_I2C_LOCK_WORD_3	(3 << 20 | 0 << 16 | BIT(0))
> +
> +/* Unlock TRE */
> +#define TRE_I2C_UNLOCK_WORD_3	(3 << 20 | 1 << 16 | BIT(8))

The comments you're introducing don't seem particularly helpful, looking
at the define names. You should also avoid adding random shifted values
and #define the bitfields used in your messages with BIT() and GENMASK()

> +
>  /* Register offsets from gpi-top */
>  #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
>  #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
> @@ -522,7 +529,7 @@ struct gpii {
>  	bool ieob_set;
>  };
>  
> -#define MAX_TRE 3
> +#define MAX_TRE 5

This almost looks like a separate commit itself? Definitely needs
an explanation.

>  
>  struct gpi_desc {
>  	struct virt_dma_desc vd;
> @@ -1644,6 +1651,18 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  	struct gpi_tre *tre;
>  	unsigned int i;
>  
> +	/* create lock tre for first tranfser */
> +	if (i2c->shared_se && i2c->first_msg) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		/* lock: chain bit set */

What does this mean?

> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = TRE_I2C_LOCK_WORD_3;
> +	}
> +
>  	/* first create config tre if applicable */
>  	if (i2c->set_config) {
>  		tre = &desc->tre[tre_idx];
> @@ -1702,6 +1721,18 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>  	}
>  
> +	/* Unlock tre for last transfer */
> +	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		/* unlock tre: ieob set */

What does this mean?

> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = TRE_I2C_UNLOCK_WORD_3;
> +	}
> +
>  	for (i = 0; i < tre_idx; i++)
>  		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>  			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index da94df466e83..c5935c5f46e8 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>  	struct dma_chan *rx_c;
>  	bool gpi_mode;
>  	bool abort_done;
> +	bool is_shared;
>  };
>  
>  struct geni_i2c_desc {
> @@ -601,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  	peripheral.clk_div = itr->clk_div;
>  	peripheral.set_config = 1;
>  	peripheral.multi_msg = false;
> +	peripheral.shared_se = gi2c->is_shared;
>  
>  	for (i = 0; i < num; i++) {
>  		gi2c->cur = &msgs[i];
> @@ -611,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  		if (i < num - 1)
>  			peripheral.stretch = 1;
>  
> +		peripheral.first_msg = (i == 0) ? true : false;
> +		peripheral.last_msg = (i == num - 1) ? true : false;

Why the ternary operator? == already returns a boolean value

>  		peripheral.addr = msgs[i].addr;
>  
>  		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> @@ -802,6 +807,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		gi2c->clk_freq_out = KHZ(100);
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
> +		gi2c->is_shared = true;
> +		dev_info(&pdev->dev, "Multi-EE usecase with shared SE\n");

How would this line be useful in my kernel log?

Konrad


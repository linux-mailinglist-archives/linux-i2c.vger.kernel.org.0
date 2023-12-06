Return-Path: <linux-i2c+bounces-632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F9807324
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 15:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6531C20EF7
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 14:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D96A3EA82;
	Wed,  6 Dec 2023 14:56:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D85B5;
	Wed,  6 Dec 2023 06:56:47 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6d9a1dd6fdcso467569a34.1;
        Wed, 06 Dec 2023 06:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874606; x=1702479406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMFxTkt+APt9VkSo60/Rj4cKZLAsbnVIJIMVqJP/nRI=;
        b=qri2uqUTwj/abp8PAD7G7hQ0iisfXb3C5gHRiuoDGEnnPptrvDXqEPF2nxvtjqmz2l
         jOXHFzOy5knLtxAni5Oxwvmih9OPw9J/DT8VZ8IJT5TvnSt9YU+ywswBiwJshvJv3VNv
         2o9NTKPHsGBnyy/08nlwd2o9huJOKUxqABwL1cKIOx+7BOwrrPJmw5K6WrUMopgByQn8
         HAH2BMPZEMcSeGNfxirR665CJ6saeZ82FrVOl3pZLDotSkGPLjTX7jy1xRZHMTOkrNBX
         e0qGUFbd2r3z8p7MpXtWEK16iG3BS55aY4tawa1ToPXFxTa1qdGQtY//gBGnZPdl/6s0
         o72A==
X-Gm-Message-State: AOJu0YzOqKF5MeQUZXnoSj3fsQul1YcnBfqzRYZBYZe1JPT5KwtSkCq4
	W1kYE4P9XYZBmhycqcljQBbPlCbs0g==
X-Google-Smtp-Source: AGHT+IGo7Nw4yr8MZn9UYM3es1DB4fV7+KFr86PkrLstPfPuNnxjgC+QKtK0LxxDfWXey61y9+S+nQ==
X-Received: by 2002:a05:6830:c89:b0:6d8:74f0:30d3 with SMTP id bn9-20020a0568300c8900b006d874f030d3mr1429643otb.29.1701874606223;
        Wed, 06 Dec 2023 06:56:46 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m2-20020a9d4c82000000b006d879b8e68csm1880241otf.69.2023.12.06.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:56:45 -0800 (PST)
Received: (nullmailer pid 2138604 invoked by uid 1000);
	Wed, 06 Dec 2023 14:56:44 -0000
Date: Wed, 6 Dec 2023 08:56:44 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: i2c: document st,stm32mp25-i2c
 compatible
Message-ID: <20231206145644.GA2133904-robh@kernel.org>
References: <20231129125920.1702497-1-alain.volmat@foss.st.com>
 <20231129125920.1702497-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129125920.1702497-4-alain.volmat@foss.st.com>

On Wed, Nov 29, 2023 at 01:59:12PM +0100, Alain Volmat wrote:
> Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
> has only one interrupt line for both events and errors and differs in
> term of handling of FastModePlus.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 49 +++++++++++++++----
>  1 file changed, 39 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index 94b75d9f66cd..6a69bb6de23e 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -19,6 +19,7 @@ allOf:
>                - st,stm32f7-i2c
>                - st,stm32mp13-i2c
>                - st,stm32mp15-i2c
> +              - st,stm32mp25-i2c
>      then:
>        properties:
>          i2c-scl-rising-time-ns:
> @@ -41,6 +42,43 @@ allOf:
>          clock-frequency:
>            enum: [100000, 400000]
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32f4-i2c
> +              - st,stm32f7-i2c
> +              - st,stm32mp13-i2c
> +              - st,stm32mp15-i2c
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: interrupt ID for I2C event
> +            - description: interrupt ID for I2C error
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +            - const: error
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp25-i2c
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: common interrupt for events and errors
> +
> +        interrupt-names:
> +          items:
> +            - const: event
> +
>  properties:
>    compatible:
>      enum:
> @@ -48,20 +86,11 @@ properties:
>        - st,stm32f7-i2c
>        - st,stm32mp13-i2c
>        - st,stm32mp15-i2c
> +      - st,stm32mp25-i2c
>  
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    items:
> -      - description: interrupt ID for I2C event
> -      - description: interrupt ID for I2C error
> -
> -  interrupt-names:
> -    items:
> -      - const: event
> -      - const: error

No this should remain. You are duplicating defining the names otherwise. 
Add 'minItems: 1' here. Then the if/then schemas should just have 
'maxItems: 1' or 'minItems: 2'.

Rob


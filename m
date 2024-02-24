Return-Path: <linux-i2c+bounces-1964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A0862656
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 18:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566B7282693
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 17:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37C047F45;
	Sat, 24 Feb 2024 17:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlpqlMte"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED283D97D;
	Sat, 24 Feb 2024 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708795817; cv=none; b=IDeOurdmAKhJt3DOTLCnMbxUji92SlX3hYtfGBq9FAQ+iEyxwM/7sOZMke+zVA/Zg5V+757EChwlEM6/2YfO+iyY0Z5COgzFHWNHMviNP2NcoJtUp7QDcMu1Z1xkp6Ej8yAqVmjCQM5lFkpHpoUemcbn7ZE0Mi3wYEnnhABE3Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708795817; c=relaxed/simple;
	bh=IA7YIj34n7zOznAz4bXIxB/qfLWxQlNSifuTB9+yD7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXw12ZoSHorKY7yhefcHHDZ6dlMhJq8G0me7/OFiekR+OyLw+BwCCT86PMzH190UxkkpmaiJYDVOCl1Cnsip2LJ5wfgc1TXrohUTUZ2p4S15B3kp0Uw1fI/uZE/kILmcuLCCekGGM6JzzstkeBO9Yn7hY2SjXVyk1KntP4Q8fgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlpqlMte; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e4670921a4so892435b3a.0;
        Sat, 24 Feb 2024 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708795815; x=1709400615; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfwmTuOUeGDZRoWGVxhqodKuCSQAkBISE82LWiZnGqo=;
        b=TlpqlMte4Oz5e4zdR9REZihsCyaYP6j/yzWOlQgg0VtVehLDNCPQiZqUhhqgNDTxLp
         FK3tebxKqzbixa3cL32ZzINNEu8+HT4lbPs4R7gX90QAXONuUU2eBUkk7xehudkmrgPE
         u5OSU/w5Ilqe91sK/IbyQmisgVu8XZw9Tk6oRaF/4v3iBfp0C/kCTDwsmdD2cwjMUpjo
         F37N7xQo3J/4CJlWNa8VhnsPaDwoJ+A3aopT9H1KznLZfq4Z+GHDbZS54myemw89euVh
         YITSxfRdUWsKmlFy1aaQl9d3kw9x/pSu3aPkB0GfDRglQVCIUkLjnWmpSoSgg0aQq5Tf
         e+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708795815; x=1709400615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfwmTuOUeGDZRoWGVxhqodKuCSQAkBISE82LWiZnGqo=;
        b=KhFSQBzeCt6isx3PKtWMjB+HYKxqsWHI4sXl3BbAJxy1JHdNLHq7wYytQjU0PlrJB7
         G23QVQG75gCy+9kw5W/aLc4pBxVWBDQIuwv9Y6cszhnn55WQGpoWL9AGoJ1PP6RMtzm8
         /Bauf4q3RNK/7u2xOx+Hra1Y0y0wWOBawLy/DLqeuNmW/Bz6UP8+H884isuO0/N5fS/t
         nMUPaeOAKNwU785WfFwuV2J2Kt7rM27mkwyRPx3OZA2PCYLT0nKW0RBdn3pYdPrClMl/
         w2+ZbsYcZi+JMQGheQFFwESKy+9cm8vPJj+moAbRgjvjSy/EkBd456suf5E8sbphyBfl
         7Dmw==
X-Forwarded-Encrypted: i=1; AJvYcCWHP6BaZ1N4x2PDfAgkSyKsQDrX83qHAdSGi/GbKgXFDSwb+a+DHhOLD/nKGOUyGeTBRESZi/H6ZiETxM3+Wr+ENj9Mf51GFzG2zJKvVLU9M/8N/s5I+zN8qFcDcfCWNcItPCzuV6dqFURvXMKU8IgEFPWRMk963GRJIk+QKr6ZiKdPhDTq31CMFlVszl0AxsMkUYdXhYF9e7CJ50le60DwSN3EGEK7sax2TCfQ/QnqS4QaU+FdwC9WY1A1qQ==
X-Gm-Message-State: AOJu0YyfTBdNDN5Bn5P3OysJRY7/mDFTIgGYWOQZKJjnm1xzUsBIGtrm
	hSzmEyCKydkzy0WVr4FC2tcJN/FhXB3iqyckxTY9DINP0NgIJgYz
X-Google-Smtp-Source: AGHT+IEm76Q4MbF5YUR4cfneuhdsywGYZNDBvaLpcfw7vG9hloNtiGpuuGAQVVo42QVuY0CCHmuXKQ==
X-Received: by 2002:a05:6a00:23cc:b0:6e4:cdb2:636f with SMTP id g12-20020a056a0023cc00b006e4cdb2636fmr4271757pfc.4.1708795815252;
        Sat, 24 Feb 2024 09:30:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b006e4625a0f0dsm1324438pfi.169.2024.02.24.09.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 09:30:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 24 Feb 2024 09:30:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 03/13] dt-bindings: hwmon: lm75: add label property
Message-ID: <dcd5794b-aca6-4f6d-8e8d-f5548fcad644@roeck-us.net>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-3-19a336e91dca@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215-mbly-i2c-v1-3-19a336e91dca@bootlin.com>

On Thu, Feb 15, 2024 at 05:52:10PM +0100, Théo Lebrun wrote:
> Declare optional label devicetree property. Show usage in one example
> with dummy name.
> 
> To: Jean Delvare <jdelvare@suse.com>
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: <linux-hwmon@vger.kernel.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

What is the verdict here ? Should I apply it and accept another patch
to update it, or should it be reworked to be based on the new common
hwmon schema ?

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/lm75.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> index ed269e428a3d..5ca2c83b413d 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -52,6 +52,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  label:
> +    description: user-facing name of the hardware monitor
> +
>  required:
>    - compatible
>    - reg
> @@ -83,6 +86,7 @@ examples:
>          compatible = "st,stlm75";
>          reg = <0x48>;
>          vs-supply = <&vs>;
> +        label = "CPU temp";
>        };
>      };
>    - |


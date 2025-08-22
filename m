Return-Path: <linux-i2c+bounces-12369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCEB30AD2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 03:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95AE87B6BA8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 01:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C7F1684A4;
	Fri, 22 Aug 2025 01:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4LDnxkq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054233E1;
	Fri, 22 Aug 2025 01:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755826342; cv=none; b=WUjJnDe0YWAzwim2mhu6+hh/mIQF3WefC82Qhlgobh8J9m/YnWKMrkHfTQwBYt+C3HtNrMem7Cf6RKv4+4HsUO0HSgdrVEQ7yt5TibfbgQMks8GDlsGfV5ob6dUhjJbpNd5jO3KomYutuRXm3iiEVWXzzuBm4Mt1c6XnkfG2/aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755826342; c=relaxed/simple;
	bh=Wg6B5bcLCFGQGWcq0+K/fyju+Mj984O0JHIBAY+rP78=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpIygiIhr9kH5rUaIxx+FoTONI9l0LQu50NdVXtSZI2u/CDgCr7k2nPs/GwUR7j2yBfa0m5CvYXUpxVl42eZR3bOgJCyOzJG7Hh6zLdtVwop9abH7T9Kp/Q1EBXVVwuF0/YFwodN43RN0tK27P8/NkTRcy732xTvo9UXEoujvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4LDnxkq; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-32326e202e0so1534430a91.2;
        Thu, 21 Aug 2025 18:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755826340; x=1756431140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLZ4xRwf86hNbCUyOlRYqjM/i0x4T75qp61KARr1Axc=;
        b=H4LDnxkqDYuU1nyz715eycsGp2uFxaGRV981PzasHoBLafnChAM8xzcYb2Z+HA1K3x
         07lEtbWFCMXoNWXYrOC/QRABKZeJfORKclDQt+OBlUw1a+6wQ92vkLPZuYD7aHTKUmRq
         V+dkuDSwpmtL/zZdFwUQQ5aBSERCxANgE+xSy9AdbMqV+liP7gnVqvASlOTpGe3kLZVM
         NNVeNzTqdV6Xg90FWB0bCGA7VMYEC8lE6RJEx5282L8QJ1SOXCX3nKkng32URJtI5PX7
         4ZFt1mjIPSN4KruN7loYEHelhPLPcYCybOIaam+U4fWjc5xPmdHPGEsUShEM+wKftWez
         wqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755826340; x=1756431140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLZ4xRwf86hNbCUyOlRYqjM/i0x4T75qp61KARr1Axc=;
        b=ffKCPrsTT+hiQiQXFpJdXLsR0t0/SqQ52aIOISIdqtzvQJgKL+I7cCgtp0Tm/YfcnD
         8qxG4nw24yM4WW900ZCKhAYFcLe+vsFmbpTadg8d9Ceiwu9u2jiGU7gH2JmQBibojLZb
         iZTHE3nGfiUol+mbP64M5oIrVhQUt2axQL1HHaCcYCWPfqk/QsiKAsN36042VftLaLVW
         ABIx4M6XK2EFZ00lpSkShgVwI0dkF3MNyLmv3lFfnSSfwqg0tMoJ31Pm6gtgXx5d3eHo
         jUXv2yBkkH0LnvymakW4bNiYV2MYKcIdftOAxn7kllk6sKf6PfddbxQWCJkfkodSPyyY
         bOiA==
X-Forwarded-Encrypted: i=1; AJvYcCVXr2v+yoWvonZBMMOPDOrnb3gnzqGVt2iXw75gIq+nKLOKm+nbFmGuWWcQhsCBDEhiaEDqVpU9oWVu@vger.kernel.org, AJvYcCVinrKfAFRNVqbW5ugWGNGYMfyPvaqrfJfltjmwNUwXxeKBa52siLlEAU0PdD5IZp2Pv08wEufoFl8o5vQI@vger.kernel.org, AJvYcCWJKqf9gZ5UrYOkUnFoviW4ZX90e1W3CkgLzaYsb8MthN6xcCgg5iXQrSvSYGF0TLzOAHnCBX4iVzSm@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1Z8OgSXQaDLpBSdsbMhp76vKuYW/xmxki3ar1ROpSE9AO9j2
	lHui0bOJF2P1f7ebyXDRNcRZf2WEGJctA6ybXyrK4HfdDCGdGb7TPu6k
X-Gm-Gg: ASbGncvMeaDJHHDH4XcXeKknlRaB+grPTlRKe32d7gQYI0JQdlEDqNoDa/qxHmc3l8d
	/dztfFHB2Jd8MDnFvpBOtiJTkntkqS71rCGubaY8j4EBVLvkK8Wf5BZBMLGj0+lXWP2aYvdB3b+
	DVO81C85eZJ2B7EiIWRX8dXjk29gOjfUWeQ4dLSG3fGMZYKF3lKgy02B4wIIeu7ZXdO6lBN0Pj8
	nQwn5nxqTbD452pYNov4xuXabJ6JUAn/uWO13OIlcZyqD7+gF39SkmMX38S9fzFS1kN9VykQy+1
	5lPlBJ0LDKSTA6uN2gU/SG5IKKpAKIT+gnaA1QZ5qCw9JbmETZAZdIk+wRMoTyfgkBBWKKeGbl6
	zdlk=
X-Google-Smtp-Source: AGHT+IHqg5BMS5H5H0CXatOkDxWYnVma8locc0gsDLlLL4jvBLJblPVH8Oi76UEBkFgq0T0ofvpIFQ==
X-Received: by 2002:a17:90b:1d91:b0:321:59e7:c5c5 with SMTP id 98e67ed59e1d1-325177426fcmr1615455a91.27.1755826339746;
        Thu, 21 Aug 2025 18:32:19 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e8344494dsm8737468b3a.79.2025.08.21.18.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 18:32:19 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:32:15 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <aKfInxTH8XeZo55z@troy-wujie14pro-arch>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>

On Thu, Aug 21, 2025 at 10:32:06AM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 3d6aefb0d0f1..c1a3004df71d 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -53,7 +53,7 @@ examples:
>          reg = <0xd4010800 0x38>;
>          interrupt-parent = <&plic>;
>          interrupts = <36>;
> -        clocks =<&ccu 32>, <&ccu 84>;
> +        clocks = <&ccu 32>, <&ccu 84>;
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>

Best regards,
Troy
>          clock-names = "func", "bus";
>          clock-frequency = <100000>;
>      };
> -- 
> 2.48.1
> 


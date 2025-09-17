Return-Path: <linux-i2c+bounces-13026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E2B7FEA0
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 16:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6FCE1C82C34
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BD52E888C;
	Wed, 17 Sep 2025 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="RbBATuLO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F81287275
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118140; cv=none; b=Cf56Yalq01zPaos+bma/ovT4nhYOmKoZN2j5GfA398dp0r8MSF/+0cG+VqdHOId01TpWq9Gjwsw1M/CDtEur+rfRW0ldRK6h+hJsrLk8ZW/6xoX4VbZUWPp6B90lxg6DuEmlffX0thHCH06PT4YxB5n2Ow2qMt7QiQ7vMe5y61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118140; c=relaxed/simple;
	bh=y55jVHTsFdR0ohUFnQ8BSywHTKpU8ilitRM6NGPy960=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxfJhowJ02BF4aStqKSwJDU1D7nC5WqutqEg+PeJ/9Gth0a0kMVNE6/7kJgP59OlUxWx56Rf7D1WwsJk3CpzXDoom2ostlZr/cljwZcnuwWtZ51QJhTCvF+T84FFoIzFSOtBO5sxtYxqznl5bBvcRMGomngsJXpHqQADR1Kx6cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=RbBATuLO; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-88762f20125so503535639f.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1758118138; x=1758722938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwXs810vPVolctqhE5kX1kHC5K5g0mvG5ftVgYqmopk=;
        b=RbBATuLOQ58sJ2hqNSLuD/4Nr7sHLcauJzrwfJceWGoV60JHpxDKEoltmtB5pfCWo5
         cSrEKXUBbwtuiyN4XHCf1njv7BsVO0reueEzAPb8fI75X74HRSZBSmc1Q+z6h4OSLXHj
         YQKXrkBBqQ7To1PQR7XzmkNS5QSmG0VXll/G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118138; x=1758722938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwXs810vPVolctqhE5kX1kHC5K5g0mvG5ftVgYqmopk=;
        b=UHZSgJ0uB06kO/1kmUvmqLzbPxh9TOFW261SNnpZt9mXQFxe+Sh9DAbu4uA30r0k/a
         iK6mDrNhS1iEkB8k9W4CdmBsyd5ZhUvvuFC3ePUcJ3eE20iZnuvTj5tGA0Cd3gMeQZ3k
         EJnQ0bI++m1/Ls39RJtm4n+ijmwrlWFN7DuuvQn6QPTNi+xOTihJxCttRubPp4WyITDt
         EJs5SUogunRCSOvlSYQbqW9GIp21Zf3NDEZVhgfvuwkrAAdG75G9iC+v9D3FSDZpk8Ov
         d3Q52QMaLAUwcneZRbxLobWtslO/0/kp9jGNV5UIzLmiraebMwveHXrs2UdDrjko4+Ii
         6Y9g==
X-Gm-Message-State: AOJu0YzfW3h8x7FDO+VxORhn6IVvoil6xN/cZr1uCZzxcWObBct19d+H
	aYzg+Q0n0mRYIaCKp9i2t4LWx1QTAuporU8s7MoEi6QUh9JZlpTnJN1pAJ3uMiyLJw==
X-Gm-Gg: ASbGncs6N1jWmHH9xPkL6n6T4Fm4F3K3veKR0HXk6BHynE/45/pcYPEJZLzK+tmFAzu
	Z1mBbe/ze9UsAQP93aFCJj/UcsXwshWOGx0rLngLl5bfjOICVLlUuxeWZvQchp6hQp4lKt9DfCv
	MLnIR3XRmp2UbwnXOHiGFQQYyF5WfsnL0F/4m+b647PWWR3y+WUbxaWyr2g8FrT+XXvOCesqrQ5
	4sQxzQ3gZfYacFBy+bNI926E5od8UMxyVz1aRht7yzLtxXD58yPuWQUMwuLxIyOghqWRhX30IdJ
	xnStqePMfjSOP190btIxCFQ9ohWfdkTHQ6T2EasujaAceLAXXuH41NEqb7ttLa0XA420UrqcyKH
	eF+Wkfud4kZu12c+sPGKIgdi9cEeRFgClUx2n11M2IY5/3bob+lanZiM8XoTSk4M=
X-Google-Smtp-Source: AGHT+IF/fBkdFTD3FTvzdS8tc8bIkj0IKqMAIt/hH+T2GkDeQwHL7JRVqgSvOipa21x1SDVuYYQNaA==
X-Received: by 2002:a05:6602:3412:b0:890:1f62:492c with SMTP id ca18e2360f4ac-89d1bfab247mr324144039f.8.1758118137550;
        Wed, 17 Sep 2025 07:08:57 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-88f2fabe0bcsm648019239f.25.2025.09.17.07.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:08:56 -0700 (PDT)
Message-ID: <99168e94-9f32-458d-ae3a-55d0dcee3dc7@ieee.org>
Date: Wed, 17 Sep 2025 09:08:54 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
To: Yixun Lan <dlan@gentoo.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 10:38 PM, Yixun Lan wrote:
> Extend the K1 I2C properties by including generic i2c-controller schema.
> and this will enable it to do the DT validation check later.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Tested-by: Alex Elder <elder@riscstar.com>

> ---
> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@41' were unexpected)
> 
> Link: https://lore.kernel.org/all/20250825172057.163883-6-elder@riscstar.com/ [1]
> ---
>   Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3..226c600deae142413277117e25baae09f0918381 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -9,6 +9,9 @@ title: I2C controller embedded in SpacemiT's K1 SoC
>   maintainers:
>     - Troy Mitchell <troymitchell988@gmail.com>
>   
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
>   properties:
>     compatible:
>       const: spacemit,k1-i2c
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250917-01-k1-i2c-schema-faf6715d7b88
> 
> Best regards,



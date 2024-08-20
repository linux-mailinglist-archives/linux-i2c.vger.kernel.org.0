Return-Path: <linux-i2c+bounces-5565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C2957E02
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 08:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D6E5B22CF9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 06:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F5016B748;
	Tue, 20 Aug 2024 06:23:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9B2A1B2;
	Tue, 20 Aug 2024 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724135031; cv=none; b=j4LcB8vk1EEdYDrdFhQD5l1vMeocmqvBkm2timQd9/v4MBwWAuzC7mrAyCzpepZpqL1F99+QQ/7pxbeqztJAZBNIinYbA5KZnqc9UXm994s9dyKz4VIn0pqcP4DQwjy8czQbju/eW842wsi6bqv52VwiF4NnHe7IDcRa7p58NA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724135031; c=relaxed/simple;
	bh=zM2oa1EdLLGiJmNc29lSzfeEOuTWrGgptwcW+xB/Rfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fElytIw1LfUPp/l6PBWOnxO4dwp6j0dMjqJwz5Bc+MZOFbR7aVtc2ASfysyAVSFrHsC8NhPMJ56A082xiWNq48fQ9/60hT9jSQThDjHTZ4dGkWEhd+RKxvP7qaDMyY4146Qk3iTtD1Y2XJo8gif60IQ4R2rzKw0KErClHbtTfks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so40893795e9.2;
        Mon, 19 Aug 2024 23:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724135028; x=1724739828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN9Ta845ZUEPl4X0vI0xluoJCw89dQ0gUl/RLrISjt8=;
        b=rUK6qlj6iyzioxxlzLlrzJfJG/mTzxr1EmTHrgmss7vEF+Wq1LbGTqIe5GubFUGxFp
         EAIYzHnZ1mJ2UmQK35WonyZbJfj8VG5XGFIe32a3KfQp4LE3rpYWQxQLWoKuP3AUGzYw
         3Unr7MA2p4ye1OM+/lFEPFJpawsQZFpQc5At1N2wG8vyRIsYX1g5LAdTF887vFGDnC2v
         biN+g4XFj8KQrGBgAooYeEbCwaDkKkdVBucpwYUyOIkoGTLX/DVzZ9BmA3rtPP2Xhj4V
         c3sFNdKVyshvbqjL7Y7FDioMizgkN6ld8umCi+Rl0+7QR7Jmf0WtBEPfePLaZ+ecgfFQ
         Yq7A==
X-Forwarded-Encrypted: i=1; AJvYcCXMYhZgeLUGZ2Z56u6t98he6umBPIVz2p2/S7GQ3xfHDiE0RGmOaubQzYM8sxEFqkkpIAkSUfozKFARcSHjU4xLthC30P+JN/5cCLsVLIMT2tcMQLb3L5dnzt0l/BtfM5WYs4B+JjILqb0YhSCOjZw48Jpkub4vqRUTg/fGpdhfId+5rCZPQRAb+cm8+N16jMVjG/rNgpVD2JKR6pRdI3CghA==
X-Gm-Message-State: AOJu0Ywce1SZEAP/S3XwPeY+hwN22U/GotvbG8vCes6h0PawwbW/iA/f
	pd64uT/UTd2wogmoi1iMx2+jNceOg6Ze1C8/RJwRY3Mv6eOQHnV3
X-Google-Smtp-Source: AGHT+IFT+XlXOjd5JjOmSbppAhR/wOGsMmDdyAbLHqMaMiTG1TIeu4Zce6BhVxVpn/1wz/Kt8Q3nIw==
X-Received: by 2002:a5d:4089:0:b0:371:8e68:a6dd with SMTP id ffacd0b85a97d-3719434434emr7741985f8f.23.1724135027745;
        Mon, 19 Aug 2024 23:23:47 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed784726sm131190065e9.35.2024.08.19.23.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 23:23:46 -0700 (PDT)
Date: Tue, 20 Aug 2024 08:23:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
Message-ID: <63ma4u7vihvjalmwnsptlwjvogdopkrganhj7njhjxy6ykjoly@weforkdwazcb>
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819221051.31489-8-mailingradian@gmail.com>

On Mon, Aug 19, 2024 at 06:10:53PM -0400, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> @@ -138,6 +139,23 @@ allOf:
>              - const: cci
>              - const: camss_ahb
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm670-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4

maxItems: 4

> +        clock-names:

Best regards,
Krzysztof



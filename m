Return-Path: <linux-i2c+bounces-514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED67FC09C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 18:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7ED282BB9
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 17:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9238639AF5;
	Tue, 28 Nov 2023 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4A010CB;
	Tue, 28 Nov 2023 09:50:46 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ce353df504so3567957a34.3;
        Tue, 28 Nov 2023 09:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193845; x=1701798645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNiHiA6wSmKNmRriIDAMYJotOGbcur5RnZmpYezuUUg=;
        b=tFjFEReNcjMz+GQPjpkEP3R1k/+Spz6kX0LRbQq/YiOmf3ewY6JMvNTcOUjTulOeKd
         s7HEWkrH39TjcKQG6/DHrzwNbOjfqIAJWu+3chW17+6dXuJP1nP8HFUdRgT6Ot57MdMu
         rvxHV5hPUEhwloJVWNPf1NqZxd6wYX64K2lmIatsMd1jG/7ZkmbRG4rTqvKHYD6OWNnU
         Cc0Z177IemOvvgEC3a/AdEZeMVuVJmoG3EI4RVTevtcEEh0XY9VdSxITfRX1dgZvE3Nu
         QBkn6xAjLMCEE/11R+hYl7UnqXmd3O68UCIpj0nxBlztJ460VUOQRFWVl3X7CPjchlGi
         dHtw==
X-Gm-Message-State: AOJu0Yz6NL98yf3YZd9QwjFw9KbvqEQvuch3APgwfylDmimGXg7QCTSJ
	/KKvg3iJbEMb1+nTa6LBdPbXOvYroA==
X-Google-Smtp-Source: AGHT+IEjDCvt0vi7M2D0Vgdb1l1lflZgZ7cf7adlM1nWVNj8pKpbDYpnNuo5F79frDyWtoGy7D2zpw==
X-Received: by 2002:a9d:6449:0:b0:6d6:490f:f027 with SMTP id m9-20020a9d6449000000b006d6490ff027mr16049889otl.37.1701193845338;
        Tue, 28 Nov 2023 09:50:45 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s2-20020a0568301e0200b006d646763942sm1717051otr.23.2023.11.28.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:50:44 -0800 (PST)
Received: (nullmailer pid 3558114 invoked by uid 1000);
	Tue, 28 Nov 2023 17:50:43 -0000
Date: Tue, 28 Nov 2023 11:50:43 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom,i2c-qup: Document
 power-domains
Message-ID: <170119384299.3558042.16570050685219683863.robh@kernel.org>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-1-59a0e3039111@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-i2c-qup-dvfs-v1-1-59a0e3039111@kernkonzept.com>


On Tue, 28 Nov 2023 10:48:35 +0100, Stephan Gerhold wrote:
> Similar to qcom,geni-i2c, for i2c-qup we need to vote for performance
> states on the VDDCX power domain to ensure that required clock rates
> can be generated correctly.
> 
> I2C is typically used with a fixed clock rate, so a single required-opp
> is sufficient without a full OPP table (unlike spi-qup for example).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>



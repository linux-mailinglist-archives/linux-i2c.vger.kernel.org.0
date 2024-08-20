Return-Path: <linux-i2c+bounces-5569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3D957FAD
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 09:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90CC28401B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 07:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90503FB9F;
	Tue, 20 Aug 2024 07:31:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33218E376;
	Tue, 20 Aug 2024 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139119; cv=none; b=DNVggnkmCqNGOmfIZP2ELEFXh/7O2t0QIiUOP5YTnfhGDy41kC+Ek9WqrbDzjeIkxJqZPxOVs967XOFNvPy2RLe+dFM1XuXrmEomw/2uT8KvBlWe609tlcm7rT1RbDeFF3OtTbp3c5ZxHTKvQNhtNVLWXNL+DTc9rq01R07+8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139119; c=relaxed/simple;
	bh=Qmx2xkZx6QjU8y0JpQ3DgBemV0QRZuTDRzUNGnGAqAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSulkfH7ecLsRn3WHCGSIkZhMGbwaBgF/lvu3YBhpOBwDrUGk8CU7EUDJ3VDhka4rOjdtl2dIwrKdk5VYLiwDsmMBYUoCCL7C/u6oFBGopEdrTV73w10Cz+uvFRXS1I9UZyOKfwhklO0i7wA0IEnIduPxCO04rwqSLOA2thDw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3717ff2358eso2787007f8f.1;
        Tue, 20 Aug 2024 00:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139116; x=1724743916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwQbZZzYKJfp9JXZBu90gOlgrt4jvpTVXR4uFjbp38Q=;
        b=YYiM7fOmDJZSj/cwxKUHSsWdPoF9rS2gsC08v5U2w5+GlcmH08ID2rCy70sejmv5uD
         OOWLmak2vO0mtgW5uD4ueNO7Gc73Fzm9hhg3sHw/JUJU+jmZm90oFMRtq8kW4xEZuy/3
         MUmDvHSzrb2ipFutK4lrzb0BZcbFz4iC4/UHxXtMS6HyrfqV57qXTKLAf4y+pUfFrZ+G
         47gHGXCk0UA/OvrHmmhJJlwlE6F2l/mn/+5C6L4BLNERHSiscelYEjaRGqpJ/cVwuS45
         IPKFOhlNFB+yv3IWi6l8OE3w8lCyWSgdr9PpiYNaQT8AyMBimj4JQRkW4zbxbwP+0qZQ
         qy5w==
X-Forwarded-Encrypted: i=1; AJvYcCWgVcYERPAwBdPS5uQkTL8G4X1PBX75+P1QyPFYhEf28r33RS8qxwXLUuCKOAuH76z0vF7MTv/Ffi/RnNmUOss9G074tJ7UxVLKt0DDLMzQ50n+JRxmKVgnf1vrmxg45Dan2TDy305OPx74gDlMFkLylLcPft4MliVUutKHIOWcachKDfECPo2fszkmDgjrCSBiXC3yBxwkfO8jYXBE9Kpc4A==
X-Gm-Message-State: AOJu0Yz4vbKeHW8ovKilBoeb9oLWlE+W1PJoL3T33C9CuzCULzD53HME
	H+Q/30sKjGCyLTDtpXu0N1netjGMa2BMO+90gMfAKkz5Mmp7ec8W
X-Google-Smtp-Source: AGHT+IHTd/LmyAb9MTCxstjAsJD6mcKXnM89dKlsj660yY9f1w+dAMRpSYvFWk6FPDY5kqLqPENMjw==
X-Received: by 2002:adf:8b59:0:b0:371:844f:e0c with SMTP id ffacd0b85a97d-37194314b17mr8264101f8f.10.1724139115875;
        Tue, 20 Aug 2024 00:31:55 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718985a48asm12439743f8f.62.2024.08.20.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:31:55 -0700 (PDT)
Date: Tue, 20 Aug 2024 09:31:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Message-ID: <u7enyv6sb5n2jjsxg6tyrzjdj3tswzo7733hl3vuxh3j5nshz4@mklofzu3dzqi>
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819221051.31489-9-mailingradian@gmail.com>

On Mon, Aug 19, 2024 at 06:10:54PM -0400, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/qcom,sdm670-camss.yaml     | 319 ++++++++++++++++++
>  1 file changed, 319 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> new file mode 100644
> index 000000000000..5789cf66a516
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -0,0 +1,319 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +

No blank line here.

> +%YAML 1.2

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



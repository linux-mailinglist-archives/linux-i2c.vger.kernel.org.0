Return-Path: <linux-i2c+bounces-13547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C0BE06F3
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 21:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D471950102F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 19:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320D230DD23;
	Wed, 15 Oct 2025 19:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rm3AAiFP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB022561B9
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556628; cv=none; b=A9EwSDxOyixZ8PRXhnPoUuDw7cnLcaqusS1sBPghJwAQSgxdpIQq3fmb4ab7al88qCxLXJY1DDQ7uxTse3Bc7nl8uFSjhomq0nmYq9YsQd/DnLgwgaoxERDq70vwgXhPpptjlYHjVuD4I9cD/k5PnM7O5cfL2vAjWXEpQcLi1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556628; c=relaxed/simple;
	bh=nPbCX4b0wyKA4xqnzFN93V39LMSXnGf6slFjcnpoHkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPWnaNqh7hmalAmGiTOE9m6IUFR1nFXh4ougF9trbl1rIYTaf3y3JP6pnp3TSNgGWfp6kzPsC/dZaUX+gojCpbbTqXNMo5PhObDfKgsL6pg6czyM04+pBSOFn7zKf30qYnA27BPMRkXjgd88iZ+Do1vUiRpQHxyFBNBkJrnCRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rm3AAiFP; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-591b99cb0c4so481631e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 12:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556625; x=1761161425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn6HzcB6Q1wB3Fmq1gYyY4hfzEIJC4qbMSCV9Ej5PPg=;
        b=rm3AAiFPzKNzHGrPkiYs5NwYhdnsqXjdCQBWWNuBFoqeIsqbpexoTcLGK/luwvXmun
         wpx116Sz82PUm2GQh7VvldSRl6Ucoy6S6IFHR3OTXlIT5x/9n1RJDL2bVLuqAQa3HQjs
         dS9npXuPQ7skG+fOpmauPij9yg878q7sGUl5LJReLUJkQ/5q0K/BGVicwKqV8fmmadmJ
         0B/zLJRZ5oZFvTjYF3U5BT6Yqg7EQi1KJqMlakIRUmnHLhHGgMpjZfy3s6TYgJfPff0Y
         Qm2OCew+O+fK1ie7UR5poaypnjFT/RczzkT4862VbFs3icw2uroj8kBZbdZn0eEYeY/X
         2pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556625; x=1761161425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xn6HzcB6Q1wB3Fmq1gYyY4hfzEIJC4qbMSCV9Ej5PPg=;
        b=JGOApa9K8ZybGYPhVyty/gebci5Yf6Aaemtyzq+ecgslkvxUBDR1Nh0jFPXorVPxhi
         sv8hOLajBfRhO6hSumngPZM45A1oq3Q59gNdFJUFBwUl5BKB0wZNwlf7HcEjx+LMhCS/
         d/gxrdOIUqsf7NHj6OR8p7dvacRsq7sRX9JBMpO/ImcGP5ydyLrQSOqb98W7pekCqDJd
         s4EceBRZlHdOQOdjErZdu9oHqJXue4bUoNb4ZZNga7AO5MTsLWV/fVMtjIbT12IWnqof
         yxBmeH1l/xOVbi5gagddX+vEyir2psZdRHt+I7gIo6KZ4Pqml3B1udYknb0oR2GABRPc
         NjbA==
X-Gm-Message-State: AOJu0YwNxi/1DEtH9p3oQ6OnmaDhRho0RQUs5VZodI2siKZ83QRdUJEk
	gmlyvVH88QqOeG+IytefSHJqiATJH+rI7mL2Q0+5REp9sS4GQuRXCj+/BxmVfeoqMrM=
X-Gm-Gg: ASbGncsJMLcqRUyVUaSbdKUtyRrAwfREpMHj1Vs0Yf2TmY46tywzLCtgR+3urhMvMgg
	eyF3nh9xZkfcONqxu9OqAQYrOBmeI1KtUx7A0zep2oe3/nBktPdbGLWOG93TWMV+ABkKLb2jQ8c
	z/8IR4mbig9b08rSfkf+st0Q0p0e186yeYZ23/qVi5RebiC1KE/IdqEWZvnxG7Rcn+/YIVa0Y+K
	CG4D4nSdaq7O60rfBOoYecyBWP+UCAlS/vMWDUAKRRFLhP5brXj3bJVddMwW2HyAknvOREBXT6f
	mTetMyzOXCgYkoAt25P/aE0CbCxHlqf9aN5MK4n3Z68BgDw4tsKzMi1ukeaKrx0756FKf1wbqwM
	W71vBp0KyLYpwl6hbgN161xlt3W3OBmtGj+CS8X9IWZPFLXWHKK8UxJBSXDuBsNbvFd3ckJmjM8
	hvGlluyymYdG6HZsXIbMnXE9A5viM1OHc27HZPV0kLh4B+d6KCucasOcrEXplUcdOr5h+9wg==
X-Google-Smtp-Source: AGHT+IFtiwV326wSWMTN9z/8oSxLb3NlWVYgOdgv2W41aNnsDtgsz1zRyzjEAW4kE//A9Xvesx8DNg==
X-Received: by 2002:a05:6512:118f:b0:585:805b:e3b0 with SMTP id 2adb3069b0e04-591c904cfbemr681247e87.9.1760556624721;
        Wed, 15 Oct 2025 12:30:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5909413ec6csm5546283e87.48.2025.10.15.12.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:30:24 -0700 (PDT)
Message-ID: <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Date: Wed, 15 Oct 2025 22:30:21 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 05:56, Hangxiang Ma wrote:
> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
> aggregated into 'qcom,qcm2290-cci' node.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 9bc99d736343..0140c423f6f4 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,kaanapali-cci
>                 - qcom,qcm2290-cci
>                 - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
> @@ -128,6 +129,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-cci
>                 - qcom,qcm2290-cci
>       then:
>         properties:
> @@ -136,7 +138,9 @@ allOf:
>             maxItems: 2
>           clock-names:
>             items:
> -            - const: ahb
> +            - enum:
> +                - ahb
> +                - cam_top_ahb

Why is not to give the clock "ahb" name like on QCM2290?

On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
and name "ahb" is good for both, I believe.

>               - const: cci
>   
>     - if:
> 

-- 
Best wishes,
Vladimir


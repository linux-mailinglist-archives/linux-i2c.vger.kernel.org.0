Return-Path: <linux-i2c+bounces-5178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263B949BCC
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 01:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DCBEB225EA
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 23:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6280A175D20;
	Tue,  6 Aug 2024 23:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J3zwoikl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5D172BA8
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 23:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985625; cv=none; b=Nnu6DxdGeC6ipTMQlpWGP5cgpGpWgxMFp2Z9hql5TwbYrJ+8B0wJ2o+8fiWNrVgGcvnRDRdPO6aLTUXMbWUx4b3RzUyBcJlyA2I4+XNhS2RveUeGF/uoa+Ctrlnqk3YXYkgZN3gvRpS8hKPQEOmlsHn/mzZH2udm0Yjq3qpHar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985625; c=relaxed/simple;
	bh=0J/AdXiVvWShheGvPmUlMjBN3kfV+t5JnxiCk1W3uBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NmZLoOz3Begjaa8Sx2HrVEvHUZW/YAt7Iya3AG5+aTpYKVIj50xXeqsUC6dWsQMVJuXuz4WCAh0rys+383cb3RkCKNEq1V9zW5LSI7p04m1fPem87i9HBeRzGmKw/U8bpdgy6wYgO5NeOJ1MYf8aXvMMrqHAonwvKMYW1RHOUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J3zwoikl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so1799505e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 06 Aug 2024 16:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985622; x=1723590422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lRTZ4GySlfkCXEPTYyeONrIuCjnP06hZmIkMCl/2KwE=;
        b=J3zwoiklg4reVR1bfIj4orhh1W919oFjAVgDDuAVxZgkfYIHHMNK2dRBqNAsVReTcq
         MlAGB+FHdyzZsAF+bABxA3ABN4542ICLbk2fhnwiyLJ6CoVravJd7O4CQF7KuHagOr+L
         otKPfQun2i44LtumLA4nB4YKPhgUHsslEHs58HAVJuA9GoM5fECSAO23B/5AinOh6rNp
         uZpbrwTc6WGnYciqjbJmm8dF7P5H5OjHrqJ07DfnE7oDwY3gL+WgU0tdaxPxJLwoZEZJ
         04XQvUE3Dgx4q0YXTjp3t8qRMAXbQebrWNGQ4vmYfPaVkReKqzoh6gHK7MlPnOUIC0c0
         oDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985622; x=1723590422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRTZ4GySlfkCXEPTYyeONrIuCjnP06hZmIkMCl/2KwE=;
        b=LelmV6PSbkZHDOYOqF9DOq9fNItFnVCkCmhUXoNwNvP/fklWAQ1rt3lODaYYITMrna
         KoM+GOLmcdWI7lBb2oRG5b8LL1KST3QewuDYnUAZ2ezsm5H0Jfs2JgCYcFiUTrmgRGK7
         QYbzcDwD5fCHAmR/0IZipwhx1sfe8VOosqqSy4pIppj5sxxsjcwnBLPhOQPG5Q+s1XlM
         t8U+xbuAAwECHM0TTEXI8CJkzoS/jFY2ahfMqcL/4FH4nNIHSqd7GTLGqD4P6a9aiUS1
         YQ/oO5DXS7xcrLgkS3df+Vbx+CB9V5aO2QWnTcC9y/Vp/2IDC36ecECyq0ofBkWUxzTx
         f0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFOERy6xS/vE9XgXUpZqxA6AHM7O0WlSI8QrEH/FfDVqu+YMy/UieS/FTIbEpnVt6EnqLFn4QJEwYivkID8WwbN3uHWKbUBl/F
X-Gm-Message-State: AOJu0YwjyKfgNeXSmo/2Ma5QsEhIkJHzvsUF5YZu6o23bibIh9SLTsC/
	eJs3Nl0NwwEip7dQb7erAI3eehBnOHZvxidcMA7XSlV/Rsa8+tARzieTZmzpOFs=
X-Google-Smtp-Source: AGHT+IHVkAyWkxha6j6qpZF3mUMmg3Wku7DOp4M2iAUcjBVgKEazfg96PdMW9g2QjN+9IAXzecctXg==
X-Received: by 2002:a05:600c:5129:b0:426:5cc7:82f with SMTP id 5b1f17b1804b1-429052cfb3dmr1682185e9.13.1722985621679;
        Tue, 06 Aug 2024 16:07:01 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059713adsm1284205e9.11.2024.08.06.16.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:07:01 -0700 (PDT)
Message-ID: <f5a9796c-36a8-421d-92e4-535997e9d3ed@linaro.org>
Date: Wed, 7 Aug 2024 00:07:00 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-10-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> The camera subsystem for the Snapdragon 670 is like on SDM845, but with
> 3 CSIPHY ports instead of 4. Add support for the SDM670 camera
> subsystem.

"The camera subsystem for the SDM670 is the same as on SDM845 but, "

The naming should be consistent and the comma if you're using it should 
come after not before the but.

> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 51b1d3550421..05a47b82c012 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2403,6 +2403,17 @@ static const struct camss_resources sdm660_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sdm670_resources = {
> +	.version = CAMSS_845,
> +	.csiphy_res = csiphy_res_845,
> +	.csid_res = csid_res_845,
> +	.vfe_res = vfe_res_845,
> +	.csiphy_num = 3,
> +	.csid_num = ARRAY_SIZE(csid_res_845),
> +	.vfe_num = ARRAY_SIZE(vfe_res_845),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct camss_resources sdm845_resources = {
>   	.version = CAMSS_845,
>   	.csiphy_res = csiphy_res_845,
> @@ -2447,6 +2458,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
> +	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },

Nice work, please fixup the commit long and add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


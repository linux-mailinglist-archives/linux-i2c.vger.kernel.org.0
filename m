Return-Path: <linux-i2c+bounces-5583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A295831B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 11:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D877A1C24494
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 09:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1740518C353;
	Tue, 20 Aug 2024 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtGB/goj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF1A18E364
	for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724147145; cv=none; b=eC5f6MHYdq07zlp2h6Vq58qCaAsmHf0Bj1dhYLwgwgDlw1wJWNoBdI6toy4DndQ0KwmIwiW1EwbWOOuDYhbZIKlxRFxpK6iyOCsy7jeWqM5Mpr4KzEn7S42WUdkYOHfgyCopJSViJihB1DYzQP8tZbXNin3boaWpd9cHKw7hKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724147145; c=relaxed/simple;
	bh=QQ6gNtWTl1Gv5nSULtNhDgA2+6eaASmgABjv0NC5XSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aOHQfqpCq8dRmfEjs6SJzMOwD14qzhg4K2CSG12YUyhpTApa/OkIl979YnXSkoatalewpjLpm2wbCXGwVBxqQM9njiEENUAv69FK+9enNiEfEbuEcYxWehtJniOzXumiTGGvv0IfMST1XdQqEE3lVCemfm+RkgzqAkLcMentVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtGB/goj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b3so3937252a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 02:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724147142; x=1724751942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPLU3diYCQyH0Zvr0lRX9kTDaIcsrPo84VHTIPCk35Y=;
        b=FtGB/gojxo4iNAEBDL5tRNn/b1xyMYM7dwP1O/wXyP2PF2RNuVU1LabPJkoGjAvUOU
         AeBJaM/sQc0ZthVSqu/Vw2Rn6BYkKSsEYMox98Ockmq/+JTAHM2wpTpfBmBo5LGkMqvd
         /D4bGVqasEolIdnJbtS3MPgd4xD5E8/NQltigR18pYnYvTZ9CukMwTHuhya1hv/aPh7z
         SybBsTjk62hCWT7TjEW/3B1tTD+39i/L8yuiPu3oIbK774JU1QzhiVtUb1zQI3BIFW3K
         VjLgSqfq8CgKfCrs7MmF11RhKUUkI+/pG1s2b1641WEI+RkcASLR1uTrVMLZ75sWYPmV
         WTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724147142; x=1724751942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPLU3diYCQyH0Zvr0lRX9kTDaIcsrPo84VHTIPCk35Y=;
        b=sxQFk2wS29Pxj1Jsp1/lwNPdXSMSnGjV7KyZOUvOGhPcIFZA7SQ/mwCc/zti3U81JS
         2KqgaNh9A5Uq/CVX8xTjr0rclPzSH4cFKXk4v0bnSVO2GN76aglBflvmdfDU5OCBcpHO
         rqXIVA9+xZeumIviQXh1jqI3yfY7j4v3herWAlztbOUxKnnv8JxJtbBxVQxmRhxPbcd7
         LcfXayDmD3uJWmke0iTGt353VgkpwXuhtqQVYYZqjF9qp7tvNjEpiYAgJEHi4EJ5FK9k
         1/n4PSv069ycXbkF0at0BdevW9jSbdVNcUnz9CNSlkfLPirdoE5G2ewsFUWEue9OE/dc
         C4dg==
X-Forwarded-Encrypted: i=1; AJvYcCUA2l7n62Y5U0v9KcYBEfwb1uEN2reRQXYiUDAIwrQ264GPFdeLuw+2Z7fXJnIaTtoqp/kK4ZNyOg/VaLtKUhYzRghq13iYZDvn
X-Gm-Message-State: AOJu0Yyg+NcSfDc9cFZ9b7cNDtRLH/V6Brmi6RkK0VWnYWvhcdbP6Zok
	VkDoMJwPrkzReswnICj5V1hf2Od6HAt5NxoYKkdxsUdywhWaI8SEGDFkdc893ao=
X-Google-Smtp-Source: AGHT+IHvrGyFi2IOsYmWCzLhZUu+7BVY1lehpwMFowzNXPZTu8NxeiVoXLiLMTRM/Dovms3arJMhKA==
X-Received: by 2002:a05:6402:1d4b:b0:5bf:dd0:93ad with SMTP id 4fb4d7f45d1cf-5bf0dd09c4fmr1013538a12.27.1724147142240;
        Tue, 20 Aug 2024 02:45:42 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc08109esm6545925a12.81.2024.08.20.02.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:45:41 -0700 (PDT)
Message-ID: <f1c33879-c1ef-4861-be02-bcddd713de4b@linaro.org>
Date: Tue, 20 Aug 2024 10:45:40 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: qcom: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-10-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240819221051.31489-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2024 23:10, Richard Acayan wrote:
> The camera subsystem for the SDM670 the same as on SDM845 except with
> 3 CSIPHY ports instead of 4. Add support for the SDM670 camera
> subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 191 ++++++++++++++++++++++
>   1 file changed, 191 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 51b1d3550421..b2f22bfd8692 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>



Return-Path: <linux-i2c+bounces-13848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D8C13DE5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 10:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81ACD56288B
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B877830277E;
	Tue, 28 Oct 2025 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgpzSpBj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3381302149
	for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644085; cv=none; b=Kn7xnePQ+UMIM9scqPUzfS59oZuQUMSvrRZfoQ1IrfMa+C24VOWr4KYOYAIcHYtuAeQrYvWlHgw3fE5tj4y8YbQClKjkkD/mGVurHx72gQpLKEEluuGcxNR9s1SBCgoYPbIsfsbZdGAVKDLK3JXJfbLYxY1vZfspYXQQp9Ar0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644085; c=relaxed/simple;
	bh=ac2cQky0IwlGiqpgXPO1XMOU5eK87nY3Jt30oDW649I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZG+6zeVviRd7sr4c005XOCDAQjIupJsoWJfmjdTxqs0agGaUN3SGgDU4UngN6bVE5U7EyXuRpj7bi46tGglgYuINgAl3qIL84vtDXLzQVcMsfG7mKjgmVOSj79vcfN4DdQJEAbTX4VDofnl0Wq9X0NV7Msm+Vf6tuNhpsZ9hCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgpzSpBj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4711b95226dso71246405e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761644082; x=1762248882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/LALU22bj87w78nI48Ei34YpYAmoKYu+jDE6VBCbPs=;
        b=WgpzSpBj+JIL7I6HAeFZQbV2knyhoxIDxKIQXQlem26fBvtp5VZCsL+UdiQ3lRQJ5n
         fBmdFDBVq0U4XKlPmxhnl+CjylN+Oum+WPBrQIF/AH1qFA3cPEZbFO9hptZ2j5G2OjDl
         vY3QG/pwW3ZzqzZXpITH37aZIF+SB5y5anwQPUK70WQaz2vhTEO8OSYqV9Q45FLEq2fZ
         Dwha8fMKi5/uAjbSvNJNvW+rdwVkdt8iBV9TAxVyzG4lee+AL5V98MU3juWJVGC4aYt+
         H5YpOydx9D9f/0BJbNkB3H47HODBIjcll4M4CheeND0pEGm4TnZo5un15H9oP//tbFfV
         rm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644082; x=1762248882;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/LALU22bj87w78nI48Ei34YpYAmoKYu+jDE6VBCbPs=;
        b=Fw7iX38hhM+VvWjuGWxWk3fOqAAnkQiIkHSw6KhsW4zI7NhPY00WT4QFPqBRC7sxsa
         BuZJZei+8uQo4yVueyd9uHSQ1WlIuOhJvsUj9UbNRrJWyB0qcrl1r78Zw2Bsn74IddL3
         37DkFKojmsAqJD5PfUMqqBviYmFJnUmHL8r6iNU8br9f+cQYVu2a8lvkm2Aojgav9m2d
         rauJZM+WQTz3Jv251kqnhT+h8qxFdByCFZFIqCRxsHF64Umm9LU0ONcIaRjtzB3EIpru
         g18Lp2d12m66QbHe0TVv0phyUlYFQ8w/gjcYKKC692u4CLXr+4ewSsKuu2SCB1hM5Fc6
         A6WQ==
X-Gm-Message-State: AOJu0YwAX0qqjIU+DbLqkBVrfvr/23AbjA7xI1EIUgogcBrXOKmdd+Ay
	BD8mqo02ShVafBNvyy8sSZZdFSPbjA9HsKBoz/TAuqsNDHNkTUJyTH3dZyDdaKCbOfE=
X-Gm-Gg: ASbGncsK1PCZsJ8oBYb4KjKf3qOsrR5C+Z15/83OcFJd8cpKg7f77CARK4MljtEXK8B
	VGSxe8CNyp8SUCQllFS2p7tPUt491lmBijXy7hjSqMYypPVKMACVPPVSS2LGukjLLI2POZwzgWq
	JH3by/XaHQIaZ7DdabYoelM5oqp9kxE+3PnukSQMR2llcGOEnTI4Oaf3Ys1fXjzRYgYnnr0hBRn
	mHQCP79QA0JzAJkbBVzKYc0QVDSuLRY7zx5+wiH3AedY+EZ6CQg+yziMT1E8RpfxjTI0FYSQ4Gg
	+cw2IfdMHUna/bO+P/kQA51BSFXPX2bN8ABaKXpo4zS61Xdt8g6eX/0eU5V3LGbi5lzC2Xytz9w
	jpm1v4Mxqmo1LPCFw2WgGVInsFLRCWq4qQYVpXdYAwFcwAV3vS3HcQM3g8P7bLwrfonTHKxKopR
	TVPXE5akWpqZoOtn0rCsW8bXgW0HUG99DgMxQs+HAEIeU=
X-Google-Smtp-Source: AGHT+IEBsjbGhxSIADHKU/jkeoO1PtNiYWdQlg9Ym9NskralvCLvbd/sbcWeV6cauCEQmOzMHU/aag==
X-Received: by 2002:a05:600c:4691:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47717e414a3mr19737305e9.26.1761644082274;
        Tue, 28 Oct 2025 02:34:42 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da12dsm19563607f8f.29.2025.10.28.02.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:34:41 -0700 (PDT)
Message-ID: <22f63af8-281d-4783-b770-36cb1feb4732@linaro.org>
Date: Tue, 28 Oct 2025 09:34:40 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: camss: Add Kaanapali support
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2025 10:14, Hangxiang Ma wrote:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSI PHY
> 
> This series has been tested using the following commands with a
> downstream driver for S5KJN5 sensor.

A few comments here:

Publish the code ! Its actually in your interests to do so.

> 
> - media-ctl --reset
> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Good to see, it would be nice if you guys could also start running the 
RDI path through libcamera - softisp soon gpuisp and start showing some 
realworld results.

Not a requirement to merge this series but, a strong suggestion for your 
own verification purposes.

---
bod




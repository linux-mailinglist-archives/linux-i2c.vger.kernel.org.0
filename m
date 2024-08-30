Return-Path: <linux-i2c+bounces-5949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BFD965906
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 09:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815A31F267DB
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 07:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51F5158A37;
	Fri, 30 Aug 2024 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qazfL5dO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7F814F9F4
	for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2024 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004033; cv=none; b=I7n0zQ3Dt+tnGBFWQQsFMFzjfXTe6bdJ8YvyZfpEsaPBq1KnBGecjolFH3vK0lm571m3QpXqoR1cLheWFu2/P+krdTUdfkiJzuV9ZXlrEqHgMuKRyGOnUjGH89phSRCo48olJZutbOOL2YANQ916H2+LXBtu2+PhkykTO1F+YIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004033; c=relaxed/simple;
	bh=VSiORfFqwbMU54hiZwB1d3ZojmwfIK/Qol4tPF7c/rc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M4cShopYA9dRJ2IV0d9KuVYgk3InUUIDeWre/W0NJ6QGgSELym+YXuKLXt3kyct/fKkWmhpnqmoUhY8/EQCaZW7p3YE8ukil/wjKW3tznr0dqKr+u8C0x84ESOQgwZJk8nlkdOe3PZ3e/XccJtLImglThZpUDEc8HChsq79xNEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qazfL5dO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so13182385e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2024 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725004030; x=1725608830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25wikd69ZUkkr5ycvweR6XCBMtXqdYbsu8TrXjjukv4=;
        b=qazfL5dORWWqOYfiwI0R5dz/FQJYosfGn2YVhSFRa0ipa8xnW34SNbGeR6H8ZomZAZ
         vF5A8YJnXWKztJZHyMDTBvWX/u0qsVZtUYD8hzW37A2DGQcrZLgVc+yXyAf6Srrjyrua
         fyDeyuxaXWYwIQiWuDAhRUB02Faetj+LuxmnWJGze96/qGTu6x7yWVHhjHi62h775uWh
         JvuaF2VSP5GVkUlCHgq1aQUo50C1cLa7qC3dsehwen3H1CdtuQtckakJz+pijsJQ3+cZ
         w8V332D57vTsCuwDOAgDlm7tRwWXNQupPPdSZfNhsldyvjj9XKFeiUu4z7AtKHUgVp0B
         iIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004030; x=1725608830;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=25wikd69ZUkkr5ycvweR6XCBMtXqdYbsu8TrXjjukv4=;
        b=m8sNFrqROIYx75eixNMkTrJdPL9LGvF7JIwcmTOYxUMnd25PcfG4s42kwdZaF+Aqpp
         oH8Mq4mvpYVm+bWYWzWWXA/m4f9pJtaJceWr4sQ+PqIBD4PhfIOUvk99wtiz/dDFoGuo
         Uenp5Zm0sBLChvjwNA91v0bLyKmf3GOTTKTVxiqcE3mw9vEyJk0Ht0dxB94m3iYf+zoB
         ZM62j/7APlw/hukkO8DtDtNlDEaoAe82YLPSwoFqZAS8jZIMtV1mvA0mXu5G+rZXuAdp
         Id3OK+MpKNuiq86L2lvvpO4/1uCfqZaoRgHsPjT4FVSrnfjQxCoXqosvhvf8HN5wcDVY
         Ca3w==
X-Forwarded-Encrypted: i=1; AJvYcCUxYDsRVGn6Scc7jgTV/1RldJfran+huNO5S0Cq/Qd5R5wgG28SQ8nGPdBxXt3tk1d87gZ4o4o2UX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKbKYuzv5IjSFcHt9NytX/zzAleZXNsgaHSNi7JFyuN08lyeq
	Xee78v2cUz1VTfA8sRCDXC6OV8FnU8vezHMKFKKs8ISwU6fOQY2ZPE0MO0mgpaw=
X-Google-Smtp-Source: AGHT+IF6QuMgE0Qpt5xvvURSWNcFFsHwHxW5+gCKscPEUBfHGSOw2gWJKaA138vKn+BaqPUisECt5w==
X-Received: by 2002:a5d:60c1:0:b0:367:980a:6af with SMTP id ffacd0b85a97d-3749b58841emr3646647f8f.59.1725004029586;
        Fri, 30 Aug 2024 00:47:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3? ([2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee99d6dsm3272538f8f.48.2024.08.30.00.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 00:47:09 -0700 (PDT)
Message-ID: <d1ceab6e-907a-4939-8be4-6b460d6c594f@linaro.org>
Date: Fri, 30 Aug 2024 09:47:06 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/08/2024 11:24, Mukesh Kumar Savaliya wrote:
> This Series adds support to share QUP based I2C SE between subsystems.
> Each subsystem should have its own GPII which interacts between SE and
> GSI DMA HW engine.
> 
> Subsystem must acquire Lock over the SE on GPII channel so that it
> gets uninterrupted control till it unlocks the SE. It also makes sure
> the commonly shared TLMM GPIOs are not touched which can impact other
> subsystem or cause any interruption. Generally, GPIOs are being
> unconfigured during suspend time.
> 
> GSI DMA engine is capable to perform requested transfer operations
> from any of the SE in a seamless way and its transparent to the
> subsystems. Make sure to enable “qcom,shared-se” flag only while
> enabling this feature. I2C client should add in its respective parent
> node.
> 
> ---
> Mukesh Kumar Savaliya (4):
>    dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
>    dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
>    soc: qcom: geni-se: Export function geni_se_clks_off()
>    i2c: i2c-qcom-geni: Enable i2c controller sharing between two
>      subsystems
> 
>   .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
>   drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
>   drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
>   drivers/soc/qcom/qcom-geni-se.c               |  4 +-
>   include/linux/dma/qcom-gpi-dma.h              |  6 +++
>   include/linux/soc/qcom/geni-se.h              |  3 ++
>   6 files changed, 74 insertions(+), 9 deletions(-)
> 

I see in downstream that this flag is used on the SM8650 qupv3_se6_i2c,
and that on the SM8650-HDK this i2c is shared between the aDSP battmgr and
the linux to access the HDMI controller.

Is this is the target use-case ?

We have some issues on this platform that crashes the system when Linux
does some I2C transfers while battmgr does some access at the same time,
the problem is that on the Linux side the i2c uses the SE DMA and not GPI
because fifo_disable=0 so by default this bypasses GPI.

A temporary fix has been merged:
https://lore.kernel.org/all/20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org/
but it's clearly not a real solution

What would be the solution to use the shared i2c with on one side battmgr
using GPI and the kernel using SE DMA ?

In this case, shouldn't we force using GPI on linux with:
==============><=====================================================================
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ee2e431601a6..a15825ea56de 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -885,7 +885,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
         else
                 fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;

-       if (fifo_disable) {
+       if (gi2c->is_shared || fifo_disable) {
                 /* FIFO is disabled, so we can only use GPI DMA */
                 gi2c->gpi_mode = true;
                 ret = setup_gpi_dma(gi2c);
==============><=====================================================================

Neil


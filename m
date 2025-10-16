Return-Path: <linux-i2c+bounces-13577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DBBE2B67
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 12:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A951D1A62EDD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 10:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A57328627;
	Thu, 16 Oct 2025 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u59n4pwk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11886111A8;
	Thu, 16 Oct 2025 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609916; cv=none; b=MJShy1SHZ7kQL8QRi1XxEQOVqzBcZmY+z9+NhsmomUx9WmmNef23J7NdLAE6HPA3ay6qbh6Ty4d9jIJpcUPFcm7mOBxWgnzTHVnNOdjSk7Lpg5hyW2POH8XXo+H2mG8W3xxN1IALJMKWRny864lxS1hC3inwt1UzdnCr88yQpmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609916; c=relaxed/simple;
	bh=XBZLRHeHwSEC/eQfjqXZydQM4j4g6/JbFasBuQ9ZViM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b2Ry47oXD11R3Q2jL15Syv8AKC0CUcx8RUgLt2n91mgFO0s8QHZpnB5Uq1J47VNLF9iDWkyh/tVaCc4QIyWYx/xrN0mERQNuDMAbg7auDOq6XABvDYyDYOBX0OqModGEchA5alUpvu+2KJRO5rk0uhL8yKCLSZl086V/Zt4OcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u59n4pwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A231C4CEF1;
	Thu, 16 Oct 2025 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760609915;
	bh=XBZLRHeHwSEC/eQfjqXZydQM4j4g6/JbFasBuQ9ZViM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=u59n4pwkDkGBXihWHVgPwxqsBGP9fYXWL9jaiHx/8IoRggh4zobpQte2xN2lu3F+X
	 WB3ntzOPSP8sW2NLv5otBAaSPLFIusOe9p9dGVtEYhCT00ZbHM2EkQz9drh9BO2JsD
	 x0yWfjvq/anDLdK5EIIKqesTTfJNVDNHs1ZClZSwjO0aB+SV/odVCGnbwuaP5obmbK
	 IEgsc693K3MmRPtdzTulHM8BvbxF+HTqYDqLW/1QB5Qdrca8sIv5o2h6KDI5EfSVoC
	 d9iYa+J9Is+vWEfXRsr6oS3gcZCwdi8tbOboVwwYm/rCnXZ9vgLlX0B+fQPms2bcgD
	 lL5q6miHXWBBw==
Message-ID: <16def16e-fead-4d32-812c-5672773ef3bb@kernel.org>
Date: Thu, 16 Oct 2025 11:18:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: qcom: camss: csid: Add support for CSID
 1080
From: Bryan O'Donoghue <bod@kernel.org>
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
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-5-f5745ba2dff9@oss.qualcomm.com>
 <5f0e081c-30f6-4ff9-b8d2-2af0d87efd23@kernel.org>
Content-Language: en-US
In-Reply-To: <5f0e081c-30f6-4ff9-b8d2-2af0d87efd23@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2025 11:04, Bryan O'Donoghue wrote:
> drivers/media/platform/qcom/camss/camss-csid-gen3.c:        csid- 
>  >reg_update &= ~CSID_RUP_AUP_RDI(port_id);
> drivers/media/platform/qcom/camss/camss-csid-gen3.c:        csid- 
>  >reg_update |= CSID_RUP_AUP_RDI(port_id);
> 
> and this in your code
> 
> 
> λ ~/Development/qualcomm/qlt-kernel/ linux-stable/master-reviews- 
> oct15-25* grep aup_update drivers/media/platform/qcom/camss/*
> 
> drivers/media/platform/qcom/camss/camss-csid-1080.c:static void 
> __csid_aup_update(struct csid_device *csid, int port_id)
> drivers/media/platform/qcom/camss/camss-csid-1080.c:    csid->aup_update 
> |= AUP_RDIN << port_id;

And now that I see the code side-by-side - also please use the 
established macros and/or write a new macro to follow the established 
pattern.

There's virtually no good argument to replicate a bit shift or twiddle - 
that can be functionally decomposed and encapsulated in one place and 
subsequently reused.

---
bod


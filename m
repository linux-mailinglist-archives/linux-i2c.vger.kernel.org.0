Return-Path: <linux-i2c+bounces-13687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C0ABF2E80
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 20:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3E584EBF2D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 18:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E702D061F;
	Mon, 20 Oct 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwxVORL7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374F21EDA0B;
	Mon, 20 Oct 2025 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984332; cv=none; b=Di0GtsdwFCz71ytmgadLIdEd/h4F8WDPrTHIxhj5GEvcYDHs6oekEoKDTJ7P2y4JZGL9h66gWsz6ouKoaabM9N55b97Mx+jpBCypXmeIS7OQcm56iM1OjGl2CRzD/eiFPiUPqZt3/p3184RddSyh7BtzvGMPbP6VBAPfzK2upyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984332; c=relaxed/simple;
	bh=l7Jix1FBerg64A7Lg5AG+fwNbq6vaC7vvRzcp2jzx/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCZjuOMxOhlGOm1pfUhUx6zhcNx+GPEfyTKKJiUVnZd5C76qqqivk+oP3IxenZ4XUs84pFSwm4PQHIClsF7yIrBItROrE622Dilh6S1EolvHeswP13JDdTH6zfY/yq3yhMpc2yIMsHWnfgi1+HenKwOLQz72CCAhF4TOhK2Vpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwxVORL7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7822BC113D0;
	Mon, 20 Oct 2025 18:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760984330;
	bh=l7Jix1FBerg64A7Lg5AG+fwNbq6vaC7vvRzcp2jzx/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iwxVORL7CJrF3NyWiqB1l68YNoiTfKSOhQVKZDvsKI131gQkui/hBBrh/+F8Ay44J
	 FKrm14wL5SC+C3U3xY7JWjZ8gy3BRWwBRRDvKREq1H1hi8YDgOHX+t+pzao2hEtcke
	 0HNYKIRSg6ERXKtBwf+eM1ZHRF6nombrIuoRaYWczk5LHVbrievniUoMJjbZ5hdSX8
	 PBBl2OdKq/rbSRWiFNw/3eybQNCGoX5kGud35zkwkgG3FQb5H+x092VYQQDEp/93Hl
	 cvkhAtcmQbvF8QOyJa0rIoflvbBbNfKDoFyWkjLjD7ou+I1y257AKtin8iyl8+Clek
	 qp0fqZRp5ruDQ==
Message-ID: <d4b70cc9-8d37-4249-875f-b0d80256c9e6@kernel.org>
Date: Mon, 20 Oct 2025 19:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
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
 <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
 <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
 <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
 <e6830a20-7c58-4799-ab38-53c1276cccb4@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <e6830a20-7c58-4799-ab38-53c1276cccb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2025 14:38, Vijay Kumar Tumati wrote:
>>
>> Ack. Thanks.
> Just adding my thoughts on this, as you know the peak/avg bandwidth 
> should primarily depends on the sensor data rate and additionally, the 
> average BW vote should depend on the buffer sizes in the NIUs/NOCs and 
> (although irrelevant here) whether it's an RT or NRT module (file system 
> reads/writes from the NRT modules can be averaged and controlled 
> better). Fundamentally, the votes from all modules go into the 
> calculation of the DDR clock. The current driver does not take into 
> account anything. So either way, it is not ideal I think. We can discuss 
> and come up with a cleaner approach in a different patch series covering 
> all chip sets. Thanks.

Yeah we can.

But please put something more sensible in for v3.

---
bod


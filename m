Return-Path: <linux-i2c+bounces-13576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A3BE2D26
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 12:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FDB9486F50
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 10:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283A631A57B;
	Thu, 16 Oct 2025 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rotlpLuf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495A2D12F5;
	Thu, 16 Oct 2025 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609401; cv=none; b=dA+jilotjd8U4e+QRfb0+WCJdQVGe5c7dmDJpw+61m/59XU8bPdfVjGL07ug483xWC/DwAkMdjFa4HpUVg1fnwujHqQ0lYiTp6GFbpRDQWrc1pDtZcJA6kyUZF+n4ddyFAP9XK9UP1Tjr0r64YChJxHgnzSb9b7qajnxAqu+Jhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609401; c=relaxed/simple;
	bh=e33+JjX5ikE2TKoODBQH8QlYmIOcdmi9lIAGtEqABr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YysAqdy7btOpMkY+pFkKAuRK061VbGtAIj4MceFCgsLVIbnEp18MNF1dDizzMtSzpQ8x63pwtMGGqy9wmh83/2p7pRReK+eOm3vs41zkhZoLmN/MGlUcNudqf3SnRJqbYm3J1MsB/XpbKhN9Sn52N3PNbOTBomPYcWvt6GsIXqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rotlpLuf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67674C4CEF1;
	Thu, 16 Oct 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760609401;
	bh=e33+JjX5ikE2TKoODBQH8QlYmIOcdmi9lIAGtEqABr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rotlpLufoAosQDMkV4VczSSr5YKzEfDSkeyVN+6ug1PQQc0XsZVVEtu9zajEIJOmC
	 Hvsh8kD47wpA+QHMHsKfzW7N7v3N1QCVby8DNwzNSqX/VRJgit9W03Rqb6zYeNp6m2
	 6/zW5xzPOxne5Pl1vAjeBl+Gbz/FGpXgveuFu8r7RXbFxF1L9RYzAuoqHsmRNz5TGK
	 3TzsCQoJjABgFRN7UyvsBnuIYRpB+0DwL4IXO50ycQJ/9UumWOOp9arvvPJu4mQ/Hi
	 WWMbVk7e9yGRTH+aKg6+OVU+KfnnUX8TRwryq2cb8KH9CErQDWamnWG5z/4IVtRAze
	 rGvaZthzu4DKA==
Message-ID: <8d61f29b-ba02-4757-b8cd-5fb51b998acb@kernel.org>
Date: Thu, 16 Oct 2025 11:09:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: qcom: camss: vfe: Add support for VFE 1080
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
 <20251014-add-support-for-camss-on-kaanapali-v2-6-f5745ba2dff9@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-6-f5745ba2dff9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 03:56, Hangxiang Ma wrote:
> +
> +		/* Deferring the reg update until after CSID config */
> +		if (!vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
> +			ops->reg_update(vfe, line->id);
>   	}

But why ?

---
bod


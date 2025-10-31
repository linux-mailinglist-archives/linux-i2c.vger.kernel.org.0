Return-Path: <linux-i2c+bounces-13923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C2C23C6C
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 09:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1363BC6C3
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 08:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7942C029A;
	Fri, 31 Oct 2025 08:16:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E705253957;
	Fri, 31 Oct 2025 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761898584; cv=none; b=JTg5imKosOVdcUDAs2ym9Z1oBaV6Uyi3hnnYSJheWeB6gntH/5DKUJ0+4/ANbXs1yWVjcO9nthCpiOlk5ZcJ4Z9S2xOLZMMecyJZ7uIo8xD44iJtGMiR8aizupani5bQIdHLDZjJqij9rQxhu1/rODM2jzX4ATxRnzuUhADeLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761898584; c=relaxed/simple;
	bh=fGhIYsT50Xq9t6CI5lMf9dFSVPFae+PCvqQq0D8Qkm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU0xziyH+Yhpx97ap7X8bKhwh71PwsDYKRLzfKXFq5/t2MWcOYE1AS96EafOxmhdB7GWrWgyieLpKItzGL/ZbQk7WKJdF887J7/cKB/g3BqgczqjB5kgnZ4JoLmVmlnc8Tws5dGCTgttQwoZE213hY/kT5MxgNtltYQMLnNMNK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E229C4CEE7;
	Fri, 31 Oct 2025 08:16:23 +0000 (UTC)
Date: Fri, 31 Oct 2025 09:16:21 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Message-ID: <20251031-truthful-worm-of-force-7ef435@kuoka>
References: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
 <20251030-add-support-for-camss-on-kaanapali-v5-1-f8e12bea3d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030-add-support-for-camss-on-kaanapali-v5-1-f8e12bea3d02@oss.qualcomm.com>

On Thu, Oct 30, 2025 at 07:59:48PM -0700, Hangxiang Ma wrote:
> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Why do you send it again? Do you read messages on the mailing list?

Best regards,
Krzysztof



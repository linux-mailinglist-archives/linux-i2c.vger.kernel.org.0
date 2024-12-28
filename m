Return-Path: <linux-i2c+bounces-8784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945019FD9ED
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 11:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 283D93A132D
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 10:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889A014A0AA;
	Sat, 28 Dec 2024 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hx8Ezws+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2483669D2B;
	Sat, 28 Dec 2024 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381632; cv=none; b=SytZtsAw0yhhyr3nhl71GJEmMU76LOIbhNDPGV4YGPF9v6jUygB/8mLc+uuVN7tzXgUOLqcXswMKDqWuFvXx/VO/lDO+Ig+oV7hTydOfiUkLck4udAGHUzST6+Xv/GJLXsFw/mA0/1e+pRs0HzDQcvGMbQfFYvrpL0pRr3ldn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381632; c=relaxed/simple;
	bh=JfLhmrGU25lVww0+TvuyRVt//7Ikcd/C6Y58IQ/MPhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgFcXGPpTOBoMKF8jw2XecWwnf633aSfECw7w6fPZTQnnYR11McvkykfVg6mYqs3830wADo3qypaC8wq7KfxMty8XOzbqMSSroYnG+9Nnm6y2g+UFVF8y2r5rwpuG0QCo4JNViv1amMvHySu+GmdexeDuz0iddHFmbixgHNZJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hx8Ezws+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37AFC4CECD;
	Sat, 28 Dec 2024 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735381631;
	bh=JfLhmrGU25lVww0+TvuyRVt//7Ikcd/C6Y58IQ/MPhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hx8Ezws+4H0uHxyZGNClO4JPhtq74nPDSC3ybrh1rBKFtQteXOEn4uXQMKKyYqr7N
	 vwSTBmLGC5UzYd2staT1PIGHpzuPm9fMDh79neXsJV0ZMSjsZN3Bk/fIMgki956/wa
	 XnlMMdHbeoOJbWEMeTPSpZFoTbxovPmaCmcdhKHH/60ClHqNJq26m95HNch/1xTHTk
	 uNrEhOa0IjMetJFZ1nQ7mygeijH9vQFcdKXGd1pbxFwcSZ5M+TpGHx7U9jz7AIOzcC
	 kWtTAKglzTl8eTvbLTYyzug1O9iS+hFf9MYRaRoQLj6rBHkJEZ877zT3RPJIkD8ISv
	 LvJyFpnsWMmUw==
Date: Sat, 28 Dec 2024 11:27:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: media: Add qcom,x1e80100-camss
Message-ID: <vssl4q732cyvwlgx65ala6dwtzkyaezsrybni23fnv35ehtfs7@skvufuyhyuhn>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-3-06fdd5a7d5bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-3-06fdd5a7d5bb@linaro.org>

On Fri, Dec 27, 2024 at 01:11:36PM +0000, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
>  1 file changed, 367 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



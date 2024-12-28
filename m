Return-Path: <linux-i2c+bounces-8782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422B49FD9DF
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 11:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7B86161D1F
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 10:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06611448F2;
	Sat, 28 Dec 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTuhccTs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C70BE6C;
	Sat, 28 Dec 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381255; cv=none; b=YduizK3DWfrurCZPfYLLoWfL+NiAvzzfGmLpOwLu0oIhFfazAPx4jUwQvomoBsXQUPgdGrPC0FSYesQRiKnxIO1MirJ5i8bwqFHOQ2lXEKV0zMiQa3v0c5JCgStCEYUuqMbP8q1X9rAKRKn4R5qGu8wJWI+InAU5qfL59B/cUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381255; c=relaxed/simple;
	bh=amlWZ11/4SbRJvw+rH0cBfMsiGWHOmT7IDM8KF5Zj4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT6H3VUEkyBmcCYWQONvtKutLJquVJsgzg1g/aPEmqZmTlum3wzxItKRJGkX0X/Nkbp5Kw0KCdpmV1+scCbq6b+QjYNgoYCT0Tc3fOLa4Zg1xCjHXGoM09imIQXnsULYdzxTzpX5cWIE6/N7tnb4QV2NvM2iiWAi+g61BelxohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTuhccTs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F023C4CED3;
	Sat, 28 Dec 2024 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735381255;
	bh=amlWZ11/4SbRJvw+rH0cBfMsiGWHOmT7IDM8KF5Zj4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTuhccTsqGH6vGfKT+dyVAJkNX1FNNOg8AnNhtc5CCYbP9qfiYX0mXWtEM9IuShpy
	 c2Pl43zBbZUiUFUMOzpzw1wIVEZ3O3M0wZtI3g+tS4sxIoFBe21uLxacqCFhz1E3BK
	 r7oQZWTN/7GxAua5iQur6zJZLRbaCxups3QenwiWWw4/jUwv+GIjbnnGMsS3M+WnCW
	 ive/viq1qqvAIyaLOlhMQU29gmhTfgzcJ8Jdu4rU9tJ3rHssVIHdFPgxmPD6SH79JH
	 4o2KK6+CIIf7yZEA9VTAl1auKMRTPSUAp/C6Pa7mKoFm3QMeXqit/LuY78530PbGb+
	 Llp9s3sx4/zKQ==
Date: Sat, 28 Dec 2024 11:20:52 +0100
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
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Message-ID: <vdtnd4og24fpsgouvu4ealybmgyvoysmbyy5xbepnzd4sdnufc@oovaxxipqxnu>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-1-06fdd5a7d5bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-1-06fdd5a7d5bb@linaro.org>

On Fri, Dec 27, 2024 at 01:11:34PM +0000, Bryan O'Donoghue wrote:
> Add the x1e80100 CCI device string compatible.

... fully compatible with MSM8996.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



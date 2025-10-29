Return-Path: <linux-i2c+bounces-13883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF145C187F2
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 07:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46403BA47C
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 06:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4CC3002A2;
	Wed, 29 Oct 2025 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJDlDwOk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36921ABDC;
	Wed, 29 Oct 2025 06:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761719684; cv=none; b=Okk3gM3oafMYTmyuvIHMl/5Rvdkjt6v0UG6tLTiqoixLu+RB0ZlSs647kKMf/BUJR6k/DWFBOnnpMaz5IgvjU+UyKy/z2hFiCSQASSkAZ9+lln8VBP/LPo4thP7nqMmv7DWk7YRJQYYCzqPqy4YEIieYGc6NCk8DIsSqYQ3MOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761719684; c=relaxed/simple;
	bh=WgegGDqYF3ar9QEVgmk3wv7S3f0HBnZ4gm4YZogpFU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM8PHYFudWt6uVCN0USTgEgCRkdBbNbCorMyAtNVJ1i5tDSUvreVAg0PWwU4mJYw9wvNxMSkjq1ICgtVNSY7RBm/ld4IYrlLg4EahgWiKOx5CRyk5rYCtZeOU0hv1c7n7tqV0sa+f6HuyV5q9M9tO88jaLT5GCpwksRT6FMFpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJDlDwOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8D1C4CEF7;
	Wed, 29 Oct 2025 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761719683;
	bh=WgegGDqYF3ar9QEVgmk3wv7S3f0HBnZ4gm4YZogpFU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJDlDwOkwJqkzffoOAjJfXYboQCew1ijFfbjHpLUsebNEgAEexh3lZAeRJWXvTLCS
	 8gxb3t5mmoqiNV01RTtx3CK5dWn49UKCMN2DthGvNcNAtTzdhnv8Ou81kHnlnz4+Xb
	 H8+lN5z5DpQiZ2KlizF8VdNxbCnRASHTJLBonXfs72LaGJ3g83ui/+0dcVvpBdbNwk
	 n75HX+Nwf/FcxrzrS4QAOfgvSWySuh//eob06ib1pkI2tZhJr+AbSTWp+KqCj/fMbP
	 UlDzCS0QLJ2rwz9i5X9vHzvjfhisCZ26P9QzTWC3av1lIGY++5Flxrq6sTD+d1Zodm
	 6GBqCRhPbhlZw==
Date: Wed, 29 Oct 2025 07:34:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Message-ID: <20251029-garrulous-cheerful-hare-90bc2b@kuoka>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>

On Tue, Oct 28, 2025 at 05:40:46PM +0100, Luca Weiss wrote:
> Add the msm8953 CCI device string compatible.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



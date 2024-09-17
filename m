Return-Path: <linux-i2c+bounces-6810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C30FF97ABE8
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 09:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27471C21D22
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 07:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6581D14F9EA;
	Tue, 17 Sep 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIpe/BXW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ECB155A4E;
	Tue, 17 Sep 2024 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726557315; cv=none; b=K1TF9TlUJyFCEQCmDQ3IOMS/RK0oRVp/SaxrR2g70ekyRvL2bgi2UqZz5uTFp0aMvl0LQY+ABCZ5tNf+lQdKR7vdrB5Z1c/jXgdF8vNCT7W4QWJ3n2lWFjci3myC0Ou2NZcYYSfZbvHcyug+Fhi//WvcgUgAvVf03skJcAH+WHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726557315; c=relaxed/simple;
	bh=iAK8MsLA1QiXmV9M2V38LicGNCFvYTgbqWA5MBct58o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVZadkakwiiNxyV8yr/cXfjG/q18pdkTum7V1mMgb4+nW5ejNnjeGrHUwzLU3G7NTgWvCwglcgj0BNbJftgDlGoJjM+82NCQUOfGv0OclE+uWy1aGN1sFPvyx0qWkOiTHvB7NWXu06Ez6AuGebkih1rBFZRkNBTtaNSuGe3ly5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIpe/BXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC92C4CEC6;
	Tue, 17 Sep 2024 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726557314;
	bh=iAK8MsLA1QiXmV9M2V38LicGNCFvYTgbqWA5MBct58o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIpe/BXWEsCv6Qx93p28fa4WMUqwHgLD1psF1sfpJwI2lX3I6sd1GB8AjRA4c6oGG
	 UVywambhC9iYypPodVJSLuA4kzxPFjdpRhIQNK7vyQUgdJZ/XYOv/2DGvMvh1Wv/S5
	 MESUQAis7HpFVcZNuBY/nThksUjbmmgtjwIJc4sNhmsQpzy5pQx3n1nJgDM4psD3PI
	 PmUj1Blor0cm72JIiculAxikHELnjtOTuZNMism/LwMNkcG4HfXMr6BSqNoUWMQXK2
	 NuM60xY7/rryNgXULROXrrMHIrK3xGYbupHj44ScpCSy+hJRrNAbjWiWKhMbeZ/lHw
	 04s13s+YoCW4w==
Date: Tue, 17 Sep 2024 09:15:08 +0200
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Keep comment why interrupts start
 disabled
Message-ID: <nkfcib5rofj3tpocfpfolgqspuohduxi6ch6ss6nwl3eymuqo3@ljj3ypfmj4us>
References: <20240916121516.3102-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916121516.3102-2-wsa+renesas@sang-engineering.com>

On Mon, Sep 16, 2024 at 02:15:17PM GMT, Wolfram Sang wrote:
> The to-be-fixed commit rightfully reduced a race window, but also
> removed a comment which is still helpful after the fix. Bring the
> comment back.
> 
> Fixes: e2c85d85a05f ("i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 4c9050a4d58e..03c05dcc2202 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -818,6 +818,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> +
> +	/* Disable the interrupt so that the system can enter low-power mode */

I'm uncertain about the correctness of this comment. Seems more likely
that we're concerns about lingering interrupts from operation of the bus
during boot.


Perhaps I'm missing something obvious, or perhaps there's a need for
reviewing the code written here under the documented premise?

I think there's value in keeping the comment in the code, and then try
to update it with a more detailed description.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

>  	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>  			       dev_name(dev), gi2c);
>  	if (ret) {
> -- 
> 2.45.2
> 
> 


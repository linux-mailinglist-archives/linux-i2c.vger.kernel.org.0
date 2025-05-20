Return-Path: <linux-i2c+bounces-11063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5335ABD22D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 10:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4513A889F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 08:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B5C2641EA;
	Tue, 20 May 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaeZohTx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5F1C84C0;
	Tue, 20 May 2025 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730518; cv=none; b=J2zpYjnbZ3A+caT5nFx3mCVYZ2g6pv9qA+GOmip7VeREFeMjILxepSllXwxiOkAZtTgV5TgvofOXVbOfhJWbsuQCOSxTGlOSHXNWQkVvbxic2BlIKxfD8zSXBscRtX8uN5f3PS9jV5bJhhWGWycTIL4KLleVR6pivSqmlzD+VWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730518; c=relaxed/simple;
	bh=VxyCiOVm9biPxOYF20FCa5ct5Es6wThbt6p5CNJbtC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnqFBZoeGeCnB+Tj3Z0M5bONWlDeN9TolK8hUpdLXc/WvJ3TO6eFnuyB/ncYi02nE/MJBjIQ137Z6IIuFE24lhYBhFXk5s/S+UhtiXE1y44ZcWj6dyG7capfR0cEpKwfUXX9rr/hHWJMUqisLGjHdldpA+DuSdeysFRT98GhbQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaeZohTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D002EC4CEE9;
	Tue, 20 May 2025 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747730517;
	bh=VxyCiOVm9biPxOYF20FCa5ct5Es6wThbt6p5CNJbtC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaeZohTx+rOrydLwwi7k16JkKO7H5bIuzg2srJ33Vmf18jDeCIo28PUZXS6u7T6r/
	 dATdCDe7DyFEKKcd++rT1h/wJPihwyKRHcVSgiL+ESzjiaecXJUNeoF6BcRC+AlWr/
	 k2UP/UWugn+raOX8vxYoGKlu0EWjEoG3y2ABoNaBuqPqQ3ffImQ4Sl27PvVikdAO1d
	 cd7P2zGFSU8qYJ5qfxBLQazi6YAhEvbfxmeUgVTrpddfrtIMD3B7MwruC9L6baOmWg
	 NLhJ2sdCKkTv0KTtL61b3B/LknHH3uCZC+kKNGk0ggF9ydFmhjrPvJ0sBMErUEhgSW
	 D6Qot7jHwbICw==
Date: Tue, 20 May 2025 10:41:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
Message-ID: <kmcsuqlmawjqvixoevqa2waf2smznvbtbgw7drlbwgegfojz5x@vziujze5nzsb>
References: <20250519141918.2522-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519141918.2522-1-vulab@iscas.ac.cn>

Hi Wentao,

On Mon, May 19, 2025 at 10:19:18PM +0800, Wentao Liang wrote:
> The qup_i2c_xfer_v2() calls the qup_i2c_change_state() but does
> not check its return value. A proper implementation can be
> found in qup_i2c_xfer().
> 
> Add error handling for qup_i2c_change_state(). If the function
> fails, return the error code.
> 
> Fixes: 7545c7dba169 ("i2c: qup: reorganization of driver code to remove polling for qup v2")
> Cc: stable@vger.kernel.org # v4.17

no need to Cc stable here, it's not such a big issue.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-qup.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index da20b4487c9a..2477f570fe86 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -1538,7 +1538,7 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
>  			   int num)
>  {
>  	struct qup_i2c_dev *qup = i2c_get_adapdata(adap);
> -	int ret, idx = 0;
> +	int ret, err, idx = 0;
>  
>  	qup->bus_err = 0;
>  	qup->qup_err = 0;
> @@ -1588,7 +1588,9 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
>  		ret = qup_i2c_bus_active(qup, ONE_BYTE);
>  
>  	if (!ret)
> -		qup_i2c_change_state(qup, QUP_RESET_STATE);
> +		err = qup_i2c_change_state(qup, QUP_RESET_STATE);

This check was removed on purpose, not by accident in the commit
you pointed out in the Fixes tag. On the other hand I agree that
this needs to be checked, perhaps restoring the original code:

	if (!ret)
		ret = qup_i2c_change_state(qup, QUP_RESET_STATE);

	if (ret == 0)
		ret = num;

What is exactly that you are trying to fix here? What is the
error you have faced?

Thanks,
Andi

> +	if (err)
> +		return err;
>  
>  	if (ret == 0)
>  		ret = num;

PS: your code can be refactored in a way that we don't need this
extra variable. E.g., something like this:

	if (!ret)
		ret = qup_i2c_bus_active(qup, ONE_BYTE);

	if (!ret) {
		ret = qup_i2c_change_state(qup, QUP_RESET_STATE);
		if (ret)
			return ret;
		ret = num;
	}

Looks the same, no? But I think the original version should work
better.


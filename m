Return-Path: <linux-i2c+bounces-2879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B81748A0681
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 05:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 729F628C0D6
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 03:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE6813BAD0;
	Thu, 11 Apr 2024 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpDHbAG2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0752713BACA;
	Thu, 11 Apr 2024 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804894; cv=none; b=fUGs5qLlTugRxLA77MFKG1TbwRxG3xykMdb8D/v2csRKNJ+70xB7LBW3dwgri1kxcmR3esvMD0sDz4IohGUEwCBE6coJTJFajFXwjlmSjG7nHd6o8Zr5w28ekPnqlbRXYarvwtOUR/Aeq1bMnS7hPB/EekhlnSq+ZTDplur4O1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804894; c=relaxed/simple;
	bh=VoGsCBX4wEoCsenDI82mJ6xXvF2nfXfBUIDKz4xNrbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qofYEhkqMI1iEqfW7L5L2m2VYAtp4ZTxZ90MUcFu7tjcr2+p6NQO3+Alog0NuGKVgYXJ/lmSzOd2mY0H/d2/qiuPgsTjfMRhBujyZDvvhxxXi3ut3k77b5yCpWwcR57dz+RkovH+iPhPBC3MWiW6a/K5Wx7mt34/veKi4ScTEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpDHbAG2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E8AC433F1;
	Thu, 11 Apr 2024 03:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712804893;
	bh=VoGsCBX4wEoCsenDI82mJ6xXvF2nfXfBUIDKz4xNrbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpDHbAG2TR/SG6U1HKATjXnVQIUZGDyW9Ii3QdcL9mexoKaNtkc26VBkBzn/AynUU
	 R/5DNhSeS4cPlnTGXvZUgI//xeGXIaWw36S2LfNEGqOrxOywG6Xl+MjpgEKSxCk23E
	 oqlJucbXmI7IZnbF5QEhfbhkzgts/zpF5zW+uTs0flBNllzLvh93ZP0CSZC4kGle9e
	 ngZlDYojxWxAgsEapRhbB5gWh4CWBDDQpi/Vc8jnDB3XLU5v6yiRNpbRaoUrILNxPM
	 OdXswuR9c2Ad8C8yG3Ep5vPOMOqbqeh136BCbei25Dyi20kIQIXdk3oTO5FtX1REyP
	 J0qXt4306rKNg==
Date: Wed, 10 Apr 2024 22:08:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/18] i2c: qup: remove printout on handled timeouts
Message-ID: <rafjrpw5wbdd4cq5qvslkxfqmzd4rbcbn3exwxfmae5jqns7ix@vfhurzdgrzhd>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-32-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410112418.6400-32-wsa+renesas@sang-engineering.com>

On Wed, Apr 10, 2024 at 01:24:26PM +0200, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Remove the printout.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/i2c/busses/i2c-qup.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 598102d16677..c9b43a3c4bd3 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -793,10 +793,8 @@ static int qup_i2c_bam_schedule_desc(struct qup_i2c_dev *qup)
>  		dma_async_issue_pending(qup->brx.dma);
>  	}
>  
> -	if (!wait_for_completion_timeout(&qup->xfer, qup->xfer_timeout)) {
> -		dev_err(qup->dev, "normal trans timed out\n");
> +	if (!wait_for_completion_timeout(&qup->xfer, qup->xfer_timeout))
>  		ret = -ETIMEDOUT;
> -	}
>  
>  	if (ret || qup->bus_err || qup->qup_err) {
>  		reinit_completion(&qup->xfer);
> -- 
> 2.43.0
> 


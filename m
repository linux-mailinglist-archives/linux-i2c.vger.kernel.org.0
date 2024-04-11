Return-Path: <linux-i2c+bounces-2878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AD8A067E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 05:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED33428C14E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 03:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB8C13B5B9;
	Thu, 11 Apr 2024 03:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBDMuOfk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBABB13B5B2;
	Thu, 11 Apr 2024 03:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804882; cv=none; b=Zfm6z95OYd3jrLdgeOn2Iv2VDjxv67oGuvr+QLgJqkAEEqFlnI2nwBg/W8l3gKwjrt2WfRHJYbs9LFnexmb/8qDX9+u5m2cqz17EiPSeEBtVyvqzUANf/2UZ2vUdC+O1yiyDmB92OCHyOKcBXvCnN5wfCyVC5S6BGaigofhXswI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804882; c=relaxed/simple;
	bh=nIkVgvNu6ktxnbrIY/V2KS8zZFhOpatS2A7hVJTR3Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=By3yYg1j5L/us0POzOjf4BnWyFjaGpdCf7mcl+sk/OpAnHKNxa/16vyZabRFTOr/TYze0o9yy/U3AOgWCha28CnQqPu0wWHdb36FFmJzPPW5KAHL7uQdB6GAt6Gc6AlGrI246d/0DHYwnQL9qDxONWWDZF4UmCSZIJ3CQIe1ZuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBDMuOfk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026A3C433C7;
	Thu, 11 Apr 2024 03:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712804881;
	bh=nIkVgvNu6ktxnbrIY/V2KS8zZFhOpatS2A7hVJTR3Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBDMuOfk9Ar/4I5dmjD3gbILprvgKZD9nO8wIxS+Zwx7njEC83h2AJQK2Vz1kBr+Q
	 8/RQjU/0lQj7fhPgr5lfuepc5Be4i6cAd3ZobNKa4otsQgO5GkAXKCJuz2q1CRqNEg
	 LNBzX70DAMz4SYUQZd6hdDjTyuNehDoXbnYI4q9tn9PPsURfjoOJ7H8XoaaMxIzimV
	 XYWjD5gAZ92JuYS31JmpcbRDBtmu1ShxP1rPsxG6BwWRIag6Ihhydky/kEeWAh7r9r
	 qo90OfOCkCVF4JBynfSotg+uvKOCtZHwxilRZK1vjqs9F/5adRGzsOaF0n/sadaza/
	 BKGrUJKywL53A==
Date: Wed, 10 Apr 2024 22:07:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/18] i2c: qcom-geni: remove printout on handled timeouts
Message-ID: <ayyypwhenfofamynnlbqolbdxw3rnncsa52n5ga5paofd546qx@uxuf4n2r7uim>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-31-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410112418.6400-31-wsa+renesas@sang-engineering.com>

On Wed, Apr 10, 2024 at 01:24:25PM +0200, Wolfram Sang wrote:
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
>  drivers/i2c/busses/i2c-qcom-geni.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 11dcfcf13d8b..6054c62cd2ff 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -642,11 +642,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  		dma_async_issue_pending(gi2c->tx_c);
>  
>  		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!timeout) {
> -			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
> -				gi2c->cur->flags, gi2c->cur->addr);
> +		if (!timeout)
>  			gi2c->err = -ETIMEDOUT;
> -		}
>  
>  		if (gi2c->err) {
>  			ret = gi2c->err;
> -- 
> 2.43.0
> 


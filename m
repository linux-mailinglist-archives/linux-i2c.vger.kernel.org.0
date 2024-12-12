Return-Path: <linux-i2c+bounces-8466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8579EE801
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 14:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF96218899D2
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 13:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8223120B7FA;
	Thu, 12 Dec 2024 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SG97DJ6x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35154720;
	Thu, 12 Dec 2024 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734011136; cv=none; b=Ab2FDMvL1/+5jMu2Pt1C718n+ZX8sV3Gv9Yox2F9tK1wohDCuD9wLexlu25YPILLUAIKlEZ5FBzgQYwWSfZ8gGcq2jitZuSOEpdU6aYhB2g44Nzl7eyKzAZAz87Z2IPCaB+B2rYHy4k/SilqvChFlV3Jid+Ehwd2CivfIRYXeJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734011136; c=relaxed/simple;
	bh=N/xB9jv77LySRrAbu2Yk7Cbgx2o0HIhjAMeMKxcxFls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC+HuZkQYzVrpPNr7EJM6+a9+NMeEjcb5NaZzJC9T8x9LYuE4CNBao8TqcRT4eXvZqs7zj0zwt036F7WWIRlL2p1eGak074sJCeTRWHATd9JhpEMVyJa8H1kvbLExjDpkvlzMzC4WU0MGQ6p6XODCVuiVRr1KSeS8R+ZxTjwIxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SG97DJ6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CD4C4CECE;
	Thu, 12 Dec 2024 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734011135;
	bh=N/xB9jv77LySRrAbu2Yk7Cbgx2o0HIhjAMeMKxcxFls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SG97DJ6xU1fP6+O5sk6LIgcW+s0XXwLsifGTaHW7gCxl2Cg3qNMpHyl6sPGA5UUO3
	 phS498n5LIzCuhBEQFiPhXWFL8CneeJi10Y5jye0k3sflYaqcqIlahvnRTjQhhXV4w
	 6f+zXQu3afNMvSVg2FhZikGu8kDIw3tSWFEMrq3KfxNr/E2v8mmLZHE93hs/a6fZNf
	 j6DdMU+2urjt0QBq+qidWqGctY8UG7zdBVycVZt853Rz1PCsv0sVJekOLQ8m1Q6cu2
	 D399M8Ia2zqf1Zq6aaducU4HDOel7bu7JVKEQcksALkhO3+PpNKhhYhm4pvU3ahPS8
	 ANIaj55JCcCLw==
Date: Thu, 12 Dec 2024 14:45:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Message-ID: <fd45ts4bgcaaoydvvkq52c3r65dhrmbe4ig3oxp7pqtmrckdwd@wnyfmzlfhgs5>
References: <20241210231054.2844202-1-andi.shyti@kernel.org>
 <20241210231054.2844202-3-andi.shyti@kernel.org>
 <50ebc5f1-967a-4aa7-a4c3-3304961d1f8b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50ebc5f1-967a-4aa7-a4c3-3304961d1f8b@quicinc.com>

Hi Mukesh,

> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 01db24188e29..3fc85595a4aa 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -867,14 +867,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >   	ret = geni_se_resources_on(&gi2c->se);
> >   	if (ret) {
> > -		clk_disable_unprepare(gi2c->core_clk);
> > -		return dev_err_probe(dev, ret, "Error turning on resources\n");
> > +		dev_err_probe(dev, ret, "Error turning on resources\n");
> > +		goto err_clk;
> >   	}
> >   	proto = geni_se_read_proto(&gi2c->se);
> >   	if (proto != GENI_SE_I2C) {
> > -		geni_se_resources_off(&gi2c->se);
> > -		clk_disable_unprepare(gi2c->core_clk);
> > -		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> > +		dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> Suggestive comment, can we make this second patch as first patch ? So that
> we can have both above lines reduced in this patch.

I'm sorry, I missed this comment. I tried to swap it and there is
not much reduction in line changes[*].

The reason I chose this order is to avoid changing the same line
on both the patches, like here[**].

If it's not binding for you, I would keep the ordering.

Thanks again a lot for looking into this,
Andi

[*] https://paste.debian.net/1339486/
[**] https://paste.debian.net/1339488/

> > +		goto err_off;
> >   	}
> >   	if (desc && desc->no_dma_support)
> > @@ -886,11 +885,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >   		/* FIFO is disabled, so we can only use GPI DMA */
> >   		gi2c->gpi_mode = true;
> >   		ret = setup_gpi_dma(gi2c);
> > -		if (ret) {
> > -			geni_se_resources_off(&gi2c->se);
> > -			clk_disable_unprepare(gi2c->core_clk);
> > -			return ret;
> > -		}
> > +		if (ret)
> > +			goto err_off;
> >   		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
> >   	} else {
> > @@ -902,10 +898,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >   			tx_depth = desc->tx_fifo_depth;
> >   		if (!tx_depth) {
> > -			geni_se_resources_off(&gi2c->se);
> > -			clk_disable_unprepare(gi2c->core_clk);
> > -			return dev_err_probe(dev, -EINVAL,
> > -					     "Invalid TX FIFO depth\n");
> > +			dev_err_probe(dev, -EINVAL, "Invalid TX FIFO depth\n");
> > +			goto err_off;
> >   		}
> >   		gi2c->tx_wm = tx_depth - 1;
> > @@ -944,8 +938,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >   	return 0;
> return ret here ? yes, we need to initialize ret = 0.
> > +err_off:
> can we rename as err_resources ?
> > +	geni_se_resources_off(&gi2c->se);
> > +err_clk:
> > +	clk_disable_unprepare(gi2c->core_clk);
> > +
> > +	return ret;
> > +
> >   err_dma:
> >   	release_gpi_dma(gi2c);
> > +
> >   	return ret;
> >   }
> 


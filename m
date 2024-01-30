Return-Path: <linux-i2c+bounces-1529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C000841FF5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 10:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D73BB2CDCA
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 09:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933786089A;
	Tue, 30 Jan 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvvvnK8M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968660884;
	Tue, 30 Jan 2024 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607784; cv=none; b=tV0ZF4bayWCHsFr8dWJDXglGL82yqVpAVMMw+/+/5gwVmdE7DxtCaGlq8VwaCpbrQuJzwNldFMQ0gnBhCbacbS5E7dtmf5BcnL1BFokBeAb0HgntGg1HNV+5QLram+H2THKEPl1hFrAorj6Nu6xXqouX1jaHinCnMJB11zeX2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607784; c=relaxed/simple;
	bh=ldrlgKcrWSPBN/HSbuJTM+glXjW0wkDulQn6qoVjgNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8jBNpbEF1bmQzzVFxItfTPXz9CpzbtYtILh5rPl6rC8YfkaXEyfzCmj4DDgED51jqB82hbsogJf+yk+GFOq73AUg5rpqmx5JSN5apQdub3a8hBmaRXaDDB38eEPGATbag/wpW/zDyQnSzSRhn7zPGFD6duA2CvdwkLeuyP2ohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvvvnK8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FD4C433F1;
	Tue, 30 Jan 2024 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706607783;
	bh=ldrlgKcrWSPBN/HSbuJTM+glXjW0wkDulQn6qoVjgNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvvvnK8M//BQMdjyfgNqe0NVXQyupwifsm7Gw4xTWob7fSp3IRxVz0aBGvzazjMtY
	 0JVeNxfwhRcomwW/zCTgB1vThCBPzePW/pSpo7P2cBvQ7BkJ1B0KHJnkbXjSqfcXE0
	 5Y8a5tQ9mRTSKXvcw9gRtFmSR3GJ4uGdsGLSodNDG9Asyi4R49qKJUP4gXeebAl/NP
	 /SueJccH0u82j0fPsq9baa7XkdOyHtPJRxLGt+LCNKwu0v6tyulpwvnb1yfjFCMSP9
	 v4jyAjcZXnYB/eI+6RzkbRXyUOZEqDxy/thGd69zsI4Ie+4dyND1Bte9R8ymdPIVMH
	 lnBt+sH4XNRXg==
Date: Tue, 30 Jan 2024 10:42:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, quic_bjorande@quicinc.com, 
	manivannan.sadhasivam@linaro.org, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [V2] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Message-ID: <txbi7hpta26tdncbjyyyxmayos7kw7qbo6y5lcxp2nfk3hogxv@pddv45eqyc2b>
References: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
 <CAA8EJpr_KXsjTUYha7OVg4HLLJLqMRvJun9DnMkBFvq3R2nk=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr_KXsjTUYha7OVg4HLLJLqMRvJun9DnMkBFvq3R2nk=Q@mail.gmail.com>

Hi Dmitry,

thanks a lot for your review!

On Tue, Jan 30, 2024 at 01:49:57AM +0200, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 08:10, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
> >
> > For i2c read operation, we are getting gsi mode timeout due
> > to malformed TRE(Transfer Ring Element). Currently we are
> > configuring incorrect TRE sequence in gpi driver
> > (drivers/dma/qcom/gpi.c) as below
> >
> > - Sets up CONFIG
> > - Sets up DMA tre
> > - Sets up GO tre
> >
> > As per HPG(Hardware programming guide), We should configure TREs in below
> > sequence for any i2c transfer
> >
> > - Sets up CONFIG tre
> > - Sets up GO tre
> > - Sets up DMA tre
> 
> It is not clear how this is relevant and/or affected by swapping
> I2C_WRITE and I2C_READ gpi calls.
> 
> >
> > For only write operation or write followed by read operation,
> > existing software sequence is correct.
> >
> > for only read operation, TRE sequence need to be corrected.
> > Hence, we have changed the sequence to submit GO tre before DMA tre.
> >
> > Tested covering i2c read/write transfer on QCM6490 RB3 board.
> 
> Please read Documentation/process/submitting-patches.rst, understand
> it and write a proper commit message.
> 
> >
> > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > Fixes: commit d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> 
> As it was pointed out, this line shows ignorance of the mentioned file
> and of the existing community practices.

If the issue is only in the commit message Viken can propose a
proper commit message as reply to this e-mail and I can fix it
before merging the change.

Important is that no issue is seen in the code.

Please, Viken, can you either send a v3 with a proper commit
message or write it in the reply to this e-mail with the changes
that Dmitry suggested.

> > ---
> > v1 -> v2:
> > - Remove redundant check.
> > - update commit log.
> > - add fix tag.
> > ---
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 0d2e7171e3a6..da94df466e83 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -613,20 +613,20 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
> >
> >                 peripheral.addr = msgs[i].addr;
> >
> > +               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> > +                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> > +               if (ret)
> > +                       goto err;
> > +
> >                 if (msgs[i].flags & I2C_M_RD) {
> >                         ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> >                                             &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> >                         if (ret)
> >                                 goto err;
> > -               }
> > -
> > -               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> > -                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> > -               if (ret)
> > -                       goto err;
> >
> > -               if (msgs[i].flags & I2C_M_RD)
> >                         dma_async_issue_pending(gi2c->rx_c);
> > +               }
> > +
> >                 dma_async_issue_pending(gi2c->tx_c);
> >
> >                 timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation

If you are going to submit again, please make also sure that the
e-mail is formatted properly.

I'm not sure that this footer will be accepted by git.

Thanks,
Andi

> >
> >
> 
> 
> -- 
> With best wishes
> Dmitry


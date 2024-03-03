Return-Path: <linux-i2c+bounces-2123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDD586F579
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 15:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1511A285A5C
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 14:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6565A105;
	Sun,  3 Mar 2024 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaDfvrKn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C156D59B78;
	Sun,  3 Mar 2024 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709475161; cv=none; b=FWtQleUdRWrPDcF1o76JLlxMmQfqlfCwcat5JcxqkbdIoAkCvVTygOxC2G2+iY1HqXYcyIUj+pGy9nrgBPmvZu58yPGbKxM9sZPpcewolflypUlTRAJyU1yI8gQCjd4ZngSq+yEVQE/20zsNQ/SZ034EkrXn8J3O1xA7/kAb1jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709475161; c=relaxed/simple;
	bh=e7TtZTt6negFXYMOthELEKIIMFN91RWYmubklIaNQB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2+zfcgOalWnUxe4JKuPS8WzmXVK8yEXgqdiCO9Yagv+G0ew+rcXAU7mVQt4IqEUl+cvm82ll9aqexeBsdI2+7m3beDpgy6TSJeMiucnt70nNj+2x2X9duoqRZ/maIcp7KfRNxl6gp82iGKhaatMt3MJecEYZU6MFdpUn5Bwtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaDfvrKn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8703CC433F1;
	Sun,  3 Mar 2024 14:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709475161;
	bh=e7TtZTt6negFXYMOthELEKIIMFN91RWYmubklIaNQB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaDfvrKnqH4Qlfl3ZvLVT/d9em1h5PCMym8D5iLtWrFpkefEk38LMQKk1eCp1t+vY
	 JlukEiY1xus8v39ySUXxewXidPAF7jd7ZAPwfk9VgoB12yUqxluj5zLruKEUXrP+F3
	 gNbEwppOpHcgdtNI1JDQlW7h7iWXIMWhGnYrrdmkHBrqkYIm3jpB6sD5FlzfjPg2Ew
	 X1oipLSPHlGYkZB8XQYea0zgaJlTDxjDK0uKTGRdPyswLoEuahSl6EbzRhwZnQuAiM
	 Uua/ix46UPixnDZgoqknf94AAKrHoHIO4q/EmYBrx+4pC34e4xVt97j662sgDcmGTJ
	 TPcBbkLPPTRiA==
Date: Sun, 3 Mar 2024 19:42:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	konrad.dybcio@linaro.org, bjorn.andersson@linaro.org,
	andi.shyti@kernel.org, wsa@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	quic_vdadhani@quicinc.com
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <ZeSFVEcA9g2WTyJz@matsya>
References: <20240301112638.990045-1-quic_msavaliy@quicinc.com>
 <fuggv2kghhxijcljavzsus5uagjiknj5mrzwmqbxbhkyov5t75@smpxbhpdz7cv>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fuggv2kghhxijcljavzsus5uagjiknj5mrzwmqbxbhkyov5t75@smpxbhpdz7cv>

On 01-03-24, 10:37, Bjorn Andersson wrote:
> On Fri, Mar 01, 2024 at 04:56:38PM +0530, Mukesh Kumar Savaliya wrote:
> > we are seeing protocol errors like NACK as transfer failure but
> > ideally it should report exact error like NACK, BUS_PROTO or ARB_LOST.
> > 
> > Hence we are adding such error support in GSI mode and reporting it
> > accordingly by adding respective error logs.
> > 
> > geni_i2c_gpi_xfer() needed to allocate heap based memory instead of
> > stack memory to handle and store the geni_i2c_dev handle.
> > 
> > Copy event status from GSI driver to the i2c device status and parse
> > error when callback comes from gsi driver to the i2c driver. In the
> > gpi.c, we need to store callback param into i2c config data structure
> > so that inside the i2c driver, we can check what exactly the error is
> > and parse it accordingly.
> > 
> > Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> > Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > ---
> >  drivers/dma/qcom/gpi.c             | 12 +++++++-
> >  drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++-----------
> >  include/linux/dma/qcom-gpi-dma.h   |  4 +++
> >  3 files changed, 44 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> > index 1c93864e0e4d..6d718916fba4 100644
> > --- a/drivers/dma/qcom/gpi.c
> > +++ b/drivers/dma/qcom/gpi.c
> > @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
> >  	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
> >  
> >  	dma_cookie_complete(&vd->tx);
> > -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> > +	if (gchan->protocol == QCOM_GPI_I2C) {
> > +		struct dmaengine_desc_callback cb;
> > +		struct gpi_i2c_config *i2c;
> > +
> > +		dmaengine_desc_get_callback(&vd->tx, &cb);
> > +		i2c = cb.callback_param;
> > +		i2c->status = compl_event->status;
> 
> What would the DMA maintainer say about extending struct
> dmaengine_tx_result with some protocol-specific status field?

That would be sane thing to do if we can get protocol status. Most of
the times DMA txn would tell you success or fail, here we have firmware
which tells us this and I see no reason why this can't be propagated.

-- 
~Vinod


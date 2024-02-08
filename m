Return-Path: <linux-i2c+bounces-1659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F165484E048
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 13:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB3B1F2DE9A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 12:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B652E71B3D;
	Thu,  8 Feb 2024 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmlVmKcj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8871B31;
	Thu,  8 Feb 2024 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707393564; cv=none; b=SJp8JjPe+9Gt7j+Lwa6x2QNL/WhNDDLme4wo+q7Z/nBLX16gwDuCfcOMfIwHp881aszZKnz3bzs3TReCnAa9DXKj7Ql4OBiNlMTUQrjTjZ80MWwu+676OYBzkR1956yfgUI7Mo3NicVcX8JpJ3mhbuLOuR+EzAKmQ2mU4Q4TpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707393564; c=relaxed/simple;
	bh=hOz4D9QVROMnk+YobsB5SY6criPkFQ4Mk/iTZIxP7dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRna0GZmYjNnaaW0up6G6vgv4bOWJkcQXTvtFGsW0mGUeefGLJhPohevkB6u54dktBFRLFUYAFHYeHrXiXMVzStVWNl38miSCiP8RNq4PZFqRmya0BA26TfILENC5d7vSNCO3evp2wBuxsahWjKCjfU4WpEw24Ud/Efq7ZGKoLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmlVmKcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DCEC43390;
	Thu,  8 Feb 2024 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707393563;
	bh=hOz4D9QVROMnk+YobsB5SY6criPkFQ4Mk/iTZIxP7dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmlVmKcjBmEmzvStnviibNXMQt0NnfZxJid7cqNo/Iv9Q9XkTpA+LQGAge7b1jU3F
	 rdv6k9R8InvXTR2VHDBMWDFhb9C0ENzjgEAzo24E9Ngt2np5GUI9K6+rZiMKZwdPEK
	 0Kdt0VA32ul5LahcbKR9uDRC9FSkZl+VWoshMADNfZjXcMEv5UD2WHEdJ9n8kaQ7ST
	 92KRw2WL0WCKo/ZmG1jd0aR3aRYe1fJVl45y6fjQmCe8TpxV/XEMrxSR3DDCv6+B7R
	 ykHxCNaRrQPGZrPfWh6d540CGpk8qrAinS0hbWoj+uCdI0GuWxK6wi9AAsO0vK7BA1
	 yKSe/FsSj3YBA==
Date: Thu, 8 Feb 2024 12:59:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, quic_bjorande@quicinc.com, 
	manivannan.sadhasivam@linaro.org, bryan.odonoghue@linaro.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Message-ID: <cvzyvgb6vahlmrhaijsuyaosdl2p4q5cxhipmu4tujnkpjlbpm@6yu3sbpqha4m>
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
 <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
 <60b5e755-352b-476d-8c6e-2170594ae80d@quicinc.com>
 <uswznu3h53gcefpdc4vxozz32ecdcjvzmr7admwc4h54o27bfy@qqoevrl3dcyt>
 <CAA8EJpqzdp4xYSp+JCExP+Oeu9KhLpsXNUbDxfZ0g+C07xR6dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqzdp4xYSp+JCExP+Oeu9KhLpsXNUbDxfZ0g+C07xR6dg@mail.gmail.com>

Hi Dmitry,

On Thu, Feb 08, 2024 at 01:04:14PM +0200, Dmitry Baryshkov wrote:
> On Thu, 8 Feb 2024 at 12:02, Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Hi Viken, Dmitry,
> >
> > On Fri, Feb 02, 2024 at 04:13:06PM +0530, Viken Dadhaniya wrote:
> > >
> > > On 2/1/2024 5:24 PM, Dmitry Baryshkov wrote:
> > > > On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
> > > > >
> > > > > For i2c read operation in GSI mode, we are getting timeout
> > > > > due to malformed TRE basically incorrect TRE sequence
> > > > > in gpi(drivers/dma/qcom/gpi.c) driver.
> > > > >
> > > > > TRE stands for Transfer Ring Element - which is basically an element with
> > > > > size of 4 words. It contains all information like slave address,
> > > > > clk divider, dma address value data size etc).
> > > > >
> > > > > Mainly we have 3 TREs(Config, GO and DMA tre).
> > > > > - CONFIG TRE : consists of internal register configuration which is
> > > > >                 required before start of the transfer.
> > > > > - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
> > > > > - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
> > > > >                 of the transfer.
> > > > >
> > > > > Driver calls GPI driver API to config each TRE depending on the protocol.
> > > > > If we see GPI driver, for RX operation we are configuring DMA tre and
> > > > > for TX operation we are configuring GO tre.
> > > > >
> > > > > For read operation tre sequence will be as below which is not aligned
> > > > > to hardware programming guide.
> > > > >
> > > > > - CONFIG tre
> > > > > - DMA tre
> > > > > - GO tre
> > > > >
> > > > > As per Qualcomm's internal Hardware Programming Guide, we should configure
> > > > > TREs in below sequence for any RX only transfer.
> > > > >
> > > > > - CONFIG tre
> > > > > - GO tre
> > > > > - DMA tre
> > > > >
> > > > > In summary, for RX only transfers, we are reordering DMA and GO TREs.
> > > > > Tested covering i2c read/write transfer on QCM6490 RB3 board.
> > > >
> > > > This hasn't improved. You must describe what is the connection between
> > > > TRE types and the geni_i2c_gpi calls.
> > > > It is not obvious until somebody looks into the GPI DMA driver.
> > > >
> > > > Another point, for some reason you are still using just the patch
> > > > version in email subject. Please fix your setup so that the email
> > > > subject also includes the `[PATCH` part in the subject, which is there
> > > > by default.
> > > > Hint: git format-patch -1 -v4 will do that for you without a need to
> > > > correct anything afterwards.
> > > >
> > >
> > > At high level, let me explain the I2C to GPI driver flow in general.
> > >
> > > I2C driver calls GPI driver exposed functions which will prepare all the
> > > TREs as per programming guide and
> > > queues to the GPI DMA engine for execution. Upon completion of the Transfer,
> > > GPI DMA engine will generate an
> > > interrupt which will be handled inside the GPIO driver. Then GPI driver will
> > > call DMA framework registered callback by i2c.
> > > Upon receiving this callback, i2c driver marks the transfer completion.
> >
> > Any news about this? Dmitry do you still have concerns? We can
> > add this last description in the commit log, as well, if needed.
> 
> I was looking for pretty simple addition to the commit message, that
> links existing commit message to the actual source code change: that
> geni_i2c_gpi(I2C_WRITE) results in the GO TRE and
> geni_i2c_gpi(I2C_READ) generates DMA TRE. But I haven't seen anything
> sensible up to now. So far we have a nice description of required
> programming sequence in terms of CONFIG, GO, DMA TREs and then source
> code change that seems completely unrelated to the commit message,
> unless one actually goes deep into the corresponding GPI DMA driver.

Agree. I can't take this patch until the commit message has a
proper description and until Dmitry doesn't have any concerns
pending.

Thanks,
Andi


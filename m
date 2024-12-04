Return-Path: <linux-i2c+bounces-8319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F89E39C0
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 13:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7A7165269
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570ED1B87E6;
	Wed,  4 Dec 2024 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLV5R26i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7C1B87CE;
	Wed,  4 Dec 2024 12:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733314894; cv=none; b=fIbWdgTfnn2r5V3GGJuG0kkyctS5HIrLElIVTFRX96T+B0r9GaZFcXFE52f2ISEleyDjHSXYaEkPqFthMDJ7xKOUzYe8CkgRajl6hjFhNAWLoS/Bjnfx9pB+iFf4myiuhN4IkX8GpzZHekis9FRiYBIi0yqehBl19pKLrhLOnCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733314894; c=relaxed/simple;
	bh=CpfXi8+GcBXZJHASZTxcwS5ANDADqkwfWGAthG+eM44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CprNqoUwzwbuzqoqVDJBisO5qWGMsuD9TMibJEA5+PyYeagvxmz1rP4rnwwt3VRfYll37pVJGptRqdncg8sJDb35uAsNVL9avXAHCdZq8WeIuDZe8CfaFoXHPD8t3LN2MjfYh7h+zTeXYYcx21y5iZ2ElZ47pBzDzv8jKpgtQ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLV5R26i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3BBC4CEDD;
	Wed,  4 Dec 2024 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733314893;
	bh=CpfXi8+GcBXZJHASZTxcwS5ANDADqkwfWGAthG+eM44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLV5R26ihbzKBZha/3jRUl8Z0KzQPCH8EI4jo2y19+u9sFezSb/9EQgYFgs122wPT
	 0n7UnK2bY67YByQfehwa6AlWOmOZGaWeq2g2rMoZbV3nnl4+wwV3n1/WzuM0AXD5lL
	 JmjVS78+BUHq9t71sdV5Hd8rRAF8JOGRkAJMzRaIbF55MXUHkwmqNSzS8eK4uebocl
	 npsgFoWyC/Nag+wFqQqNIrs2Kei9aZcIz5CIQTali8WpMWyJISjUrmGWvzeIwHjT2E
	 03vJ/rtEjYk3ediEmPZIJgX1tuEJPr36puZdo2aJ+dpFHCrbwyrxKTsd/9yt8xWi5T
	 FMD/uIyA28Nvw==
Date: Wed, 4 Dec 2024 17:51:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
	linux@treblig.org, dan.carpenter@linaro.org, Frank.Li@nxp.com,
	konradybcio@kernel.org, bryan.odonoghue@linaro.org,
	krzk+dt@kernel.org, robh@kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v5 2/4] dmaengine: gpi: Add Lock and Unlock TRE support
 to access I2C exclusively
Message-ID: <Z1BJSbf+1G8ojTib@vaman>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-3-quic_msavaliy@quicinc.com>
 <Z01YBLcxDXI2UwXR@vaman>
 <d49b16b2-95e5-42b4-9bc1-40cb0bfa15b1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49b16b2-95e5-42b4-9bc1-40cb0bfa15b1@quicinc.com>

On 02-12-24, 16:13, Mukesh Kumar Savaliya wrote:
> Thanks for the review comments Vinod !
> 
> On 12/2/2024 12:17 PM, Vinod Koul wrote:
> > On 29-11-24, 20:13, Mukesh Kumar Savaliya wrote:
> > > GSI DMA provides specific TREs(Transfer ring element) namely Lock and
> > > Unlock TRE. It provides mutually exclusive access to I2C controller from
> > > any of the processor(Apps,ADSP). Lock prevents other subsystems from
> > > concurrently performing DMA transfers and avoids disturbance to data path.
> > > Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
> > > the processor, complete the transfer, unlock the SE.
> > > 
> > > Apply Lock TRE for the first transfer of shared SE and Apply Unlock
> > > TRE for the last transfer.
> > > 
> > > Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
> > > 
> > 
> > ...
> > 
> > > @@ -65,6 +65,9 @@ enum i2c_op {
> > >    * @rx_len: receive length for buffer
> > >    * @op: i2c cmd
> > >    * @muli-msg: is part of multi i2c r-w msgs
> > > + * @shared_se: bus is shared between subsystems
> > > + * @bool first_msg: use it for tracking multimessage xfer
> > > + * @bool last_msg: use it for tracking multimessage xfer
> > >    */
> > >   struct gpi_i2c_config {
> > >   	u8 set_config;
> > > @@ -78,6 +81,9 @@ struct gpi_i2c_config {
> > >   	u32 rx_len;
> > >   	enum i2c_op op;
> > >   	bool multi_msg;
> > > +	bool shared_se;
> > 
> > Looking at this why do you need this field? It can be internal to your
> > i2c driver... Why not just set an enum for lock and use the values as
> > lock/unlock/dont care and make the interface simpler. I see no reason to
> > use three variables to communicate the info which can be handled in
> > simpler way..?
> > 
> Below was earlier reply to [PATCH V3, 2/4], please let me know if you have
> any additional comment and need further clarifications.

Looks like you misunderstood, the question is why do you need three
variables to convey this info..? Use a single variable please

> --
> > Looking at the usage in following patches, why cant this be handled
> > internally as part of prep call?
> >
> As per design, i2c driver iterates over each message and submits to GPI
> where it creates TRE. Since it's per transfer, we need to create Lock and
> Unlock TRE based on first or last message.
> --
> > > +	bool first_msg;
> > > +	bool last_msg;
> > 

-- 
~Vinod


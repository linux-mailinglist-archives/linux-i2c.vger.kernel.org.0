Return-Path: <linux-i2c+bounces-8704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BC9FBBE5
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 11:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29EE016D50C
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 09:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F9D1922FD;
	Tue, 24 Dec 2024 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGXUlViZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B84A1A8F98;
	Tue, 24 Dec 2024 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735034317; cv=none; b=fbNv57CnnDvQ87cPBMcrzsShICaSbThcUWPHLn6YfDzImm2Pnx923C4POxVK0kuo+zUDR3mYeqTCYO2vy0h7ozv4A4HbavWjuWXY7hDJq4D0mhAN7+dygGdKACLV4VliOuK+2+u15byne7Yl0tf4nplTT62c7bTwYd6ihi+iOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735034317; c=relaxed/simple;
	bh=mdDbObUOMwZhB7053ESap8hVyS7kEbOEE0ZlUiqn2Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxfTIBlWhmQ7Mo1zBbxAKtW78Blfgb/YX/a76129ueaPSEbDzlPrPwHTqQtPaGWSuBDB9c3OgCHzos1KomP6RRz8p2yebaj/gzleKz8whK+L+j2iMB/JP1WrLZ5SG13derrkEFZVek+XI7L+R9EzKVn5S/ZvhCwyow2SVDi4aIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGXUlViZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247C3C4CED0;
	Tue, 24 Dec 2024 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735034316;
	bh=mdDbObUOMwZhB7053ESap8hVyS7kEbOEE0ZlUiqn2Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGXUlViZKdVvTat1y9tTH5co6b7TXLG9rP+s076VoMWfZqFBIlqJU2CCKTBL2iIx8
	 POqsitxuKkBy1RmNV0uijzN8BXCmbZHItwaUP/RpDXYjs8gp8rRyARf76SHuYSXok1
	 CiqHQTdzYlJo2JhBiNsPostL+RtRMEQbzYNpLVUOKGKaiMA8/nU72Q4gzcvVnzOxcW
	 Ek2DTshL9Py0ry+p7MK3dlQX89euTscMo93Klx/C04SOXAbc0zY0x/m2pwjjfrovh0
	 iBxmnhq00vZ2/m9PPy2IpMaDTcYy6z842Jbol5MaiHDAIt2GAJeQtB6eKxWnLYKMsZ
	 qTrN3uOtw5BLg==
Date: Tue, 24 Dec 2024 15:28:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
	linux@treblig.org, dan.carpenter@linaro.org, Frank.Li@nxp.com,
	konradybcio@kernel.org, bryan.odonoghue@linaro.org,
	krzk+dt@kernel.org, robh@kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v5 2/4] dmaengine: gpi: Add Lock and Unlock TRE support
 to access I2C exclusively
Message-ID: <Z2qFyQFFjiHy+FvY@vaman>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-3-quic_msavaliy@quicinc.com>
 <Z01YBLcxDXI2UwXR@vaman>
 <d49b16b2-95e5-42b4-9bc1-40cb0bfa15b1@quicinc.com>
 <Z1BJSbf+1G8ojTib@vaman>
 <5ef44277-6739-4e1e-af62-0f40ae081ec1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ef44277-6739-4e1e-af62-0f40ae081ec1@quicinc.com>

On 18-12-24, 18:04, Mukesh Kumar Savaliya wrote:
> Hi Vinod, Thanks !  I just saw your comments now as somehow it was going in
> some other folder and didn't realize.
> 
> On 12/4/2024 5:51 PM, Vinod Koul wrote:
> > On 02-12-24, 16:13, Mukesh Kumar Savaliya wrote:
> > > Thanks for the review comments Vinod !
> > > 
> > > On 12/2/2024 12:17 PM, Vinod Koul wrote:
> > > > On 29-11-24, 20:13, Mukesh Kumar Savaliya wrote:
> > > > > GSI DMA provides specific TREs(Transfer ring element) namely Lock and
> > > > > Unlock TRE. It provides mutually exclusive access to I2C controller from
> > > > > any of the processor(Apps,ADSP). Lock prevents other subsystems from
> > > > > concurrently performing DMA transfers and avoids disturbance to data path.
> > > > > Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
> > > > > the processor, complete the transfer, unlock the SE.
> > > > > 
> > > > > Apply Lock TRE for the first transfer of shared SE and Apply Unlock
> > > > > TRE for the last transfer.
> > > > > 
> > > > > Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
> > > > > 
> > > > 
> > > > ...
> > > > 
> > > > > @@ -65,6 +65,9 @@ enum i2c_op {
> > > > >     * @rx_len: receive length for buffer
> > > > >     * @op: i2c cmd
> > > > >     * @muli-msg: is part of multi i2c r-w msgs
> > > > > + * @shared_se: bus is shared between subsystems
> > > > > + * @bool first_msg: use it for tracking multimessage xfer
> > > > > + * @bool last_msg: use it for tracking multimessage xfer
> > > > >     */
> > > > >    struct gpi_i2c_config {
> > > > >    	u8 set_config;
> > > > > @@ -78,6 +81,9 @@ struct gpi_i2c_config {
> > > > >    	u32 rx_len;
> > > > >    	enum i2c_op op;
> > > > >    	bool multi_msg;
> > > > > +	bool shared_se;
> > > > 
> > > > Looking at this why do you need this field? It can be internal to your
> > > > i2c driver... Why not just set an enum for lock and use the values as
> > > > lock/unlock/dont care and make the interface simpler. I see no reason to
> > > > use three variables to communicate the info which can be handled in
> > > > simpler way..?
> > > > 
> > > Below was earlier reply to [PATCH V3, 2/4], please let me know if you have
> > > any additional comment and need further clarifications.
> > 
> > Looks like you misunderstood, the question is why do you need three
> > variables to convey this info..? Use a single variable please
> Yes, I think so. Please let me clarify.
> First variable is a feature flag and it's required to be explicitly
> mentioned by client (i2c/spi/etc) to GSI driver.
> 
> Second and third, can be optimized to boolean so either first or last can be
> passed.
> 
> Please correct me or add simple change where you would like to make, i can
> add that.

I though we could do with a single and derive

Also, please see 20241212041639.4109039-3-quic_mdalam@quicinc.com, folks
from same company should talk together on same solutions, please
converge and come up with a single proposal which works for both drivers

-- 
~Vinod


Return-Path: <linux-i2c+bounces-8312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBCB9E2A4F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 19:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD69B2AFB5
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 15:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D322202F89;
	Tue,  3 Dec 2024 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDHeXaVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA0200B98;
	Tue,  3 Dec 2024 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733240586; cv=none; b=f0vz6w40BsNMay+dNFjN5GoeWd8CFwitcVdHc4CLzYhdU8awNUbdu3bRcA5zyE1I82GvTnn0wTWPOO9x4T875c8cq8NjXUoefxC7KEE02f2JknJr2w41NR6Z/oFIw06qjwUgC55Xv+2/RKPh9amIlLJtbXtaA1dZD4cWinnoFXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733240586; c=relaxed/simple;
	bh=9OLNoWfbJ/fSHk/eblFi6t1yYGWqojnjJocz0fyfeCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxOHNalYzfGLaH3XgoXrzppKAs6whlLx+4HVHM57GD0Za/W0YuI2PUNZlBM/lEmm8mD5maqTgvmHg9TrGNVnm+Olc+RtWIiQlLXXbuUYqWW3cPSWgcEVLFAU3yoG1VmUJBn09cUOHEIxeDdT2RXZldQ0+0hYNAgFGAZAxe3muKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDHeXaVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F78C4CEDE;
	Tue,  3 Dec 2024 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733240585;
	bh=9OLNoWfbJ/fSHk/eblFi6t1yYGWqojnjJocz0fyfeCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDHeXaVqQtDhhOJjv110b09VHj0jTOPpq3Pg4h0PNQs61hgZPsrKmE4W/DEi7VxTr
	 GclUxKd2QAnPrw8wkzAaTM9Y5n60me86sR2yTMiTvmSH3fEJBs7t01lTF2D4Vt/rWO
	 Yu3NMzpsLcY+qxNqzxJZMYqRiHbl7u5mnIytJrP8AO6GK+KOV0xz2c4pROkGVmIqDT
	 BCYfIddcWSdmhHTFTreCGuCq8GKjsSIagqAbJOMq1utgCV88lrGHdcE8R8ddwaTqG0
	 ZbPYwglEFysH9h+zOUC0Usf4TbFllMHRCiEU+TC2ACTe7nd+ryEx+SCJrNEnKWBx5Y
	 Ntp0VShw9d2Sg==
Date: Tue, 3 Dec 2024 09:43:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org, 
	krzk+dt@kernel.org, robh@kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
Message-ID: <2axyig3yi6tftuhjxwgj6paga2ail2bhzccfipdvjhf7fvkc5b@3mvifuylj3yz>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-2-quic_msavaliy@quicinc.com>
 <5gy5gldcybby53irzyu6lejbwb6wcorb2k4qpd4j7yrijemehu@wmj3tgvxvhdy>
 <c870f63a-3beb-4364-a993-880736d4bbe0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c870f63a-3beb-4364-a993-880736d4bbe0@quicinc.com>

On Mon, Dec 02, 2024 at 04:08:32PM +0530, Mukesh Kumar Savaliya wrote:
> Hi Bjorn, Thanks for the review !
> 
> On 11/30/2024 10:15 AM, Bjorn Andersson wrote:
> > On Fri, Nov 29, 2024 at 08:13:54PM +0530, Mukesh Kumar Savaliya wrote:
> > > Adds qcom,shared-se flag usage. Use this flag when I2C serial controller
> > > needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
> > > 
> > 
> > Per https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > your commit message should start with a description of your problem.
> > "Add" isn't the right word to start a problem description with.
> Problem statement i have explained in cover letter, let me add here too in
> V6. I thought same story gets repeated here. Will not start with Add, but
> problem statement and need of this flag.

The cover-letter is generally not included in the git history, so that
explanation would be lost on future readers.

> > > SE(Serial Engine HW controller acting as protocol master controller) is an
> > > I2C controller. Basically a programmable SERDES(serializer/deserializer)
> > 
> > "Basically"?
> will remove this.
> > 
> > > coupled with data DMA entity, capable in handling a bus protocol, and data
> > > moves to/from system memory.
> > > 
> > > Two clients from different processors can share an I2C controller for same
> > > slave device OR their owned slave devices. Assume I2C Slave EEPROM device
> > > connected with I2C controller. Each client from ADSP SS and APPS Linux SS
> > > can perform i2c transactions.
> > > 
> > 
> > The DeviceTree binding describes properties used to describe the
> > hardware; your commit message describes what a SE is and that it can
> > exist can exist in a configuration with multiple client etc etc.
> > 
> I have explained the use of flag, and background surrounding to the feature.
> See the V4 and V5 and earlier, where i was required to explain and open up
> about "what is SE" ?
> Because of the SE word in flag name, i had to expand with explanation.
> > > Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
> > > 
> > 
> > This isn't what this patch implements. It defines a property which when
> > specified means to the OS that any DMA transfers should be performed
> > using TRE lock/unlock operations.
> I agree, it adds onto understanding about the flag feature. I can remove
> this statement in V6. Let me get complete agreement.

I think the understanding is necessary, but that the wording should be
different. Imaging you're implementing MukeshOS and reading this binding
document to understand what you're expected to do in your I2C driver
when you see this property. 


Similarly, the binding document should be sufficiently clear such that a
newly hired colleague of ours would understand if they should put this
property or not in the dts file they are writing.

> > 
> > > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > ---
> > >   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml       | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > > index 9f66a3bb1f80..88682a333399 100644
> > > --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > > +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > > @@ -60,6 +60,14 @@ properties:
> > >     power-domains:
> > >       maxItems: 1
> > > +  qcom,shared-se:
> > > +    description: True if I2C controller is shared between two or more system processors.
> > 
> > This attempts to describe the property.
> I agree, thats why i limited but there was an ask to understand what is SE ?
> hence i added below.
> > 
> > > +        SE(Serial Engine HW controller working as protocol master controller) is an
> > > +        I2C controller. Basically, a programmable SERDES(serializer/deserializer)
> > > +        coupled with data DMA entity, capable in handling a bus protocol, and data
> > > +        moves to/from system memory.
> > 
> > But this is basically just 4 lines of text expanding the acronym "se",
> > but while it might give some insight into what this binding (the whole
> > binding) is about, I'm afraid it doesn't add value to the understanding
> > of the property...
> > 
> ""se" is also not explained in the binding - please open it and look for
> such explanation."
> 
> It was required to explain based on comment on V4, V5 hence i did. Please
> let me know if one line is enough to explain flag usage OR we need exact
> description from the hardware programming guide ?
> 

What I'm saying is that this binding is for the serial engine, if you
need to describe what SE or a serial engine is you should do that in the
top-level description, not within one of the properties (or in a
possible future repeat that explanation in multiple different
properties).

> I will need to get agreement on this patch first and then upload V6.
> 

Sounds good.

Regards,
Bjorn

> > Regards,
> > Bjorn
> > 
> > > +    type: boolean
> > > +
> > >     reg:
> > >       maxItems: 1
> > > -- 
> > > 2.25.1
> > > 


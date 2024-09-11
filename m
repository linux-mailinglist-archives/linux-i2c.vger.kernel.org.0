Return-Path: <linux-i2c+bounces-6591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A0B9758F6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 19:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1861F26EA1
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149FF1B150F;
	Wed, 11 Sep 2024 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsRzNkjc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530B1AED41;
	Wed, 11 Sep 2024 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074155; cv=none; b=q+SenJYLJKfe6/LD5u6OdqN+mnLSimRAdeI9ZPmnc9A7w0dlGpbkq7ifBiN8S+nPX39pU+nLQ7jwnnjHBIhhsgbZtZtagc3xQOMhmzf0kK2gLOKKRRQd+kOpotC6gBjgpnumRVVvTpddckHfrbXJDMLUt4/Lo+W0rd2myhg/Vl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074155; c=relaxed/simple;
	bh=Ot54YyUryY6P9QornUPLLQJx48nxlLyQvWluOKqxVHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdM6bb8KVs+1ri62gy4J6kkcgiNz1pTjdD8Smtz9el1TGg1iPN6BsOFqRrqiwn0bAcTzr5jeWr51K7fnYw748HqmaeSwzVKqxQaYQ/eU4khIFJYZfHXVX1bUtWMz1nznt4JDeEhu63312D4dG8a0vAjRfVdYhJ8HjbMeldRTjwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsRzNkjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5656EC4CEC0;
	Wed, 11 Sep 2024 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726074155;
	bh=Ot54YyUryY6P9QornUPLLQJx48nxlLyQvWluOKqxVHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsRzNkjc4J+G5EIcBtBS54skNvEpLVMwsq17vuuFyIVXdbSz+NKWi56KPOVNvpDsA
	 anR4a0HJ0w9Svgz9lT/WbDFkevpS5uV5C7pX4vXSR2hPiIs1EKY17sUl64tdBgoRCV
	 zbrDrsLgN0HP+/rz1pPcN7XKs4BwUo0z+CwKnVyN8Bdk115Pa7+ob/GhCk1h7UCjHI
	 53SV3r+JPS1qmglHyPdHi8zz7PXPh3dvZ7sv9sSJECrQKJ+lqskHaK/P8fmqxi4sQm
	 xlSy3oaRNec3E0+4HkjbQIsRM0cOpcjK04NxCyFSd3/ePdVskgngceDj3Op6jmRaSL
	 fIh4BP/qWUKjQ==
Date: Wed, 11 Sep 2024 22:32:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
	linux@treblig.org, dan.carpenter@linaro.org, Frank.Li@nxp.com,
	konradybcio@kernel.org
Subject: Re: [PATCH v2 0/4] Enable shared SE support over I2C
Message-ID: <ZuHNJl7VvMSv8q8l@vaman>
References: <20240906191410.4104243-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906191410.4104243-1-quic_msavaliy@quicinc.com>

On 07-09-24, 00:44, Mukesh Kumar Savaliya wrote:
> This Series adds support to share QUP (Qualcomm Unified peripheral)
> based I2C SE (Serial Engine) controller between two subsystems.
> Each subsystem should have its own dedicated GPII (General Purpose -
> Interface Instance) acting as pipe between SE and GSI (Generic SW -
> Interface) DMA HW engine.
> 
> Subsystem must acquire Lock over the SE so that it gets uninterrupted
> control till it unlocks the SE. It also makes sure the commonly shared
> TLMM GPIOs are not touched which can impact other subsystem or cause
> any interruption. Generally, GPIOs are being unconfigured during
> suspend time.
> 
> GSI DMA engine is capable to perform requested transfer operations
> from any of the I2C client in a seamless way and its transparent to
> the subsystems. Make sure to enable “qcom,shared-se” flag only while
> enabling this feature. I2C client should add in its respective parent
> node.
> 
> Example : 
> Two clients from different SS can share an I2C SE for same slave device
> OR their owned slave devices.
> Assume I2C Slave EEPROM device connected with I2C controller.
> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.

Where is the rest of the series, I see only this cover letter??

-- 
~Vinod


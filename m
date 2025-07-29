Return-Path: <linux-i2c+bounces-12073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D314AB1555A
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 00:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4688918A4E30
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 22:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4127A284B59;
	Tue, 29 Jul 2025 22:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcsUs7dM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D5EEBD;
	Tue, 29 Jul 2025 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753828966; cv=none; b=LhteWGM+6qwC29A+y7oWbD5wciO3gd+Ho281/ZBJ0gSlQFQ+sem16CG07KHtLXTkbUVVvr2nfgIUp8hbb5IlueDqHzB1MShRLKnpp7br68N/NnNqYXrUuAS1krH4fUE34kVxmIOwbBBtPLnU7OKI9dur6p57zEXnG/AZtT42wTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753828966; c=relaxed/simple;
	bh=ROIgu5RITsVSZEfqqmAzwj38jYZFAlzsaSg3Gx+HRXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsI7pK9IPlRYzNL2zMobnkfQE+MFUE/9P0phCOv2UNlrqlb3pL6hgvHzdoZEnKeWVNvtKc2cFKjGCoKbRofQos21hsLLvBgGnYP+nKJa1AMNo95ioUqOPT53GDYzFU3e//yV154TzgSXi8KVvYNSszhprnVp1QDC6PC6GN1lPCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcsUs7dM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DC9C4CEEF;
	Tue, 29 Jul 2025 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753828965;
	bh=ROIgu5RITsVSZEfqqmAzwj38jYZFAlzsaSg3Gx+HRXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcsUs7dM2n+g54qNN6KGPZgdQ2qx0qDS3xPFNSuIBItBULIF0hIAwEko289fcl9fE
	 1kXbwvENvfnCh3lvAD2k7+MwJqqV9FJujJY6c2dnjNyCYhwlOzbuW6GRlitmXHOF3N
	 /DRiasmXdyMQjKC/DCc3QYNm/o4PB7sB9jNWQtWX593Iig4sPiQS2+NpMO5kiz5swY
	 clv1rZ6jRDtEtaiUDOAYfMU0sTqPcnK6UuylCB+pqOAVot+/w4znSfBHqsAZ10sQ5u
	 kesInfFy8YnYyn9hku62DBNgMq6If4GhHSFGn8dgGyWZpvjEP4+xe1QbGQ4cKDqDON
	 lIWPmyAErz6HQ==
Date: Wed, 30 Jul 2025 00:42:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	Viken Dadhaniya <quic_vdadhani@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
Message-ID: <kt372ehgwt3kjaxkdk47rri4s525pr4a6fvtjxy5c7rsf2ad6s@ebeaygqihe5k>
References: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>

Hi Kathiravan,

On Tue, May 13, 2025 at 04:38:33PM +0530, Kathiravan Thirumoorthy wrote:
> Update the I2C frequency table to match the recommended values
> specified in the I2C hardware programming guide. In the current IPQ5424
> configuration where 32MHz is the source clock, the I2C bus frequencies do
> not meet expectations—for instance, 363KHz is achieved instead of the
> expected 400KHz.
> 
> Cc: stable@kernel.org
> Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

I was sure I did apply this patch, but for some reason it has
completely slipped from my sight.

Now it's applied in i2c/i2c-host.

Thanks,
Andi


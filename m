Return-Path: <linux-i2c+bounces-9959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B458EA6AFB7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D97A982DF3
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 21:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CEF21421F;
	Thu, 20 Mar 2025 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRWwqTTw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058F08F6E;
	Thu, 20 Mar 2025 21:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742505356; cv=none; b=IWmpWtawQ42+0A2qK4ITbsODDN5fh/sbuiUgwWWNFYKCOLHQpl93WdM8dLXTJHbSdkvdvWGUmZ4M3AbQwXpSA68k4v/pSL2H0vjbzJSPIpXpxSy3rozhS6BO0CGOcDhdc32OHXJbkNT21bVcgLrweRBk5U+dp0YlcgGrQBv1j1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742505356; c=relaxed/simple;
	bh=PoXIbn2fn8/ey+YtojroXlXe2OOZVXk/kLQFFkXv94I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQsgxyXN3uJ18fja6+AGrKrF1GpqOFCftlNXa9frplRhWRlAeLn1fxMWvu9w+mUtRjf3QNosspDmHVlNNlGDJPi2JRulUSvp0nJpwlQJr8f/q7i/8O8VYeMZ9oCgSU8XVD7GOWemwpHmIseBrwupJMjg7rB6owVu1OkRYdybM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRWwqTTw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A10C4CEDD;
	Thu, 20 Mar 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742505355;
	bh=PoXIbn2fn8/ey+YtojroXlXe2OOZVXk/kLQFFkXv94I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRWwqTTwq9zAOQ421NJq07q58gHkM1ZM29x2jRwFUD5qCvEEQF1QYk5SnSYqBG4J5
	 rE9E5h30DzhL/lkKVxk9+qR2ewxU4x/0/dq5aP0r3bLXqLNDJvaYevBLkWHmPXk6b0
	 Ab1bfEj7xwblTJdcgEtF1m3UvcBBsJnDApMBV1BzWgEF8TLDThZpBWBfAHhh+cT/HS
	 wQxCHURXL5Gg8o0iENEwuAItYGPNVQrJtl6HnrS00DzdQ/dC1cX/52UtULfCgi86r3
	 tnMo/PV/whnEFjxMc5cjqkDDF+haAZ69DGM4RsZ2NXe+MiHpEXgvc/vQHLcnhMI3t+
	 3/BuQ9ySN3R1A==
Date: Thu, 20 Mar 2025 22:15:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: qcom-geni: Update i2c frequency table to match
 hardware guidance
Message-ID: <ngap6z7lr4vebvdnadpl4f7jjp2b6agkjqglrayrx44r2aet6g@aghomyb4qyqy>
References: <20250122064634.2864432-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122064634.2864432-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

On Wed, Jan 22, 2025 at 12:16:34PM +0530, Mukesh Kumar Savaliya wrote:
> With the current settings, the I2C buses are achieving around 370KHz
> instead of the expected 400KHz. For 100KHz and 1MHz, the settings are
> now more compliant and adhere to the Qualcomm’s internal programming
> guide.
> 
> Update the I2C frequency table to align with the recommended values
> outlined in the I2C hardware programming guide, ensuring proper
> communication and performance.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

merged to i2c/i2c-host.

Thanks,
Andi


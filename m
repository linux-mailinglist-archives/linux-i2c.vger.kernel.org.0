Return-Path: <linux-i2c+bounces-14378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D52CA0C46
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 19:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C737323BCB0
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 17:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5CB365A0F;
	Wed,  3 Dec 2025 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYTushmO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173733659EA;
	Wed,  3 Dec 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781042; cv=none; b=UFG0k+KGggMGREqFBy9aT1n9f6sOgJ5X4ZqIrngfHO7ktymFjtzJW77G12w6sKkg+5txF5AOR6VjoBgONEZ7tgrn+5D21n2mIwI92I5ZUvUPHzScUheMWptmhrWanbjbNXL/eLdwthvGzEvPOEA3fi58nVCQJYablFGIF3R0qg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781042; c=relaxed/simple;
	bh=qX9Pb+MNfHKzXLrxKSGLZ/5YSLtMQCU6zWN/H2ytlC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2Q7kihQ6yxMie8Z5wOHAY0wyU0BBQq3A8NXSli58uU9eSEF51UjeP+fWtY1nDgVsPWZhzMfg2148vZ+1VXKWAY5Rf7nPgkDlmZmVc4fAgzltXM7/3Y6bjxfSQvWG4VdVdV0dArLC4Swunzc3jVjAtmnTXilo4aZvr4zM3vKkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYTushmO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EC6C16AAE;
	Wed,  3 Dec 2025 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764781041;
	bh=qX9Pb+MNfHKzXLrxKSGLZ/5YSLtMQCU6zWN/H2ytlC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYTushmOAt5CNE7vXSo5eM8oIODSoU52PsYMe+36pGmJ4RLwfzKAhre5SXQAB/KlQ
	 SAhHyCzTY5NTu8U6aqtJ9//TBAAn4s3AHXoZNzwyM+BjQt6eRCsVRLkkFPXi+S6Q/V
	 91anPdLfXOU8fCiOhY1BjYTPW/FJ0kgeDVNpkE3hNJyu7cNc956AybwXUlww8xnDhs
	 1BwD198u2CHu/KbUyY6S1U3CVp51ji1UShtqI9nDCwuVqWu5wwQqYhybruo7XjfxFK
	 hhIjZQyR8xtW8fDxgnrlLv1GN1e/eMo8Ej2m+2DRq1ngj17tddaVUZaKAj5iBDopGA
	 y8jVxIPhRZgLA==
Date: Wed, 3 Dec 2025 17:57:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>, 
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
Message-ID: <n3w3lvw2tnqjcu74eesuo7sr7nbe5tqlufii5zsvvpwtapxd2p@6pbrr46cc26j>
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
 <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
 <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
 <577ece85-adf1-41c9-b7a4-ca65e27e6c75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <577ece85-adf1-41c9-b7a4-ca65e27e6c75@oss.qualcomm.com>

Hi,

On Mon, Dec 01, 2025 at 06:18:51PM +0100, Konrad Dybcio wrote:
> On 12/1/25 3:48 PM, Vijay Kumar Tumati wrote:
> > 
> > On 12/1/2025 4:20 AM, Konrad Dybcio wrote:
> >> On 12/1/25 7:25 AM, Hangxiang Ma wrote:
> >>> The current value of '0xb0' that represents the offset to the status
> >>> registers within the common registers of the CSIPHY has been changed on
> >>> the newer SOCs and it requires generalizing the macro using a new
> >>> variable 'common_status_offset'. This variable is initialized in the
> >>> csiphy_init() function.
> >> "offset" + "common_status_offset" is confusing
> >>
> >> Let's maybe add some platform data where we store the actual offset of
> >> the registers in question and pass a csiphy ptr as an argument
> >>
> >> Konrad
> > Hi Konrad, may be I didn't follow correctly. This is consistent with the way we maintain the other SOC specific reg offsets / data in the CSIPHY driver, in csiphy_device_regs, isn't it? I seem to think it's clearer this way for the reader to see all the offsets at one place. No? Thanks.
> 
> I thought this driver was a little more complex.. anyway, big
> changes that will make this prettier are coming so this works too in
> the meantime

After this short discussion, in order to get it in, can someone
from Qualcomm ack/r-b it?

Thanks,
Andi


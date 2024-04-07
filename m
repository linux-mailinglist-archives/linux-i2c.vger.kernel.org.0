Return-Path: <linux-i2c+bounces-2805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240E89AF74
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 10:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93DD61C2156D
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 08:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A9A1118B;
	Sun,  7 Apr 2024 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxnzVKhc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4C10A0E;
	Sun,  7 Apr 2024 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712477484; cv=none; b=KhAtX7y9vUGSOaBU2HFL/pP+6xYq7CKTNnT7iU9CI89IgS+LkBHvWcgJlsst7B7XEvc15otveYuY9irNgS2f+ojW9V6tgsBLbGQwaIOTWHLn7HQuIH8k0kdPaVUTfHeUZ/U0yhoUEptF3hLokZtM2kjnRQxp8f5FG9N/gSldkd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712477484; c=relaxed/simple;
	bh=TVFe4OYH04o/5Ll/IX/zzUlK3mIhW7/Js8yZ/caVDnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2ixrRo3xWiipBpmjqUE/k/ON/MkPSGCPfsRqHcxOwg+JFeZ4nm0Alj3y3mfY5LpX5cJmuK/PPtwkEdWu2wd0vDe+/Ca8OKiBv91bbCDNUv7JRgOdLrRgrppJ6GxNiwm6t7f7SsOKXzJT5Yh7YemfEolEAT0tKGTQEXRCewbwMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxnzVKhc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48048C43390;
	Sun,  7 Apr 2024 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712477484;
	bh=TVFe4OYH04o/5Ll/IX/zzUlK3mIhW7/Js8yZ/caVDnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxnzVKhcyJZGeMpZKR5e0livkrh9a5YebkkXdvqdqhS0UCl6uabGw/gCPnziHNPe2
	 2IE6uFxeCRaaHyxkhjO4UZknZOISONJUfZ+dtCTWtT/VCHk+JYzeBoh2H9hv16n6YR
	 MTu6/6TpEuOt9tbK/Qk/2iJHmouMla6xdKL+1A1iQv55SO0brTK8Rx0w+oIVsSWriq
	 7dFdJ+av1QKItIGCDpYbMjOLldaBh+KxfJsvUAZOVfogar6tPU/+R/LmDdKGa2DE6a
	 dkHajcP7zuQna2ia59m/WMTNWmfvhJwJnEcGv0aa18oUUc1uI1tB1Sop9cc/OwanJ3
	 5ythQznKwnZFQ==
Date: Sun, 7 Apr 2024 13:41:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>, konrad.dybcio@linaro.org,
	andersson@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <ZhJVJ-VU8S4wB9J9@matsya>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
 <c805ff2a-8056-49a8-90b7-814c7a973d72@quicinc.com>
 <3dad8ee4-7d9d-4602-bb5e-f148d51d1fcf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dad8ee4-7d9d-4602-bb5e-f148d51d1fcf@kernel.org>

On 03-04-24, 11:14, Krzysztof Kozlowski wrote:
> On 03/04/2024 08:46, Mukesh Kumar Savaliya wrote:
> > Hi Vinod,
> > 
> > On 3/29/2024 10:15 PM, Vinod Koul wrote:
> >> On 28-03-24, 08:36, Andi Shyti wrote:
> >>> Hi
> >>>
> >>> On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
> >>>> I2C driver currently reports "DMA txn failed" error even though it's
> >>>> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> >>>> on the bus instead of generic transfer failure which doesn't give any
> >>>> specific clue.
> >>>>
> >>>> Make Changes inside i2c driver callback handler function
> >>>> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> >>>> stores the error status during error interrupt.
> >>>>
> >>>> [...]
> >>>
> >>> Applied to i2c/i2c-host-next on
> >>>
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/local tree
> >>
> >> You applied changes to dmaengine driver without my ack! I dont agree to
> >> the approach here, we could do better
> >>
> > Could you please suggest changes OR approach related comments ? So i can 
> > make a new change which can clean the merged code ?  Hope that can 
> > address the concerns.
> 
> Can you address original comments?

That is the best advice!

-- 
~Vinod


Return-Path: <linux-i2c+bounces-4888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7792E1A3
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 438AD1F21D11
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9F815746E;
	Thu, 11 Jul 2024 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV2U/pFh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E2156F4D;
	Thu, 11 Jul 2024 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685427; cv=none; b=UAVt18nHXMYLJmdGM5SSUR1FVc7Ns1ZNTCRObFbNgnn48o2GI3CZA0Jgp63RSrVxsDS1Hj/+d6ZkHROLckkGtZYbYOGDnjX3G38gVA1LGiEgd1bTmFBaoxXhM+Ql/hRBuhCOA1styLwtkmqCO5Sl1dgAG4Wj/fOBdchN6hxDxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685427; c=relaxed/simple;
	bh=xzREfGGS/Sap7PbOCyPC8kX8oaYFEtcfObMfdJvQK1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/iX0PMlwipUta+jLmMsRkY2YWyR3IXgL79EmVwHmN7+zMoOJ14qYO7fTgyIHmzTq7o6hd5PSBeo/AMZk/hl8i074PEWm0Wn4V0UHA0CyMh4j2oiJIUw+5asMiJlg7S+83O3u7BBx5YLak9THxW1DdIQYGcRuf06iLkaxGHC6wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IV2U/pFh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58115C4AF0B;
	Thu, 11 Jul 2024 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685426;
	bh=xzREfGGS/Sap7PbOCyPC8kX8oaYFEtcfObMfdJvQK1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV2U/pFhoZSEQNsWPDJs4kw9LPk+euDPeupf8SvrntFRu6SmpTMiRS6uBuFlsirBg
	 3gjZdXdBSuj3T8qvkg45Q3AuASJVtRlMjw6PE7LzbzI+tMfZ7E5cB4TmBQUDQli/C4
	 A+VJG8GsDRqLTKWib0lEb70U4vkPDnYPSljgms6mQLP2enIsVEETW+/rIjUR5sQFFg
	 GW0vrxRNeEq2BKOyNxn2O4CECXmzFCr/69/e2x9/hbM+sNGyIhop07vkod3nKYWaim
	 ND5JUKmsdTtIKTB8OKJl7wOYGzC7n1vvk/8mecv9dVOLJc9wVKQH7X66gLUIWp76Ow
	 z2a+h6ic7HUcA==
Date: Thu, 11 Jul 2024 10:10:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 39/60] i2c: powermac: reword according to newest
 specification
Message-ID: <a35xwmcm5oia6v5u2geghssutcej5k3rvr4py7zlu2eonl4tgw@zsc4oa6e5yej>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-40-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-40-wsa+renesas@sang-engineering.com>

Hi Wolfram,

> -static int i2c_powermac_master_xfer(	struct i2c_adapter *adap,
> -					struct i2c_msg *msgs,
> -					int num)
> +static int i2c_powermac_xfer(struct i2c_adapter *adap,
> +			     struct i2c_msg *msgs,
> +			     int num)

and we get a nice free cleanup here :-)

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi


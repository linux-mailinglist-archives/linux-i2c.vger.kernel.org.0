Return-Path: <linux-i2c+bounces-4935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E12D92E8EC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 15:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BF3F286E99
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AAA1662FE;
	Thu, 11 Jul 2024 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePKL7esM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC514C587;
	Thu, 11 Jul 2024 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703182; cv=none; b=jUpH5U7+3r/lDim7xy5KCG4XbA5OaAJRkiSHVcAgzPFCy+IU83HQYJ8YnPNSXe9NEzBzfeemiyBabMp0U5uT1LIKijzaitTtmAvxOgdZ7NbgSpWBl5NxZYaiWlFW1F7sv3HN7gdaKBVvdkMgrj/K6CeXaEtOVV7tfsG0JxhsUTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703182; c=relaxed/simple;
	bh=V/vIE0fO90P6Ms9zn71oTABvAUwmybnB9qMJuHtoMkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbpFPzWZa9Mh2Lhw1zNIzDIBHr1iwPtGwdAIQqa/cpK/O/szITRAnFp8c6FMQOGf0M3Fr1FeWMETZ/BvVgxXWM98xjxUgnsMenQjxgOU8FP6XKcC+Il5ldpYACOdyuUTMetN17q279Iz6ysgN/6HcJXhggdQOxBB/jdLvbqnjF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePKL7esM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D021AC4AF07;
	Thu, 11 Jul 2024 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720703181;
	bh=V/vIE0fO90P6Ms9zn71oTABvAUwmybnB9qMJuHtoMkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePKL7esMbt6y6ZCx6dGyfJnrFOq98+c7q9GF/1lU15RKxz9aCKr4zePTOV60gIQsd
	 N7eh22sdX85Mv/xYEDzJ9uvlDKTMfW9zd1OPtbZ9shlVomi/eAVr87NtlhbkYKxIP5
	 1bFjZ0Vt50zrZBfldpl89WtM5z4gQxBF9ufF40SmBs0g2PJK5O2yXDt1ceEiog/WYq
	 kT93zQMsgLen3Lu0QdyyyaRx72GYdO3GOxyyU3BfVGmrX3eDa+fkHKctozT1U4uRM/
	 u55e8moZ5V1cwU1lyFy7NHO2edZHJ8Nt/kC73afencERtwYmLtptHY7gvEAltjm6kG
	 P4hVV40qF6nqw==
Date: Thu, 11 Jul 2024 15:06:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conghui Chen <conghui.chen@intel.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 58/60] i2c: virtio: reword according to newest
 specification
Message-ID: <dpqvmzqi6qzffjt25os3ji3bifdzm6y4aan3jiosmfkn53gvt3@xikl27f6kjyv>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-59-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-59-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:58PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi


Return-Path: <linux-i2c+bounces-8485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C410A9F015C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 01:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDEEC16831B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 00:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB7933F3;
	Fri, 13 Dec 2024 00:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iL+ULImG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8200747F;
	Fri, 13 Dec 2024 00:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051452; cv=none; b=Qv/ELGdhN/B5tJ8P42EmcKNyNkhqw65A668LF7sD8VA9ybU85j1R4usfGDfHX/5P6+okOF4mpP5SNPVVocyuX9gHiB+LeuxHiJB0/g3Utazd2+HS29gipE7lcoq8PKG46KHXa3aiXe6JvQJQV29nQ+oXjOn8pEyWUGcRYLxaGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051452; c=relaxed/simple;
	bh=qsZ5iF+FEPOxi7Mwryhjpy6hRIz1qVnezwJ0aYXAgmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzvpJ75b+HVYzJ4v5/RVvmaGP+WOB2csghxBk9x/BwqhQ61NGFVCHpEebgQbIbIghJBUiuPl7AjIy+zCaaGy8MZkPqAp6mCUphB0qO52Ja1pUjFM7iCz7HhAz4JURyxPpqQijryCT/NZeOr4N06USGFmT26DF3LAKbXzIgbQIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iL+ULImG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC72C4CED3;
	Fri, 13 Dec 2024 00:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734051451;
	bh=qsZ5iF+FEPOxi7Mwryhjpy6hRIz1qVnezwJ0aYXAgmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iL+ULImGIyfhTR9ZtkkEchDKMbKZsXaJ0hCAtvyzekAt2zXpv5w26Uzz4y76stALu
	 GfBnw+tB6QVdOB2DfTUpkpTr6FRmf1bb10yqOgUiG2I6teFbJCuklGlDGVSD3F9ksN
	 aUnnr5JmV8aS7jFQZwLbvAA/eyQvngQwWwFIs2/AP7oW0GqhcJ+C4PptHZBeVz9Tvi
	 FVkdprJ9sfAPgH8AXCAX+0ICLqvy8j8H+XMdYoEo336E1i0UofWsYNTeG/pizISHsg
	 5pmFLB+I7S9uHgAaMYfPNUkZ3CO7onyOVJL1nSfleBd6XsuvcRJMvJHcSzDWY5HsYr
	 edKgtxFqZUyfg==
Date: Fri, 13 Dec 2024 01:57:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Message-ID: <defqnoyhcpkb6mvuoyz4fpskqicyxoauiwxsgamdskz3owjn2q@2u64wl7ob5oa>
References: <20241212135416.244504-1-andi.shyti@kernel.org>
 <20241212135416.244504-3-andi.shyti@kernel.org>
 <fac676fe-c5b0-4765-90bc-affda7c00be5@mleia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac676fe-c5b0-4765-90bc-affda7c00be5@mleia.com>

> >   	proto = geni_se_read_proto(&gi2c->se);
> >   	if (proto != GENI_SE_I2C) {
> > -		geni_se_resources_off(&gi2c->se);
> > -		clk_disable_unprepare(gi2c->core_clk);
> > -		return dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> > +		dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
> > +		goto err_resources;
> 
> What's about setting ret = -ENXIO before bailing out?

Oh yes, sorry, my bad... I snap changed this patch without
using my brain. It was better in v1 :-)

Thanks Vladimir,
Andi


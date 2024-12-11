Return-Path: <linux-i2c+bounces-8440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE09EC51A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 07:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC1B1887DA8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 06:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD041C5485;
	Wed, 11 Dec 2024 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1cEVh6B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4844F1C07C4;
	Wed, 11 Dec 2024 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733900218; cv=none; b=A24wc2KJ3PCnFbqTQg7RJkH8EGDhBpR/cY2qjK9bHpmQuRc65sA3j9z3lId2Et91gFla/xdRp34WKNEncgkNLXz0bNcXlEZk0QBwPhUfNrS+c59DzU41RsmFJoTJdx9j7jzISeBVXykRZoFmQlmbXPd1eFAXZFsFW3zIFtWCBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733900218; c=relaxed/simple;
	bh=kK2A1SfWXW/DorLebHTbi8kuvJVjRoKFWsmFNWo+lBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqY9uptP3A1w4AG2dO8MD78vUNfy/h+c/Arx94YFa7zs2b+G9ok9LP3hgm4TW5rdCNAQsrA2iofooYtNyrGgP5Ue5l9qgjaWubs+ZuQx+qSJC6gr90Hjl4zbXN3sQ3eTPza6QJ2O6pE0PR4AGOhFW3Q40LZjHEFVx6x27u8fQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1cEVh6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FBBC4CED2;
	Wed, 11 Dec 2024 06:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733900217;
	bh=kK2A1SfWXW/DorLebHTbi8kuvJVjRoKFWsmFNWo+lBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1cEVh6BP3bI4DRAgPWYRB9pe0tarspqpQu4nu81b0X4rmuu9s3eokJpfLYTvM24w
	 p3la5/wzy0nAcUoOPcTv8k2BEvjN7O5CSlsDnw0jYbOuPfXmQtS4TS1ZTWkqftnwtx
	 PNXt7jVa2yPAzIAFkQCGxwk5qTw+/9Vi93nNHTzo2e2+jO07+NJkO/cXazfrZEM0Bk
	 JM1eSRz5nxY+LMCj+QdNao3i/VsAHC5TlZ0Ph842s+Wxnax4qDaWbtPClF4poUy+RO
	 S9bjkdq3BJlZdCgr7fXT7dgjVwi81sJ2C90Vre1Z/qrJWjwrTso8kVgU3Sz/3Yf9wj
	 FlHXsaKVIqUqQ==
Date: Wed, 11 Dec 2024 07:56:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Message-ID: <gwl6occrun32l4rmcdrjnzymadhlwixba5eyeznnx462gp7gym@rsvsdjr2zgmp>
References: <20241210231054.2844202-1-andi.shyti@kernel.org>
 <20241210231054.2844202-3-andi.shyti@kernel.org>
 <50ebc5f1-967a-4aa7-a4c3-3304961d1f8b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50ebc5f1-967a-4aa7-a4c3-3304961d1f8b@quicinc.com>

Hi Mukesh,

On Wed, Dec 11, 2024 at 09:26:53AM +0530, Mukesh Kumar Savaliya wrote:
> Thanks Andi for this change !

Thanks for looking into it.

...

> > @@ -944,8 +938,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
> >   	return 0;
> return ret here ? yes, we need to initialize ret = 0.

here? It's returning '0', as it was before. I'm failing to see
where 'ret' is used uninitialized. What am I missing?

> > +err_off:
> can we rename as err_resources ?

yes, it's better, as meaning it's more aligned with the other
labels.

Thanks,
Andi

> > +	geni_se_resources_off(&gi2c->se);
> > +err_clk:
> > +	clk_disable_unprepare(gi2c->core_clk);
> > +
> > +	return ret;
> > +
> >   err_dma:
> >   	release_gpi_dma(gi2c);
> > +
> >   	return ret;
> >   }
> 


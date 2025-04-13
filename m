Return-Path: <linux-i2c+bounces-10310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6AA87498
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BEFB3B2B8F
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E170618C930;
	Sun, 13 Apr 2025 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l60+XYZP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540414F117;
	Sun, 13 Apr 2025 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584524; cv=none; b=JBIBvq7ueXiANFHQXlIwH9UBxQWUmd8rXL7s+vfFjUtVP1Hpc4JsBdnjoFmtZJ4KkJnJwRZDPAjZvpDqYIh+PC/2+x6RFVqf1E8FWkenu2i99JwZG0BGo2DQJm1lSp8TLTf5T7hOmaYwJcJqj3HXQlyXuChwTyusGhZeZQ7NP3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584524; c=relaxed/simple;
	bh=Rh14R+jb2HtCQ2cFLnFZNGo21Tzn594Dks9gIKlxzh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtqDiun+qXGHf/uMF0QibTuU+kTuBWb56fN4tbzx8dHrjugdFQtAjgLq2eof9EOW6dBQEbXqpvBLGhaaBVNGKynNP7P3emHdKJmD5oULeFhnBtghUYxd4SrQXjwYNoSXfc3neOyqwiUOejf26jF+R8676h+L7mNv72k0JXLpVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l60+XYZP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1087DC4CEDD;
	Sun, 13 Apr 2025 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744584524;
	bh=Rh14R+jb2HtCQ2cFLnFZNGo21Tzn594Dks9gIKlxzh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l60+XYZPRa9VW7vDyJAQ1jvHWp6Fqxgm80UCkrSEzD62CuT3bfLZAGH74RHXAbcsJ
	 IS1hDiJSvw7MLVTYtZYbCslnlt58yRffWeooewfr1H4ITVu/gcyiQGcUD6orm45qyk
	 Wdhd+m91IBC6lYHmqhcEoQ/WFo2pu8GoD8s9kj2wLaPerImFSJJj7usrc5GT8sMn0W
	 d1wBEpla/4/mtStHlWtSCtdxmRNV9LCTV7Xaw7+O2nyzklKX8Z53zi6e+nRN4lDYbU
	 nrzxGw27yryEyMFBpMGlU9qnZuY42pzXrfnjtWJMTMbFjR+rPUd3DU0pSS8UqxPNwP
	 ynaRPHjWEXoIw==
Date: Mon, 14 Apr 2025 00:48:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] i2c: imx: add some dev_err_probe calls
Message-ID: <hrwb3arue6kshmjqohmhswmicidp44yed5qeswlhk6np2fhtbp@f6bvvazdmrxc>
References: <20250408100300.556703-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408100300.556703-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

On Tue, Apr 08, 2025 at 12:02:59PM +0200, Alexander Stein wrote:
> Add corresponding error messages if DMA channels are not available during
> probe. Using dev_err_probe adds deferred probe messages as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi


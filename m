Return-Path: <linux-i2c+bounces-2596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B788CCAE
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E54328064
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 19:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CFC13CFBA;
	Tue, 26 Mar 2024 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFHxM+3l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3813C8E8;
	Tue, 26 Mar 2024 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479977; cv=none; b=BTkc14QZ4NzhJrE4S7rJbEYynbYo94XtCvqGvUCWLwpJDXNakQxr511siSkjDFaakwHlWQadOcP5LelXRg2wzg6iPcH6wAXsINO2Magpi14U7a7U9Le1tNxusy78PJ07sge1y8UGyRNFxdfmYCAQttjpsySzciY4S/7oJZMOwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479977; c=relaxed/simple;
	bh=fd6pEC3DcmQudDAWojRJjsarS9ZV8ICp2pNeYnT5rS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APITG5lFRpDLTCc6St7WxxOtS3Rhc0GRyvgjpahMjRe3eWrgYky401E085c7qu0EDp8ciRvNCRe9SUO742+zK7+DkqeCH2zk3It3fmy4F6OxDsaDX6vt25tULZW9KQ/ZyosyQOOtkiXDR+P21ZL6pDWlDUI3iprNMWO/jVSQZbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFHxM+3l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D254C433F1;
	Tue, 26 Mar 2024 19:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711479977;
	bh=fd6pEC3DcmQudDAWojRJjsarS9ZV8ICp2pNeYnT5rS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFHxM+3ljH1M+gfIbRS5u+V8AiZe7SxzT0zyxCf5NEXnD6SsAJuG0W3jltSuC4GNu
	 ml9Jo3VYp1rpZ51b29H6ueVq7e+PAt9sOZ84Q9q192gyYzJhMP4GDGFrhu0pPeWIaK
	 4zz2+xd8UJA7PSF3yXrHYtZYRl1tDeHWCK/8scqGP8EFUGkJrOvk1UrvksG8vJbyWg
	 UhIzqVaJPqCNNP3tn6/lAUlQqwmYiVbtFiBDSP2mOimRl0wajg0YUnfZMd//VyD0nQ
	 kaC2DkQHK468YTKga1xm8R7ryP9crOZ/q/Pe0wPTg62wXfJaXR458MI+9LGuLOkSvw
	 c9kS4H58A66vQ==
Date: Tue, 26 Mar 2024 20:06:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Michal Simek <michal.simek@amd.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/64] i2c: cadence: reword according to newest
 specification
Message-ID: <z2pc5p32ceipdo5zlemglduaqrgvjuc7o6em27qa3q4yoohmlp@swcur5snc34c>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-12-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-12-wsa+renesas@sang-engineering.com>

Hi Wolfram,

>  static const struct i2c_algorithm cdns_i2c_algo = {
> -	.master_xfer	= cdns_i2c_master_xfer,
> +	.xfer	= cdns_i2c_xfer,

alignment :-)

Andi


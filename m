Return-Path: <linux-i2c+bounces-1673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61E84EAC9
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 22:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0E2A1C21910
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 21:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4177A4F5E9;
	Thu,  8 Feb 2024 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqdlTfbE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FE4F202;
	Thu,  8 Feb 2024 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707428694; cv=none; b=hi2KnLhlmgbW2IuSUPX+/SLlN0jNbdAZXf/imIa6/JY9Yzj7+GiF19pE0arNrjNp9jWvUgEy22LVUjjLdmSvFbrHs2mMZ27R9LUg7KDY0oHS2+6Wlvy12GC5sUkYXAhkIqVs/HjQ7gIiw6hPnrZnxCB+JcJfI5bXq+/JYqD9dGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707428694; c=relaxed/simple;
	bh=vQbCfq7vICrbCtK0WFCBoDtGYvtny9K8O6mhGkJVJo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKqlwhnr9O4Od8to7DsICAOnIW8u+EixwUif/dAC/91F92CVXPFdBpxnC5i5F34WHO9qbU+8jBF0N8wFZP/DgLnPbmxtUwv+7Ro38aIEzpT3QN5lGRUvpU61LEZBbhqSrjoDx+sSiuFyIDD4WHoKdD39B31p8YZ3h6iYsDxhPUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqdlTfbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5425C433C7;
	Thu,  8 Feb 2024 21:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707428693;
	bh=vQbCfq7vICrbCtK0WFCBoDtGYvtny9K8O6mhGkJVJo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqdlTfbEpn63I5cVkjUS9tiLUjMJAwgFmWtXD7aKnGRDHAHOpm+mYsVV/Sej2qUMD
	 PeHzFYcDZ5XgFp0Qoh1MG+NMUspHar5NUYOrdT3TVQg9n7XSUJ2JX+VVyo8R0M8LlX
	 7ufA+YFlHUWS/yTApbKYHRg3km8azcXgrii1tV8IE9p9Y7Y11pDONgdIMRsDddQHnI
	 5s+mNvcjl0xTpIrdiCv42LVrBrTPSK/PzlW96Znfv5H0+eAy2Lw/CklGxjOhtJrxz4
	 lEvsYP1M+hTYL/9j2NRgug47O+v7O9h3YYdbghhg0uYir0jUL78a751ngGNlVnfIem
	 CJz0m55qArglA==
Date: Thu, 8 Feb 2024 22:44:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v3 4/4] i2c: thunderx: Adding ioclk support
Message-ID: <wysbddkg425btfh2noyhtzi7ilihyrhwmag6fin4i3no5afnes@aeyvhgmgu2tv>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
 <20240206114349.32197-5-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206114349.32197-5-pmalgujar@marvell.com>

Hi Piyush,

On Tue, Feb 06, 2024 at 03:43:49AM -0800, Piyush Malgujar wrote:
> Adding support to use ioclk as reference clock if sclk not
> present to make it SOC agnostic.

Please use the imperative form to describe what you did. Did you
add support or what or "adding support..." what?

Andi


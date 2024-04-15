Return-Path: <linux-i2c+bounces-2950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35008A5C97
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 23:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 200931C20B81
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 21:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF73B15696E;
	Mon, 15 Apr 2024 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivmO1hKd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D197155A58
	for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215140; cv=none; b=TsKxCZym1YevSjZZD5faLnufC5tEIcVpIrA/GEuelnlwlVtQ7H+CJgdBbbypMQ+M6yJ/RCefwKXsDhMq/IWvTJAhmgh7Tj4QnVMnCYaZIfyo9vrANV+ssDaEK0jD2S0vYMhefAyUtUIJvIlX68lmsXPdhSQ2mtiZJetBEPDwnKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215140; c=relaxed/simple;
	bh=r3xBfF35X6n3/4JWAg9Q0UpqL8AzB9qfh7N2aLD74Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpTVFY0T16vuIpLh0nrAw1Qp7m4LruzkFOIHpg6lawE2ELe+P/YI6LPUlKRqG9BIFhLtVpczkzfXVSfYHhzSVJ1//EFQPGd/Mx0xsGo3fTQMEnjKijw+SaaGzj9i6+tihQnx/UMifkygg/MIXfDpeoSjtSbA5nxUBo2ClJ/1pvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivmO1hKd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829F0C113CC;
	Mon, 15 Apr 2024 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713215140;
	bh=r3xBfF35X6n3/4JWAg9Q0UpqL8AzB9qfh7N2aLD74Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivmO1hKdTBIEs+pW+WN/HXWed/V19fplktnMuL/uR8GBYtGwleUq+Vs5d8leS2Upw
	 iglspWZj1G6UjNYZmwtfGe/u+rqmpwMF8YKEmgfU7CfjslswwjmjBJNUl/g2M/mTM9
	 aIcP4BXD6Juy9vYGQdWuJFTvlRQwo5t2wJWuR8V+Vuq20bSV4E+HqqVSl7qmBbt0HJ
	 QkOkB0J8/UlhwRL0BfNdl5u4ItlOI3fUI0g+P3/DTKxgGw+oS2YIW5Gbmw6MevkzZ0
	 O3N3jruY9thZwc3mzrgmCi9NEO5U8jN8C6n1bllBjtaDY211bhdzK5b0ab3FX0Ig5A
	 JV7XB4mBIHTrw==
Date: Mon, 15 Apr 2024 23:05:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Annotate apanel_addr as __ro_after_init
Message-ID: <hezbbhcsjewtn7xbpfsbp34qczx5xw7swk4pthic4bguj6cumo@umb5mkckaxj6>
References: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>

Hi Heiner,

On Fri, Apr 12, 2024 at 12:21:58PM +0200, Heiner Kallweit wrote:
> Annotate this variable as __ro_after_init to protect it from being
> overwritten later.

What is the reason behind this patch? Where is the risk of
overwriting this variable?

Andi


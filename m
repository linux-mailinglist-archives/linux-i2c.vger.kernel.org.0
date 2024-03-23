Return-Path: <linux-i2c+bounces-2568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC808877DB
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 10:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 822AAB217D2
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 09:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F80DF46;
	Sat, 23 Mar 2024 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUU4sVy7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DDA6D39;
	Sat, 23 Mar 2024 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711187237; cv=none; b=IO3P3DBomKSMFcvNln0wVZeA1WZHdoofWzhfc9vx+QW/OC7TTO0m455EAx2YDLGxf2YMplfaoNIzgPGLupp6FIcn9crI4EXrOUQRshlwNObc4W9mXFOgeodzx6pchJyfqXHuZPF5IR7gFy7mzEZcqBjAQWgBjBHVhTVBCFzzqvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711187237; c=relaxed/simple;
	bh=wxvzCkm4kET0OS7QfYEgwrchCejES0dLL0OfxVNRqzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeIPwve29q+ZnOBOqxP2kU87Za3qekbDc4NUZBvxlcAqZwgCGvtw9Jr9hTG845CcMYjqSagG3Trzvly9bbBMeqrvyTAluCCrxe+Ewdo6J0NAkCFP9d+IZ2NsNVIRLuO/oklzrXiAZytjQmC20b5o6xVJdCZ96q1BZdUYdziObQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUU4sVy7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE057C433C7;
	Sat, 23 Mar 2024 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711187237;
	bh=wxvzCkm4kET0OS7QfYEgwrchCejES0dLL0OfxVNRqzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUU4sVy7j+vsEyQeXBmUI1KzR3dCw1jP7Ywa7eYXZZJg7pRl/LEoFfjpbX3v8ReTe
	 FhNg4+M/sUurAeNV3XrBwLZrUW8ZVXx5l99kUpAF5MsshIrzirNv7v1cmmrpMM1Nzn
	 leum/PTxADb0+pafJomCFECWl1steB17hkDitsQDPbAH8K0Ve5QT6LhIQ33l9+sXyE
	 qgDFCiGctXfnjXo82gYgsCI11cdSnH1tyVhPTsIDVFc4bLILCF55ZmkYWsYkYYh4gF
	 oWvJLfhDfHvc5q95yaTS79zlwc59yuT9sB4sWKkKP445OW/MszlwvFv8pAm3oYqHdF
	 S5sM4aYEfaeag==
Date: Sat, 23 Mar 2024 10:47:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <54i4mvoxegs6vda7cwvlo6a6nn4qrdtibcpif2642bspid4mqu@5qjt5q2xyxoq>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:54PM +0100, Wolfram Sang wrote:
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more

nit: "I3C 1.1.1" as you added the version to every specification.

> appropriate terms. The first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi


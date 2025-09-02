Return-Path: <linux-i2c+bounces-12565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91291B40DB0
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 21:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34884189AD52
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 19:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B29C34DCF3;
	Tue,  2 Sep 2025 19:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nz/uINwI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EB62D593A;
	Tue,  2 Sep 2025 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756840284; cv=none; b=Y6AperO4W3OQWEsPL/VBJJKJH1m+zTB6VQZMdeDcueYXwfpdelBfYYZcyeKPLsfxS9m5be3JHM2pX403x4LjL5jbWWR7VcZrU1pqI9D+AccliSMBoGlS9RPR1pBgngryz8xchfJRCUxr3m6c4nR5H8CXXTi4Ed5O7sFS9dc02e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756840284; c=relaxed/simple;
	bh=q0EnhcqbZSZryQYzAA6oXrKP6VbMGZqvZ0KskurHSy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6IJW0X9e+MQvKmTJJiuANdnRiNrYAetKmwJVXSa/u4OSyAxITWftSd6G/WtazZE4nc7Qi6dbd6l3EbAj/ibvw1H9rUEM5rX2xy3pCc6VVedJvnQBHyasSZckxm7hOHbe36B6mPD0rnsCbNqt0/v/Ai2LUJf29SfOM2FmdXJqWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nz/uINwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F450C4CEED;
	Tue,  2 Sep 2025 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756840283;
	bh=q0EnhcqbZSZryQYzAA6oXrKP6VbMGZqvZ0KskurHSy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nz/uINwIRvNBBLP9dPVoe23N5+1DMsekcLcodXWgVhenUNM71nElQaFfEnJLEkxq7
	 1FwJOhR+LIZz0ULkO1SnMCPMhmz62l5141/XBvz+UCufMDeNrUoEqxnOhsT+OwghDw
	 MwwgYttY6Vgu89bIJkxOMAOG9c4pNKtflWbI9pw2B/fLujLH1mDY4yVL0K6OUFv5yK
	 MOt7hpmeihYLv4PFhfG4sekWGu3Yl3GPnSo4YdwmBmbvBWUGNx9awQv+C5P7WU3KHN
	 2t3rz5YAVEijd/gGGkOLrkeaRgAwEx/a7HpRIcR5XXl3fuD39qqbTA3beLWDoUvjd1
	 AZxtE8CwBbW4Q==
Message-ID: <a25b2c4e-9003-40be-b02e-45e8237c3261@kernel.org>
Date: Tue, 2 Sep 2025 21:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
To: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250902190443.3252-2-jefflessard3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/2/25 9:04 PM, Jean-François Lessard wrote:
> Add scoped versions of fwnode child node iterators that automatically
> handle reference counting cleanup using the __free() attribute:
> 
> - fwnode_for_each_child_node_scoped()
> - fwnode_for_each_available_child_node_scoped()
> 
> These macros follow the same pattern as existing scoped iterators in the
> kernel, ensuring fwnode references are automatically released when the
> iterator variable goes out of scope. This prevents resource leaks and
> eliminates the need for manual cleanup in error paths.
> 
> The implementation mirrors the non-scoped variants but uses
> __free(fwnode_handle) for automatic resource management, providing a
> safer and more convenient interface for drivers iterating over firmware
> node children.
> 
> Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>


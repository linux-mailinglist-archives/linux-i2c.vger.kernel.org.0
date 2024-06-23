Return-Path: <linux-i2c+bounces-4285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB30913BC7
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 16:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133581F21EEB
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 14:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3266E181B9D;
	Sun, 23 Jun 2024 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfB7k0T8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B1C1EB25;
	Sun, 23 Jun 2024 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719153057; cv=none; b=biHR7GZWh9FDI4jHRc2uMaGVfAp2zZ0xVsKzTwwzrSEWGsZ05pkdLpL9QYC4aOfWKs03Z81i1fN8bCaz29VxDpA9wJnXLVXDhPAlQUft+lxzs6pE1PD4Cd5c/6Fx4MF7kQa11ZTM0f5vfvsp6ML+gJf90W/ttSr1IRiL6Qd85FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719153057; c=relaxed/simple;
	bh=9anqhmX8GxqwFjTggPt2tyA7UrpPciNEH5Qs1zigBZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHPHqvPyu2qkhqTg9OcOxsIGtZIhDjOMSSgM7y/cmXPGZOcXwwNaDPelzWDKGDP6gFRryj1P87gsu02xBK10FW8h0SLDNo6TwzYV+femzDy587nPObEVRL3dG6jFvr+9Gc/5BY1KlMop2S9fbx4XCPUs0UnS1O3se7bM1AG0J/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfB7k0T8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C357C2BD10;
	Sun, 23 Jun 2024 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719153056;
	bh=9anqhmX8GxqwFjTggPt2tyA7UrpPciNEH5Qs1zigBZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfB7k0T8L8ZZ5QrsGJo8OgXDoYpzn/UL1mUi55r1X3zvQUxwHnedEsn/YbWJjMqmf
	 R/pe2IuHOGOVBftJz7srKE7AbowyoBUAAsutMJyPxIRwqwA2pWkWpNpheXD/A2Jzy8
	 pDfzB1U7oe2SiFzzApIu1RbPPswOgoYX3asB/Ep/6tr0cU4+uGXXS8b77KzjQ5xVmi
	 UrgFv7RdPDwupavosMuGjE1YgA/H73948/nlsGgFnMjQj68J+xwuS+VJQ0o/bvSgE4
	 TpJ6Wc0FmBF9648j3sXiL6tirK5t44e0F3jGfoq9IWB+DXdRvsPD8aDqMoK26KBfdw
	 kTL6y54ehA74A==
Received: by pali.im (Postfix)
	id 2833764D; Sun, 23 Jun 2024 16:30:53 +0200 (CEST)
Date: Sun, 23 Jun 2024 16:30:53 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240623143053.sgdadcstjlts5yy4@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122503.10034-4-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440 ATG"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},

This is an example why DMI_MATCH is not a good idea for usage and
DMI_EXACT_MATCH should be there instead. First entry is substring of
second entry, so kernel running on second model will use first entry.

Both have same driver_data, so it is not an issue now. But if the list
will be extended in future then DMI_MATCH conflicts can appear invisibly.

Anyway, in i2c-i801.c is exact match on the both vendor and product name.


Return-Path: <linux-i2c+bounces-4315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E591567F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 20:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16B571C21F05
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 18:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C6119FA8D;
	Mon, 24 Jun 2024 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSnnvSLt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA49182B2;
	Mon, 24 Jun 2024 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253696; cv=none; b=h7lZxzx6Ly7YbXqltVAFpXDEoSJM2sKXUf9wJnoyKyggDFlil3mPYqLyIBz6WqVBF9POJB9BP/NRhmijGMp+rJJq/Co7He1odqqhHo/UguvlIIhpznf3IYarT8M+B/RpR1yp3MPQodq2v6flTl7mpX7heCh5dwFaAYaeRf8syXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253696; c=relaxed/simple;
	bh=regM0VHOUBmv8YjzRnnwayJDxfTnaV5iiOMcdP0U9qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kV1n+ylSMA/fkfhUSyY/t37j1+Cax3/+90thvXBAedZE2U+o/SqdNBNEFf1NJJn1vjGbka4SW6HGKJIZ9DVbkn+LgAWyFClwOmHvKe+dvH0A6ugFAsv95mPWwiKDtgQ8ki9NtxriYeoKIqcHA/Wi8YDUe2wKinOj5OYmMNt4HkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSnnvSLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A4FC2BBFC;
	Mon, 24 Jun 2024 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719253695;
	bh=regM0VHOUBmv8YjzRnnwayJDxfTnaV5iiOMcdP0U9qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSnnvSLtbygR7pSLpcZmrZZE4AuhU823fOCm3hcIeaD5k3aRtqoch9cjzuDHKa91K
	 yrgl2R6OgNZJ44huLxsBMGe3SL8kEYXxr3luXT0sDi8/pHz+JG2JCHeizOJTYTs5ws
	 9VwxlB7jmX4A0s261dHZ7LFKpG2EubVeY5nRf35U4lLli+e6SqzZKEY6b11N9EiVUR
	 QMxnYAVoyD7nRsIR5aAxVxDZU3CjUMx2ccmyDZyONp69P+nIpZct6Uoq+afFFXJqsF
	 0E05nlN9+GA65kJyoCYIVlz6jQK2OlYruM0nMCoUbfU6S0zQWFwFt1mDfowTTMxWyZ
	 nF/g087ihk9bw==
Received: by pali.im (Postfix)
	id 8F277BF4; Mon, 24 Jun 2024 20:28:12 +0200 (CEST)
Date: Mon, 24 Jun 2024 20:28:12 +0200
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
Subject: Re: [PATCH v4 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <20240624182812.fa6akymygv3qolug@pali>
References: <20240624111519.15652-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624111519.15652-1-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
> Hans de Goede (6):
>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
>   i2c: i801: Use a different adapter-name for IDF adapters
>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
>     dell-smo8800-ids.h
>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
>     from i2c-i801 to dell-lis3lv02d
>   platform/x86: dell-smo8800: Add a couple more models to
>     lis3lv02d_devices[]
>   platform/x86: dell-smo8800: Add support for probing for the
>     accelerometer i2c address

Patches 1-5 looks good. There are just a few minor things, but you can add
Reviewed-by: Pali Rohár <pali@kernel.org>

For patch 6 as I mentioned previously I'm strictly against this change
until somebody goes and politely ask Dell about the current situation of
the discovering of accelerometer's i2c address. And if there is no other
option than start discussion if Dell can include this information into
DMI / ACPI / WMI or other part of firmware data which they can send from
BIOS/UEFI to operating system.

>  drivers/i2c/busses/i2c-i801.c                | 133 +-------
>  drivers/i2c/i2c-core-base.c                  |  18 +-
>  drivers/platform/x86/dell/Makefile           |   1 +
>  drivers/platform/x86/dell/dell-lis3lv02d.c   | 331 +++++++++++++++++++
>  drivers/platform/x86/dell/dell-smo8800-ids.h |  26 ++
>  drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
>  6 files changed, 379 insertions(+), 146 deletions(-)
>  create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
>  create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
> 
> -- 
> 2.45.1
> 


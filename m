Return-Path: <linux-i2c+bounces-4264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D32913527
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 18:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2824283C16
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3F21DDC5;
	Sat, 22 Jun 2024 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL+Us7Jq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED1155310;
	Sat, 22 Jun 2024 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719074633; cv=none; b=pfhqL1Figt0qXrDkurC1DtfkbeoQUk3LExgqcEj3gJEWKBibGcG5Zj8eVYphseHz5ZtOfgwHH5twtpwXPiYDVrfDjYsECemahTlRb4MA2sLUCf6lX8+cmn6usMgzcEkt5cldiBEmI6RU1WwUJNwdtesvXAen2nDCDDVoaKMXcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719074633; c=relaxed/simple;
	bh=mA5/q/VY7fCsDzOr0vkIVNBB6HQ8Iu03+cFsvvPIFIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbcMmZG55BZZyrtdeX/KTpuNfP91tm/uFLrPNQZ0aXEzeYE7fsy77TIOHoWkCt7N4ehrSXrsb87aJS3gaRCU2y/XdKxxM/i1HHH4OF7jeKK51eMJno8dmhFRvgRCH0Z9R5VuUmkZuj5vaucy1xi7TKtC6fGnfqwN/3Sp5g+Q3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL+Us7Jq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D006C3277B;
	Sat, 22 Jun 2024 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719074633;
	bh=mA5/q/VY7fCsDzOr0vkIVNBB6HQ8Iu03+cFsvvPIFIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL+Us7JqJk4xCnJ3x5Yb3plnUrXqpQGdOtytGqFWa3u1oBOyIVQa1Nxjf1jKj7aPP
	 5ZVqdtdlyX7kT3F5eTVzUqDwlPVJU5Mn0F/q2oAVNdjMiMS3YbMEbgdOlxUln8gLGr
	 gH7g1tjLqlWIIEtXtayUIrid+vXWTzpWri40/4EV1N4E6ZwhI8ZThjCqSlUKgssr7r
	 QlxJZ50ky+qfoJUx5PNGgc4l+v9yZX+/F9u7GCgzuyCOunx3vP9sH1r88OFmxLh9vX
	 hikvXUJ7t4k/QScVYtFhMvkBR7jMInGSulpNMSgcLO509VbDzgoGphUx6O8pWJLEZd
	 rkQwuBC8edoNA==
Received: by pali.im (Postfix)
	id 10E2EBF5; Sat, 22 Jun 2024 18:43:50 +0200 (CEST)
Date: Sat, 22 Jun 2024 18:43:49 +0200
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
Message-ID: <20240622164349.fycelzxcd45j4g22@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240622142015.7cfl2onabpr6kl6r@pali>
User-Agent: NeoMutt/20180716

On Saturday 22 June 2024 16:20:15 Pali Rohár wrote:
> On Saturday 22 June 2024 16:06:01 Hans de Goede wrote:
> > > Also does the whole device table has to be such verbose with lot of
> > > duplicated information (which probably also increase size of every linux
> > > image which includes this driver into it)?
> > 
> > struct dmi_system_id is the default way to specify DMI matches in
> > the kernel. This avoids code duplication in the form of writing
> > a DYI function to do the matching.
> > 
> > In v2 of the patch-set I only matched on product-name, but you asked
> > in the review of v2 to also match on sys-vendor and you mentioned
> > we may want to support other sys-vendors too, since some other brands
> > have SMO88xx ACPI devices too. This more or less automatically leads
> > to using the kernel's standard, existing, DMI matching mechanism.
> > 
> > We really want to avoid coming up with something "new" ourselves here
> > leading to unnecessary code duplication.
> > 
> > Regards,
> > 
> > Hans
> 
> Ok, then let that table as you have it now.

Definition of the table can be simplified by defining a macro which
expand to those verbose parts which are being repeating, without need to
introduce something "new". E.g.:

#define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr) \
	{ \
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."), \
			DMI_MATCH(DMI_PRODUCT_NAME, product_name), \
		}, \
		.driver_data = (void *)(i2c_addr), \
	}

static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
	DELL_LIS3LV02D_DMI_ENTRY("Latitude E5250", 0x29),
	DELL_LIS3LV02D_DMI_ENTRY("Latitude E5450", 0x29),
	...
	{ }
};

Any opinion about this?


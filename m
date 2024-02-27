Return-Path: <linux-i2c+bounces-2037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BEF86A153
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 22:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0391C23C55
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 21:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF73114EFCB;
	Tue, 27 Feb 2024 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz62ghy5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F951C4C;
	Tue, 27 Feb 2024 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709067872; cv=none; b=C7RoKRtOIFl+CrIld6dcSjuVwFUAqbzRpX2cCxlfRvK3ZC0yqjxjRaxEX3/7EGJ7i9RwfjaDHL1TXY+KHvOci2Uwl21W6KmdZ9NA289Iws2Od9Rc/VdhoE71sH/wALOd6kREOzqcW+5t3nMlKXEWUzrzSV+AwZQNZ/5A9DtlmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709067872; c=relaxed/simple;
	bh=MWdudiSGoujcNzJfy7mKghCj1DfOqAzSv/aNbtsYw0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNzQpHh1jAMrHYdTH2VeQRnt2bXTPNRFgzkaS/xszL2ECirVqxvMqQOe4RUQvhSRLsjOfQO8uGv93h6qaHNVcEBH4jAZ6q57L29lETrdKKiEmJqOno2G90Pz6sBpl8cvT3KJkpoVGACz7JUOAgLGxy1iQKYLdbpSGP4h4Uw1Q9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz62ghy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABC3C433C7;
	Tue, 27 Feb 2024 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709067872;
	bh=MWdudiSGoujcNzJfy7mKghCj1DfOqAzSv/aNbtsYw0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cz62ghy5t/2+yuYxlsz4VU5OcY1Db0L2IXqbzGQAGIaWPgVIMdRdnHdfw01hdnQf/
	 cgU3rFrNIksh+0b92Er13dz2sXx3vbOrpb55+kG5jTAzPDPZONQqmjHRiZDRCIc5M8
	 tbdV0aHPuOi/KUFXMC1urJICyUnLp+zfwBU8zo3L7oKj3bAP2ui/6UTl9OUZezScim
	 bATFO5Uk6w8T4zPy1HYCflvNbSEQ2SnagIBBbjINJ6EY3STiF2TMTa2ESY/ZGgeD4u
	 I3mtraBrEom9vrFJhmfr4zTdi2Ep1Nawm5wWwHMs+Cka8avLgcUOgsklcBNiKbXrWp
	 0xAll6Kfqymew==
Received: by pali.im (Postfix)
	id 6FD1C828; Tue, 27 Feb 2024 22:04:29 +0100 (CET)
Date: Tue, 27 Feb 2024 22:04:29 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Jean Delvare <jdelvare@suse.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240227210429.l5o52wuexqqmrpol@pali>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdNBGSJ28AcdpC7f@smile.fi.intel.com>
User-Agent: NeoMutt/20180716

On Monday 19 February 2024 13:52:57 Andy Shevchenko wrote:
> On Sat, Feb 17, 2024 at 11:33:21AM +0100, Hans de Goede wrote:
> > On 2/13/24 17:30, Jean Delvare wrote:
> > > On Sun, 7 Jan 2024 18:10:55 +0100, Pali Rohár wrote:
> > >> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
> 
> FWIW, I agree with Hans on the location of the HW quirks.
> If there is a possible way to make the actual driver cleaner
> and collect quirks somewhere else, I'm full support for that.

Location of the quirks can be moved outside of the i2c-i801.c source
code relatively easily without need to change the way how parent--child
relationship currently works.

Relevant functions is_dell_system_with_lis3lv02d() and
register_dell_lis3lv02d_i2c_device() does not use internals of
i2c-i801 and could be moved into new file, lets say
drivers/platform/x86/dell/dell-smo8800-plat.c
Put this file under a new hidden "bool" config option which is auto
enabled when CONFIG_DELL_SMO8800 is used.

i2c-i801.c currently has code:

	if (is_dell_system_with_lis3lv02d())
		register_dell_lis3lv02d_i2c_device(priv);

This can be put into a new exported function, e.g.
void dell_smo8800_scan_i2c(struct i2c_adapter *adapter);
And i2c-i801.c would call it instead.

register_dell_lis3lv02d_i2c_device just needs "adapter", it does not
need whole i801 priv struct.

With this simple change all dell smo8800 code would be in its subdir
drivers/platform/x86/dell/ and i2c-i801.c would get rid of smo code.

This approach does not change any functionality, so should be absolutely
safe.

Future changes will be done only in drivers/platform/x86/dell/ subdir,
touching i801 would not be needed at all.


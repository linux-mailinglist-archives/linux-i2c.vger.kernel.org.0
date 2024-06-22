Return-Path: <linux-i2c+bounces-4262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32291350D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 18:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202EF2834F2
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E3016FF44;
	Sat, 22 Jun 2024 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiexhsEe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120416F8EC;
	Sat, 22 Jun 2024 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719073591; cv=none; b=EXqg6t70tIO4t+N+s8eW/nu9iC5POACQYnF6Q5BKa/w1uDT/VC/D2ypgLfTwa4uCEGrIeAeC4lz7A/DYfbr5s/wFC+tmW3SV0Li+Q+f2GmIOPlQpmiM9MMJODv+WJuQC58qNKTfAExB60glBAi6gaqPxauFa4W8RILdrRDcHRBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719073591; c=relaxed/simple;
	bh=tLXB9cFvdKA+kH7iiFSEfoWQKAmbWDFgPyT08LTLm3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jI8mtxexlIM0MTfmaRXFS345fgEwFLQvoQUnuGA2QSVEHLAIUInihSALebCYIygajVEMQ1T0WvExbaNuXGghTlYk9mEGzxM2WLYFynPk00pJ4XZFGyHq8GRfh4qMVmq582We7D45ZnOzgTUxSXD3wAL23nOdhKUfeSKxWKdgQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiexhsEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD325C3277B;
	Sat, 22 Jun 2024 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719073591;
	bh=tLXB9cFvdKA+kH7iiFSEfoWQKAmbWDFgPyT08LTLm3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uiexhsEeeLY7Pe1dfCByNgyi+MHbggH2NCJqZwoquyPcB3aIcbi3iA5th/4/xx45n
	 tCgKwLkwwfsRn2sOHkEaLtgghD6RJCAFrUIQSK3YFmjgQpHcfmuMbfMuY11CW3JeCj
	 ngz+tv+PpSTxaPc3DNlfDjbSZbnalYD4cqmi5XpqrMODLGrbiVHv0685nzr9U1wMVZ
	 7OPjzDjsTF01pnFUqsPfyblKw5ti3q3DtWPnLHFOl5MGI25IobtR4WHDQAHf0edUJG
	 4xyb+QYL3VcDHG1P2oUvXsYeb/+44IU4DFz5aHvq0s3mPUM+3dY2wTS1AEsU75i9bt
	 lRplfmdJN5s4g==
Received: by pali.im (Postfix)
	id D6B3CBF5; Sat, 22 Jun 2024 18:26:27 +0200 (CEST)
Date: Sat, 22 Jun 2024 18:26:27 +0200
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
Message-ID: <20240622162627.gs3esrwgjbmarpxl@pali>
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
> > >> +	{
> > >> +		.matches = {
> > >> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > >> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
> > >> +		},
> > >> +		.driver_data = (void *)0x29L,
> > > 
> > > At least for me, casting i2c address to LONG and then to pointer looks
> > > very strange. If I look at this code without knowing what the number
> > > 0x29 means I would not figure out that expression "(void *)0x29L" is i2c
> > > address.
> > > 
> > > Is not there a better way to write i2c address? E.g. ".i2c_addr = 0x29"
> > > instead of ".something = (void *)0x29L" to make it readable?
> > 
> > struct dmi_system_id is an existing structure and we cannot just go adding
> > fields to it. driver_data is intended to tie driver specific data to
> > each DMI match, often pointing to some struct, so it is a void *, but
> 
> Yes, I know it.
> 
> > in this case we only need a single integer, so we store that in the
> > pointer. That is is the address becomes obvious when looking at the code
> > which consumes the data.
> 
> Ok, this makes sense. Anyway, is explicit void* cast and L suffix
> required?

I have checked compilers and L suffix is not needed. No error or warning
is generated without L.

Explicit cast is needed as without it compiler generates warning.


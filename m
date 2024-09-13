Return-Path: <linux-i2c+bounces-6680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5275C977B2A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7A71C2458D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51191D5CC4;
	Fri, 13 Sep 2024 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FykS9YEX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A71D52B
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216571; cv=none; b=Om9A/I9H6NmnWPWc/bb5tjF3aAtWI0D8NvN5IbaYpHNHWDpBzBpje/ElbjcToFjdkaSru8DPqlAMg1R5Z4oKpXc7HXjUDY/6YjyhbtsORxYMCMcZVyR1mF/+R/SdjcRpaFpLCkesdc5rAkDRl8s7+XPCFr8hG3eVdq99dQ0nAoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216571; c=relaxed/simple;
	bh=Rxue254yLFkVYPm+KCcyQp/u4PcineiB444aD5q5kcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syKABjkxRdrd8mVBs2de/jI5/gCngztiHI8adH9lETbC0HECyUEyHl/KicTHzxsHIpYxxJzwmWlS4j+6O9Aebe9MI5jbhFOMz29QeLyqnoGDMlibxMA87SfRadovpR2Izu+20IT1yctPbfnzZsJ2QKXTbf9ltiz7q/kCJ2VlN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FykS9YEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F98C4CEC0;
	Fri, 13 Sep 2024 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726216569;
	bh=Rxue254yLFkVYPm+KCcyQp/u4PcineiB444aD5q5kcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FykS9YEX58yFNrwdu7Jkyew2Doz7oRHIfnicYpVu4Qzyl5pBFIXoinHrPu+1/pWDY
	 H7UDHujaYxRi5nipmsvtARtRygp+dVbFZp5bRSREAcCvkv03pjFm2LG/88QOnnof4u
	 bGDZMzMCNoc0mCNJlgYZRzv3al9PaFavd7aC80uPFp4Iu6Knmpr5yLV7JJK73nbNRl
	 9Qfm+koGo1/im9uD9plNOmu77tZ+r6paz85Pr/nttJ8DoapN0V4+9x7mwGR43P+TOY
	 Z+ZdtrVZ6Z2LjQWUL/IVJCRldceyZ8D19aB7ixq5XtUeQ7VGQVFwUo8xw6wokWeh8R
	 Ngvc8jKVdJGcA==
Date: Fri, 13 Sep 2024 10:36:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Message-ID: <kgl6xhbvcxwy65zm3tu3svtsyftar5tjiycv6jxjd3mixosuz7@2bd3gsy43dig>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-4-Shyam-sundar.S-k@amd.com>
 <xog6iyhri64cml2p53ncja6lxpt256eqceru4jxi7ee4esnb2j@xrbmeheorofv>
 <1830e424-c74d-44d4-8d36-2f2a86eba99b@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1830e424-c74d-44d4-8d36-2f2a86eba99b@amd.com>

Hi Shyam,

On Fri, Sep 13, 2024 at 11:54:55AM GMT, Shyam Sundar S K wrote:
> On 9/12/2024 13:10, Andi Shyti wrote:
> > On Wed, Sep 11, 2024 at 05:24:02PM GMT, Shyam Sundar S K wrote:
> >> Export the following i2c_piix4 driver functions as a library so that the
> >> AMD ASF driver can utilize these core functionalities from the i2c_piix4
> >> driver:
> >>
> >> - piix4_sb800_region_request(): Request access to a specific SMBus region
> >> on the SB800 chipset.
> >>
> >> - piix4_sb800_region_release(): Release the previously requested SMBus
> >> region on the SB800 chipset.
> >>
> >> - piix4_transaction(): Handle SMBus transactions between the SMBus
> >> controller and connected devices.
> >>
> >> - piix4_sb800_port_sel(): Select the appropriate SMBus port on the SB800
> >> chipset.
> >>
> >> By making these functions available as a library, enable the AMD ASF
> >> driver to leverage the established mechanisms in the i2c_piix4 driver,
> >> promoting code reuse and consistency across different drivers.
> > 
> > ...
> > 
> >> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> >> index 2c2a466e2f85..174cce254e96 100644
> >> --- a/drivers/i2c/busses/i2c-piix4.c
> >> +++ b/drivers/i2c/busses/i2c-piix4.c
> >> @@ -153,8 +153,7 @@ struct i2c_piix4_adapdata {
> >>  	struct sb800_mmio_cfg mmio_cfg;
> >>  };
> >>  
> >> -static int piix4_sb800_region_request(struct device *dev,
> >> -				      struct sb800_mmio_cfg *mmio_cfg)
> >> +int piix4_sb800_region_request(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
> > 
> > I’m not entirely happy with this change, or the others above. If
> > someone runs a git bisect, they would be confused by not seeing
> > this change described in the commit log.
> 
> Can you elaborate a bit more on the expectation? The commit message
> has the details on the each of the functions that has to be exported.
> 
> Can you please take a look at it again?

The change I am referring to is that style change I described
here below, that consists in putting in one line the functions.

You are describing the logical changes, but there is no mention
of the fact that you are moving the second parameter of the
function in the same line with the other.

> > While it's true that the accepted line length is now 100
> > characters, the 80-character limit is still preferred (and
> > personally, I prefer 80, though that’s just my opinion).
> > 
> > This change doesn’t seem necessary, so please amend it along with
> > the others below in the next version.
> 
> Ok. I will move to 80 char length.

Thanks,
Andi


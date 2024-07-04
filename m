Return-Path: <linux-i2c+bounces-4641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E87927E86
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 23:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D476B22DFF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 21:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD616142E76;
	Thu,  4 Jul 2024 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYbEz5ia"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728DD13D246;
	Thu,  4 Jul 2024 21:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720128370; cv=none; b=ka2lYaQKNkCwHrrJ6hh0OMkUjsCIL3xaNfe5IXGwu9A3voO3RJMy948WZC4mpDDMiiWs5VlwpW7o16FCYn7GZZRQKnxnh881Y0+FdNzpj07T58/BziVJtVjxuiVAFGpFIx9nlS7ChFe4fwA33+n8yGfRHOCMe/3JnmN62H6FRMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720128370; c=relaxed/simple;
	bh=4npAyt5vGt45dUxv9P67N8iru3tBu2lOXQVriqXTCVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqvsRPfIrYfMtG9XSojC4fEYcNlURcqJU/DaiT2ed/ys8m3hEP7SUv8+j6sb4HvApEPfo2U3pmggG9bM68iGT/02+g7iWJpfTRXfGPTOuIHjmMLPtzVzZhxYbXdDBzj4Yy73FWiXd+UC7i/KbpR5sntIpDQdwTvFq8yM+5TBT6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYbEz5ia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483BDC3277B;
	Thu,  4 Jul 2024 21:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720128369;
	bh=4npAyt5vGt45dUxv9P67N8iru3tBu2lOXQVriqXTCVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYbEz5ia2XPRcgGx/7JTrHQiM8jnR+Y9wlMXigQBRAwE/ndU/iVNhK3xGKTkzeEVD
	 lvJ7SwhmHk5oRNvTHTiKHvSC/NgLxhoeY+beesOA7A9OqwCIWou2/2AG1Dp1ppRlfV
	 da8nELpWg0sJpEUOwRBwJ2lcpmUKuTv9v1JOImaKnxpaWcNyWiEwi6eraBEL3DPrOd
	 zkJk0KHUxLSKHeYR4kVPO4fie/T66xi1uMwl8SVykWGwQhPEoXBB426Miyf2+Zb2Wc
	 fAveLTeagK/XXowV45hAcfcWGWWrHpSMjQdVefim2dDAYN4lrVpgAfr8ebgWKRLkPK
	 OB8HLF607iG7A==
Date: Thu, 4 Jul 2024 23:26:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
	Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <ii7wdgjkjgytbu7wmj3pa3zxxccwuntkwxw463icmdichrgnyf@pku5kqfxyd7s>
References: <20240704125643.22946-1-hdegoede@redhat.com>
 <20240704125643.22946-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704125643.22946-3-hdegoede@redhat.com>

Hi Hans,

On Thu, Jul 04, 2024 at 02:56:39PM GMT, Hans de Goede wrote:
> On chipsets with a second 'Integrated Device Function' SMBus controller use
> a different adapter-name for the second IDF adapter.
> 
> This allows platform glue code which is looking for the primary i801
> adapter to manually instantiate i2c_clients on to differentiate
> between the 2.
> 
> This allows such code to find the primary i801 adapter by name, without
> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
> 
> Reviewed-by: Pali Rohár <pali@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I believe Wolfram will take patch 1. Once he takes it, I will
pick this up.

Thanks,
Andi


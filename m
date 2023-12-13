Return-Path: <linux-i2c+bounces-765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A7811F1B
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 20:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 137CAB21171
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 19:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC0A68284;
	Wed, 13 Dec 2023 19:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ogj8zM/6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6467B6C;
	Wed, 13 Dec 2023 19:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3E8C433C8;
	Wed, 13 Dec 2023 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702496508;
	bh=r5caWHZ8DXSvWHSwhmR5Tmf3Lip96nv1oNKmYxfn+iA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ogj8zM/6LzmTB24yYi9IwK2MhAHsuDy3wqhfJZEVuD82Payg4N03l0nMLdJ15c3CF
	 8NX9BSNFaoZ4kFdqnEPny55MRUZQx/6wg3mDg5VRanQwXmL4ZxYh6E9IATkQZbf9r/
	 NQr6I0m71gkpdglNPqzp7lqh2PDZJWiucDlyONN+usdYDiwITmOSTx0IWXFVVLIBK3
	 3ZXHbFu66OWhU+ftG/Teb48/H/eDp30jlPRAYtswoE28z233Iadj1wsDWVvVAPvrPI
	 SGFr5N1pAkh7DGvlHe8NN9SYwqYIXzPabr5qksPzAIQmLHq0d+nB9GsEonZ7bDG2cv
	 zvCesPxVtitjw==
Date: Wed, 13 Dec 2023 13:41:46 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <20231213194146.GA1055128@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>

On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
> p2sb_bar() unhides P2SB device to get resources from the device. It
> guards the operation by locking pci_rescan_remove_lock so that parallel
> rescans do not find the P2SB device. However, this lock causes deadlock
> when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
> locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
> call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
> Hence the deadlock.
> 
> To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar().
> Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
> for fs_initcall which gets and caches the P2SB resources. At p2sb_bar(),
> refer the cache and return to the caller.
> ...

> +/* Cache BAR0 of P2SB device from function 0 ot 7 */

s/ot/to/

or even s/from function 0 ot 7/functions 0 to 7/

> +static bool p2sb_invalid_resource(struct resource *res)
> +{
> +	return res->flags == 0;
> +}

IMO this would read better as "p2sb_valid_resource()" with
corresponding negation in the callers.  But it doesn't matter either
way.

> + * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> + * @bus: PCI bus to communicate with
> + * @devfn: PCI slot and function to communicate with
> + * @mem: memory resource to be filled in
> + *
> + * if @bus is NULL, the bus 0 in domain 0 will be used.

s/if/If/


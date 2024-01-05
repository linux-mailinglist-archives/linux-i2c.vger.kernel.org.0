Return-Path: <linux-i2c+bounces-1131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53670825029
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07A9D1F230CF
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 08:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0205F21A14;
	Fri,  5 Jan 2024 08:45:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268F219F9;
	Fri,  5 Jan 2024 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 9D0F32800B4B5;
	Fri,  5 Jan 2024 09:44:54 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 90186187B21; Fri,  5 Jan 2024 09:44:54 +0100 (CET)
Date: Fri, 5 Jan 2024 09:44:54 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Klara Modin <klarasmodin@gmail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <20240105084454.GA28978@wunner.de>
References: <CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com>
 <oe4cs5ptinmmdaxv6xa524whc7bppfqa7ern5jzc3aca5nffpm@xbmv34mjjxvv>
 <20240104123621.GA4876@wunner.de>
 <b565j7nbqu67pjhjw6ei7i3nkazazirl4dyxhaem3z7ghii3gs@dngmvjcylrjp>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b565j7nbqu67pjhjw6ei7i3nkazazirl4dyxhaem3z7ghii3gs@dngmvjcylrjp>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jan 05, 2024 at 08:18:05AM +0000, Shinichiro Kawasaki wrote:
> --- a/drivers/platform/x86/p2sb.c
> +++ b/drivers/platform/x86/p2sb.c
> @@ -150,6 +153,14 @@ static int p2sb_cache_resources(void)
>  	if (!bus)
>  		return -ENODEV;
>  
> +	/*
> +	 * When a device with same devfn exists and it is not P2SB, do not
> +	 * touch it.
> +	 */
> +	pci_bus_read_config_dword(bus, devfn_p2sb, PCI_CLASS_REVISION, &class);
> +	if (!PCI_POSSIBLE_ERROR(class) && class >> 8 != P2SB_CLASS_CODE)
> +		return -ENODEV;
> +

The function should probably return if PCI_POSSIBLE_ERROR() is true.
Also I think you can use PCI_CLASS_MEMORY_OTHER, so how about:

	if (PCI_POSSIBLE_ERROR(class) || class >> 16 != PCI_CLASS_MEMORY_OTHER)
		return -ENODEV;

Can alternatively use "class >> 8 != PCI_CLASS_MEMORY_OTHER << 8" if you
want to ensure the lowest byte is 0x00.

Thanks,

Lukas


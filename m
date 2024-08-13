Return-Path: <linux-i2c+bounces-5350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A570950FF7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 00:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 786CB1C22EB6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 22:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29881AAE0A;
	Tue, 13 Aug 2024 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCpd2KcF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E136B11;
	Tue, 13 Aug 2024 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723589718; cv=none; b=bTmVWY18DBYODO+kEEJQRkYoeej+cdT45akuLirFMscseFUwKsIyomoz0A1Pu1YKfrhPpN1cJsusEPOFJp4uXXxeeJceMy593USV69jCHkrcZIW1X0UBTYPuZyMpV9x+k7yZX62E6wTY4e26QR6k5C2j2Z6ERMFg5lsMI6qX39s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723589718; c=relaxed/simple;
	bh=EaiLUZtV9dHZPDWCgUcTe3AVUvqDMjFJ769dzz2V6w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qo3ND7u1Lv1B0fNKUqGK3QLnlyiQ58XDBUL1FxaMG6KKVDpMuSvtGLGYaMYjr0qRwGpIhqXH+38w2I0t8Lc6iapbcMOizfbCrODmzua8twAGciJOBKzYejdOBiIjB3TTqvH1fGAGyrzaOklRk0emQXSsEk6Ec0kNyTpZ5jyClCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCpd2KcF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E924EC32782;
	Tue, 13 Aug 2024 22:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723589717;
	bh=EaiLUZtV9dHZPDWCgUcTe3AVUvqDMjFJ769dzz2V6w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCpd2KcFzv7h7gqLAOT4Ozd2tn2Uf8bOIDNhE8gcKlHJvV/JWPp8lyynNd79F52MS
	 J9oXD1EH5WghPsJCrXxvYO8n3TjymCp++oNS6n6K3hI8cgZPHQQGOZJjO6VAi8ZKWG
	 D8iDL20a92UgmqeDn1PU1/0zjKRKL1qJGYLviMSSrydJI3e3NYfmckW4T74QC8BFVk
	 w180RA42XEp6M+mCv4f4OD4U1MZFurEqeBzXqHlXddsYK+SMrHXYR3CzelGD3fNZFK
	 GO0snVjgcYNSqDSi1HLYMtNiIdzjLagQbfurFSqV1BolAasWp2p5wL3SKDVOx6aqHZ
	 rDEYSGoanpS2A==
Date: Tue, 13 Aug 2024 23:55:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net, 
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
	Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <c35b6mawhhbhjioan6hvrlthtcoc6dqivwihhwz5ftvv6jcohs@ovctm27nnd2n>
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240812203952.42804-3-hdegoede@redhat.com>

Hi Wolfram,

On Mon, Aug 12, 2024 at 10:39:48PM GMT, Hans de Goede wrote:
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
> ---
> Changes in v4:
> - Use a single snprintf() with a conditional argument for the 2 names
> - Add a comment that the adapter-name is used by platform code
> 
> Changes in v3:
> - This is a new patch in v3 of this patch-set
> ---
>  drivers/i2c/busses/i2c-i801.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 328c0dab6b14..299fe9d3afab 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1763,8 +1763,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  
>  	i801_add_tco(priv);
>  
> +	/*
> +	 * adapter.name is used by platform code to find the main I801 adapter
> +	 * to instantiante i2c_clients, do not change.
> +	 */
>  	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> -		"SMBus I801 adapter at %04lx", priv->smba);
> +		 "SMBus %s adapter at %04lx",
> +		 (priv->features & FEATURE_IDF) ? "I801 IDF" : "I801",
> +		 priv->smba);
> +

do you have any comment here?

Thanks,
Andi

>  	err = i2c_add_adapter(&priv->adapter);
>  	if (err) {
>  		platform_device_unregister(priv->tco_pdev);
> -- 
> 2.46.0
> 


Return-Path: <linux-i2c+bounces-6062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C396AA8D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 23:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF6201F257C0
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 21:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3D8126C10;
	Tue,  3 Sep 2024 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXxGJwuu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D6B647
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725400164; cv=none; b=pWA4EFXcAOAtWbIfg5u6oBm6aQZYNNKCrfdQdhTRTfRLaCx+LBBspmtMQHfJPMNex7u6ZRdGUyOxqqGcEXE6A8JmsQoSzRleBuhqRhVdiH9qa2d1q8JBpCbKZK3AmdJ3NzbtbhV2g/T3pBcw8UrLGqPoL2RtJLuZnEp5Qev5EW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725400164; c=relaxed/simple;
	bh=QxBJhyQ11K3UOA/rtzWMZ9fVMUK2nkSTvlXeWdaByrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TW+SBV7/MAI5l756AtyaF1nddqgpkJ7zSL5YY9LFShEQfNMyi2wY6/8etWNcszc8yJLGhHjoSNXVUKbd/PoN3SDDQvJR8nRjG2tBp5gL72AWBvV6goJsRv822YdsCht+sKF5yjXLfWeWvies6Q9IGaIEv8O72XORr9Qx+cQJz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXxGJwuu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E69C4CEC4;
	Tue,  3 Sep 2024 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725400163;
	bh=QxBJhyQ11K3UOA/rtzWMZ9fVMUK2nkSTvlXeWdaByrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXxGJwuulmPsnfS8f5AAwLmuRw2pFGKQ0qtT5shDxX3vX1YcqigxpcqtJ2yMQ+5VB
	 Y4Rp2QjQbi+0gw8ST41XO7OgSsyrqBAh6L89cWzlMsEiUMVPMfJGZyTlYDJQdhq19C
	 d49U7X3pLHJaBehLsYGvovQ+GXjn5VmLwpFG+sg3so29OJMPc6BeDFnxPFlUjbG+4g
	 x3sr1SIGaMa8oHSqHE35s0MCXNq0wgtb9e5nOOPAMHyl9L2pnmW5UaiIiupABV8KdD
	 qPJPTfhrfoTbPTtPbSBKWdJKrya8ujhoZAcc0n9MI76iiByPY/kM1af1fewttrOzbf
	 Fjl7QkSDsGGJg==
Date: Tue, 3 Sep 2024 23:49:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH 1/5] i2c: piix4: Allow more than two algo selection for
 SMBus
Message-ID: <d4eai4r34suiuwkbpvubtvax2cuqafkiw7j64yi5h3axysxayg@vxe4kqbgjtvh>
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
 <20240822142200.686842-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822142200.686842-2-Shyam-sundar.S-k@amd.com>

Hi Shyam,

...

> +enum piix4_algo {
> +	SMBUS_SB800,
> +	SMBUS_LEGACY,

please don't use the SMBUS_ prefix, this driver has its own
prefix which is PIIX4. I suggest calling these enums PIIX4_SMBUS
and PIIX4_SB800.

> +};
> +
>  struct i2c_piix4_adapdata {
>  	unsigned short smba;
>  
> @@ -173,6 +178,7 @@ struct i2c_piix4_adapdata {
>  	bool notify_imc;
>  	u8 port;		/* Port number, shifted */
>  	struct sb800_mmio_cfg mmio_cfg;
> +	u8 algo_select;
>  };
>  
>  static int piix4_sb800_region_request(struct device *dev,
> @@ -929,7 +935,7 @@ static struct i2c_adapter *piix4_aux_adapter;
>  static int piix4_adapter_count;
>  
>  static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
> -			     bool sb800_main, u8 port, bool notify_imc,
> +			     u8 piix4_algo, u8 port, bool notify_imc,
                             ^^
why "u8" and not "enum piix4_algo"?

Thanks,
Andi


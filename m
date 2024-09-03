Return-Path: <linux-i2c+bounces-6063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2896AA95
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 23:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C6501F21C31
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 21:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE85126C18;
	Tue,  3 Sep 2024 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXlpHPwO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A796B647
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725400286; cv=none; b=Y9J+9t3BBTUKPKiAgxNxvuMok1s86wIxsGlROdx38oychmSHfP5pYj0oLmmPlkqBeTZea/mnRfPhah7iu/a3FW/ah3W8UzhCbGuVaAqOZcnHowrFGpxgTXI8risfVhUQibr6TArDb169s58OYd3k+RuAgxJcQ3JSFad4i2sFE2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725400286; c=relaxed/simple;
	bh=A5zcsOCCYLNy9TI818g8ZUCOsp5BT7AvY7CIh3rZisw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD4L/7vo4DB9+2VZCzsCnzCkcGqdyfhn2bpdN09zN4GOSqYmLiNpcedQXLnYGcKQb/6qKMORNAJgu6qQzZ7wxRq5LlkmO3iSvfrDOpq5LiweosJ1sRYLK4iluLdfHyoS4WRcr0ThcEgEsbJX1hXc8wxSLZ+Y4J0SHTG7ZO3Rx5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXlpHPwO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5115C4CEC4;
	Tue,  3 Sep 2024 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725400284;
	bh=A5zcsOCCYLNy9TI818g8ZUCOsp5BT7AvY7CIh3rZisw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXlpHPwOvsMNpYvROHOcT5uihbWzLvI4q2D5uUC2AC3veTTt/Uvtq7kvhh+3AC+uf
	 22sqIlYPMqR14lmDK9+SQ2Kl20w6DRM9y47V9lCvXDJUAARU1bE0K1Zw4uaBPxolUj
	 x73ZoMYNdWP0oblbWaPtMW+IdVK5zRndvdC1zzHaRsiJ0G6dgTBO5mAVUIuh8mGO+b
	 HkYxgga0j1rcXcMwnKCq/g/LheJ0kjL5IZfuPzHowej3b8sKBjWAFwAATas5MSR2jO
	 gIBx9jN0ytMEv86q+agVVeK5Et+n8F2GEB4+P9WBGVXypNDeIkJW2plai0D0wa3wl+
	 d8mGY8vBtwo8g==
Date: Tue, 3 Sep 2024 23:51:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH 4/5] i2c: piix4: Adjust the SMBus debug message
Message-ID: <7jdrjtyln26ikkm6wjz4jc2hcynqniejepjjlm66ukxeayfkbo@u4tgx3bmqtqq>
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
 <20240822142200.686842-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822142200.686842-5-Shyam-sundar.S-k@amd.com>

Hi Shyam,

> @@ -1194,6 +1194,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  {
>  	struct i2c_adapter *adap;
>  	struct i2c_piix4_adapdata *adapdata;
> +	char *node = "PIIX4";

please, make this const and initialize it...

>  	int retval;
>  
>  	adap = kzalloc(sizeof(*adap), GFP_KERNEL);
> @@ -1213,6 +1214,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  		adap->algo = &piix4_smbus_algorithm_sb800;
>  		break;

... here.

>  	case SMBUS_ASF:
> +		node = "ASF";
>  		adap->algo = &sb800_asf_smbus_algorithm;
>  		break;

shall we have a default case here? I thought checkpatch complains
when no default is specified.

Thanks,
Andi


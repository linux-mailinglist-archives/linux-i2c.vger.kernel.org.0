Return-Path: <linux-i2c+bounces-703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785580B480
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 14:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4B6EB20953
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 13:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C851C14A92;
	Sat,  9 Dec 2023 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pzvv/d6m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E613AE3
	for <linux-i2c@vger.kernel.org>; Sat,  9 Dec 2023 13:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0A3C433C8;
	Sat,  9 Dec 2023 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702126906;
	bh=tLQNu65wbF7DzIeT8McHn0JFIAviqlbeBR9/VLN2jw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzvv/d6mCsdrYIXfd/aNExUyQKLD17xKrc1GzBXIJK/Q1ui6K+HoyPlfP9RyYQHps
	 oDtb1KA6Y8xo8i4zNtj1zfU1k89u67gb9lYLjyfuagriEcTykmySljWSUATGgKy8df
	 ngoKmfsovgqz84k1+XZP+bxdoQowH+tAqQSQ4U6MrUKbcaF27UUFm5yiNirZzmquz5
	 8iocrQiRQrSKUe269izRmUFuHl2FRrVXFsH8W87ff2JWiT4vZ1FZx3LBYwsc9yUDZo
	 huG6FKZRANOR+D4dYIuifeVSMaHMZBexWwU3la8uyXHY0HeWepdjeDtiD/WdhCGbqe
	 wZAPHQjrAu2+w==
Date: Sat, 9 Dec 2023 14:01:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: cadence: Add system suspend and resume PM support
Message-ID: <20231209130140.m2ym5yy5rv3pwtzn@zenone.zhora.eu>
References: <20231209030955.1156905-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209030955.1156905-1-jisheng.teoh@starfivetech.com>

Hi Ji Sheng,

[...]

> +static int __maybe_unused cdns_i2c_resume(struct device *dev)
> +{
> +	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = cdns_i2c_runtime_resume(dev);
> +	if (err)
> +		return err;
> +
> +	if (pm_runtime_status_suspended(dev)) {
> +		cdns_i2c_runtime_suspend(dev);
> +		if (err)
> +			return err;

have you forgotten to assign 'err'?

Andi

> +	}


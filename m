Return-Path: <linux-i2c+bounces-7511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6F79AD7E7
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 00:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3421BB21E82
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2024 22:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B131FEFA4;
	Wed, 23 Oct 2024 22:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSDAc0yl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDF31F470D;
	Wed, 23 Oct 2024 22:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723346; cv=none; b=avhUom4zZdiN80KVeOHRMPpZHsPe5QlF7tKI4h5+tVSmLrAq8PaSPtLjcbLJc+4ca8KMnPXlFWfYIs7cOuJkH/H3dGlzd57bnEkDgLD2rZ4MH8L8tdWzFp266DE+/K9/F99F8dhsaniX9z1/5dN4mr+CY7VJzVF4qE7Y7oIUKsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723346; c=relaxed/simple;
	bh=tTiJ25Zp/ob+6UlLvL2Q98qetxrN0g9WXC9Z7+TXy2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/HhPqMwbQfMppSwO1twHDqenB56wLTqDvs4UjQIN50VQrI9VgtISyBVekzZKxElVZBOZVoLwIBr99HH1eHw4TdyFxBedO7o8P+w/H5rPnp5vTRkKh40eAm4ttiGbErHMsQOtZE4Lxh6Ntqhu7RzHRzNriUvv9pdLUP/R3xB1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSDAc0yl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ED7C4CEC6;
	Wed, 23 Oct 2024 22:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729723346;
	bh=tTiJ25Zp/ob+6UlLvL2Q98qetxrN0g9WXC9Z7+TXy2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSDAc0ylq9WjGnZQ++C9sHnrSPc69JXgtFrLsKEhI1piLa47ISpHqlhYpW7KuALN5
	 32P69SSmwXwFPVwXCH81GS7X7xrb9ZPTfJDhOeJ+WXu1sG6CgZOt2mOxrd7YazZexK
	 /QI73g73kzbDYte6IrGIBSOlWp52UwAwZ6WUEmdT6H5zc5Y5PCI+wMV5PCK3LrTDhm
	 yMyiLlQpZXRwxIB15iIpR+PJRA918FZyy7BJJIo9BxjzVtLV0nd3Xtzu1CztQuu+Ps
	 Xih/t4aRd2xAxBgxyWD1/luxMvETkCx3KqXskOeaMqJf8JcKC+wZCEDO6YydIAdfgN
	 Co3+96PhBZGSQ==
Date: Thu, 24 Oct 2024 00:42:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, francesco.dolcini@toradex.com, 
	l.stach@pengutronix.de, arnd@arndb.de, Frank.Li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] i2c: imx: prevent rescheduling in non-dma mode
Message-ID: <7ts577rxed4mmfkfin7kfdjfjkb6iak2y4vtgtz6merwxkzz6w@h5aefbvyx44u>
References: <20241014131635.205489-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014131635.205489-1-eichest@gmail.com>

Hi Stefan,

> Stefan Eichenberger (3):
>   i2c: imx: do not poll for bus busy in single master mode
>   i2c: imx: separate atomic, dma and non-dma use case
>   i2c: imx: prevent rescheduling in non dma mode

Merged to i2c/i2c-host.

Thanks,
Andi


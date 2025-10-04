Return-Path: <linux-i2c+bounces-13391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7EABB902A
	for <lists+linux-i2c@lfdr.de>; Sat, 04 Oct 2025 18:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC2AD188BA96
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Oct 2025 16:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF3A27F18F;
	Sat,  4 Oct 2025 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B8A1aUXZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A0262A6
	for <linux-i2c@vger.kernel.org>; Sat,  4 Oct 2025 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759596399; cv=none; b=DAEXURnaGrsFLIEtA0K56TXMs3oUTG9v5w2fQF72xQo98fH53kI8tqRIJyWZpg+O9WpYZ5wbLdMOlE952cYsTh1ook94XMbt47Q4opWI0TEErpwR4dsGYfT6PUyTUBX80FghIFWR/3o/0YMmJ56xDxL8PQt+415RD2iugIuiFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759596399; c=relaxed/simple;
	bh=jcqkVfSfbnhIbIU4Gc7ZHCepbp4VWSI9yobHGq377ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaqvCkKtAgm9sM6Jj5YLbviwj+zLVc5fqVzJQnCuKUcTJpuJqdTQ4xNLZWQgk/E4wktEsEqoOjZPRytmzr9bSUSsHd+WXcVQQ9RD/Nq90DywnG7EBhYQSvHl6wm0m/NYXBxdONwk7Y/wKOsLYCwySWJJfb+cqSIgNtlWnOjjo7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B8A1aUXZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XMDv
	xc/6tD3YkJOwpDYjlkn09VUXh303IXyIaSE4Tpw=; b=B8A1aUXZTduHepLOE4EX
	tqM8HkKnwU8ZS8xh/cGLhLVf85AWgY9Ilpc4yOel06RKxIglTBi31d7qkZ3xXuTu
	IcHisfuqyGlbIOP7B2HxviHFnR7QK2qUojfNagsSJXjalkGuvAumlu0muDEPldb/
	NklhYADlNwVhvLLfu1bpZGLDEbpl1vZBexRGQdoaEoj/zzJd2RWQXO53/A+5Ph6c
	TtiXz8CtdPTfPP9QAUhuYuV/99BBqbkD5HbmtMA4KYkNwMYDuB0uVeWdNbmZZXVT
	f9VB+bWanYAn4BLU/ZQqE5cqzvNA2ZL2MEJKzXeXUUxSGwQWlCxtUmkAdZcw5k/g
	gA==
Received: (qmail 1089998 invoked from network); 4 Oct 2025 18:46:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2025 18:46:35 +0200
X-UD-Smtp-Session: l3s3148p1@w4MR9ldA7rqSRnW9
Date: Sat, 4 Oct 2025 18:46:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] i2c: mt65xx: convert set_speed function to void
Message-ID: <aOFPapyaC6FiYetl@shikoro>
References: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>

On Thu, Sep 25, 2025 at 11:05:18PM +0200, Wolfram Sang wrote:
> cppcheck rightfully reports:
> drivers/i2c/busses/i2c-mt65xx.c:1464:6: warning: Condition 'ret' is always false [knownConditionTrueFalse]
> 
> Make the function void and simplify the code.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!



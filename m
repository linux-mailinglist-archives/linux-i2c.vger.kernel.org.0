Return-Path: <linux-i2c+bounces-12134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A83B19559
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAD3B18932DF
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 20:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C901FDA9E;
	Sun,  3 Aug 2025 20:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qh6FlLsJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA671DE8A0
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254110; cv=none; b=H07uPH+jPFHdH5PF11OS6qXJmQBXXdQt/B27RyqWftmWNDCgNWfcOZPPflUuzFGdJZpthoT641Hn7IlxHGqKXSyiECr+cjDDtbgsMwSM2w9QIxj+o/DQnLo6O97+yhdcGmYiFE64k3v4qO95nDCFgIpJMgtcJNl6xlrreYTlbWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254110; c=relaxed/simple;
	bh=R86UDJNzFtE514NSFGrePDVR3V4l4yC8q8IYyfFSx3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl1aaFbhCBM6ecMItNvP8ZRXum0LgsU/pAEN7TEsa/qw/gfbntdo86z2xGL+IJXmCvQUbQCNzLsF1kXt+OM2cmy3OxjFu72asL/SP9uC150ww0eqg0XI/X8g8f82uXgaHQBlgJ15u8P4UZU00qrnsQ8coIOgRXwkNtBLIVtZONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qh6FlLsJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ux+D
	LqhEa+N6g72w9NCM8SJSd65hGlEnGKuqCAwAej4=; b=Qh6FlLsJFVANQqkrDBZ3
	vCMxPIZSE0qrwGZCfHf2CU3aelKd8Z1kjZuZzca2Si/vB3KOlH1hiq4dgLg+FTbt
	lA+QzujEaWCB34gb28Az+zFk7HkHk9QcERoZilKRnPPPzlorS6m9kwQ3ItG7c2ic
	dQGt8mQxAJ5bG4NnfTBvrWjDCi3jcM/X8nYxy/G3uM2V7cFPjek75sRTkmxZthhr
	O7uedQ5NSY+WjfVu8sGfhk9vQQNjbaAJlU6XeCxno4qNaFbr1k8nrzCsLKRVCEG3
	YbtHVJqyxYXHbp/R29i/jAVfO7k0t77Q8eBdo7k3gsafXIz1pP+U8BARBDLQ30GM
	Fw==
Received: (qmail 1647447 invoked from network); 3 Aug 2025 22:48:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 22:48:26 +0200
X-UD-Smtp-Session: l3s3148p1@t6jZHHw7LL4ujntd
Date: Sun, 3 Aug 2025 22:48:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: muxes: mule: Fix an error handling path in
 mule_i2c_mux_probe()
Message-ID: <aI_LGrnls6X7TFT6@shikoro>
References: <354bf00a245ec3bac9cdd197a06138dddda2f009.1753904271.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <354bf00a245ec3bac9cdd197a06138dddda2f009.1753904271.git.christophe.jaillet@wanadoo.fr>

On Wed, Jul 30, 2025 at 09:38:02PM +0200, Christophe JAILLET wrote:
> If an error occurs in the loop that creates the device adapters, then a
> reference to 'dev' still needs to be released.
> 
> Use for_each_child_of_node_scoped() to both fix the issue and save one line
> of code.
> 
> Fixes: d0f8e97866bf ("i2c: muxes: add support for tsd,mule-i2c multiplexer")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-next (for 6.17 mergewindow), thanks!


